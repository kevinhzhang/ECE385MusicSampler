/*
 * note_render.c
 *
 *  Created on: May 1, 2023
 *      Author: Sydney Wang
 */

#include <system.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
#include <time.h>
#include <alt_types.h>
#include "note_render.h"

void clear() {
	for(int i = 0; i < ROWS*COLUMNS*2; i++) {
		vram_ptr->VRAM[i] = 0;
	}
}

int drawnote(struct NOTE note, int timeslice) {
	if (note.PITCH > 56 ||
			note.DURATION > 16 ||
			timeslice < 0 ||
			timeslice >= GRID_WIDTH * 3) return -1;
	
	if (note.DURATION == 0) return 0;

	alt_u8 incr = note.DURATION > 1 ? note.DURATION : note.DURATION + 1;
	alt_u8 sharp_flag = 0;
	alt_u8 dot_flag = 0;
	alt_u8 tail_flag = 0;
	alt_u8 line_flag = 0;
	alt_u8 line_dir = 0; // 0 is UP 1 is DOWN
	alt_u8 LL_flag = 0;
	int grid = timeslice / GRID_WIDTH;

	// check if needs to shift drawing down - 1 timeslice of padding
	if (incr + (timeslice % GRID_WIDTH) + 1 >= GRID_WIDTH) {
		if (grid == 2) return -1;
		incr = incr + GRID_WIDTH - (timeslice % GRID_WIDTH);
		timeslice = GRID_WIDTH*(++grid);
	}

	int offset = timeslice % GRID_WIDTH;

	// get note position
	float position;


	if (note.PITCH > -1) {
		position = positions[note.PITCH];
		if (note.DURATION < 16) line_flag = 1;

		// line should point DOWNWARDS
		if ((position < 12 && position > 9) || position < 5) {
			line_dir = 1;
		}

		//printf("Note position is %d\n", (int)position);
	}
	else {
		// just draw the rest in the middle
		//printf("Arrived here.\n");
		position = positions[note.PITCH + 31];
		//printf("Rest position is %d\n", (int)position);
	}

	//printf("Position was set to %d\n", (int) position);

	// need LL
	if (position == 7 || (position < 2)) {
		LL_flag = 1;
	}

	//get if sharp needs to be drawn
	if (note.PITCH > 0 &&
			(positions[note.PITCH - 1] == positions[note.PITCH])){
		sharp_flag = 1;
	}

	// needs dot
	if(note.DURATION % 3 == 0) {
		dot_flag = 1;
	}

	// needs tail
	if (note.DURATION < 4 && note.PITCH > -1) {
		tail_flag = 1;
	}

	alt_u8 note_mask = 0x00;
	alt_u8 LL_mask = 0x00;
	alt_u8 line_mask = 0x00;
	alt_u8 dot_mask = 0x00;

	// drawing is on current grid box
	if (floorf(position) == position) {
		if (note.PITCH > -1) { // playable note
			if (note.DURATION < 8) {
				// black body
				note_mask = 0x08;
				//vram_ptr->VRAM[((grid*PART_HEIGHT + UPPER_Y + (int)position) * COLUMNS + (UPPER_X + offset) )*2 + 1] = note_mask;
			}
			else if (note.DURATION < 16) {
				// half-note body
				note_mask = 0x10;
				//vram_ptr->VRAM[((grid*PART_HEIGHT + UPPER_Y + (int)position) * COLUMNS + (UPPER_X + offset) )*2 + 1] = note_mask;
			}
			else {
				// whole note body
				note_mask = 0x18;
				//note_mask = 0x58; // debug only
				//vram_ptr->VRAM[((grid*PART_HEIGHT + UPPER_Y + (int)position) * COLUMNS + (UPPER_X + offset) )*2 + 1] = note_mask;
				//offset++;
				vram_ptr->VRAM[((grid*PART_HEIGHT + UPPER_Y + (int)position) * COLUMNS + (UPPER_X + offset + 1) )*2 + 1] = note_mask + 0b00001000;
			}

			vram_ptr->VRAM[((grid*PART_HEIGHT + UPPER_Y + (int)position) * COLUMNS + (UPPER_X + offset) )*2 + 1] = note_mask;

			if(note.DURATION == 16) offset++;
		}
		else {
			if (note.DURATION < 4) {
				// eighth rest
				note_mask = 0x28;
				vram_ptr->VRAM[((grid*PART_HEIGHT + UPPER_Y + (int)position) * COLUMNS + (UPPER_X + offset) )*2 + 1] = note_mask;
				note_mask += 0b00001000;
				vram_ptr->VRAM[((grid*PART_HEIGHT + UPPER_Y + (int)position + 1) * COLUMNS + (UPPER_X + offset) )*2 + 1] = note_mask;
			}
			else if (note.DURATION < 8) {
				// quarter rest
				note_mask = 0x38;
				vram_ptr->VRAM[((grid*PART_HEIGHT + UPPER_Y + (int)position) * COLUMNS + (UPPER_X + offset) )*2 + 1] = note_mask;
				note_mask += 0b00001000;
				vram_ptr->VRAM[((grid*PART_HEIGHT + UPPER_Y + (int)position + 1) * COLUMNS + (UPPER_X + offset) )*2 + 1] = note_mask;
			}
			else if (note.DURATION < 16) {
				// half rest
				note_mask = 0x48;
				vram_ptr->VRAM[((grid*PART_HEIGHT + UPPER_Y + (int)position) * COLUMNS + (UPPER_X + offset) )*2 + 1] = note_mask;
				offset++;
				note_mask += 0b00001000;
				vram_ptr->VRAM[((grid*PART_HEIGHT + UPPER_Y + (int)position) * COLUMNS + (UPPER_X + offset) )*2 + 1] = note_mask;
			}
			else {
				// whole rest
				note_mask = 0x58; // 0b01011000
				vram_ptr->VRAM[((grid*PART_HEIGHT + UPPER_Y + (int)position) * COLUMNS + (UPPER_X + offset) )*2 + 1] = note_mask;
				offset++;
				note_mask += 0b00001000;
				vram_ptr->VRAM[((grid*PART_HEIGHT + UPPER_Y + (int)position) * COLUMNS + (UPPER_X + offset) )*2 + 1] = note_mask;
			}

		}
	}
	// drawing occupies current box and box above
	else {
		if (note.DURATION < 8) {
			// black body
			note_mask = 0x68; // 0b01101000
			vram_ptr->VRAM[((grid*PART_HEIGHT + UPPER_Y + (int)position) * COLUMNS + (UPPER_X + offset) )*2 + 1] = note_mask;
			note_mask += 0b00001000;   // 0b01110000
			vram_ptr->VRAM[((grid*PART_HEIGHT + UPPER_Y + (int)position + 1) * COLUMNS + (UPPER_X + offset) )*2 + 1] = note_mask;
		}
		else if (note.DURATION < 16) {
			// half-note body
			note_mask = 0xD0;
			vram_ptr->VRAM[((grid*PART_HEIGHT + UPPER_Y + (int)position) * COLUMNS + (UPPER_X + offset) )*2 + 1] = note_mask;
			note_mask += 0b00001000;
			vram_ptr->VRAM[((grid*PART_HEIGHT + UPPER_Y + (int)position + 1) * COLUMNS + (UPPER_X + offset) )*2 + 1] = note_mask;
		}
		else {
			// whole note body
			note_mask = 0xE0;
			vram_ptr->VRAM[((grid*PART_HEIGHT + UPPER_Y + (int)position) * COLUMNS + (UPPER_X + offset) )*2 + 1] = note_mask;
			note_mask += 0b00001000;
			vram_ptr->VRAM[((grid*PART_HEIGHT + UPPER_Y + (int)position + 1) * COLUMNS + (UPPER_X + offset) )*2 + 1] = note_mask;
			offset++;
			note_mask += 0b00001000;
			vram_ptr->VRAM[((grid*PART_HEIGHT + UPPER_Y + (int)position) * COLUMNS + (UPPER_X + offset) )*2 + 1] = note_mask;
			note_mask += 0b00001000;
			vram_ptr->VRAM[((grid*PART_HEIGHT + UPPER_Y + (int)position + 1) * COLUMNS + (UPPER_X + offset) )*2 + 1] = note_mask;
		}
	}

	if (LL_flag) {
		if (floorf(position) == position) {
			LL_mask = 0x40;
		}
		else if (position == 0.5) {
			LL_mask = 0xC0;
		}

		vram_ptr->VRAM[((grid*PART_HEIGHT + UPPER_Y + (int)position) * COLUMNS + (UPPER_X + offset) )*2] |= LL_mask;
		if (note.DURATION == 16) {
			vram_ptr->VRAM[((grid*PART_HEIGHT + UPPER_Y + (int)position) * COLUMNS + (UPPER_X + offset - 1) )*2] |= LL_mask;
		}

		// need to draw other ledger line
		if (position < 1) {
			vram_ptr->VRAM[((grid*PART_HEIGHT + UPPER_Y + (int)position + 1) * COLUMNS + (UPPER_X + offset) )*2] |= LL_mask;
			if (note.DURATION == 16) {
				vram_ptr->VRAM[((grid*PART_HEIGHT + UPPER_Y + (int)position + 1) * COLUMNS + (UPPER_X + offset - 1) )*2] |= LL_mask;
			}
		}
	}

	// TODO - line (stem) drawing, tail drawing

	if (sharp_flag) {
		note_mask = 0xC0;
		vram_ptr->VRAM[((grid*PART_HEIGHT + UPPER_Y + (int)position) * COLUMNS + (UPPER_X + offset + 1) )*2 + 1] = note_mask;
		note_mask += 0b00001000;
		vram_ptr->VRAM[((grid*PART_HEIGHT + UPPER_Y + (int)position + 1) * COLUMNS + (UPPER_X + offset + 1) )*2 + 1] = note_mask;
	}

	if (dot_flag) {
		dot_mask = 0x01;
		vram_ptr->VRAM[((grid*PART_HEIGHT + UPPER_Y + (int)position) * COLUMNS + (UPPER_X + offset + 1) )*2] |= dot_mask;
	}

	if (line_flag) {
		if (line_dir == 0) {
			line_mask = 0x08;
			vram_ptr->VRAM[((grid*PART_HEIGHT + UPPER_Y + (int)position) * COLUMNS + (UPPER_X + offset) )*2] |= line_mask;
			vram_ptr->VRAM[((grid*PART_HEIGHT + UPPER_Y + (int)position - 1) * COLUMNS + (UPPER_X + offset) )*2] |= line_mask;
			vram_ptr->VRAM[((grid*PART_HEIGHT + UPPER_Y + (int)position - 2) * COLUMNS + (UPPER_X + offset) )*2] |= line_mask;

			if (tail_flag) { // use upward tail
				note_mask = 0x80;
				vram_ptr->VRAM[((grid*PART_HEIGHT + UPPER_Y + (int)position - 2) * COLUMNS + (UPPER_X + offset + 1) )*2 + 1] |= note_mask;
				note_mask += 0b00001000;
				vram_ptr->VRAM[((grid*PART_HEIGHT + UPPER_Y + (int)position - 1) * COLUMNS + (UPPER_X + offset + 1) )*2 + 1] |= note_mask;
			}
		}
		else {
			line_mask = 0x10;
			vram_ptr->VRAM[((grid*PART_HEIGHT + UPPER_Y + (int)position) * COLUMNS + (UPPER_X + offset) )*2] |= line_mask;
			vram_ptr->VRAM[((grid*PART_HEIGHT + UPPER_Y + (int)position + 1) * COLUMNS + (UPPER_X + offset) )*2] |= line_mask;
			vram_ptr->VRAM[((grid*PART_HEIGHT + UPPER_Y + (int)position + 2) * COLUMNS + (UPPER_X + offset) )*2] |= line_mask;

			if (tail_flag) { // use downward tail
				note_mask = 0x90; // 0b10010000
				vram_ptr->VRAM[((grid*PART_HEIGHT + UPPER_Y + (int)position + 1) * COLUMNS + (UPPER_X + offset - 1) )*2 + 1] |= note_mask;
				note_mask += 0b00001000;
				vram_ptr->VRAM[((grid*PART_HEIGHT + UPPER_Y + (int)position + 2) * COLUMNS + (UPPER_X + offset - 1) )*2 + 1] |= note_mask;
			}
		}
	}

	return incr;
}
int pitchtable(int idx) {
	int pitch_mod = 0;
	int return_note = -1;
	if(idx == 0) {
		return 0;
	}
	float hz = idx * 5.383;
	float sub_mod = 5.383/2;
//	hz is the lower bound of the "bin", each bin corresponds to
//	printf("mom I'm not stuck in a for loop, %f \n ", hz);

	while(hz < 250.0) {
		hz = hz * 2;
		pitch_mod = pitch_mod - 12;
	}
	while (hz > 501) {
		hz = hz / 2;
		pitch_mod = pitch_mod + 12;
	}
	if(hz > (483.88 - sub_mod)) {
		return 30 + pitch_mod;
	}
	if(hz > (466.16 - sub_mod)) {
		return 29 + pitch_mod;
	}
	if(hz > (440 - sub_mod)) {
			return 28 + pitch_mod;
		}
	if(hz > (415.30 - sub_mod)) {
			return 27 + pitch_mod;
		}
	if(hz > (392 - sub_mod)) {
			return 26 + pitch_mod;
		}
	if(hz > (370 - sub_mod)) {
			return 25 + pitch_mod;
		}
	if(hz > (349.23 - sub_mod)) {
			return 24 + pitch_mod;
		}
	if(hz > (329.63 - sub_mod)) {
			return 23 + pitch_mod;
		}
	if(hz > (311.13 - sub_mod)) {
			return 22 + pitch_mod;
		}
	if(hz > (293.66	 - sub_mod)) {
			return 21 + pitch_mod;
		}
	if(hz > (277.18	 - sub_mod)) {
			return 20 + pitch_mod;
		}
	if(hz > (261.63	 - sub_mod)) {
				return 19 + pitch_mod;
			}

	return -1;
}

void testsheet() {
	clear();

	printf("Beginning sheet music test... \n");

	struct NOTE n;
	n.PITCH = 23; // E
	n.DURATION = 4;
	int ts = 0;
	ts += drawnote(n, ts);
	n.PITCH = 21; // D
	ts += drawnote(n, ts);
	n.PITCH = 19; // C
	ts += drawnote(n, ts);
	n.PITCH = 21;
	ts += drawnote(n, ts);

	n.PITCH = 23;
	ts += drawnote(n, ts);
	ts += drawnote(n, ts);
	n.DURATION = 8;
	ts += drawnote(n, ts);

	n.PITCH = 21;
	n.DURATION = 4;
	ts += drawnote(n, ts);
	ts += drawnote(n, ts);
	n.DURATION = 8;
	ts += drawnote(n, ts);

	n.PITCH = 23;
	n.DURATION = 4;
	ts += drawnote(n, ts);
	n.PITCH = 26; // G
	ts += drawnote(n, ts);
	n.DURATION = 8;
	ts += drawnote(n, ts);

	n.PITCH = 23; // E
	n.DURATION = 4;
	ts += drawnote(n, ts);
	n.PITCH = 21; // D
	ts += drawnote(n, ts);
	n.PITCH = 19; // C
	ts += drawnote(n, ts);
	n.PITCH = 21;
	ts += drawnote(n, ts);

	n.PITCH = 23;
	ts += drawnote(n, ts);
	ts += drawnote(n, ts);
	ts += drawnote(n, ts);
	ts += drawnote(n, ts);

	n.PITCH = 21;
	ts += drawnote(n, ts);
	n.DURATION = 2;
	ts += drawnote(n, ts);
	ts += drawnote(n, ts);
	n.DURATION = 4;
	n.PITCH = 23;
	ts += drawnote(n, ts);
	n.PITCH = 21;
	ts += drawnote(n, ts);

	n.PITCH = 19;
	n.DURATION = 16;
	ts += drawnote(n, ts);

	usleep (500000);

	//while(1){}

	clear();


	// debug tests
	ts = 0;
	n.PITCH = 44;
	ts += drawnote(n, ts);

	n.DURATION = 4;
	n.PITCH = 42;
	ts += drawnote(n, ts);

	n.PITCH = 0;
	n.DURATION = 2;
	ts += drawnote(n, ts);

	n.PITCH = -1;
	n.DURATION = 16;
	ts += drawnote(n, ts);

	n.DURATION = 8;
	ts += drawnote(n, ts);

	n.DURATION = 4;
	ts += drawnote(n, ts);

	n.DURATION = 2;
	ts += drawnote(n, ts);

	n.PITCH = 30;
	n.DURATION = 3;
	ts += drawnote(n, ts);

	n.DURATION = 6;
	ts += drawnote(n, ts);

	n.DURATION = 12;
	ts += drawnote(n, ts);

}

void testdraw() {
	for (int i = 0; i < ROWS; i++) {
		vram_ptr->VRAM[i] = i;
		printf("Written value is: %d\n", i);
	}

	for (int i = 0; i < ROWS; i++) {
		int temp = vram_ptr->VRAM[i];
		printf("Writeback is: %d\n", temp);
	}

	int temp = vram_ptr->VRAM[6];
	printf("DEBUG: Writeback is: %d\n", temp);
	temp = vram_ptr->VRAM[8];
	printf("DEBUG: Writeback is: %d\n", temp);
	temp = vram_ptr->VRAM[10];
	printf("DEBUG: Writeback is: %d\n", temp);
	temp = vram_ptr->VRAM[3];
	printf("Writeback is: %d\n", temp);

	for(int i = 0; i < ROWS*COLUMNS*2; i++) {
		vram_ptr->VRAM[i] = 0;
	}

	for(int p = 0; p < 3; p++) {
		for (int j = UPPER_Y + PART_HEIGHT * p; j < UPPER_Y + GRID_HEIGHT + PART_HEIGHT * p; j++) {
			for(int i = UPPER_X*2; i < (UPPER_X + GRID_WIDTH)*2; i++) {
				vram_ptr->VRAM[j*COLUMNS*2 + i] = 0x10;
				//printf("Index %d set to %u\n", i, vram_ptr->VRAM[i]);
			}
		}
	}
}




