function[vsivektorji,zamik] = najdi_ujemanja (seznam_zamikov, prvivektor,drugivektor,treshold)
#dobimo v pravem zaporedju objekta 
  pkg load signal
  pkg load image
  
if (exist("treshold", "var") != 1)
treshold = 0.5;
printf("  ni bil nastiman treshold, default='%d' \n",treshold)
endif
# da samo gledam ker je priv in ker je drugi??
 

%----zakoemntiral ker dobimo v pravem zaproedju.....
% # nastavimo ker je vecji in ker manjsi
%  if(prvivektor.prvi == false )
%    prvivektor = prvivektor;
%    drugivektor = drugivektor;
%  else
%    prvivektor = drugivektor;
%    drugivektor = prvivektor;
%  endif

  # glavni loop
  zamik = []; 
  for i =1:length(seznam_zamikov)
    printf("-------------startfor---------------------- \n")
  
  primerjalni_vektor =[]; 
  
  
    tau = seznam_zamikov(i) - numel(prvivektor.vektor_sprememb); 
    
    #zakomentiramo ker zdej so zamiki dejansko vredu.....lol
%    if(tau + length(prvivektor.vektor_sprememb ) > length(drugivektor.vektor_sprememb)  )
%      continue # če zamik ne ustreza, preskočimo
%    endif 
    
    # za določen tau, oziroma zam
    #gremo z MAD primerjat, če najdemo zamike.
    tau
    zacetek_prvi=max(0,-1*tau)+1  # zakaj to d ela???
    konec_prvi=min(length(prvivektor.vektor_sprememb),length(drugivektor.vektor_sprememb)-tau)
    zacetek_drugi=max(tau,0)+1
    konec_drugi = min(tau+length(prvivektor.vektor_sprememb),length(drugivektor.vektor_sprememb) ) # to bo treba spreminjat , v primeru da se ne ujema vse?

    
    
  aaaa="";
    for j = zacetek_prvi:konec_prvi
      primerjalni_vektor(end+1)= mad(prvivektor.podvzorcene_slike(:,:,j) , drugivektor.podvzorcene_slike(:,:,j+zacetek_drugi-zacetek_prvi));
    endfor
  
%    for j = zacetek_drugi:konec_drugi
%      primerjalni_vektor(j)= mad(prvivektor.vektor_sprememb(zacetek_prvi) , drugivektor.vektor_sprememb(konec_drugi) );
%    endfor

    vsivektorji{i}=primerjalni_vektor; # hranimo, samo ker smo radovedni

%tempsmooth= (imsmooth(primerjalni_vektor, "Gaussian", 30));

    #tole dela če je v celoti enak...
    if(max(primerjalni_vektor)< treshold) # naš "threshold", razlika med piksli manj kot 1, potem je neka korelacija. ,
      zamik(end+1) = tau;
    endif 
    printf("-------------endfor---------------------- \n")
  endfor 
endfunction


