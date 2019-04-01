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
%
%ab = load("ab"); prvi_videoposnetek=ab.prvi_videoposnetek;clear ab
%c = load("c"); drugi_videoposnetek=c.drugi_videoposnetek;clear c


%%prvi_videoposnetek = generacija("df.mp4");
%%drugi_videoposnetek = generacija("g.mp4");
%%save("-mat-binary","df","prvi_videoposnetek")
%%save("-mat-binary","g","drugi_videoposnetek")

df = load("df"); prvi_videoposnetek=df.prvi_videoposnetek;clear df
g = load("g"); drugi_videoposnetek=g.drugi_videoposnetek;clear g


%prvi_videoposnetek = generacija("xy.mp4");
%drugi_videoposnetek = generacija("z.mp4");
%%save("-mat-binary","xy","prvi_videoposnetek")
%%save("-mat-binary","z","drugi_videoposnetek")

%xy = load("xy"); prvi_videoposnetek=xy.prvi_videoposnetek;clear xy
%z = load("z"); drugi_videoposnetek=z.drugi_videoposnetek;clear z


[b seznam prvi drugi]= korelacija(drugi_videoposnetek,prvi_videoposnetek);


[vsivektorji,zamik] =najdi_ujemanja(seznam,prvi,drugi,3);
%plot(vsivektorji{2})
[vektor newimg indexvtor] = primerjanje_slik (prvi, drugi,vsivektorji{2},seznam(2),0.5)


tau= zamik - length(prvi.vektor_sprememb);
zacetek_prvi=max(1,-1*tau-1)  # zakaj to d ela???
konec_prvi=min(length(prvi.vektor_sprememb),length(drugi.vektor_sprememb)-tau)
zacetek_drugi=max(tau,1)
konec_drugi = min(tau+length(prvi.vektor_sprememb),length(drugi.vektor_sprememb) ) # to bo treba spreminjat , v primeru da se ne ujema vse?

for i=zacetek_prvi:konec_prvi
drawnow()
subplot (2, 1, 1)
imshow(prvi.podvzorcene_slike(:,:,i))
subplot (2, 1, 2)
imshow(drugi.podvzorcene_slike(:,:,zacetek_drugi+i))
pause(0.004)
endfor

# ali je vedno +1, zaradi? , to je prej nareidmo np v najdi_ujemanja
index1=1+125+87
index2=1 +87
mad(prvi.podvzorcene_slike(:,:,index1),drugi.podvzorcene_slike(:,:,index2))
%newImg = cat(2,prvi.podvzorcene_slike(:,:,index1),drugi.podvzorcene_slike(:,:,index2))
imshow(newImg)

subplot (2, 1, 1)
imshow(prvi.podvzorcene_slike(:,:,index1))
subplot (2, 1, 2)
imshow(drugi.podvzorcene_slike(:,:,index2))
drawnow(); 



  figure("visible","off"); movie("init","square.mp4")
   n=100; a=zeros(n,n); a(1:20,41:60)=1;
   for i=1:n; imshow(shift(a,i)); movie("add","square.mp4"); endfor
   movie("close","square.mp4",24); close; system("mplayer square.mp4")



%
%%% create data, 25 frames of 512x512 pixels
%
%%% create blank image
%h = imagesc(uint8(prvi.podvzorcene_slike(:,:,1)));
%%% for loop to play "movie"
%for i = 1:size(prvi.podvzorcene_slike,3)
%  set(h, 'cdata', uint8(prvi.podvzorcene_slike(:,:,i))) % update latest frame
%  pause(0.04) % feel free to reduce, but keep greater than 0 to ensure redraw
%end
%
%
%# sample pa drugisample.mp4 dela, ker vrne samo eden. bi blo treba for loop naredit, TODO
%primerjanje_slik (drugi_videoposnetek,prvi_videoposnetek,zamik)
%

