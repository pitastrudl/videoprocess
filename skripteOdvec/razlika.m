pkg load video
pkg load image
#se nepsrremnjena 



#MAD TEST
#v tej skripti loudamo 3D matriko, ki je video. imamo mad funkcijo ki ji potem pozenemo
#in shranimo v vektor vse rezultate. 

matvid = load("/home/arun/Desktop/videoti/frames/resized/myfile.mat");
#matvid = load("/home/arun/Desktop/videoti/video.mat"); #drugi path za testirat

#dostopamo do shranjene spremenljivke
matvid = matvid.saved_frames;
size(matvid);


#printamo testni med dvema matrikama
#printf("onetwo mad. ", mad(one,two))
printf("testing signamlad \n")

%stevilo vrednosti
numSize = size(matvid,3) -1; #-1 ker bo vedno en manj rezultat kot je elementov 
printf("stevilo elementov v 3d matriki: %d \n", numSize)
vect(numSize)=0; #inicializiramo vektor z niclami 

#zafilamo vektor 
for i = 1:numSize-1 #-1 ker drugace bomo primerjal zadnjega z nicemer. 
  j = i + 1;
 #filamo vektor, razlika med i-tem in i+1--tem.  
 vect(i)= immse(matvid(:,:,i), matvid(:,:,j) );  
 #na koncu imamo vektor, vsak element je MAD med njem in naslednjim frameom. 
end

#malo gledamo vrednosti ce so vredu. 
printf("values bigger than 900 \n ")
for i = 1:numel(vect)
    if i < 10
      vect(i)
    end
    if i > 900
    vect(i)
    end
  end




save('/home/arun/Desktop/videoti/vect_mse.mat','vect');
clear vect 
#sysum( abs(  one(j,i) - two(j,i))

