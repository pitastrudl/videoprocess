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
[mad_a, podvzorcene_slike_a, pot_do_video_posnetka_a]= generacija ("sample.mp4"); # 337
[mad_b, podvzorcene_slike_b, pot_do_video_posnetka_b]= generacija ("cutsample.mp4"); #125

[b seznam prvi drugi]= korelacija(mad_a,mad_b,pot_do_video_posnetka_a,pot_do_video_posnetka_b);




%imshow(podvzorcene_slike_a(:,:,213))
%figure, imshow(podvzorcene_slike_b(:,:,1))
%plot(v3)

%[a,b,c,d]=generacija("cutsample.mp4");

%load("c.mat")
%imshow(c(:,:,1))
%figure, imshow(c(:,:,2))
%figure, imshow(c(:,:,3))

