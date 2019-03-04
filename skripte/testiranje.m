%[mad_a md_a podv_a]= generacija("sample.mp4");
%[mad_b md_b podv_b] = generacija("cutsample.mp4");

#errr = najdi("sample.mp4","cutsample.mp4");
pkg load video 
pkg load image
%clear -a
%aviinfo("sample.mp4")
%aviinfo("cutsample.mp4")
%load "samplemp4/samplemp4_vect_mad.mat";
%v1_sample = vect_mad;
%clear vect_mad;
%load "cutsamplemp4/cutsamplemp4_vect_mad.mat";
%v2_cutsample = vect_mad;
%clear vect_mad;


%function pos = posnetek(video)
%    pos.datoteka=video;
%    pos.vektor_sprememb = 0;
%    pos.podvzorcene_slike = 0;
%    pos.dolzina = 0;
%    pos.polozaj = "";
%    pos.velikost = "";
%endfunction


#testiranje novega z objektom 
prvi_videoposnetek = posnetek("sample.mp4")
drugi_videoposnetek = posnetek("drugisample.mp4")



[drugi_videoposnetek.vektor_sprememb, drugi_videoposnetek.podvzorcene_slike, drugi_videoposnetek.pot_do_posnetka]= generacija (drugi_videoposnetek.datoteka); #125cutsam
[prvi_videoposnetek.vektor_sprememb, prvi_videoposnetek.podvzorcene_slike, prvi_videoposnetek.pot_do_posnetka]= generacija (prvi_videoposnetek.datoteka); # 337


[b seznam prvi drugi]= korelacija_v1(drugi_videoposnetek,prvi_videoposnetek);
[vsivektorji,zamik] =najdi_ujemanja(seznam,prvi,drugi);


primerjanje_slik ( drugi_videoposnetek.podvzorcene_slike,prvi_videoposnetek.podvzorcene_slike,zamik)

primerjanje_slik ( drugi_videoposnetek.podvzorcene_slike,prvi_videoposnetek.podvzorcene_slike,274)

primerjanje_slik(prvi_videoposnetek.podvzorcene_slike,drugi_videoposnetek.podvzorcene_slike,73)


%imshow(podvzorcene_slike_a(:,:,213))
%figure, imshow(podvzorcene_slike_b(:,:,1))
%plot(v3)

%[a,b,c,d]=generacija("cutsample.mp4");

%load("c.mat")
%imshow(c(:,:,1))
%figure, imshow(c(:,:,2))
%figure, imshow(c(:,:,3))

