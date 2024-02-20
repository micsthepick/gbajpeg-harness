#!/bin/bash

# Directory containing JPEG files
SOURCE_DIR="./gbajpeg/example/nitrofs"
# Output directory for modified files
OUTPUT_DIR="/fuzzing-outs/seeds-harness"

# Make sure the output directory exists
mkdir -p "$OUTPUT_DIR"

# Find all JPEG files and process them
find "$SOURCE_DIR" -type f -name "*.jpg" -o -name "*.jpeg" | while read filename
do
    # Extract the base name for the output file
    base_name=$(basename "$filename")
    output_file="$OUTPUT_DIR/$base_name"
    # Use Python to get the dimensions as uint8 and append them to the image data
    python -c "
from PIL import Image
import struct

# Open the image file
with Image.open('$filename') as img:
    # Extract dimensions
    width, height = img.size
    # Convert dimensions to uint8
    width_uint8 = width & 0xFF
    height_uint8 = height & 0xFF
    # Pack the dimensions into binary format
    dimensions = struct.pack('II', width, height)  # 'I' is the format code for uint32
    # Read the original image data
    with open('$filename', 'rb') as original:
        img_data = original.read()
    # Combine the dimensions and image data
    new_content = dimensions + img_data
    # Write the new content to the output file
    with open('$output_file', 'wb') as output:
        output.write(new_content)
"
done

