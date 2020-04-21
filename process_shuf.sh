#!/bin/sh

corpus=$1

find $corpus/ -name "*.txt" | while read -r file; do cat "$file" | sed 1d | shuf  > $file-rand ; done

find $corpus/ -name "*-rand" | while read -r file; do { echo -e "participant\tcontent"; cat "$file"; } > $file.txt ; done

find $corpus/ -name "*-rand" -type f -delete
