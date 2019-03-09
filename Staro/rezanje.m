pkg load video
pkg load image
#rezemo videje 

#system('ffmpeg -i /home/arun/Desktop/videoti/famnit_hitripremik.mp4 "/home/arun/Desktop/videoti/frames_test/%03d.jpg" ')

#s tem naredili ampak so bili artifakti
% 8828  ffmpeg -ss 00:00:10 -t 00:00:25 -i famnit_hitripremik.mp4 -acodec copy -vcodec copy manjsi.mp4
% 8829  ffmpeg -ss 00:00:10 -t 00:00:15 -i famnit_hitripremik.mp4 -acodec copy -vcodec copy manjsi2.mp4
% 8830  ffmpeg -ss 00:00:05 -t 00:00:10 -i famnit_hitripremik.mp4 -acodec copy -vcodec copy manjsi3.mp4
## 
% 8833  ffmpeg -ss 00:00:10 -t 00:00:20 -i -force-_key_frames famnit_hitripremik.mp4 -acodec copy -vcodec copy manjsi.mp4

#delalo prazne framje
% 8834  ffmpeg -ss 00:00:10 -t 00:00:20 -i -force-_key_frames famnit_hitripremik.mp4 -acodec copy -avoid_negative_ts make_zero copy manjsi.mp4
% 8835  ffmpeg -ss 00:00:10 -t 00:00:20 -i  famnit_hitripremik.mp4 -acodec copy -avoid_negative_ts make_zero copy manjsi.mp4
% 8836  ffmpeg -ss 00:00:10 -t 00:00:20 -i  famnit_hitripremik.mp4 -acodec -c copy -avoid_negative_ts make_zero copy manjsi.mp4
% 8837  ffmpeg -ss 00:00:10 -t 00:00:20 -i  famnit_hitripremik.mp4 -acodec -c copy -avoid_negative_ts make_zero  manjsi.mp4
% 8838  ffmpeg -ss 00:00:10 -t 00:00:20 -i  famnit_hitripremik.mp4 -acodec copy -avoid_negative_ts make_zero  manjsi.mp4

#se dekodira pa potem tudi je vredu. 
% 8839  ffmpeg -i famnit_hitripremik.mp4 -ss 2 -strict -2 -t 20 output_clip.mp4
% 8840  ffmpeg -i famnit_hitripremik.mp4 -ss 5 -strict -2 -t 10 output_clip.mp4
% 8841  ffmpeg -i famnit_hitripremik.mp4 -ss 5 -strict -2 -t 10 output_clip2.mp4



