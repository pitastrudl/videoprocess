#sprejme dva vektorja
#vrne vrhove
function [a seznam_tau prvi drugi] = korelacija (prvi_posnetek,drugi_posnetek)
pkg load signal
pkg load image



[vektor_korelacije prvi drugi]= normirana_korelacija(prvi_posnetek,drugi_posnetek);
#vrhovi= zeros(numel(vektor_korelacije)); #redundant
#vektor_korelacije(end+5)=0;  #kaj pa zacetek , ce je korelacija na zacetku ...redundant
a = vektor_korelacije; # vracamo za radovednost
v1 = imsmooth(vektor_korelacije, "Gaussian", 30);  #vbistvu tega ne rabimo delat...
v2 = (vektor_korelacije-v1)>0.6;
seznam_tau = find(v2);

#-------------mojo staro primerjanje
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

endfunction