#!/bin/bash
# Check if this script is running in a screen session or if the -f flag is passed
if [[[ -z "$STY" ] && [ -z "$TMUX" ]  && "$1" != "-f" ]]; then
    echo "This script should run in a screen session. Use -f to run it outside of screen."
    exit 1
fi

docker run --rm -ti --name fuzzgbajpeg --mount type=bind,source=/fuzzing-outs,destination=/outs --mount type=tmpfs,destination=/ramdisk -e AFL_TMPDIR=/ramdisk gbajpeg-harness bash run12tmux.sh
