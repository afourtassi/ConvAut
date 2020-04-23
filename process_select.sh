#!/bin/sh

corpus=$1

find $corpus/ -name "*.txt" | while read -r file; do cat "$file" | grep -E -v "CHI\s+$" | grep -C 1 "CHI" | grep -v "^--" | uniq  > $file-select ; done

find $corpus/ -name "*-select" | while read -r file; do { echo -e "participant\tcontent"; cat "$file"; } > $file.txt ; done

find $corpus/ -name "*-select" -type f -delete
