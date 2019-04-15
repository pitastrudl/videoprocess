function[vsivektorji,zamik,obseg_ujemanja] = iskanje_ujemanj (seznam_zamikov, prvivektor,drugivektor,treshold,stevilo_ujemanj)
#dobimo v pravem zaporedju objekta 
  pkg load signal
  pkg load image
  
  if (exist("treshold", "var") != 1)
    treshold = 0.5;
    printf("  ni bil nastiman treshold, default='%d' \n",treshold)
  endif
  obseg_ujemanja = "";
  zamik = []; 
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

    aaaa="";
    for j = zacetek_prvi:konec_prvi
      primerjalni_vektor(end+1)= mad(prvivektor.podvzorcene_slike(:,:,j) , drugivektor.podvzorcene_slike(:,:,j+zacetek_drugi-zacetek_prvi));
    endfor
    vsivektorji{i}=primerjalni_vektor; # hranimo, samo ker smo radovedni
    
    if(numel(find(primerjalni_vektor < treshold)) > stevilo_ujemanj ) # gledamo da je ujemanj vsaj za eno sekundo....
      zamik(end+1) = tau;
      
      # za kateri zamik? --treba testirat 
      je_zacetek=true;
      for i=1:length(primerjalni_vektor)
        if(primerjalni_vektor(i) < treshold && je_zacetek)
          obseg_ujemanja = cstrcat(int2str(tau)," - ",obseg_ujemanja," \n[ ",int2str(i));
          je_zacetek = false;
          elseif(primerjalni_vektor(i) > treshold && !je_zacetek)
          obseg_ujemanja = cstrcat(obseg_ujemanja," - ",int2str(i)," ]");
          je_zacetek = true;
          elseif(primerjalni_vektor(i) < treshold && !je_zacetek && i == length(primerjalni_vektor))
          obseg_ujemanja = cstrcat(obseg_ujemanja," - ",int2str(i),"]");
        endif
      endfor
      
    endif 
    printf("-------------endfor---------------------- \n")
  endfor 
endfunction



