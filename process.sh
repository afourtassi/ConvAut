#!/bin/sh

corpus=$1

find $corpus/ -name "*.cha" | while read -r file; do cat "$file" |  grep '^\*' | sed 's/^\*//g' | sed 's/xxx//g' | sed 's/yyy//g' | sed 's/www//g' | sed -E 's/\(.+\)//g' | sed 's/[\<\>]//g'  | sed -E 's/&=?-?\+?[a-z]+//g' | sed -E 's/\[.+\]//g' | sed 's/://g' | sed -E 's/@[a-z]+//g' | sed -E 's/[.,\!\?\+\/0]//g' > $file.conv ; done

find $corpus/ -name "*.conv" | while read -r file; do { echo -e "participant\tcontent"; cat "$file"; } > $file.txt ; done

find $corpus/ -name "*.conv" -type f -delete
