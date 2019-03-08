#sprejme dva vektorja
#vrne vrhove
function [a seznam_tau prvi drugi] = korelacija_v1(prvi_posnetek,drugi_posnetek)
pkg load signal
pkg load image

#manjsi je ta prvi?
%prvi_posnetek.polozaj_v_normxcorr = "prvivektor";
%drugi_posnetek.polozaj_v_normxcorr = "drugivektor";

[vektor_korelacije prvi drugi]= normirana_korelacijav1(prvi_posnetek,drugi_posnetek);
vrhovi= zeros(numel(vektor_korelacije));
vektor_korelacije(end+5)=0;  #kaj pa zacetek , ce je korelacija na zacetku 
a = vektor_korelacije;
v1 = imsmooth(vektor_korelacije, "Gaussian", 30);
v2 = (vektor_korelacije-v1)>0.6;
seznam_tau = find(v2);
%for i = 1:numel(vektor_korelacije)-5
%   #seznam_tau = 10; # ne pride v prvi if. 
%  #ce je lokalna manjsa od globalne, spremenu obratno, zakaj ta 0.4 deluje? 
%  if ( std(vektor_korelacije(i:i+5))*0.5 > std(vektor_korelacije) )   
%    #računamo sproti taue
%     if(vektor_korelacije(i)>0)
%        vrhovi(i) = vektor_korelacije(i);
%        seznam_tau(end +1)  =  i;
%     endif
%  endif
%endfor


%prvivektor{1}=1;
%drugivektor{1}=1; 
endfunction




v1 = imsmooth(vektor_korelacije, "Gaussian", 30); %"Gaussian" filter for octave, used for 1d, although it is a 2d function.
figure(2); plot(v1);
v2 = (vektor_korelacije-v1)>0.4;
