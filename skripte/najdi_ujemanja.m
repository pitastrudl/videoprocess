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
    
    primerjalni_vektor =[];
    # nastimamo ker je vecji in ker manjsi
    if(prvivektor{3} == "manjsi" )
      manjsivektor = prvivektor;
      vecjivektor = drugivektor;
    else
      manjsivektor = drugivektor;
      vecjivektor = prvivektor;
    endif

    # glavni loop
    for i =1:length(vrhovi)
      tau = vrhovi(i) - numel(manjsivektor{1}); #96, zamik
      if(tau > numel(manjsivektor{1} ))
        break; 
      endif
 
        for j = 1:length(manjsivektor{1}) #primerjamo, lahk oze tuki gledam od kdaj do kdaj se primerja...?
         primerjalni_vektor(j)= mad( vecjivektor{1}(tau+j) , manjsivektor{1}(j) );
        endfor
      #pisemo stvari
       #tempsmooth = primerjalni_vektor;
       vsivektorji{i}=primerjalni_vektor;
      tempsmooth= (imsmooth(primerjalni_vektor, "Gaussian", 30));
        if(max(tempsmooth) < 1) # da je max razlika manj kot 1, potem je vredu 
            figure(i);
            
            plot(tempsmooth);
            zamik = ta #tukaj povozi druge, ce je več ujemanj
            drawnow
        endif 
    endfor 
endfunction











# naredit z mad? 
  for i =1:length(vrhovi)
  if vrhovi(i) < 0 
    abstau = abs(vrhovi(i))
    
        for j=abstau:length(manjsilist)
          A = (manjsilist(:,:,j));
          B=  (vecjilist(:,:,j-abstau+1));
          imgdiff = imabsdiff( A, B );  
          
          if sum(sum(imgdiff)) == 0  #se lahko zgodi tudi samo ce sta mogoce bela obadva. 
            imgdiff
            j
            foundtau= vrhovi(i);
            break 
          endif
          
        endfor
        
      else #-------------------------
      
         for j=1:length(manjsilist)
             if j+vrhovi(i) > length(vecjilist)
               break
             end
            A = (manjsilist(:,:,j)) ; #+1 da ni out of bounds
            B=  (vecjilist(:,:,j+vrhovi(i))); 
            imgdiff = imabsdiff( A, B );  
             if sum(sum(imgdiff)) == 0  #se lahko zgodi tudi samo ce sta mogoce bela obadva. 
              imgdiff
              j
              foundtau= vrhovi(i);
              break 
            end
          endfor
        endif
endfor
  


