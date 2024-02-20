docker run --rm -ti --name fuzzgbajpeg --mount type=bind,source=/fuzzing-outs,destination=/outs --mount type=tmpfs,destination=/ramdisk -e AFL_TMPDIR=/ramdisk gbajpeg-harness bash
