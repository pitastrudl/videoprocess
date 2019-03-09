function atest (video)
pkg load video
pkg load image
info = aviinfo (video)
info.NumFrames
%aviobj = avifile(video,["h264",29.934,10,400000])

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

