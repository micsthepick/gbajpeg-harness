export AFL_AUTORESUME=1 AFL_CMPLOG_ONLY_NEW=1 AFL_IMPORT_FIRST=1 AFL_TESTCACHE_SIZE=100MB
[ "$M" == "a" ] && mkdir -p /ramdisk/tmp00 && AFL_TMPDIR=/ramdisk/tmp00 AFL_FINAL_SYNC=1   afl-fuzz -i /outs/seeds-$PGM -M $PGM-$M -o out-$PGM -a binary -p fast                 -- ./$PGM-laf
[ "$M" == "b" ] && mkdir -p /ramdisk/tmp01 && AFL_TMPDIR=/ramdisk/tmp01                    afl-fuzz -i /outs/seeds-$PGM -S $PGM-$M -o out-$PGM -a binary -p exploit              -- ./$PGM-san
[ "$M" == "c" ] && mkdir -p /ramdisk/tmp02 && AFL_TMPDIR=/ramdisk/tmp02                    afl-fuzz -i /outs/seeds-$PGM -S $PGM-$M -o out-$PGM -a binary -c ./$PGM-cmp -l 2AT    -- ./$PGM-afl
[ "$M" == "d" ] && mkdir -p /ramdisk/tmp03 && AFL_TMPDIR=/ramdisk/tmp03                    afl-fuzz -i /outs/seeds-$PGM -S $PGM-$M -o out-$PGM -a binary -c ./$PGM-cmp           -- ./$PGM-afl
[ "$M" == "e" ] && mkdir -p /ramdisk/tmp04 && AFL_TMPDIR=/ramdisk/tmp04                    afl-fuzz -i /outs/seeds-$PGM -S $PGM-$M -o out-$PGM -a binary -p rare -L 0            -- ./$PGM-afl
[ "$M" == "f" ] && mkdir -p /ramdisk/tmp05 && AFL_TMPDIR=/ramdisk/tmp05                    afl-fuzz -i /outs/seeds-$PGM -S $PGM-$M -o out-$PGM -a binary -p explore -Z           -- ./$PGM-afl
[ "$M" == "g" ] && mkdir -p /ramdisk/tmp06 && AFL_TMPDIR=/ramdisk/tmp06                    afl-fuzz -i /outs/seeds-$PGM -S $PGM-$M -o out-$PGM -a binary -p explore              -- ./$PGM-afl
[ "$M" == "h" ] && mkdir -p /ramdisk/tmp07 && AFL_TMPDIR=/ramdisk/tmp07 AFL_DISABLE_TRIM=1 afl-fuzz -i /outs/seeds-$PGM -S $PGM-$M -o out-$PGM -a binary -p explore              -- ./$PGM-afl
[ "$M" == "i" ] && mkdir -p /ramdisk/tmp08 && AFL_TMPDIR=/ramdisk/tmp08 AFL_DISABLE_TRIM=1 afl-fuzz -i /outs/seeds-$PGM -S $PGM-$M -o out-$PGM -a binary -p explore              -- ./$PGM-afl
[ "$M" == "j" ] && mkdir -p /ramdisk/tmp09 && AFL_TMPDIR=/ramdisk/tmp09 AFL_DISABLE_TRIM=1 afl-fuzz -i /outs/seeds-$PGM -S $PGM-$M -o out-$PGM -a binary -p explore              -- ./$PGM-afl
[ "$M" == "k" ] && mkdir -p /ramdisk/tmp10 && AFL_TMPDIR=/ramdisk/tmp10 AFL_DISABLE_TRIM=1 afl-fuzz -i /outs/seeds-$PGM -S $PGM-$M -o out-$PGM -a binary -p exploit              -- ./$PGM-afl
[ "$M" == "l" ] && mkdir -p /ramdisk/tmp11 && AFL_TMPDIR=/ramdisk/tmp11 AFL_DISABLE_TRIM=1 afl-fuzz -i /outs/seeds-$PGM -S $PGM-$M -o out-$PGM -a binary -p lin                  -- ./$PGM-afl
