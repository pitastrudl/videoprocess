pkg load video 
pkg load image

dolzina_a=1   #15bila max
ime=cstrcat("A_test_",int2str(dolzina_a),".mp4");
imefilemat=cstrcat("A_test_",int2str(dolzina_a));
rezanje("big.mp4",15,dolzina_a,ime)
%rezanje("big.mp4",5,35,"B.mp4")
prvi_videoposnetek = predprocesiranje(ime);
%drugi_videoposnetek = predprocesiranje("B.mp4");
save("-mat-binary",imefilemat,"prvi_videoposnetek")
%save("-mat-binary","B","drugi_videoposnetek")
A = load(imefilemat); prvi_videoposnetek=A.prvi_videoposnetek;clear A
B = load("B"); drugi_videoposnetek=B.drugi_videoposnetek;clear B


[b seznam prvi drugi]= korelacija(drugi_videoposnetek,prvi_videoposnetek,0.5);


[vsivektorji,zamik,obseg_ujemanj] =iskanje_ujemanj(seznam,prvi,drugi,5,1);obseg_ujemanj

%[vektor_razlik newimg indexvektor] = primerjanje_slik (prvi, drugi,vsivektorji{1,1},seznam(1),1)

