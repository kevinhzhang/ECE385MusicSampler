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
#include <alt_types.h>
#include "note_render.h"

void testdraw() {
	for (int i = 0; i < ROWS; i ++) {
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

	vram_ptr-> VRAM[0] = 0xFFFFFFFF;
}




