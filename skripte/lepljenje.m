

function lepljenje (video1,video2,outputfajl)
system(["ffmpeg -i" ' ' video1 ' ' "-c copy -bsf:v h264_mp4toannexb -f mpegts intermediate1.ts"])
system(["ffmpeg -i" ' ' video2 ' ' "-c copy -bsf:v h264_mp4toannexb -f mpegts intermediate2.ts"])
system(["ffmpeg -i" ' ' "\"concat:intermediate1.ts|intermediate2.ts\" -c copy -bsf:a aac_adtstoasc" ' ' outputfajl ]) 
endfunction

