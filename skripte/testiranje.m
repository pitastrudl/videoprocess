pkg load video 
pkg load image




rezanje("original.mp4",30,5,"konglomerat1.mp4")
rezanje("original.mp4",10,5,"konglomerat2.mp4")
rezanje("original.mp4",40,10,"konglomerat3.mp4")
rezanje("original.mp4",0,25,"izrez.mp4")
lepljenje({"konglomerat1.mp4";"konglomerat2.mp4";"konglomerat3.mp4"},"konglomerat.mp4")

system("ffmpeg -i konglomerat.mp4 -c:v libx264 -crf 48 konglomerat.flv");
prvi_videoposnetek = predprocesiranje("konglomerat.flv");
drugi_videoposnetek = predprocesiranje("izrez.mp4");

konglomerat = load("konglomerat"); prvi_videoposnetek=konglomerat.prvi_videoposnetek;clear konglomerat
izrez = load("izrez"); drugi_videoposnetek=izrez.drugi_videoposnetek;clear izrez

%q = load("q"); prvi_videoposnetek=q.prvi_videoposnetek;clear q
%pr = load("pr"); drugi_videoposnetek=pr.drugi_videoposnetek;clear pr

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
%


[b seznam prvi drugi]= iskanje_kandidatov(drugi_videoposnetek,prvi_videoposnetek,0.1);


[vsivektorji,zamik,obseg_ujemanja] =iskanje_ujemanj(seznam,prvi,drugi,1,30);obseg_ujemanja

#---testiranje rezultata edgecase
plot(b);

hold on
plot(499,0.1,'*','color','r'); #znak 
plot(749,0.1,'*','color','r'); #znak 
set(gca, "fontsize", 12);
hold off

%plot(vsivektorji{2})
[vektor_razlik newimg indexvektor] = primerjanje_slik (prvi, drugi,vsivektorji{1,1},seznam(1),1)

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
index1=126
index2=126
mad(prvi.podvzorcene_slike(:,:,index1),drugi.podvzorcene_slike(:,:,index2))
%newImg = cat(2,prvi.podvzorcene_slike(:,:,index1),drugi.podvzorcene_slike(:,:,index2))
subplot (2, 1, 1)
imshow(prvi.podvzorcene_slike(:,:,index1))
subplot (2, 1, 2)
imshow(drugi.podvzorcene_slike(:,:,index2))
drawnow(); 


figure("visible","off"); movie("init","square.mp4")
 n=100; a=zeros(n,n); a(1:20,41:60)=1;
 for i=1:n; imshow(shift(a,i)); movie("add","square.mp4"); endfor
 movie("close","square.mp4",24); close; system("mplayer square.mp4")

 #------plotting obeh madjev
 f=figure(1);

hold on
  h=title("Prvi video posnetek");
 set (h, "fontsize", 15);
 xlabel("Jakost razlike","fontsize",14);
 ylabel("Indeks razlik med sličicami","fontsize",14);
plot(prvi.vektor_sprememb)
%subplot (2, 1, 2)
%plot(drugi.vektor_sprememb)
%  h=title("Drugi video posnetek");
%  set (h, "fontsize", 15);
% xlabel("Jakost razlike","fontsize",14);
% ylabel("Indeks razlik med sličicami","fontsize",14);
% hold off
  saveas (f, "/home/arun/latex/diploma_rework/slike/madobeh.png", "png")

 
#--------plottanje korelacije
graphics_toolkit ("qt")
f=figure(1);
plot(b);
xlabel("Zamiki krizne korelacije","fontsize",20);
ylabel("Vrednost krizne korelacije","fontsize",20);
set(gca, "fontsize", 12)
 line ([0 numel(b)], [0.5 0.5], "linestyle", "--", "color", "b");
 text(200,0.55,"Prag","fontsize",12)
 hold on;
 plot(624,0.6,'*','color','r'); #znak 
 text(628,0.6,"624","fontsize",10)
 hold off;
 saveas (f, "/home/arun/latex/diploma_rework/slike/korelacija.png", "png")
%print(f,"/home/arun/latex/diploma_rework/slike/korelacija.png", "-dpng")


#--------plottanje vektorja ujemanja
graphics_toolkit ("qt")
f=figure(1);
plot(vekt);
treshold = 1;
xlabel("Razlika med podvzorčenimi sličicami","fontsize",20);
ylabel("Indeks razlik med sličicami","fontsize",20);
set(gca, "fontsize", 12)
line ([0 numel(vekt)], [treshold treshold], "linestyle", "--", "color", "b");
text(100,treshold + 0.05,"Prag","fontsize",12)
hold on;
% plot(624,0.6,'*','color','r'); #znak 
% text(628,0.6,"624","fontsize",10)
 hold off;
 saveas (f, "/home/arun/latex/diploma_rework/slike/obseg_ujemanj.png", "png")
%print(f,"/home/arun/latex/diploma_rework/slike/korelacija.png", "-dpng")


#--- glavni plot test, za poglavje prikaz rezultatov
figure(1);
crna_slika(1:100,1:100)=1;
crna_slika1(1:100,1:100)=1;
crna_slika2(1:100,1:100)=1;
colormap("gray");
%  f=figure(1, "visible", "off"); 
subplot(2,2,1)
hold on 
%title("prvi video");
h=title("prvi video");
set (h, "fontsize", 20);
imshow(prvi.podvzorcene_slike(:,:,1+250));
hold off
subplot(2,2,2)
hold on 
g=title("drugi video");
set (g, "fontsize", 20);
%title("drugi video");
imshow(drugi.podvzorcene_slike(:,:,251+250));
hold off

subplot(2,2,3:4)
plot(vsivektorji{1,1}); 
hold on
  k=title("drugi video");
  set (k, "fontsize", 15);
  axis ([0 numel(vsivektorji{1,1}) 0 max(vsivektorji{1,1})],"manual");
  plot(250,vsivektorji{1,1}(250),'*','color','r'); 
  line ([0 numel(vsivektorji{1,1})], [1 1], "linestyle", "--", "color", "b");
  ylabel("MAD razlika","fontsize",20);
  xlabel("Indeks razlik med sličicami","fontsize",20);
hold off
 saveas (f, "/home/arun/latex/diploma_rework/slike/ujemanje.png", "png")

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



%pos1 = predprocesiranje("a.mp4");
%pos2 = predprocesiranje("a.mp4");
%[b seznam prvi drugi]= iskanje_kandidatov(pos1,pos2,0.5);

%rezanje("big.mp4",15,15,"A.mp4")
%rezanje("big.mp4",5,35,"B.mp4")



#--------------S IN T testiranje
#za s
%rezanje("big.mp4",5,5,"s1.mp4")
%rezanje("big.mp4",15,5,"s2.mp4")
%rezanje("big.mp4",25,5,"s3.mp4")
%rezanje("big.mp4",40,30,"t.mp4")
%rezanje("big.mp4",40,5,"t1.mp4")
%rezanje("big.mp4",50,5,"t2.mp4")
%
%lepljenje({"s1.mp4";"t1.mp4";"s2.mp4";"t2.mp4";"s3.mp4"},"dva_ujemanja.mp4")
%save("-mat-binary","A","prvi_videoposnetek")
%save("-mat-binary","B","drugi_videoposnetek")

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
%save("-mat-binary","q","prvi_videoposnetek")
%save("-mat-binary","pr","drugi_videoposnetek")
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