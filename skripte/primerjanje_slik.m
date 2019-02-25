## Copyright (C) 2019 arun
## 
## This program is free software; you can redistribute it and/or modify it
## under the terms of the GNU General Public License as published by
## the Free Software Foundation; either version 3 of the License, or
## (at your option) any later version.
## 
## This program is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
## 
## You should have received a copy of the GNU General Public License
## along with this program.  If not, see <http://www.gnu.org/licenses/>.

## -*- texinfo -*- 
## @deftypefn {} {@var{retval} =} primerjanje_slik (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: arun <arun@hplaptop>
## Created: 2019-02-21

function primerjanje_slik (video1, video2,zamik)


figure(1)
title("video 1")
imshow(video1(:,:,1))
figure(2)
title("video 2 + zamik")
imshow(video2(:,:,1+zamik))





endfunction
