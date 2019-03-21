pkg load video 
pkg load image


%prvi_videoposnetek = generacija("sample.mp4");
%drugi_videoposnetek = generacija("drugisample.mp4");
%drugi_videoposnetek = generacija("drugisample.mp4");
%drugi_videoposnetek = generacija("tretjisample.mp4");
%drugi_videoposnetek = generacija("kratek.mp4");

%%prvi_videoposnetek = generacija("ab.mp4");
%%drugi_videoposnetek = generacija("c.mp4");
%%save("-mat-binary","ab","prvi_videoposnetek")
%%save("-mat-binary","c","drugi_videoposnetek")
ab = load("ab"); prvi_videoposnetek=ab.prvi_videoposnetek;clear ab
c = load("c"); drugi_videoposnetek=c.drugi_videoposnetek;clear c


%%prvi_videoposnetek = generacija("df.mp4");
%%drugi_videoposnetek = generacija("g.mp4");
%%save("-mat-binary","df","prvi_videoposnetek")
%%save("-mat-binary","g","drugi_videoposnetek")
%df = load("df"); prvi_videoposnetek=df.prvi_videoposnetek;clear df
%g = load("g"); drugi_videoposnetek=g.drugi_videoposnetek;clear g


%%prvi_videoposnetek = generacija("xy.mp4");
%%drugi_videoposnetek = generacija("z.mp4");
%%save("-mat-binary","xy","prvi_videoposnetek")
%%save("-mat-binary","z","drugi_videoposnetek")
%xy = load("xy"); prvi_videoposnetek=xy.prvi_videoposnetek;clear xy
%z = load("z"); drugi_videoposnetek=z.drugi_videoposnetek;clear z


[b seznam prvi drugi]= korelacija(drugi_videoposnetek,prvi_videoposnetek);


[vsivektorji,zamik] =najdi_ujemanja(seznam,prvi,drugi,1);

tau= 499 - length(prvi.vektor_sprememb);
    zacetek_prvi=max(1,-1*tau-1)  # zakaj to d ela???
    konec_prvi=min(length(prvi.vektor_sprememb),length(drugi.vektor_sprememb)-tau)
    zacetek_drugi=max(tau,1)
    konec_drugi = min(tau+length(prvi.vektor_sprememb),length(drugi.vektor_sprememb) ) # to bo treba spreminjat , v primeru da se ne ujema vse?

for i=zacetek_prvi:konec_prvi
subplot (2, 1, 1)
drawnow(); 
imshow(prvi.podvzorcene_slike(:,:,i))
subplot (2, 1, 2)

imshow(drugi.podvzorcene_slike(:,:,zacetek_drugi+i))
 
pause(.004)
endfor

index1=251+89+1;
index2=89+1+1
subplot (2, 1, 1)
imshow(prvi.podvzorcene_slike(:,:,index1))
subplot (2, 1, 2)
imshow(drugi.podvzorcene_slike(:,:,index2))
drawnow(); 
mad(prvi.podvzorcene_slike(:,:,index1),drugi.podvzorcene_slike(:,:,index2))

%% create data, 25 frames of 512x512 pixels

%% create blank image
h = imagesc(uint8(prvi.podvzorcene_slike(:,:,1)));
%% for loop to play "movie"
for i = 1:size(prvi.podvzorcene_slike,3)
  set(h, 'cdata', uint8(prvi.podvzorcene_slike(:,:,i))) % update latest frame
  pause(0.04) % feel free to reduce, but keep greater than 0 to ensure redraw
end


# sample pa drugisample.mp4 dela, ker vrne samo eden. bi blo treba for loop naredit, TODO
primerjanje_slik (drugi_videoposnetek,prvi_videoposnetek,zamik)


