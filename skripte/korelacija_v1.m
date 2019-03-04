#sprejme dva vektorja
#vrne vrhove
function [a seznam_tau prvi_posnetek drugi_posnetek] = korelacija_v1(prvi_posnetek,drugi_posnetek)
pkg load signal
pkg load image

#manjsi je ta prvi?
%prvi_posnetek.polozaj_v_normxcorr = "prvivektor";
%drugi_posnetek.polozaj_v_normxcorr = "drugivektor";

[vektor_korelacije prvi_posnetek drugi_posnetek]= normirana_korelacijav1(prvi_posnetek,drugi_posnetek);
vrhovi= zeros(numel(vektor_korelacije));
vektor_korelacije(end+5)=0;  #kaj pa zacetek , ce je korelacija na zacetku 
a = vektor_korelacije;
for i = 1:numel(vektor_korelacije)-5
   #seznam_tau = 10; # ne pride v prvi if. 
  #ce je lokalna manjsa od globalne, spremenu obratno, zakaj ta 0.4 deluje? 
  
  if ( std(vektor_korelacije(i:i+5))*0.5 > std(vektor_korelacije) )   
    
    #računamo sproti taue
     if(vektor_korelacije(i)>0)
        vrhovi(i) = vektor_korelacije(i);
        seznam_tau(end +1)  =  i;
     endif
  endif
endfor
%prvivektor{1}=1;
%drugivektor{1}=1; 
endfunction

