#!/bin/bash

#gpt parallel version
# Function to run afl-tmin on a single file
minimize() {
    f=$1
    afl-tmin -i "./seeds-$PGM/$f" -o "seeds-$PGM-tmin/$f" -- /AFLplusplus/util-linux/$PGM-afl || exit 1
}

export -f minimize

# Ensure output directories exist
mkdir -p seeds-$PGM-tmin

# Run afl-tmin in parallel for chsh files
ls seeds-$PGM | parallel minimize
