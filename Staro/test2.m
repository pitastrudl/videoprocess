pkg load video
pkg load image
#pretravjamo video v slike
info = aviinfo ("famnit_hitripremik.mp4")
info.NumFrames
aviobj = avifile("famnit_hitripremik.mp4")

for i = 1:info.NumFrames-1
  string = int2str(i)
  concated = strcat("img",string,".jpeg")
  img = aviread("famnit_hitripremik.mp4",i);
  imwrite(img, concated)                  
end

clear aviobj
clear img
clear g
 
% 
% pkg load video
%pkg load image
%info = aviinfo ("output.avi")
%info.NumFrames
%
%#da dobimo enako sliko ven 
%
%
%#aviobj = avifile("targetvideo.avi")
%
%#aviobj = avifile("filename.avi", "codec","mpeg4","fps",30,"gop",1,"bitrate",4000000)
%aviobj = avifile("output.avi")
%#display(img);
%#debug_on_error (1) 
%g=0;
%for i = 1:info.NumFrames-1
%  i
%  img = aviread("output.avi",i);
%  addframe(aviobj,img);                                     
%end
%g
%#avifile("targetvideo.avi",30.0,10,400000)
%#avifile("targetvideo.avi",["codec",mpeg4],10,400000)
%#saveobj aviobj
%clear aviobj
%clear img
%clear g
%  

