pkg load video
pkg load image


info = aviinfo ("famnit_hitripremik.mp4")
info.NumFrames
aviobj = avifile("targetvideo.avi")
#display(img);

for i = 1:info.NumFrames
  img = aviread("famnit_hitripremik.mp4",i);
  #aviobj = addframe(aviobj,img);                                                            
endfor







