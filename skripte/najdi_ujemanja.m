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
## @deftypefn {} {@var{retval} =} najdi_ujemanja (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: arun <arun@hplaptop>
## Created: 2019-01-10

function[vsivektorji,zamik] = najdi_ujemanja (vrhovi, prvivektor,drugivektor)
pkg load signal
pkg load image
    zamik = []; #array zamikov
    primerjalni_vektor =[]; 
    # nastavimo ker je vecji in ker manjsi
    if(prvivektor.vecji == false )
      manjsivektor = prvivektor;
      vecjivektor = drugivektor;
    else
      manjsivektor = drugivektor;
      vecjivektor = prvivektor;
    endif

    # glavni loop
    for i =1:length(vrhovi)
      tau = vrhovi(i) - numel(manjsivektor.vektor_sprememb); 
     if(tau + length(manjsivektor.vektor_sprememb ) > length(vecjivektor.vektor_sprememb)  )
     continue # če zamik ne ustreza, preskočimo
     endif
 
 # za določen tau, oziroma zamik, gremo z MAD primerjat, če najdemo zamike.
        for j = 1:length(manjsivektor.vektor_sprememb) 
         primerjalni_vektor(j)= mad( vecjivektor.vektor_sprememb(tau+j) , manjsivektor.vektor_sprememb(j) );
        endfor

       vsivektorji{i}=primerjalni_vektor;
       
      tempsmooth= (imsmooth(primerjalni_vektor, "Gaussian", 30));
        if(max(tempsmooth) < 1) # naš "threshold", razlika med piksli manj kot 1.
            figure(i);
            #plot(tempsmooth);
            zamik(end+1) = tau;

            #drawnow
        endif 
    endfor 
    endfunction 

    
