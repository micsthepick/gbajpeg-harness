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
        if (len < 8) continue;
        //int w = *(int*)(&__AFL_FUZZ_TESTCASE_BUF[0]);
        //int h = *(int*)(&__AFL_FUZZ_TESTCASE_BUF[4]);
        JPEG_DecompressImage(__AFL_FUZZ_TESTCASE_BUF, buffer, 256, 256);
    }
    return 0;
}
