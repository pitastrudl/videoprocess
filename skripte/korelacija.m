#sprejme dva vektorja
#vrne vrhove
function [a seznam_tau prvi drugi] = korelacija (prvi_posnetek,drugi_posnetek)
pkg load signal
pkg load image

[vektor_korelacije prvi drugi]= normirana_korelacija(prvi_posnetek,drugi_posnetek);

a = vektor_korelacije; # vracamo za radovednost
%v1 = imsmooth(vektor_korelacije, "Gaussian", 30);  #vbistvu tega ne rabimo delat...
%v2 = (vektor_korelacije-v1)>0.6;
%seznam_tau = find(v2);
seznam_tau = find(a>0.8);
endfunction