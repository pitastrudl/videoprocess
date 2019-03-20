function[vsivektorji,zamik] = najdi_ujemanja (vrhovi, prvivektor,drugivektor)
#dobimo v pravem zaporedju objekta 
  pkg load signal
  pkg load image
# da samo gledam ker je priv in ker je drugi??
  zamik = []; 
  primerjalni_vektor =[]; 

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
  for i =1:length(vrhovi)
    tau = vrhovi(i) - numel(prvivektor.vektor_sprememb); 
    if(tau + length(prvivektor.vektor_sprememb ) > length(drugivektor.vektor_sprememb)  )
      continue # če zamik ne ustreza, preskočimo
    endif
    # za določen tau, oziroma zamik, gremo z MAD primerjat, če najdemo zamike.
    for j = 1:length(prvivektor.vektor_sprememb) 
      primerjalni_vektor(j)= mad( drugivektor.vektor_sprememb(tau+j) , prvivektor.vektor_sprememb(j) );
    endfor

    vsivektorji{i}=primerjalni_vektor; # hranimo, samo ker smo radovedni

    tempsmooth= (imsmooth(primerjalni_vektor, "Gaussian", 30));
    if(max(tempsmooth) < 0.5) # naš "threshold", razlika med piksli manj kot 1, potem je neka korelacija. 
      zamik(end+1) = tau;
    endif 
  endfor 
endfunction