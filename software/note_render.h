/*
 * note_render.h
 *
 *  Created on: May 1, 2023
 *      Author: 17345
 */

#ifndef NOTE_RENDER_H_
#define NOTE_RENDER_H_

#define COLUMNS 80
#define ROWS 60 // change to 60 after debug

// x,y coordinates of upper-left of grid
#define UPPER_X 8
#define UPPER_Y 3

#define GRID_HEIGHT 16
#define GRID_WIDTH  69

// there are 3 partitions
#define PART_HEIGHT 20

#define FALSE 0
#define TRUE 1

#include <system.h>
#include <alt_types.h>

struct NOTE_RENDER_STRUCT {
	alt_u8 VRAM [ROWS*COLUMNS*2];
};

struct NOTE {
	// 0-56 INCLUSIVE START AT F2 GOES UP BY HALF STEPS
	// -1 is rest
	int PITCH;
	// NUMBER OF TIMESLICES--MAX IS 16 (WHOLE NOTE)
	alt_u8 DURATION;
};

static float positions[] = {
		GRID_HEIGHT - 1, // F2 0
		GRID_HEIGHT - 1, // 1
		GRID_HEIGHT - 1.5, // 2
		GRID_HEIGHT - 1.5, // 3
		GRID_HEIGHT - 2, // 4
		GRID_HEIGHT - 2, // 5
		GRID_HEIGHT - 2.5, // 6
		GRID_HEIGHT - 3, // 7
		GRID_HEIGHT - 3, // 8
		GRID_HEIGHT - 3.5, // 9
		GRID_HEIGHT - 3.5, // 10
		GRID_HEIGHT - 4, // 11
		GRID_HEIGHT - 4.5, // 12
		GRID_HEIGHT - 4.5, // 13
		GRID_HEIGHT - 5, // 14
		GRID_HEIGHT - 5, // 15
		GRID_HEIGHT - 5.5, // 16
		GRID_HEIGHT - 5.5, // 17
		GRID_HEIGHT - 6, // 18
		GRID_HEIGHT - 9, // MIDDLE C (C4) 19
		GRID_HEIGHT - 9, // 20
		GRID_HEIGHT - 9.5, // 21
		GRID_HEIGHT - 9.5, // 22
		GRID_HEIGHT - 10, // 23
		GRID_HEIGHT - 10.5, // 24
		GRID_HEIGHT - 10.5, // 25
		GRID_HEIGHT - 11, // 26
		GRID_HEIGHT - 11, // 27
		GRID_HEIGHT - 11.5, // 28
		GRID_HEIGHT - 11.5, // 29
		GRID_HEIGHT - 12, // 30
		GRID_HEIGHT - 12.5, // 31
		GRID_HEIGHT - 12.5, // 32
		GRID_HEIGHT - 13, // 33
		GRID_HEIGHT - 13, // 34
		GRID_HEIGHT - 13.5, // 35
		GRID_HEIGHT - 14, // 36
		GRID_HEIGHT - 14, // 37
		GRID_HEIGHT - 14.5, // 38
		GRID_HEIGHT - 14.5, //39
		GRID_HEIGHT - 15, // 40
		GRID_HEIGHT - 15, // 41
		GRID_HEIGHT - 15.5, // 42
		GRID_HEIGHT - 16, // 43
		GRID_HEIGHT - 16 // 44
};

static volatile struct NOTE_RENDER_STRUCT* vram_ptr = VGA_MUSIC_RENDER_0_BASE;

// Draws note to screen at timeslice. Returns
// amount by which timeslice should be incremented.
// Returns -1 if error occurs.
int drawNote(struct NOTE note, int timeslice);

// clears screen
void clear();

// Tests writebacks and blocks out render-able sections
// of sheet music. Writeback test need not be passed
// if blocking appears to be correct.

// Range is F2-C6#, 0-56 inclusive
void testdraw();

// Prints basic scale then "Mary Had a Little Lamb."
void testsheet();

#endif /* NOTE_RENDER_H_ */
