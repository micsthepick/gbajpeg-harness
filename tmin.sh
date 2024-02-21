#!/bin/bash
export INDIR=outs/seeds-$PGM
export OUTDIR=seeds-$PGM-tmin

#gpt parallel version
# Function to run afl-tmin on a single file
minimize() {
	f=$1
	afl-tmin -i "$INDIR/$f" -o "$OUTDIR/$f" -- /AFLplusplus/util-linux/$PGM-afl || exit 1       }
export -f minimize
# Ensure output directories exist
mkdir -p $OUTDIR
# Run afl-tmin in parallel for $PGM files
ls $OUTDIR | parallel minimize
