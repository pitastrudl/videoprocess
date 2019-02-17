#!/bin/bash
find ./ -name "*.wav" -print | while read f
for name in *.mp4; do
  ffmpeg -i "$name" 
done 
