pkg load image
%cd('~/cv/mexopencv')
%addpath('~/cv/mexopencv')
%addpath('~/cv/mexopencv/opencv_contrib')
%addpath('~/cv/mexopencv/+cv/private')                 % HACK
%addpath('~/cv/mexopencv/opencv_contrib/+cv/private')  % HACK
%#cv.getBuildInformation()
%cd('~/Desktop/videoti/skripte')
cap = cv.VideoCapture("cutsample.mp4");
cap.FrameCount

cap.set(1,120);

frame = cap.read();
imshow(frame);






shranjene_slicice = zeros(54 ,96,cap.FrameCount) ; #3D matrika init 


testt=1;
while(cap.isOpened())
    frame = cap.read('FlipChannels',true); #flipchannel da gre v RGB namesto BRG
    podvzorceno = imresize(frame,[54 96]);
    shranjene_slicice(:,:,testt) = rgb2gray(podvzorceno);
    testt=testt+1;
    if(cap.FrameCount < testt )
        break
    endif
endwhile
cap.release()

matrike_video_posnetka = shranjene_slicice;


%stevilo vrednosti
velikost_matrike = size(matrike_video_posnetka,3) -1; #-1 ker bo vedno en manj rezultat kot je elementov 
printf("stevilo elementov v 3d matriki: %d \n", velikost_matrike);
vect_mad(velikost_matrike)=0; #inicializiramo vektor z niclami
%vect_msd(velikost_matrike)=0; #inicializiramo vektor z niclami 


for i = 1:velikost_matrike #-1 ker drugace bomo primerjal zadnjega z nicemer. seprav zadnjega nikol nebomo primerjla, kaj  ce je keframe?
 #filamo vektor, razlika med i-tem in i+1--tem.  
 vect_mad(i)= mad(matrike_video_posnetka(:,:,i), matrike_video_posnetka(:,:,i+1) );  

end