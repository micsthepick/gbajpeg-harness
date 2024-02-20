// SPDX-License-Identifier: CC0-1.0
//
// SPDX-FileContributor: Antonio Niño Díaz, 2023

#include <stdio.h>
#include <stdlib.h>
#include <inttypes.h>
#include <unistd.h>

//#include <nds.h>
//#include <filesystem.h>

#include <gba-jpeg-decode.h>


__AFL_FUZZ_INIT();

uint16_t buffer[256 * 192];

int main(int argc, char **argv)
{


#ifdef __AFL_HAVE_MANUAL_CONTROL
    __AFL_INIT();
#endif
    unsigned char *buf = __AFL_FUZZ_TESTCASE_BUF;

    while (__AFL_LOOP(__UINT16_MAX__)) {
        int len = __AFL_FUZZ_TESTCASE_LEN;
        if (len < 3) continue;
        JPEG_DecompressImage(&__AFL_FUZZ_TESTCASE_BUF[8], buffer, *(int*)&__AFL_FUZZ_TESTCASE_BUF[0], *(int*)&__AFL_FUZZ_TESTCASE_BUF[4]);
    }
    //uint32_t ticks = cpuEndTiming();

    //free(jpg_file);

    //printf("Image decoded!\n");

    //printf("Time elapsed: %" PRIu32 " ms\n", timerTicks2msec(ticks));

    // Flush the cache before doing a DMA copy
    //DC_FlushRange(buffer, sizeof(buffer));
    //dmaCopyWords(3, buffer, VRAM_A, sizeof(buffer));

    //printf("\n");
    //printf("Press START to exit to loader");

    // while (1)
    // {
    //     swiWaitForVBlank();

    //     scanKeys();
    //     if (keysDown() & KEY_START)
    //         break;
    // }

    return 0;
}
