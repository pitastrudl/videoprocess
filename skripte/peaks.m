#od rogla
pkg load image
graphics_toolkit("gnuplot")
clear -a
load korelacija_abc_dge.mat
xkorel = korelbak;
graphics_toolkit("qt")
%load korelacija_abc_dge.mat
figure(1); plot(xkorel);


c0=xkorel;
c1= imsmooth(c0, "Gaussian", 30); %"Gaussian" filter for octave, used for 1d, although it is a 2d function.

figure(2); plot(c1);


c2 = (c0-c1)>0.4;

figure(3); plot(c2);


