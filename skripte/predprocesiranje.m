function [video_struct]= predprocesiranje (video_posnetek) 
    pkg load video
    pkg load image
    
    #kreiramo objekt
    video_struct = posnetek(video_posnetek);
   
    pot_do_posnetka = strcat(pwd,"/",video_posnetek);
    captureObjekt = cv.VideoCapture(video_posnetek);
    podvzorcene_slike = zeros(54 ,96,captureObjekt.FrameCount); #3D matrika init 
    captureObjekt.FrameCount
    #beremo video
    i=1;
    while(captureObjekt.isOpened())
    
      if(captureObjekt.FrameCount < i )
          break
      endif
      frame = captureObjekt.read('FlipChannels',true); 

      #dodal na novo, flv se ni bral vredu
      if(size(frame,1)==0)
        break 
      endif 


      #flipchannel da gre v RGB namesto BRG
      podvzorceno = imresize(frame,[54 96]);
      sivinska_slika= rgb2gray(podvzorceno);
      podvzorcene_slike(:,:,i) = sivinska_slika;
      i++;      
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
%      vektor_sprememb(i)= immse(matrike_video_posnetka(:,:,i), matrike_video_posnetka(:,:,i+1) );  
    end
    podvzorcene_slike=uint8(podvzorcene_slike); # spreminjamo v pravi zapis, drugače imshow ne deluje (shranjuje kot double)
    
    
    video_struct.pot_do_posnetka = pot_do_posnetka;
    video_struct.podvzorcene_slike = podvzorcene_slike;
    video_struct.vektor_sprememb = vektor_sprememb;
    video_struct.hash = hash("md5",video_posnetek);
endfunction

