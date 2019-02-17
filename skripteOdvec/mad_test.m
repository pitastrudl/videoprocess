pkg load video
pkg load image

#MAD TEST
#v tej skripti loudamo 3D matriko, ki je video. imamo mad funkcijo ki ji potem pozenemo
#in shranimo v vektor vse rezultate. 

matvid = load("/home/arun/Desktop/videoti/frames/resized/myfile.mat");
#matvid = load("/home/arun/Desktop/videoti/video.mat"); #drugi path za testirat

#dostopamo do shranjene spremenljivke
matvid = matvid.saved_frames;
size(matvid);

#mad funkcija za med dvema matrikama 
function s = mad(A,B)
  r = imabsdiff(A,B);  #absolutna ralzika med dvema matrikama 
  s = sum(sum(r)) / numel(A); #delimo z število elementov A-ja, 2xni sum 
end


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
 vect(i)= mad(matvid(:,:,i), matvid(:,:,j) );  
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


#druga funkcija, samo testna

      #prvi poskus za MAD,  for loop za MAD
%        [m,n] = size(matvid(:,:,100))  # m je height in n je width   54x96
%        sumd = 0;
%        printf("testing diy sum mad .\n")
%        for i = 1:n
%           for j = 1:m
%              sumd = sumd  +  abs(  one(j,i) - two(j,i)  ); 
%           end
%        end
%        %stevilo eltov v matriki one
%        numel(one);
%
%        #normalizacija 
%        sumd / numel(one) ;

save('/home/arun/Desktop/videoti/vect.mat','vect');
clear vect 
#sysum( abs(  one(j,i) - two(j,i))




