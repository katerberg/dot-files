#!/bin/bash

#for i in `find . -type f -name \*.avi -print0 | xargs -0 echo`
find . -type f -name \*.avi -print0 | while read -d $'\0' file
do
avidemux2_cli --video-codec copy --audio-codec AAC --autoindex --force-unpack --load "$file" --output-format MKV --save "${file%????}.mkv"
if [ $? -eq 0 ]; then
    rm "$file"
else
    exit $?
fi
done
