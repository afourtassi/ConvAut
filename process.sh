#!/bin/sh

corpus=$1

find $corpus/ -name "*.cha" | while read -r file; do cat "$file" |  grep '^\*' | sed 's/^\*//g' > $file.conv ; done
