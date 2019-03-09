pkg load video
pkg load image



fajl="famnit_hitripremik.mp4";
fajl="famnit_panning.mp4";
imeslike="image.png"; #je bla fora da jpeg ne dela dobr 

info = aviinfo (fajl);
nf = info.NumFrames;
nf
%rt = 2*1080 * ( (nf / 5) / 9000);
rt = ((nf/5)*1080) / 9000


[in, out, pid] = popen2 ("ffmpeg -i",[fajl,"-frames 1 -vf scale=iw/",num2str(rt),":ih,select=not(mod(n\,5)),tile=",int2str(nf / 5) , "x1'",imeslike]);


strarg = strcat("fajl=",fajl,";nf=",num2str(rt),";fr=",int2str(nf),";imgname=",imeslike,";")
system([strarg '' 'ffmpeg -i $fajl -frames 1 -vf "select=not(mod(n\,5)),scale=iw/$nf:ih,tile=$frx1" $imgname']);


system(["ffmpeg -i "'' fajl ''"-frames 1 -vf 'scale=iw/" '' num2str(rt) '' "':ih,select=not(mod(n\,5)),tile="'' int2str(nf / 5)    ''"x1' ''" imeslike]);




#ta ni delala
#system(["ffmpeg -i "'' fajl ''"-frames 1 -vf 'scale=iw/" '' num2str(rt) '' "':ih,select=not(mod(n\,5)),tile="'' int2str(nf / 5)    ''"x1' ''" imeslike]);


#system(["ffmpeg -i ''' fajl '''-frames 1 -vf "scale=iw/''' int2str(rt) ''':ih,select=not(mod(n\,5)),tile=''' int2str(nf / 5)    '''x1" ''' imeslike]);


#ffmpeg -i famnit_hitripremik.mp4 -frames 1 -vf "scale=iw/40:ih,select=not(mod(n\,5)),tile=180x1" image.png





[in, out, pid] = popen2 ("sort", "-r");
fputs (in, "these\nare\nsome\nstrings\n");
fclose (in);
EAGAIN = errno ("EAGAIN");
done = false;
do
  s = fgets (out);
  if (ischar (s))
    fputs (stdout, s);
  elseif (errno () == EAGAIN)
    pause (0.1);
    fclear (out);
  else
    done = true;
  endif
until (done)
fclose (out);
waitpid (pid);

   -| these
   -| strings
   -| some
   -| are
