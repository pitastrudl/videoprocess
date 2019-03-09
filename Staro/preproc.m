#naredimo poti
#generiramo slike

pkg load video
pkg load image
clear -a

fajl="compressed.mp4"  #datoteka ki so je reže
pot="compressed"        #pot kjer bodo slike 
outputfajl = "compr.mp4" #ime izrezka

rezanje=false  #switch
dolzina=2        #dolzina izrezka 
kdaj_zacet=3        #na kateri tock ividea zacet 

#gledamo ce pot obstaja
if exist(pot,"dir") == 7 
    "dir exists"
    return
end

system(["mkdir" ' ' pot] );
system(["mkdir" ' ' pot '' "/slike"] );
system(["mkdir" ' ' pot '' '/resized'] );

resized_dir = strcat(pwd,"/",pot,'/resized')
direktorij= strcat(pwd,"/",pot)
direktorij_slike = strcat(pwd,"/",pot,"/slike/")

#rezanje
 if rezanje
   system(["ffmpeg -i " '' fajl ' ' "-ss" ' ' int2str(kdaj_zacet) ' ' "-strict -2 -t" ' ' int2str(dolzina) ' ' outputfajl ])
 else
   outputfajl = fajl
 end


#generiramo slike 
system(["ffmpeg -i" ' ' outputfajl ' '     direktorij_slike '' "/%03d.jpg" ]);
 
#direktorij do slik, poskrbi da so samo jpegi notri. to je treba omenit. 
currdir = pwd; 
cd(direktorij_slike)
list = glob("*.jpg")
cd(currdir)


numelts = numel(list)
saved_frames = zeros(54 ,96,numelts) ; #3D matrika init  #tukaj naredit nek ratio, oz da do dolocene velikosti zmanjsa 


#sprehajamo po datotekah. 
for i = 1:numelts  
  #pot do slike
  path_to_img = strcat(direktorij_slike,list{i,1})
  #beremo
  img = imread(path_to_img);
  #resizamo 20x manjsi, seprav na to resolucijo
  resized = imresize(img,[54 96]);
  #zgeneriramo ime kjer ga bo zapisal
  newimg_name = strcat(resized_dir,'/',int2str(i),"resized.jpeg")
  #damo v grayscale
  #returnamo ce je ze v grajscale
  if (size(resized, 3)) == 1
    printf ("this isnt a colormap....")  
    return
   end
  resized = rgb2gray(resized);
 
  imwrite(resized,newimg_name); #zapišemo
  #shranimo v variable
  saved_frames(:,:,i) = resized;   %spremenil i iz i-2 %spet spremenil na i-2 ker drugace imamo nicle% spremenil na 1 ker smo sprmenil indexing
end



#dostopamo do shranjene spremenljivke
matvid = saved_frames;
size(matvid);

#mad funkcija za med dvema matrikama 
function s = mad(A,B)
  r = imabsdiff(A,B);  #absolutna ralzika med dvema matrikama 
  s = sum(sum(r)) / numel(A); #delimo z število elementov A-ja, 2xni sum 
end


%stevilo vrednosti
numSize = size(matvid,3) -1; #-1 ker bo vedno en manj rezultat kot je elementov 
printf("stevilo elementov v 3d matriki: %d \n", numSize)
vect_mad(numSize)=0; #inicializiramo vektor z niclami
vect_msd(numSize)=0; #inicializiramo vektor z niclami 


#zafilamo vektor 
for i = 1:numSize #-1 ker drugace bomo primerjal zadnjega z nicemer. seprav zadnjega nikol nebomo primerjla, kaj  ce je keframe?
 #filamo vektor, razlika med i-tem in i+1--tem.  
 vect_mad(i)= mad(matvid(:,:,i), matvid(:,:,i+1) );  
 vect_msd(i)= immse(matvid(:,:,i), matvid(:,:,i+1) );  
 #na koncu imamo vektor, vsak element je MAD med njem in naslednjim frameom. 
   if i > numSize-4
     sum(sum(matvid(:,:,i+1)))  ##samo gledamo malo
     i
    end

end

#malo gledamo vrednosti ce so vredu. 
printf("last 10 values msd   \n ")
for i = 1:numel(vect_mad)
    if i < 10
      vect_mad(i)
    end
    if i > numel(vect_mad) - 10
    vect_mad(i)
    end
  end
  
  
  printf("last 10 values msd  \n ")
for i = 1:numel(vect_msd)
 
    if i < 10
      vect_msd(i)
    end
    if i > numel(vect_msd) - 10
    vect_msd(i)
    end
  end
  
md =strcat(direktorij,"/",pot,"_vect_mad.mat");
ms= strcat(direktorij,"/",pot,"_vect_msd.mat");   

save(md,'vect_mad');
save(ms,'vect_msd');


  subplot(2,1,1);
plot(vect_mad); 
  title(md);
  subplot(2,1,2)
plot(vect_msd); 
title(ms);








