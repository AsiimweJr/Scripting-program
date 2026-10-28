#!/bin/bash

if [ -z "$1" ]; then
    echo "Usage: $0 <filename.vcf>"
    exit 1
fi

# Count the lines efficiently without using cat
line_numbers=$(wc -l < "$1")

echo "Number of lines in file $1 is $line_numbers"

