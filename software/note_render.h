/*
 * note_render.h
 *
 *  Created on: May 1, 2023
 *      Author: 17345
 */

#ifndef NOTE_RENDER_H_
#define NOTE_RENDER_H_

#define COLUMNS 80
#define ROWS 60

#include <system.h>
#include <alt_types.h>

struct NOTE_RENDER_STRUCT {
	alt_u32 VRAM [ROWS*COLUMNS/2];
};

static volatile struct NOTE_RENDER_STRUCT* vram_ptr = VGA_MUSIC_RENDER_0_BASE;

void drawNote(char* str, int x, int y);
void testdraw();

#endif /* NOTE_RENDER_H_ */
