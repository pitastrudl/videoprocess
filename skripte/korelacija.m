#sprejme dva vektorja
#vrne vrhove
function [vektor_korelacije seznam_tau prvi drugi] = korelacija (prvi_posnetek,drugi_posnetek,meja)
pkg load signal
pkg load image

#pogledamo ce sta duplikata
if(prvi_posnetek.hash == drugi_posnetek.hash)
  error("sta duplikata!");
endif

#gledamo če je meja bil podan
if (exist("meja", "var") != 1)
meja = 0.5;
printf("  ni bil nastiman meja, default='%d' \n",meja)
endif

[vektor_korelacije prvi drugi]= normirana_korelacija(prvi_posnetek,drugi_posnetek);

%v1 = imsmooth(vektor_korelacije, "Gaussian", 30);  #vbistvu tega ne rabimo delat...
%v2 = (vektor_korelacije-v1)>0.6;
%seznam_tau = find(v2);
seznam_tau = find(vektor_korelacije>meja);

# če nič ne najdemo
  if (numel(seznam_tau)==0)
%     error ("Ni bilo najdenih zamikov!");
     seznam_tau = 0;
  endif
endfunction

