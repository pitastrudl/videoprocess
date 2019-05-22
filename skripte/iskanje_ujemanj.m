function [vsivektorji,zamik,ujemanja] = iskanje_ujemanj(seznam_zamikov, prvivektor,drugivektor,prag,stevilo_ujemanj)
#dobimo v pravem zaporedju objekta 
  pkg load signal
  pkg load image
  
  if (exist("prag", "var") != 1)
    prag = 0.5;
    printf("  ni bil nastiman prag, default='%d' \n",prag)
  endif
  
  zamik = []; 
  ujemanja = {};
  
  
  for i =1:length(seznam_zamikov)
    printf("-------------startfor---------------------- \n")

   
    primerjalni_vektor =[]; 
 
    tau = seznam_zamikov(i) - numel(prvivektor.vektor_sprememb); 
   
    #gremo z MAD primerjat, če najdemo zamike.
    
    tau
    dolzinaprvi= numel(prvivektor.vektor_sprememb);
    dolzinadrugi=numel(drugivektor.vektor_sprememb);
    zacetek_prvi=max(0,-1*tau)+1  # zakaj to d ela???
    konec_prvi=min(length(prvivektor.vektor_sprememb),length(drugivektor.vektor_sprememb)-tau)
    zacetek_drugi=max(tau,0)+1 
    konec_drugi = min(tau+length(prvivektor.vektor_sprememb),length(drugivektor.vektor_sprememb) ) # to bo treba spreminjat , v primeru da se ne ujema vse? ;
    i
    aaaa="";
    for j = zacetek_prvi:konec_prvi
      primerjalni_vektor(end+1)= mad(prvivektor.podvzorcene_slike(:,:,j) , drugivektor.podvzorcene_slike(:,:,j+zacetek_drugi-zacetek_prvi));
%      primerjalni_vektor(end+1)= mar(prvivektor.podvzorcene_slike(:,:,j) , drugivektor.podvzorcene_slike(:,:,j+zacetek_drugi-zacetek_prvi));
    endfor
    vsivektorji{i}=primerjalni_vektor; # hranimo, samo ker smo radovedni
    
    if(numel(find(primerjalni_vektor < prag)) > stevilo_ujemanj ) # gledamo da je ujemanj vsaj za neko stevilo ujemanj
      zamik(end+1) = tau;
      obseg_ujemanja = "";
      # za kateri zamik? --treba testirat 
      je_zacetek=true;
      for k=1:length(primerjalni_vektor) 
        if(primerjalni_vektor(k) < prag && je_zacetek)
          obseg_ujemanja = cstrcat(obseg_ujemanja," [ ",int2str(k));
          je_zacetek = false;
          elseif(primerjalni_vektor(k) > prag && !je_zacetek)
          obseg_ujemanja = cstrcat(obseg_ujemanja," - ",int2str(k)," ]");
          je_zacetek = true;
          elseif(primerjalni_vektor(k) < prag && !je_zacetek && k == length(primerjalni_vektor))
          obseg_ujemanja = cstrcat(obseg_ujemanja," - ",int2str(k),"]");
        endif
      endfor
       obseg_ujemanja = cstrcat("i - ",int2str(i)," tau: ",int2str(tau)," - ",obseg_ujemanja);
       ujemanja{1,end +1}=obseg_ujemanja;
    endif 
    printf("-------------endfor---------------------- \n")
  endfor 
endfunction



