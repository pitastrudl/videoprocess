#!/bin/bash
temp = ffmpeg -i $1 -map 0:v:0 -c copy -f null - 2>&1 
numframe = awk '/frame=/ {print $2}') $temp

