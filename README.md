# Videoprocess - Final thesis , Video procesiranje in iskanje duplikatov

Sample files are added in the repo. Use najdi.m to match up videos. This is a proof of concept.

This project needs mexopencv 3 with Octave 4.2.2, after you add it ,add this to your .octaverc:

```octave
tempp = pwd
cd('~/cv/mexopencv')
addpath('~/cv/mexopencv')
addpath('~/cv/mexopencv/opencv_contrib')
addpath('~/cv/mexopencv/+cv/private')                 % HACK
addpath('~/cv/mexopencv/opencv_contrib/+cv/private')  % HACK
cd(pwd)
clear tempp
```
Usage goes in order:
1. load sample file
2. [b seznam prvi drugi]= iskanje_kandidatov(drugi_videoposnetek,prvi_videoposnetek,0.5);seznam
3. [vsivektorji,zamik,obseg_ujemanja] =iskanje_ujemanj(seznam,prvi,drugi,5,25);obseg_ujemanja

that's it. You can use some sample plots which were used trough the thesis in testiranje.m. Data can be loaded from saved files. 
