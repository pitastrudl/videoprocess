# Videoprocess - Final thesis , Video procesiranje in iskanje duplikatov

Sample files are added in the repo. Use najdi.m to match up videos. This is a proof of concept.

This project needs mexopencv with Octave, after you add it ,add this to your .octaverc:

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

