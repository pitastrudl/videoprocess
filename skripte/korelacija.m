#sprejme dva vektorja
#vrne vrhove
function [a seznam_tau prvi drugi] = korelacija (prvi_posnetek,drugi_posnetek,treshold)
pkg load signal
pkg load image

#gledamo če je treshold bil podan
if (exist("treshold", "var") != 1)
treshold = 0.8;
printf("  ni bil nastiman treshold, default=0.8 \n")
endif

[vektor_korelacije prvi drugi]= normirana_korelacija(prvi_posnetek,drugi_posnetek);

a = vektor_korelacije; # vracamo za radovednost
%v1 = imsmooth(vektor_korelacije, "Gaussian", 30);  #vbistvu tega ne rabimo delat...
%v2 = (vektor_korelacije-v1)>0.6;
%seznam_tau = find(v2);
seznam_tau = find(a>treshold);

# če nič ne najdemo
  if (numel(seznam_tau)==0)
     error ("Ni bilo najdenih zamikov!");
     seznam_tau = 0;
  endif
endfunction