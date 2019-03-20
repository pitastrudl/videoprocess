pkg load video 
pkg load image


prvi_videoposnetek = generacija("sample.mp4");
drugi_videoposnetek = generacija("drugisample.mp4");
%drugi_videoposnetek = generacija("drugisample.mp4");
%drugi_videoposnetek = generacija("tretjisample.mp4");
%drugi_videoposnetek = generacija("kratek.mp4");


[b seznam prvi drugi]= korelacija(drugi_videoposnetek,prvi_videoposnetek);


[vsivektorji,zamik] =najdi_ujemanja(seznam,prvi,drugi);

# sample pa drugisample.mp4 dela, ker vrne samo eden. bi blo treba for loop naredit, TODO
primerjanje_slik (drugi_videoposnetek,prvi_videoposnetek,zamik)


