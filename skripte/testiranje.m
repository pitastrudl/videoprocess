pkg load video 
pkg load image


prvi_videoposnetek = generacija("sample.mp4");
drugi_videoposnetek = generacija("cutsample.mp4");
%drugi_videoposnetek = generacija("drugisample.mp4");
%drugi_videoposnetek = generacija("tretjisample.mp4");
%drugi_videoposnetek = generacija("kratek.mp4");


[b seznam prvi drugi]= korelacija(drugi_videoposnetek,prvi_videoposnetek);


[vsivektorji,zamik] =najdi_ujemanja(seznam,prvi,drugi);


%primerjanje_slik ( drugi_videoposnetek.podvzorcene_slike,prvi_videoposnetek.podvzorcene_slike,zamik)




