#!/bin/sh

find nadig/ -name "*.cha" | while read -r file; do cat "$file" |  grep '^\*' | sed 's/^\*//g' > $file.conv ; done
