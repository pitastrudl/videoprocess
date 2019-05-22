pkg load video 
pkg load image

if(true)
  error("dont run this")
  break
endif


#---testni primeri
%rezanje("original.mp4",30,5,"konglomerat1.mp4")
%rezanje("original.mp4",10,5,"konglomerat2.mp4")
%rezanje("original.mp4",40,10,"konglomerat3.mp4")
%rezanje("original.mp4",0,25,"izrez.mp4")
%lepljenje({"konglomerat1.mp4";"konglomerat2.mp4";"konglomerat3.mp4"},"konglomerat.mp4")
%system("ffmpeg -i konglomerat.mp4 -c:v libx264 -crf 48 konglomerat.flv");
%system("ffmpeg -i konglomerat.mp4 -qscale:v 31 -c:v mpeg4  konglomeratmpeg4.mp4 ");  
%sss

%prvi_videoposnetek = predprocesiranje("konglomerat_resized.mp4");
%save("-mat-binary","konglomerat_resized","prvi_videoposnetek")
%
%prvi_videoposnetek = predprocesiranje("konglomeratmpeg4.mp4");
%save("-mat-binary","konglomeratmpeg4","prvi_videoposnetek")
%
%prvi_videoposnetek = predprocesiranje("konglomerat.flv");
%save("-mat-binary","konglomeratflv","prvi_videoposnetek")
%
%prvi_videoposnetek = predprocesiranje("konglomerat.mp4");
%save("-mat-binary","konglomeratmp4","prvi_videoposnetek")
%
%drugi_videoposnetek = predprocesiranje("izrez.mp4");
%save("-mat-binary","izrez","drugi_videoposnetek")
%
%konglomerat = load("konglomeratmp4"); prvi_videoposnetek=konglomerat.prvi_videoposnetek;clear konglomerat
%konglomerat = load("konglomeratflv"); prvi_videoposnetek=konglomerat.prvi_videoposnetek;clear konglomerat
%izrez = load("izrez"); drugi_videoposnetek=izrez.drugi_videoposnetek;clear izrez



%A = load("A"); prvi_videoposnetek=A.prvi_videoposnetek;clear A
%B = load("B"); drugi_videoposnetek=B.drugi_videoposnetek;clear B

%dva_ujemanja = load("dva_ujemanja"); prvi_videoposnetek=dva_ujemanja.prvi_videoposnetek;clear dva_ujemanja
%t = load("t"); drugi_videoposnetek=t.drugi_videoposnetek;clear t

%ab = load("ab"); prvi_videoposnetek=ab.prvi_videoposnetek;clear ab
%c = load("c"); drugi_videoposnetek=c.drugi_videoposnetek;clear c

%df = load("df"); prvi_videoposnetek=df.prvi_videoposnetek;clear df
%g = load("g"); drugi_videoposnetek=g.drugi_videoposnetek;clear g

%xy = load("xy"); prvi_videoposnetek=xy.prvi_videoposnetek;clear xy
%z = load("z"); drugi_videoposnetek=z.drugi_videoposnetek;clear z


%rezanje("original.mp4",20,0.20,"small_1.mp4")
%
%lepljenje({"s1.mp4";"t1.mp4";"s2.mp4";"t2.mp4";"s3.mp4"},"dva_ujemanja.mp4")

%konglomerat = load("konglomerat_resized"); prvi_videoposnetek=konglomerat.prvi_videoposnetek;clear konglomerat
konglomerat = load("konglomeratflv"); prvi_videoposnetek=konglomerat.prvi_videoposnetek;clear konglomerat
konglomerat = load("konglomeratmp4"); prvi_videoposnetek=konglomerat.prvi_videoposnetek;clear konglomerat
konglomerat = load("konglomeratmpeg4"); prvi_videoposnetek=konglomerat.prvi_videoposnetek;clear konglomerat
izrez = load("izrez"); drugi_videoposnetek=izrez.drugi_videoposnetek;clear izrez

drugi_videoposnetek.vektor_sprememb = arrayfun(@rezaj_kandidate,drugi_videoposnetek.vektor_sprememb,2000 );
prvi_videoposnetek.vektor_sprememb = arrayfun(@rezaj_kandidate,prvi_videoposnetek.vektor_sprememb,2000 );


%prvi_videoposnetek = predprocesiranje("q.mp4");
%drugi_videoposnetek = predprocesiranje("pr.mp4");
%save("-mat-binary","q","prvi_videoposnetek")
%save("-mat-binary","pr","drugi_videoposnetek")


q = load("q"); prvi_videoposnetek=q.prvi_videoposnetek;clear q
pr = load("pr"); drugi_videoposnetek=pr.drugi_videoposnetek;clear pr



avid = load("A"); prvi_videoposnetek=avid.prvi_videoposnetek;clear avid
bvid = load("B"); drugi_videoposnetek=bvid.drugi_videoposnetek;clear bvid

[b seznam prvi drugi]= iskanje_kandidatov(drugi_videoposnetek,prvi_videoposnetek,0.5);seznam

[vsivektorji,zamik,obseg_ujemanja] =iskanje_ujemanj(seznam,prvi,drugi,5,25);obseg_ujemanja
%plot(b);


 [ vektor_razlik newImg indexvektor] = primerjanje_slik (prvi,drugi,vsivektorji{1,1},seznam(1),0.5)

%dbstop in iskanje_ujemanj at 30 if 'tau==125'


%for i=zacetek_prvi:konec_prvi
%drawnow()
%subplot (2, 1, 1)
%imshow(prvi.podvzorcene_slike(:,:,i))
%subplot (2, 1, 2)
%imshow(drugi.podvzorcene_slike(:,:,zacetek_drugi+i))
%pause(0.004)
%endfor


A=255*rand(2)
B=255*rand(2)


mad(uint8(A),uint8(B))
mad(A,B)

sum((A(:)-B(:)).^2)/numel(A)
msd(A,B)
immse(A,B)
#NE MARA DOUBLEA 




#------------------------------------------------------------------------------------------------------msd enega vektorja + cut več ujemanj 
%print(f,"/home/arun/latex/diploma_rework/slike/msdvsprememb.png", '-dpngcairo')

prvi_videoposnetek = predprocesiranje("q.mp4");
drugi_videoposnetek = predprocesiranje("pr.mp4");
save("-mat-binary","q_msd","prvi_videoposnetek")
save("-mat-binary","pr_msd","drugi_videoposnetek")

prvi_videoposnetek = predprocesiranje("q.mp4");
drugi_videoposnetek = predprocesiranje("pr.mp4");
save("-mat-binary","q_mad","prvi_videoposnetek")
save("-mat-binary","pr_mad","drugi_videoposnetek")


q_mad = load("q_mad"); prvi_videoposnetek_mad=q_mad.prvi_videoposnetek;clear q_mad
pr_mad = load("pr_mad"); drugi_videoposnetek_mad=pr_mad.drugi_videoposnetek;clear pr_mad

q_msd = load("q_msd"); prvi_videoposnetek_msd=q_msd.prvi_videoposnetek;clear q_msd
pr_msd = load("pr_msd"); drugi_videoposnetek_msd=pr_msd.drugi_videoposnetek;clear pr_msd



drugicut.vektor_sprememb = arrayfun(@rezaj_kandidate,drugi_videoposnetek_msd.vektor_sprememb,80 );
prvicut.vektor_sprememb = arrayfun(@rezaj_kandidate,prvi_videoposnetek_msd.vektor_sprememb,80 );


[b seznam prvi drugi]= iskanje_kandidatov(prvi_videoposnetek_mad,drugi_videoposnetek_mad,0.1);


[c seznamcut prvicut drugicut]= iskanje_kandidatov(prvicut,drugicut,0.1);
%[c seznamcut prvicut drugicut]= iskanje_kandidatov(prvi_videoposnetek_msd,drugi_videoposnetek_msd,0.1);
%[vsivektorji_cut,zamik_cut,obseg_ujemanja_cut] =iskanje_ujemanj(seznamcut,prvicut,drugicut,5,25);


#--testiramo msd
index1=1;
index2=2
msd(prvi_videoposnetek_msd.podvzorcene_slike(:,:,index1),prvi_videoposnetek_msd.podvzorcene_slike(:,:,index2))
prvi_videoposnetek_msd.vektor_sprememb(index1)
plot(prvicut.vektor_sprememb,"linestyle","--")

    podv = prvi_videoposnetek_msd.podvzorcene_slike;
    for i = 1:size(podv,3)-1
      #filamo vektor, razlika med i-tem in i+1--tem.  
%     vektor_sprememb(i)= mad(matrike_video_posnetka(:,:,i), matrike_video_posnetka(:,:,i+1) );  
     testvekt(i)= msd(podv(:,:,i), podv(:,:,i+1) );
    end
    
#-----



close all
graphics_toolkit("qt")
f=figure(1);
subplot(2,2,1:2)
hold on
  x=b;
  x=1-500:numel(b)-500;
  plot(x,b);

  y=c;
  y=1-500:numel(c)-500;
  plot(y,c,"linestyle","--");
  
  hs = legend ({"korelacija \n z mad"}, "korelacija \n z msd");
  legend (hs, "location", "northeast");
  xlabel("Vrednost kandidata za zamik","fontsize",14);
  ylabel("Vrednost korelacije med \n vektorjema sprememb","fontsize",14);
  g=title("Vektor korelacije med video posnetkoma");
  set (g, "fontsize", 15);

subplot(2,2,3)
  hold on
  x=b;
  x=1-500:numel(b)-500;
  plot(x,b);
  y=c;
  y=1-500:numel(c)-500;
  plot(y,c,"linestyle","--");
  
  hj = legend ({"korelacija z mad"}, "korelacija  z msd");
  legend (hj, "location", "southoutside");
  h=title("Vektor korelacije \n med 400 in 600");
  set (h, "fontsize", 15);
  axis ([-100 100],"manual");
subplot(2,2,4)
hold on
   
    plot(prvi.vektor_sprememb)
     plot(prvicut.vektor_sprememb,"linestyle","--")
    hh = legend ({"mad vektor sprememb"}, "msd vektor sprememb");
  legend (hh, "location", "southoutside");
  h=title("Vektor sprememb \n prvega video posnetka");
  set (h, "fontsize", 15);
  hold off
  
  saveas (f, "/home/arun/latex/diploma_rework/slike/msdvsprememb_cut.png", "png")
  

  legend("show")
  
  print(f,"/home/arun/latex/diploma_rework/slike/msdvsprememb.png", '-dpngcairo')



#--------------------------------------------------------------------------------manual xcorr

vekt1 = prvi.vektor_sprememb;
vekt2 = drugi.vektor_sprememb(1:499);
vekt1 = arrayfun(@rezaj_kandidate,vekt1,20 );
vekt2= arrayfun(@rezaj_kandidate,vekt2,20 );
[korelacijskivektor lagi] = xcorr(vekt1,vekt2);
%korelacijskivektor = corr2(vekt1,vekt2);
plot(korelacijskivektor)




#------------------manual testiranje 
# ali je vedno +1, zaradi? , to je prej nareidmo np v najdi_ujemanja
index1=1 +150
index2=1+ 24 +150
mad(prvi.podvzorcene_slike(:,:,index1),drugi.podvzorcene_slike(:,:,index2))
%newImg = cat(2,prvi.podvzorcene_slike(:,:,index1),drugi.podvzorcene_slike(:,:,index2))
subplot (2, 1, 1)
imshow(prvi.podvzorcene_slike(:,:,index1))
subplot (2, 1, 2)
imshow(drugi.podvzorcene_slike(:,:,index2))
drawnow(); 





#-----------------------plot za prvi testni primer, navadna vsebovanost ---korelacija 
konglomerat = load("konglomeratmp4"); prvi_videoposnetek=konglomerat.prvi_videoposnetek;clear konglomerat
izrez = load("izrez"); drugi_videoposnetek=izrez.drugi_videoposnetek;clear izrez
[b seznam prvi drugi]= iskanje_kandidatov(drugi_videoposnetek,prvi_videoposnetek,0.5);seznam
[vsivektorji,zamik,obseg_ujemanja] =iskanje_ujemanj(seznam,prvi,drugi,5,25);obseg_ujemanja

close all
graphics_toolkit("gnuplot")
f=figure(1);
x=b;
x=1-500:numel(b)-500;
plot(x,b);
%plot(b)

  set(gca, "fontsize", 14);
  ylabel("Vrednost korelacije med \n vektorjema sprememb","fontsize",14);
  xlabel("Vrednost kandidata za zamik","fontsize",14);


print(f,"/home/arun/latex/diploma_rework/slike/testprimerbreztrans.png", '-dpngcairo')
% saveas (f, "/home/arun/latex/diploma_rework/slike/testprimerundersample.png", "png")







#---------------------------testiranje korelacija vec ujemanj 
q = load("q"); prvi_videoposnetek=q.prvi_videoposnetek;clear q
pr = load("pr"); drugi_videoposnetek=pr.drugi_videoposnetek;clear pr
[b seznam prvi drugi]= iskanje_kandidatov(drugi_videoposnetek,prvi_videoposnetek,0.1);seznam
[vsivektorji,zamik,obseg_ujemanja] =iskanje_ujemanj(seznam,prvi,drugi,5,25);obseg_ujemanja
close all
graphics_toolkit("gnuplot")
f=figure(1,'position', [300,300, 500, 250]);
x=b;
x=1-500:numel(b)-500;
plot(x,b);

  hold on
     xlabel("Vrednost zamika","fontsize",14);
     ylabel("Vrednost korelacije med \n vektorjema sprememb","fontsize",14);
     axis ([450-500 550-500 -0.1 0.3 ],"manual");
  set(gca, "fontsize", 14);
  hold off
%   saveas (f, "/home/arun/latex/diploma_rework/slike/korelacijavecujemanj.png", "png")
     print(f,"/home/arun/latex/diploma_rework/slike/korelacijavecujemanj.png", '-dpngcairo')

#--------------------------------zakaj ni ujemanje tau 250

close all
graphics_toolkit("gnuplot")
f=figure(1);
index1=1   +140
index2=1+ 250 +140
mad(prvi.podvzorcene_slike(:,:,index1),drugi.podvzorcene_slike(:,:,index2))
%newImg = cat(2,prvi.podvzorcene_slike(:,:,index1),drugi.podvzorcene_slike(:,:,index2))
subplot (1, 2, 1)
imshow(prvi.podvzorcene_slike(:,:,index1))
  hold on
  h=title("141-ta sličica A.mp4");
  set (h, "fontsize", 15);
  
subplot (1, 2, 2)
imshow(drugi.podvzorcene_slike(:,:,index2))
 
  j=title("391-ta sličica B.mp4");
  set (j, "fontsize", 15);
  hold off
  print(f,"/home/arun/latex/diploma_rework/slike/podobnislicici.png", '-dpngcairo')
  
#-----------------------plot za testni primer tri obseg ujemanja

subplot(2,3,1)
  hold on
  h=title("Tau -32");
  set (h, "fontsize", 20);
  plot(vsivektorji{1,9})
  set(gca, "fontsize", 10);
  hold off
subplot(2,3,2)
 hold on
  h=title("Tau -29");
  set (h, "fontsize", 20);
  plot(vsivektorji{1,10})
  set(gca, "fontsize", 10);
  hold off
subplot(2,3,3)
 hold on
  h=title("Tau 24");
  set (h, "fontsize", 20);
  plot(vsivektorji{1,11})
  set(gca, "fontsize", 10);
  hold off
subplot(2,3,4)
   hold on
  h=title("Tau 258");
  set (h, "fontsize", 20);
  plot(vsivektorji{1,20})
  set(gca, "fontsize", 10);
  hold off
subplot(2,3,5:6)
  hold on  
  h=title("Tau 250");
  set (h, "fontsize", 20);
  plot(vsivektorji{1,19})
  set(gca, "fontsize", 10);
  hold off
  saveas (f, "/home/arun/latex/diploma_rework/slike/edgecasemadujemanja.png", "png")
  

#------------------------------------------------------------------testiranje mar
q = load("q"); prvi_videoposnetek=q.prvi_videoposnetek;clear q
pr = load("pr"); drugi_videoposnetek=pr.drugi_videoposnetek;clear pr
[b seznam prvi drugi]= iskanje_kandidatov(drugi_videoposnetek,prvi_videoposnetek,0.1);seznam
[vsivektorji,zamik,obseg_ujemanja] =iskanje_ujemanj(seznam,prvi,drugi,5,25);obseg_ujemanja
[vsivektorji,zamik,obseg_ujemanja] =iskanje_ujemanj(seznam,prvi,drugi,20,25);obseg_ujemanja
[vsivektorji,zamik,obseg_ujemanja] =iskanje_ujemanj(seznam,prvi,drugi,30,25);obseg_ujemanja

f=figure(1);
  subplot(2,3,1)
  hold on
  h=title("Tau -32");
  set (h, "fontsize", 20);
  plot(vsivektorji{1,9})
  set(gca, "fontsize", 10);
  hold off
subplot(2,3,2)
 hold on
  h=title("Tau -29");
  set (h, "fontsize", 20);
  plot(vsivektorji{1,10})
  set(gca, "fontsize", 10);
  hold off
subplot(2,3,3)
 hold on
  h=title("Tau 24");
  set (h, "fontsize", 20);
  plot(vsivektorji{1,11})
  set(gca, "fontsize", 10);
  hold off
subplot(2,3,4)
   hold on
  h=title("Tau 258");
  set (h, "fontsize", 20);
  plot(vsivektorji{1,20})
  set(gca, "fontsize", 10);
  hold off
subplot(2,3,5:6)
  hold on  
  h=title("Tau 250");
  set (h, "fontsize", 20);
  plot(vsivektorji{1,19})
  set(gca, "fontsize", 10);
  hold off
  saveas (f, "/home/arun/latex/diploma_rework/slike/marprimerjanje.png", "png")
  
  
  
  
  
  
  
  
  
  
  
#-----------------------plot za testni primer undersample
konglomerat = load("konglomerat_resized"); prvi_videoposnetek=konglomerat.prvi_videoposnetek;clear konglomerat
izrez = load("izrez"); drugi_videoposnetek=izrez.drugi_videoposnetek;clear izrez
[b seznam prvi drugi]= iskanje_kandidatov(drugi_videoposnetek,prvi_videoposnetek,0.1);seznam
[vsivektorji,zamik,obseg_ujemanja] =iskanje_ujemanj(seznam,prvi,drugi,5,25);obseg_ujemanja

close all
graphics_toolkit("gnuplot")

index1=1      +127
index2=1+ 124  +127
imwrite (prvi.podvzorcene_slike(:,:,index1), "/home/arun/latex/diploma_rework/slike/testprimerundersample1.png");
imwrite (drugi.podvzorcene_slike(:,:,index2), "/home/arun/latex/diploma_rework/slike/testprimerundersample2.png");

mad(prvi.podvzorcene_slike(:,:,index1),drugi.podvzorcene_slike(:,:,index2))
f=figure(1);
colormap("gray");
%  f=figure(1, "visible", "off"); 
%subplot(2,2,1)
%hold on 
%%title("prvi video");
%h=title("prvi video");
%set (h, "fontsize", 20);
%imshow(prvi.podvzorcene_slike(:,:,index1))
%hold off
%
%subplot(2,2,2)
%hold on 
%g=title("drugi video");
%set (g, "fontsize", 20);
%imshow(drugi.podvzorcene_slike(:,:,index2))
%hold off
%
%subplot(2,2,3:4)
plot(vsivektorji{1,11}); 
hold on
%  k=title("vektor razlik v obsegu ujemanja");
%  set (k, "fontsize", 15);
%  axis ([0 numel(vsivektorji{1,1}) 0 max(vsivektorji{1,1})],"manual");
  plot(127,vsivektorji{1,11}(127),'*','color','r'); 
%  line ([0 numel(vsivektorji{1,10})], [1 1], "linestyle", "--", "color", "b");
  ylabel("MAD razlika","fontsize",20);
  xlabel("Indeks razlik med sličicami","fontsize",20);
hold off
print(f,"/home/arun/latex/diploma_rework/slike/testprimerundersample.png", '-dpngcairo')
% saveas (f, "/home/arun/latex/diploma_rework/slike/testprimerundersample.png", "png")








#-------------------------------------------------------------------------plot za testni primer kompresije mpeg4
konglomerat = load("konglomeratmpeg4"); prvi_videoposnetek=konglomerat.prvi_videoposnetek;clear konglomerat
izrez = load("izrez"); drugi_videoposnetek=izrez.drugi_videoposnetek;clear izrez
[b seznam prvi drugi]= iskanje_kandidatov(drugi_videoposnetek,prvi_videoposnetek,0.1);
[vsivektorji,zamik,obseg_ujemanja] =iskanje_ujemanj(seznam,prvi,drugi,5,25);


index1=1 + 127
index2=1+ 127 +124

imwrite (prvi.podvzorcene_slike(:,:,index1), "/home/arun/latex/diploma_rework/slike/mpeg4primer1.png");
imwrite (drugi.podvzorcene_slike(:,:,index2), "/home/arun/latex/diploma_rework/slike/mpeg4primer2.png");

close all
graphics_toolkit("gnuplot")
%f=figure(1);
f=figure(1,'position', [300,300, 500, 200]);
colormap("gray");


%  f=figure(1, "visible", "off"); 
%subplot(2,2,1)
%hold on 
%%title("prvi video");
%h=title("prvi video");
%set (h, "fontsize", 20);
%imshow(prvi.podvzorcene_slike(:,:,index1))
%hold off
%
%subplot(2,2,2)
%hold on 
%g=title("drugi video");
%set (g, "fontsize", 20);
%imshow(drugi.podvzorcene_slike(:,:,index2))
%hold off
%
%subplot(2,2,3:4)

plot(vsivektorji{1,11}); 

 set(gca, "fontsize", 14)

hold on
%  k=title("vektor razlik v obsegu ujemanja");
%  set (k, "fontsize", 14);
%  axis ([0 numel(vsivektorji{1,1}) 0 max(vsivektorji{1,1})],"manual");
  plot(127,vsivektorji{1,11}(127),'*','color','r',"markersize", 5); 
%  line ([0 numel(vsivektorji{1,10})], [1 1], "linestyle", "--", "color", "b");
  ylabel("MAD razlika","fontsize",14);
  xlabel("Indeks razlik med sličicami","fontsize",14);

hold off
 print(f,"/home/arun/latex/diploma_rework/slike/mpeg4primer.png", '-dpngcairo')
% saveas (f, "/home/arun/latex/diploma_rework/slike/mpeg4primer.png", "png")


#---------------------------testiranje rezultata 
konglomerat = load("konglomerat_resized"); prvi_videoposnetek=konglomerat.prvi_videoposnetek;clear konglomerat
izrez = load("izrez"); drugi_videoposnetek=izrez.drugi_videoposnetek;clear izrez
[b seznam prvi drugi]= iskanje_kandidatov(drugi_videoposnetek,prvi_videoposnetek,0.1);seznam
[vsivektorji,zamik,obseg_ujemanja] =iskanje_ujemanj(seznam,prvi,drugi,5,25);obseg_ujemanja

close all
graphics_toolkit("gnuplot")
x=b;
x=1-500:numel(b)-500;
plot(x,b);


  hold on
  %plot(499,0.1,'*','color','r'); #znak 
  %plot(749,0.1,'*','color','r'); #znak 
    set(gca, "fontsize", 12);
     xlabel("Vrednost kandidata za zamik","fontsize",15);
     ylabel("Vrednost korelacije med \n vektorjema sprememb ","fontsize",15);

  axis("tight")
  hold off
   print(f,"/home/arun/latex/diploma_rework/slike/testprimer_undersampl.png", '-dpngcairo')
%   saveas (f, "/home/arun/latex/diploma_rework/slike/testprimer_undersampl.png", "png")
   
 


#--------------plot za testni primer kompresije mpeg4

f=figure(1);
colormap("gray");
%  f=figure(1, "visible", "off"); 
subplot(2,2,1)
hold on 
%title("prvi video");
h=title("prvi video");
set (h, "fontsize", 20);
imshow(prvi.podvzorcene_slike(:,:,index1))
hold off

subplot(2,2,2)
hold on 
g=title("drugi video");
set (g, "fontsize", 20);
imshow(drugi.podvzorcene_slike(:,:,index2))
hold off

subplot(2,2,3:4)

plot(vsivektorji{1,19}); 


hold on
  k=title("vektor razlik v obsegu ujemanja");
  set (k, "fontsize", 15);
%  axis ([0 numel(vsivektorji{1,1}) 0 max(vsivektorji{1,1})],"manual");
  plot(127,vsivektorji{1,19}(127),'*','color','r'); 
%  line ([0 numel(vsivektorji{1,10})], [1 1], "linestyle", "--", "color", "b");
  ylabel("MAD razlika","fontsize",20);
  xlabel("Indeks razlik med sličicami","fontsize",20);
hold off
 saveas (f, "/home/arun/latex/diploma_rework/slike/mpeg4primer.png", "png")





#----------------------------plot za testni primer kompresije flv
konglomerat = load("konglomeratflv"); prvi_videoposnetek=konglomerat.prvi_videoposnetek;clear konglomerat
izrez = load("izrez"); drugi_videoposnetek=izrez.drugi_videoposnetek;clear izrez
[b seznam prvi drugi]= iskanje_kandidatov(drugi_videoposnetek,prvi_videoposnetek,0.05);seznam
[vsivektorji,zamik,obseg_ujemanja] =iskanje_ujemanj(seznam,prvi,drugi,5,25);obseg_ujemanja

graphics_toolkit("gnuplot")
index1=1 + 126
index2=1+ 126 +125
imwrite (prvi.podvzorcene_slike(:,:,index1), "/home/arun/latex/diploma_rework/slike/flvprimervideo1.png");
imwrite (drugi.podvzorcene_slike(:,:,index2), "/home/arun/latex/diploma_rework/slike/flvprimervideo2.png");

f=figure(1);
colormap("gray");
%  f=figure(1, "visible", "off"); 
%subplot(2,2,1)
%hold on 
%%title("prvi video");
%h=title("prvi video");
%set (h, "fontsize", 20);
%imshow(prvi.podvzorcene_slike(:,:,index1))
%hold off
%
%subplot(2,2,2)
%hold on 
%g=title("drugi video");
%set (g, "fontsize", 20);
%imshow(drugi.podvzorcene_slike(:,:,index2))
%hold off
%
%subplot(2,2,3:4)

plot(vsivektorji{1,79}); 
set(gca, "fontsize", 12)

hold on
%  k=title("vektor razlik v obsegu ujemanja");
%  set (k, "fontsize", 15);
%  axis ([0 numel(vsivektorji{1,1}) 0 max(vsivektorji{1,1})],"manual");
  plot(126,vsivektorji{1,79}(126),'*','color','r'); 
%  line ([0 numel(vsivektorji{1,10})], [1 1], "linestyle", "--", "color", "b");
  ylabel("MAD razlika","fontsize",13);
  xlabel("Indeks razlik med sličicami","fontsize",13);
hold off
 print(f,"/home/arun/latex/diploma_rework/slike/flvprimervideo.png", '-dpngcairo')
% saveas (f, "/home/arun/latex/diploma_rework/slike/flvprimervideo.png", "png")







#----------------------------plot za testni primer ko n itau pravi, brez transfomracije1
konglomerat = load("konglomeratmp4"); prvi_videoposnetek=konglomerat.prvi_videoposnetek;clear konglomerat
izrez = load("izrez"); drugi_videoposnetek=izrez.drugi_videoposnetek;clear izrez
[b seznam prvi drugi]= iskanje_kandidatov(drugi_videoposnetek,prvi_videoposnetek,0.1);seznam
[vsivektorji,zamik,obseg_ujemanja] =iskanje_ujemanj(seznam,prvi,drugi,5,25);obseg_ujemanja
index1=1 + 126
index2=1+ 126 +101
imwrite (prvi.podvzorcene_slike(:,:,index1), "/home/arun/latex/diploma_rework/slike/slaboujemanjetestniprimer1_1.png");
imwrite (drugi.podvzorcene_slike(:,:,index2), "/home/arun/latex/diploma_rework/slike/slaboujemanjetestniprimer1_2.png");

close all
graphics_toolkit("gnuplot")
f=figure(1);
colormap("gray");
%  f=figure(1, "visible", "off"); 
%subplot(2,2,1)
%hold on 
%title("prvi video");
%h=title("prvi video");
%set (h, "fontsize", 20);
%imshow(prvi.podvzorcene_slike(:,:,index1))
%hold off
%
%subplot(2,2,2)
%hold on 
%g=title("drugi video");
%set (g, "fontsize", 20);
%imshow(drugi.podvzorcene_slike(:,:,index2))
%hold off
%
%subplot(2,2,3:4)

plot(vsivektorji{1,10}); 
set(gca, "fontsize", 12)

hold on
%  k=title("vektor razlik v obsegu ujemanja");
%  set (k, "fontsize", 15);
%  axis ([0 numel(vsivektorji{1,1}) 0 max(vsivektorji{1,1})],"manual");
  plot(126,vsivektorji{1,10}(126),'*','color','r'); 
%  line ([0 numel(vsivektorji{1,10})], [1 1], "linestyle", "--", "color", "b");
  ylabel("MAD vrednost","fontsize",13);
  xlabel("Zamik","fontsize",13);
hold off
% saveas (f, "/home/arun/latex/diploma_rework/slike/slaboujemanjetestniprimer1.png", "png")
  print(f,"/home/arun/latex/diploma_rework/slike/slaboujemanjetestniprimer1.png", '-dpngcairo')


 #----------------------------plot za testni primer ko n itau pravi, brez transfomracije2
konglomerat = load("konglomeratmp4"); prvi_videoposnetek=konglomerat.prvi_videoposnetek;clear konglomerat
izrez = load("izrez"); drugi_videoposnetek=izrez.drugi_videoposnetek;clear izrez
[b seznam prvi drugi]= iskanje_kandidatov(drugi_videoposnetek,prvi_videoposnetek,0.1);seznam
[vsivektorji,zamik,obseg_ujemanja] =iskanje_ujemanj(seznam,prvi,drugi,5,25);obseg_ujemanja
index1=1 + 126
index2=1+ 126 +125
imwrite (prvi.podvzorcene_slike(:,:,index1), "/home/arun/latex/diploma_rework/slike/slaboujemanjetestniprimer2_1.png");
imwrite (drugi.podvzorcene_slike(:,:,index2), "/home/arun/latex/diploma_rework/slike/slaboujemanjetestniprimer2_2.png");

close all
graphics_toolkit("gnuplot")
f=figure(1);
colormap("gray");
%%  f=figure(1, "visible", "off"); 
%subplot(2,2,1)
%hold on 
%%title("prvi video");
%h=title("prvi video");
%set (h, "fontsize", 20);
%imshow(prvi.podvzorcene_slike(:,:,index1))
%hold off
%
%subplot(2,2,2)
%hold on 
%g=title("drugi video");
%set (g, "fontsize", 20);
%imshow(drugi.podvzorcene_slike(:,:,index2))
%hold off
%
%subplot(2,2,3:4)

plot(vsivektorji{1,11}); 
set(gca, "fontsize", 12)
hold on
%  k=title("vektor razlik v obsegu ujemanja");
%  set (k, "fontsize", 15);
%  axis ([0 numel(vsivektorji{1,1}) 0 max(vsivektorji{1,1})],"manual");
  plot(126,vsivektorji{1,11}(126),'*','color','r'); 
%  line ([0 numel(vsivektorji{1,10})], [1 1], "linestyle", "--", "color", "b");
  ylabel("MAD vrednost","fontsize",13);
  xlabel("Zamik","fontsize",13);
hold off
  print(f,"/home/arun/latex/diploma_rework/slike/slaboujemanjetestniprimer2.png", '-dpngcairo')


 
 

 #-------------------------------------plot test primer mpeg4
konglomerat = load("konglomeratmpeg4"); prvi_videoposnetek=konglomerat.prvi_videoposnetek;clear konglomerat
izrez = load("izrez"); drugi_videoposnetek=izrez.drugi_videoposnetek;clear izrez
[b seznam prvi drugi]= iskanje_kandidatov(drugi_videoposnetek,prvi_videoposnetek,0.05);seznam

f=figure(1);
 x=b;
x=1-500:numel(b)-500;
plot(x,b);


hold on
%plot(499,0.1,'*','color','r'); #znak 
%plot(749,0.1,'*','color','r'); #znak 
   xlabel("Vrednost kandidata za zamik","fontsize",14);
   ylabel("Vrednost korelacije med vektorjema sprememb","fontsize",14);
set(gca, "fontsize", 15);
axis("tight")
hold off
 saveas (f, "/home/arun/latex/diploma_rework/slike/korelacijampeg4.png", "png")
   
   
   
#----------------------------------------------plot korel primer 2
konglomerat = load("konglomeratflv"); prvi_videoposnetek=konglomerat.prvi_videoposnetek;clear konglomerat
izrez = load("izrez"); drugi_videoposnetek=izrez.drugi_videoposnetek;clear izrez
[b seznam prvi drugi]= iskanje_kandidatov(drugi_videoposnetek,prvi_videoposnetek,0.05);seznam
[vsivektorji,zamik,obseg_ujemanja] =iskanje_ujemanj(seznam,prvi,drugi,5,25);obseg_ujemanja

close all
x=b;
x=1-500:numel(b)-500;
plot(x,b);

hold on
%plot(499,0.1,'*','color','r'); #znak 
%plot(749,0.1,'*','color','r'); #znak 
   xlabel("Vrednost kandidata za zamik","fontsize",16);
   ylabel("Korelacijska vrednost vektorjev sprememb","fontsize",16);
set(gca, "fontsize", 15);
%  axis ([0 numel(b) min(b) max(b))],"tight");
  axis ("tight");
hold off
 saveas (f, "/home/arun/latex/diploma_rework/slike/testprimer2_korel.png", "png")
   
   #----------------------------------------------plotting obeh madjev
prvi_videoposnetek = predprocesiranje("A.mp4");
drugi_videoposnetek = predprocesiranje("B.mp4");
save("-mat-binary","A","prvi_videoposnetek")
save("-mat-binary","B","drugi_videoposnetek")

avid = load("A"); prvi_videoposnetek_prev=avid.prvi_videoposnetek;clear avid
bvid = load("B"); drugi_videoposnetek_prev=bvid.drugi_videoposnetek;clear bvid
   
   #TEST
   subplot(2,1,1)
   prvi_videoposnetek.vektor_sprememb(168)
   prvi_videoposnetek_prev.vektor_sprememb(168)
   avid = load("A"); prvi_videoposnetek_prev=avid.prvi_videoposnetek;clear avid
   plot(prvi_videoposnetek_prev.vektor_sprememb)
  
   subplot(2,1,2)
   plot(prvi_videoposnetek.vektor_sprememb)
  
  sum(prvi_videoposnetek.vektor_sprememb(:))
  sum( prvi_videoposnetek_prev.vektor_sprememb(:))
   
   G=prvi_videoposnetek.vektor_sprememb;
   H=prvi_videoposnetek_prev.vektor_sprememb;
   J=H-G;
   max(J)
   sum(H(:))
   sum(G(:))
   
   
close all
  graphics_toolkit("gnuplot")
  f=figure(1);
  hold on
  h=title("Prvi video posnetek");
  set (h, "fontsize", 15);
  xlabel("Jakost razlike","fontsize",14);
  ylabel("Indeks razlik med sličicami","fontsize",14);
  plot(prvi_videoposnetek.vektor_sprememb)
  hold off
print(f,"/home/arun/latex/diploma_rework/slike/madobeh.png", '-dpngcairo')




#------------------------------------------------plottanje korelacije
   
avid = load("A"); prvi_videoposnetek=avid.prvi_videoposnetek;clear avid
bvid = load("B"); drugi_videoposnetek=bvid.drugi_videoposnetek;clear bvid
[b seznam prvi drugi]= iskanje_kandidatov(drugi_videoposnetek,prvi_videoposnetek,0.1);seznam


close all
graphics_toolkit("gnuplot")

f=figure(1);
x=b;
x=1-375:numel(b)-375;
plot(x,b);
xlabel("Indeks zamika križne korelacije","fontsize",17);
ylabel("Vrednost križne korelacije","fontsize",17);
set(gca, "fontsize", 12)
 line ([1-375 numel(b)-375], [0.5 0.5], "linestyle", "--", "color", "b");
 text(450,0.55,"Prag","fontsize",12)
 hold on;
 plot(624-375,0.6,'*','color','r'); #znak 
 text(628-370,0.6,"250","fontsize",10)
 hold off;
% saveas (f, "/home/arun/latex/diploma_rework/slike/korelacija.png", "png")
print(f,"/home/arun/latex/diploma_rework/slike/korelacija.png", '-dpngcairo')


#------------------------------------------------plottanje vektorja ujemanja
avid = load("A"); prvi_videoposnetek=avid.prvi_videoposnetek;clear avid
bvid = load("B"); drugi_videoposnetek=bvid.drugi_videoposnetek;clear bvid
[b seznam prvi drugi]= iskanje_kandidatov(drugi_videoposnetek,prvi_videoposnetek,0.5);seznam
[vsivektorji,zamik,obseg_ujemanja] =iskanje_ujemanj(seznam,prvi,drugi,5,25);obseg_ujemanja

close all
graphics_toolkit("gnuplot")
treshold=1;
f=figure(1);
plot(vsivektorji{1,1});
treshold = 1;
xlabel("Indeks razlik med sličicami" ,"fontsize",17);
ylabel("Razlika med \n podvzorčenimi sličicami","fontsize",17);
set(gca, "fontsize", 12)
%line ([0 numel(vsivektorji{1,1})], [treshold treshold], "linestyle", "--", "color", "b");
%text(100,treshold + 0.05,"Prag","fontsize",12)
hold on;
% plot(624,0.6,'*','color','r'); #znak 
% text(628,0.6,"624","fontsize",10)
 hold off;
% saveas (f, "/home/arun/latex/diploma_rework/slike/obseg_ujemanj.png", "png")
print(f,"/home/arun/latex/diploma_rework/slike/obseg_ujemanj.png", '-dpngcairo')


#------------------------------------------- glavni plot test, za poglavje prikaz rezultatov
avid = load("A"); prvi_videoposnetek=avid.prvi_videoposnetek;clear avid
bvid = load("B"); drugi_videoposnetek=bvid.drugi_videoposnetek;clear bvid
[b seznam prvi drugi]= iskanje_kandidatov(drugi_videoposnetek,prvi_videoposnetek,0.5);seznam
[vsivektorji,zamik,obseg_ujemanja] =iskanje_ujemanj(seznam,prvi,drugi,5,25);obseg_ujemanja


close all
graphics_toolkit("gnuplot")
f=figure(1);
colormap("gray");
%catt= cat(2,prvi.podvzorcene_slike(:,:,1+250),ones(54,10)*255,drugi.podvzorcene_slike(:,:,251+250));
imwrite (prvi.podvzorcene_slike(:,:,1+250), "/home/arun/latex/diploma_rework/slike/ujemanje1.png");
imwrite (drugi.podvzorcene_slike(:,:,251+250), "/home/arun/latex/diploma_rework/slike/ujemanje2.png");
%subplot(2,2,1:2)
%  hold on 
%  imshow(catt)
%  im = imshow(catt)
%  h=title("prvi video                 drugi video");
%  set (h, "fontsize", 15);
  %subplot(2,2,1)
  %  hold on 
  %  h=title("prvi video");
  %  set (h, "fontsize", 17);
  %  imshow(prvi.podvzorcene_slike(:,:,1+250));
  %  hold off
  %subplot(2,2,2)
  %  hold on 
  %  g=title("drugi video");
  %  set (g, "fontsize", 20);
  %  %title("drugi video");
  %  imshow(drugi.podvzorcene_slike(:,:,251+250));
  %  hold off

  hold off
 % [StartX, StartY, Width, Height)
%subplot(2,2,3:4)
  plot(vsivektorji{1,1}); 
  hold on
%  k=title("Obseg ujemanj");
%  set (k, "fontsize", 18);
  axis ([0 numel(vsivektorji{1,1}) 0 max(vsivektorji{1,1})],"manual");
  set(gca, "fontsize", 12)
  plot(250,vsivektorji{1,1}(250),'*','color','r'); 
  line ([0 numel(vsivektorji{1,1})], [1 1], "linestyle", "--", "color", "b");
  ylabel("MAD razlika","fontsize",13);
  xlabel("Indeks razlik med sličicami","fontsize",13);
  hold off
  
%  print(f,"/home/arun/latex/diploma_rework/slike/test.tex", '-dpslatex')

% saveas (f, "/home/arun/latex/diploma_rework/slike/ujemanje.png", "png")
print(f,"/home/arun/latex/diploma_rework/slike/ujemanje.png", '-dpngcairo')

 
 

 
 
 
 
 
#-----------------------testing utf
close all
graphics_toolkit("qt")
f = figure(1)
%set(f,"defaulttextfontname","Courier") 
% h = findall (f, "-property", "fontname"); 
%        set (h, "fontname", "Courier new") 
 x = 1:5;  y = 1:5;
 plot (x,y,"g");
 title ("the next 3 letters should be printer: čšž");
 set(gca, 'fontname', 'Courier New')
 saveas (f, "test.png", "png")
 
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

%



%pos1 = predprocesiranje("a.mp4");
%pos2 = predprocesiranje("a.mp4");
%[b seznam prvi drugi]= iskanje_kandidatov(pos1,pos2,0.5);

%rezanje("original.mp4",15,15,"A.mp4")
%rezanje("original.mp4",5,35,"B.mp4")

%prvi_videoposnetek = predprocesiranje("A.mp4");
%drugi_videoposnetek = predprocesiranje("B.mp4");
%save("-mat-binary","A","prvi_videoposnetek")
%save("-mat-binary","B","drugi_videoposnetek")

%avid = load("A"); prvi_videoposnetek=avid.prvi_videoposnetek;clear avid
%bvid = load("B"); drugi_videoposnetek=bvid.drugi_videoposnetek;clear bvid


#------------------------------------------------------S IN T testiranje
#za s
%rezanje("big.mp4",5,5,"s1.mp4")
%rezanje("big.mp4",15,5,"s2.mp4")
%rezanje("big.mp4",25,5,"s3.mp4")
%rezanje("big.mp4",40,30,"t.mp4")
%rezanje("big.mp4",40,5,"t1.mp4")
%rezanje("big.mp4",50,5,"t2.mp4")
%
%lepljenje({"s1.mp4";"t1.mp4";"s2.mp4";"t2.mp4";"s3.mp4"},"dva_ujemanja.mp4")



%prvi_videoposnetek = predprocesiranje("sample.mp4");
%drugi_videoposnetek = predprocesiranje("drugisample.mp4");
%drugi_videoposnetek = predprocesiranje("drugisample.mp4");
%drugi_videoposnetek = predprocesiranje("tretjisample.mp4");
%drugi_videoposnetek = predprocesiranje("kratek.mp4");



%
%rezanje("original.mp4",5,5,"p1.mp4")
%rezanje("original.mp4",15,5,"p2.mp4")
%rezanje("original.mp4",30,30,"q.mp4")
%rezanje("original.mp4",35,5,"r1.mp4")
%rezanje("original.mp4",55,5,"r2.mp4")
%lepljenje({"p1.mp4";"r1.mp4";"p2.mp4";"r2.mp4"},"pr.mp4")
%
%prvi_videoposnetek = predprocesiranje("q.mp4");
%drugi_videoposnetek = predprocesiranje("pr.mp4");
%save("-mat-binary","q_mad","prvi_videoposnetek")
%save("-mat-binary","pr_mad","drugi_videoposnetek")
%
%prvi_videoposnetek = predprocesiranje("q.mp4");
%drugi_videoposnetek = predprocesiranje("pr.mp4");
%save("-mat-binary","q_msd","prvi_videoposnetek")
%save("-mat-binary","pr_msd","drugi_videoposnetek")
%
%prvi_videoposnetek = predprocesiranje("dva_ujemanja.mp4");
%drugi_videoposnetek = predprocesiranje("t.mp4");
%save("-mat-binary","dva_ujemanja","prvi_videoposnetek")
%save("-mat-binary","t","drugi_videoposnetek")
%
%
%
%prvi_videoposnetek = predprocesiranje("ab.mp4");
%drugi_videoposnetek = predprocesiranje("c.mp4");
%save("-mat-binary","ab","prvi_videoposnetek")
%save("-mat-binary","c","drugi_videoposnetek")
%
%
%prvi_videoposnetek = predprocesiranje("df.mp4");
%drugi_videoposnetek = predprocesiranje("g.mp4");
%save("-mat-binary","df","prvi_videoposnetek")
%save("-mat-binary","g","drugi_videoposnetek")
%
%
%prvi_videoposnetek = predprocesiranje("xy.mp4");
%drugi_videoposnetek = predprocesiranje("z.mp4");
%save("-mat-binary","xy","prvi_videoposnetek")
%save("-mat-binary","z","drugi_videoposnetek")


#---probal drugo
%rezanje("original.mp4",120,5,"konglomerat1.mp4")
%rezanje("original.mp4",10,5,"konglomerat2.mp4")
%rezanje("original.mp4",130,10,"konglomerat3.mp4")
%rezanje("original.mp4",0,25,"izrez.mp4")
%lepljenje({"konglomerat1.mp4";"konglomerat2.mp4";"konglomerat3.mp4"},"konglomerat.mp4")
