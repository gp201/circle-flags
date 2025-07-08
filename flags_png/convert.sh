#!/bin/bash

# Simple script to convert SVG flags to PNG using Inkscape
echo "Converting SVG flags to PNG..."

# Convert all SVG files in flags directory
for svg_file in ../flags/*.svg; do
    if [[ -f "$svg_file" ]]; then
        filename=$(basename "$svg_file")
        png_filename="${filename%.svg}.png"
        
        echo "Converting $filename..."
        inkscape "$svg_file" --export-type=png --export-filename="$png_filename" --export-width=512 --export-height=512 --export-background-opacity=0 2>/dev/null
        echo "✓ Created $png_filename"
    fi
done

# Convert SVG files in subdirectories
for subdir in ../flags/*/; do
    if [[ -d "$subdir" ]]; then
        dirname=$(basename "$subdir")
        mkdir -p "$dirname"
        
        for svg_file in "$subdir"*.svg; do
            if [[ -f "$svg_file" ]]; then
                filename=$(basename "$svg_file")
                png_filename="${filename%.svg}.png"
                
                echo "Converting $dirname/$filename..."
                inkscape "$svg_file" --export-type=png --export-filename="$dirname/$png_filename" --export-width=512 --export-height=512 --export-background-opacity=0 2>/dev/null
                echo "✓ Created $dirname/$png_filename"
            fi
        done
    fi
done

echo "Done!"
