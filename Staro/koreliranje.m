pkg load signal
pkg load image
clear -a 
%
prvi_vect_mad = load("/home/arun/Desktop/videoti/prvi/prvi.mp4_vect_mad.mat","vect_mad").vect_mad;
prvi_vect_msd = load("/home/arun/Desktop/videoti/prvi/prvi.mp4_vect_msd.mat","vect_msd").vect_msd;

drugi_vect_mad = load("/home/arun/Desktop/videoti/drugi/drugi.mp4_vect_mad.mat","vect_mad").vect_mad;
drugi_vect_msd = load("/home/arun/Desktop/videoti/drugi/drugi.mp4_vect_msd.mat","vect_msd").vect_msd;

tretji_vect_mad = load("/home/arun/Desktop/videoti/tretji/tretji.mp4_vect_mad.mat","vect_mad").vect_mad;
tretji_vect_msd = load("/home/arun/Desktop/videoti/tretji/tretji.mp4_vect_msd.mat","vect_msd").vect_msd;

konkat_vect_mad = load("/home/arun/Desktop/videoti/konkat/konkat.mp4_vect_mad.mat","vect_mad").vect_mad;
konkat_vect_msd = load("/home/arun/Desktop/videoti/konkat/konkat.mp4_vect_msd.mat","vect_msd").vect_msd;

prvitest_vect_mad = load("/home/arun/Desktop/videoti/prvitest/prvitest.mp4_vect_mad.mat","vect_mad").vect_mad;
prvitest_vect_msd = load("/home/arun/Desktop/videoti/prvitest/prvitest.mp4_vect_msd.mat","vect_msd").vect_msd;

#korel =xcorr(konkat_vect_msd,tretji_vect_msd,"none");
%korel =xcorr(konkat_vect_msd,tretji_vect_msd);
%plot(korel)

%xkorel = normxcorr2 (tretji_vect_mad,konkat_vect_mad);
%xkorel2 = normxcorr2 (tretji_vect_msd,konkat_vect_msd);

xkorel = normxcorr2 (prvitest_vect_mad,konkat_vect_mad);
xkorel2 = normxcorr2 (prvitest_vect_msd,konkat_vect_msd);
[a b ] = max(xkorel)
[a b ] = max(xkorel2)


subplot(2,1,1);
plot(xkorel); 
title("mad xcorr");
subplot(2,1,2)
plot(xkorel2); 
title("msd xcorr");


function ret = getTau(A,B)
  #a je krajsi, b daljsi , kako pol ce sta obratno? al neki kaj pa ce sta enaka 
  #mogoce se ustimat da cekira argumente, da so pravilni
temp = normxcorr2 (A,B);
[tempmax tempmaxlen] = max(temp)
tempmaxlen
ret =  tempmaxlen -  length(A);


end


getTau(prvitest_vect_mad,konkat_vect_mad)

tt2 = imabsdiff(prvitest_vect_mad(180),konkat_vect_mad(390))  #absolutna ralzika med dvema matrikama 



