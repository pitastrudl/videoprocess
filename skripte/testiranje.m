pkg load video 
pkg load image


%prvi_videoposnetek = generacija("sample.mp4");
%drugi_videoposnetek = generacija("drugisample.mp4");
%drugi_videoposnetek = generacija("drugisample.mp4");
%drugi_videoposnetek = generacija("tretjisample.mp4");
%drugi_videoposnetek = generacija("kratek.mp4");

%prvi_videoposnetek = generacija("output.mp4");
%drugi_videoposnetek = generacija("c.mp4");

prvi_videoposnetek = generacija("df.mp4");
drugi_videoposnetek = generacija("g.mp4");

[b seznam prvi drugi]= korelacija(drugi_videoposnetek,prvi_videoposnetek);


[vsivektorji,zamik] =najdi_ujemanja(seznam,prvi,drugi,2);

for i=1:124
subplot (2, 1, 1)
imshow(prvi.podvzorcene_slike(:,:,125+i))
subplot (2, 1, 2)
imshow(drugi.podvzorcene_slike(:,:,i))
pause(0.05)
endfor

# sample pa drugisample.mp4 dela, ker vrne samo eden. bi blo treba for loop naredit, TODO
primerjanje_slik (drugi_videoposnetek,prvi_videoposnetek,zamik)


