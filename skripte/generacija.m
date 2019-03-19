function [video_struct]= generacija (video_posnetek) 
  pkg load video
  pkg load image

  #kreiramo objekt
  video_struct = posnetek(video_posnetek);
  
  pot_do_posnetka = strcat(pwd,"/",video_posnetek);
  captureObjekt = cv.VideoCapture(video_posnetek);
  podvzorcene_slike = zeros(54 ,96,captureObjekt.FrameCount); #3D matrika init 

  #beremo video
  i=1;
  while(captureObjekt.isOpened())
    frame = captureObjekt.read('FlipChannels',true); #flipchannel da gre v RGB namesto BRG
    podvzorceno = imresize(frame,[54 96]);
    sivinska_slika= rgb2gray(podvzorceno);
    podvzorcene_slike(:,:,i) = sivinska_slika;
    i++;
    if(captureObjekt.FrameCount < i )
      break
    endif
  endwhile
  captureObjekt.release()
  
  #tukaj se zacne MAD 
  matrike_video_posnetka = podvzorcene_slike;
  dolzina_3D_matrike = size(matrike_video_posnetka,3) -1; #-1 ker bo vedno en manj rezultat kot je elementov 
  printf("stevilo elementov v 3d matriki: %d \n", dolzina_3D_matrike);
  vektor_sprememb(dolzina_3D_matrike)=0; #inicializiramo vektor z niclami
  for i = 1:dolzina_3D_matrike 
    #filamo vektor, razlika med i-tem in i+1--tem.  
    vektor_sprememb(i)= mad(matrike_video_posnetka(:,:,i), matrike_video_posnetka(:,:,i+1) );  
  end
  podvzorcene_slike=uint8(podvzorcene_slike); # spreminjamo v pravi zapis, drugače imshow ne deluje (shranjuje kot double)
  
  video_struct.pot_do_posnetka = pot_do_posnetka;
  video_struct.podvzorcene_slike = podvzorcene_slike;
  video_struct.vektor_sprememb = vektor_sprememb;
endfunction

#-----------samo za preglednost je tukaj tole---------
%function pos = posnetek(video)
%    pos.datoteka=video;
%    pos.vektor_sprememb = 0;
%    pos.podvzorcene_slike = 0;
%    pos.dolzina = 0;
%    pos.polozaj_v_normxcorr = "";
%    pos.vecji = true;
%    pos.pot_do_posnetka= "";
%endfunction