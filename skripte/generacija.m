function [vect_mad, podvzorcene_slike, pot_do_video_posnetka]= generacija (video_posnetek) #varargin so argumenti
pkg load video
pkg load image


pot_do_video_posnetka = strcat(pwd,"/",video_posnetek);
cap = cv.VideoCapture(video_posnetek);
cap.FrameCount
podvzorcene_slike = zeros(54 ,96,cap.FrameCount); #3D matrika init 

i=1;
while(cap.isOpened())
    frame = cap.read('FlipChannels',true); #flipchannel da gre v RGB namesto BRG
%    frame = cap.read();


podvzorceno = imresize(frame,[54 96]);
sivinska= rgb2gray(podvzorceno);
%sivinska= cv.decolor(podvzorceno);

%    sivinska= cv.decolor(frame);
%    podvzorceno = imresize(sivinska,[54 96]);
   
    #podvzorceno_sivinska = rgb2gray(podvzorceno);
    podvzorcene_slike(:,:,i) = sivinska;
    i++;
    if(cap.FrameCount < i )
        break
    endif
endwhile
cap.release()
matrike_video_posnetka = podvzorcene_slike;
%stevilo vrednosti
velikost_matrike = size(matrike_video_posnetka,3) -1; #-1 ker bo vedno en manj rezultat kot je elementov 
printf("stevilo elementov v 3d matriki: %d \n", velikost_matrike);
vect_mad(velikost_matrike)=0; #inicializiramo vektor z niclami
%vect_msd(velikost_matrike)=0; #inicializiramo vektor z niclami 
for i = 1:velikost_matrike #-1 ker drugace bomo primerjal zadnjega z nicemer. seprav zadnjega nikol nebomo primerjla, kaj  ce je keframe?
 #filamo vektor, razlika med i-tem in i+1--tem.  
 vect_mad(i)= mad(matrike_video_posnetka(:,:,i), matrike_video_posnetka(:,:,i+1) );  
end
podvzorcene_slike=uint8(podvzorcene_slike);
endfunction




%md =strcat(direktorij,"/",pot,"_vect_mad.mat");
%%ms= strcat(direktorij,"/",pot,"_vect_msd.mat");
%save(md,'vect_mad');


%aviinfo(video_posnetek);
%pot =  regexprep (video_posnetek, '[\W_]+', ''); #odstrani vse kar ni beseda?
%
%#premaknt v ram tole?? itak lahko gledam v video direkt posamezne slicice...
%system(["mkdir" ' ' pot] );
%system(["mkdir" ' ' pot '' "/slike"] );
%system(["mkdir" ' ' pot '' '/podvzorceno'] );
%
%podvzorcene_pot = strcat(pwd,"/",pot,'/podvzorceno');
%direktorij= strcat(pwd,"/",pot);
%direktorij_slike = strcat(pwd,"/",pot,"/slike");
%
%
%system(["ffmpeg -i" ' ' video_posnetek ' '   direktorij_slike '' "/%d.jpg" ]);


#seznamamo slike iz videja
%trenutna_pot = pwd; 
%cd(direktorij_slike);
%seznam = glob("*.jpg");
%
%cd(trenutna_pot);
%seznam= sort_nat(seznam)
%stevilo_elementov = numel(seznam);
%#pricakujemo da je slika 16:9 razmerja 
%podvzorcene_slike = zeros(54 ,96,stevilo_elementov) ; #3D matrika init  
%
%#sprehajamo po datotekah. 
%for i = 1:stevilo_elementov 
%  #pot do slike
%  pot_do_slik = strcat(direktorij_slike,"/",seznam{i,1});
%  #beremo
%  slika = imread(pot_do_slik);
%  #resizamo 20x manjsi, seprav na to resolucijo
%  podvzorceno = imresize(slika,[54 96]);
%  #zgeneriramo ime kjer ga bo zapisal
%  newimg_name = strcat(podvzorcene_pot,'/',int2str(i),"podvzorceno.jpeg");
%  #damo v grayscale
%  #returnamo ce je ze v grajscale
%  if (size(podvzorceno, 3)) == 1
%    #printf ("this isnt a colormap....");
%  else 
%      podvzorceno = rgb2gray(podvzorceno);
%   end
%
% 
%  imwrite(podvzorceno,newimg_name); #zapišemo
%  #shranimo v variable
%  podvzorcene_slike(:,:,i) = podvzorceno;   %spremenil i iz i-2 %spet spremenil na i-2 ker drugace imamo nicle% spremenil na 1 ker smo sprmenil indexing
%end
%numel(podvzorcene_slike)
%
%
%#dostopamo do shranjene spremenljivke
%matrike_video_posnetka = podvzorcene_slike;
%size(matrike_video_posnetka);
%
%#mad funkcija za med dvema matrikama 
%
%%stevilo vrednosti
%velikost_matrike = size(matrike_video_posnetka,3) -1; #-1 ker bo vedno en manj rezultat kot je elementov 
%printf("stevilo elementov v 3d matriki: %d \n", velikost_matrike);
%vect_mad(velikost_matrike)=0; #inicializiramo vektor z niclami
%%vect_msd(velikost_matrike)=0; #inicializiramo vektor z niclami 
%
%
%
%#zafilamo vektor 
%for i = 1:velikost_matrike #-1 ker drugace bomo primerjal zadnjega z nicemer. seprav zadnjega nikol nebomo primerjla, kaj  ce je keframe?
% #filamo vektor, razlika med i-tem in i+1--tem.  
% vect_mad(i)= mad(matrike_video_posnetka(:,:,i), matrike_video_posnetka(:,:,i+1) );  
%% vect_msd(i)= immse(matrike_video_posnetka(:,:,i), matrike_video_posnetka(:,:,i+1) );  
% #na koncu imamo vektor, vsak element je MAD med njem in naslednjim frameom. 
%%    if i > velikost_matrike-4
%%     sum(sum(matrike_video_posnetka(:,:,i+1)));  ##samo gledamo malo
%%     i;
%%    end
%end


%md =strcat(direktorij,"/",pot,"_vect_mad.mat");
%%ms= strcat(direktorij,"/",pot,"_vect_msd.mat");
%save(md,'vect_mad');
%save(ms,'vect_msd');
%  subplot(2,1,1);
%plot(vect_mad); 
%  title(md);
%  subplot(2,1,2)
%plot(vect_msd); 
%title(ms);





%function generacija (varargin) #varargin so argumenti
%pot = varargin{1};
%system(["mkdir" ' ' pot] );
%system(["mkdir" ' ' pot '' "/slike"] );
%system(["mkdir" ' ' pot '' '/resized'] );
%  for i = 2:length (varargin)
%%    printf ("%d");
%    disp (varargin{i});
%  endfor
%endfunction

%je ena funkcija find, sprejme dva videja
%ta dva videja se dobi ven venktorje mad...
%potem se naredi koleracijo med njima.
%lahko mamo še kako funkcijo za rezat posebi. za testiranje. 

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
  
