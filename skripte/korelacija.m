#sprejme dva vektorja
#vrne vrhove
function [a seznam_tau prvivektor drugivektor] = korelacija(pv,dv,prvapot,drugapot)
pkg load signal
pkg load image

prvivektor{1}=pv;
prvivektor{2}="prvivektor";
prvivektor{4}=prvapot;
drugivektor{1}=dv;  
drugivektor{2}="drugivektor";
drugivektor{4}=drugapot;
[vektor_korelacije prvivektor drugivektor]= normirana_korelacija (prvivektor,drugivektor);
vrhovi= zeros(numel(vektor_korelacije));
vektor_korelacije(end+5)=0;  #kaj pa zacetek , ce je korelacija na zacetku 
a = vektor_korelacije;
for i = 1:numel(vektor_korelacije)-5
   #seznam_tau = 10; # ne pride v prvi if. 
  #ce je lokalna manjsa od globalne, spremenu obratno, zakaj ta 0.4 deluje? 
  
  if ( std(vektor_korelacije(i:i+5))*0.4 > std(vektor_korelacije) )   
    
    #računamo sproti taue
     if(vektor_korelacije(i)>0)
        vrhovi(i) = vektor_korelacije(i);
        seznam_tau(end +1)  =  i;
     endif
  endif
endfor
prvivektor{1}=1;
drugivektor{1}=1; 
endfunction

