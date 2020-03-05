#!/bin/sh

corpus=$1

find $corpus/ -name "*.cha" | while read -r file; do cat "$file" |  grep '^\*' | sed 's/^\*//g' > $file.conv ; done

find $corpus/ -name "*.conv" | while read -r file; do { echo -e "participants\tcontent"; cat "$file"; } > $file.txt ; done

find $corpus/ -name "*.conv" -type f -delete
