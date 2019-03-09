function atest (video)
pkg load video
pkg load image
info = aviinfo (video)
info.NumFrames
aviobj = avifile(video)

for i = 1:info.NumFrames-1
  string = int2str(i)
  concated = strcat("img",string,".jpeg")
  img = aviread(video,i);
  imwrite(img, concated)                  
end

clear aviobj
clear img
clear g
end

