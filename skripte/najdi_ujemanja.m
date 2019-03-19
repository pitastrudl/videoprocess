function[vsivektorji,zamik] = najdi_ujemanja (vrhovi, prvivektor,drugivektor)
  pkg load signal
  pkg load image

  zamik = []; 
  primerjalni_vektor =[]; 
  # nastavimo ker je vecji in ker manjsi
  if(prvivektor.vecji == false )
    manjsivektor = prvivektor;
    vecjivektor = drugivektor;
  else
    manjsivektor = drugivektor;
    vecjivektor = prvivektor;
  endif

  # glavni loop
  for i =1:length(vrhovi)
    tau = vrhovi(i) - numel(manjsivektor.vektor_sprememb); 
    if(tau + length(manjsivektor.vektor_sprememb ) > length(vecjivektor.vektor_sprememb)  )
      continue # če zamik ne ustreza, preskočimo
    endif
    # za določen tau, oziroma zamik, gremo z MAD primerjat, če najdemo zamike.
    for j = 1:length(manjsivektor.vektor_sprememb) 
      primerjalni_vektor(j)= mad( vecjivektor.vektor_sprememb(tau+j) , manjsivektor.vektor_sprememb(j) );
    endfor

    vsivektorji{i}=primerjalni_vektor; # hranimo, samo ker smo radovedni

    tempsmooth= (imsmooth(primerjalni_vektor, "Gaussian", 30));
    if(max(tempsmooth) < 0.5) # naš "threshold", razlika med piksli manj kot 1, potem je neka korelacija. 
      zamik(end+1) = tau;
    endif 
  endfor 
endfunction