
function lepljenje (video_posnetki,outputfajl)
for i=1:numel(video_posnetki)
  video_posnetki{i}
  tempstr=strcat("echo \"file '",video_posnetki{i},"'\""," >> mylist.txt")
  system([tempstr]) 
endfor

system(["ffmpeg -f concat -i mylist.txt -c copy" ' ' outputfajl ]) 

system("> mylist.txt") 
outputfajl
endfunction

