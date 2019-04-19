function [ vektor_razlik newImg indexvektor] = primerjanje_slik (prvi,drugi,vektor,zamik,treshold)
  pkg load signal
  pkg load image
  pkg load video

newImg= [];
indexvektor= [];

# kreiramo indekse
    tau= zamik - length(prvi.vektor_sprememb)
    zacetek_prvi=max(0,-1*tau)+1  
    konec_prvi=min(length(prvi.vektor_sprememb),length(drugi.vektor_sprememb)-tau)
    zacetek_drugi=max(tau,0)+1
    konec_drugi = min(tau+length(prvi.vektor_sprememb),length(drugi.vektor_sprememb) ) # to bo treba spreminjat , v primeru da se ne ujema vse?
   
   #iščemo razlike z zamikom
   i=1;
  for j = zacetek_prvi:konec_prvi
    madrazlika= mad(prvi.podvzorcene_slike(:,:,j) , drugi.podvzorcene_slike(:,:,j+zacetek_drugi-zacetek_prvi));
     indexvektor(i)=0;
  if ( madrazlika <  treshold)
    indexvektor(i)=1;
    
    
    newImg(:,:,end +1) = imresize([ prvi.podvzorcene_slike(:,:,j) drugi.podvzorcene_slike(:,:,j+zacetek_drugi-zacetek_prvi)] ,1);
%    vektor_razlik = find(vektor < treshold); #notri dobimo indekse kjer je treshold vredu!
  endif
i++;
endfor


graphics_toolkit("gnuplot")
# plottamo
crna_slika(1:size(newImg,1),1:size(newImg,2))=1;
j=1;
for i=1:length(indexvektor)  #tukaj naredit, z vektor_razlik, ko bo kazu in ne. 
  colormap("gray");
  f=figure(1, "visible", "off"); 
  subplot(2,1,1)
  if(indexvektor(i)) #če je true
    imshow(newImg(:,:,j));
    j++;
  else
    imshow(crna_slika);
  endif
%  h=text(numel(vektor)*0.20,-0.2,"prvi video");
%  h=title("prvi video");
%  set (h, "fontsize", 15);
%  g=text(numel(vektor)*0.80,-0.2,"drugi video");
  g=title("prvi in drugi video");
  set (g, "fontsize", 15);
  subplot(2,1,2)
   ylabel("MAD razlika","fontsize",17);
  xlabel("Indeks razlik med sličicami","fontsize",17);
  plot(vektor); 
  axis ([0 numel(vektor) 0 max(vektor)],"manual");
  hold on;
   text(200,0.55,"Prag","fontsize",12)
  plot(i,vektor(i),'*','color','r'); #znak 
  line ([0 numel(vektor)], [treshold treshold], "linestyle", "--", "color", "b");

  hold off
%  drawnow();
%subplot(1,2,1);imshow(prvi.podvzorcene_slike(:,:,126));title("test");subplot(1,2,2);imshow(drugi.podvzorcene_slike(:,:,1));
  pause(0.04)
  #print -append "animation/animation.pdf"
  fname = sprintf ("animation/img%03i.png", i);
 
  set(f, "visible", "off");
  print ("-dpng", "-r100", fname);
   set(f, "visible", "on");
endfor

#---video package
v = avifile(['animation/anim' '' int2str(zamik) '' '.mp4'],'fps',25.0,'codec','mpeg4');
for i=1:length(indexvektor)
  tempstring=sprintf("animation/img%03i.png", i);
  tempimg=imread(tempstring);
  tempadd = im2double(tempimg);
  size(tempadd);
  addframe(v,tempadd);
endfor



#----------------iz glavnega loopa------------------


    %colormap("gray")
    %subplot (2, 1, 1)
    %  imagesc(im2uint8(prvi.podvzorcene_slike(:,:,j))) % update latest frame
    %  % feel free to reduce, but keep greater than 0 to ensure redraw
    %  subplot (2, 1, 2)
    %  imagesc(im2uint8(drugi.podvzorcene_slike(:,:,j+zacetek_drugi-zacetek_prvi))) % update latest frame
    %  drawnow();
    %  pause(0.04)
    %%  
    %#primerjalni_vektor(end+1)= mad(prvivektor.podvzorcene_slike(:,:,j) , drugivektor.podvzorcene_slike(:,:,j+zacetek_drugi-zacetek_prvi));
    %pause(1/25) 
    %drawnow(); 
    %newImg(:,:,end +1) = imresize(cat(2,prvi.podvzorcene_slike(:,:,j) , drugi.podvzorcene_slike(:,:,j+zacetek_drugi-zacetek_prvi)),0.3);
    #gradimo plot field
    %figure('visible','off');
    %subplot(1,2,1);
    %imshow(prvi.podvzorcene_slike(:,:,j));
    %title("test");
    %subplot(1,2,2);
    %imshow(drugi.podvzorcene_slike(:,:,j+zacetek_drugi-zacetek_prvi))
    %#------
#----------------------------------




#---nomral try
%f = figure
%set(f, "visible", "off")
%for i=1:size(newImg,3)  #tukaj naredit, z vektor_razlik, ko bo kazu in ne. 
%  
%  colormap("gray");
%  subplot(2,1,1)
%  imagesc(newImg(:,:,i));
%%  h=text(numel(vektor)*0.20,-0.2,"prvi video");
%  h=title("prvi video");
%  set (h, "fontsize", 15);
%%  g=text(numel(vektor)*0.80,-0.2,"drugi video");
%  g=title("drugi video");
%  set (g, "fontsize", 15);
%  subplot(2,1,2)
%  plot(vektor); 
%  axis ([0 numel(vektor) 0 max(vektor)],"manual");
%  hold on;
%  plot(i,vektor(i),'*','color','r'); #znak 
%  line ([0 numel(vektor)], [treshold treshold], "linestyle", "--", "color", "b");
%  hold off
%%  drawnow();
%%subplot(1,2,1);imshow(prvi.podvzorcene_slike(:,:,126));title("test");subplot(1,2,2);imshow(drugi.podvzorcene_slike(:,:,1));
%  pause(0.04)
%%  print -append "animation/animation.pdf"
%  
%  fname = sprintf ("animation/img%03i.png", i);
%  print ("-dpng", "-r100", fname);
%endfor
%im = imread ("animation/animation.pdf", "Index", "all");
%imwrite (im, "animation/animation.gif", "DelayTime", 0.37)
%set(f, "visible", "on")



#---drugi posks 
%video = VideoWriter('yourvideo.avi'); %create the video object
%open(video); %open the file for writing
%for ii=1:N %where N is the number of images
%  I = imread('the ith image.jpg'); %read the next image
%  writeVideo(video,I); %write the image to file
%end
%close(video); %close the file
      % add a frame
           % finish
           
           
#-------------------ha?
%im = imread ("animation.pdf", "Index", "all");
%imwrite (im, "animation.gif", "DelayTime", 1/25)
%
%   figure("visible","off"); movie("init","test.mp4")
%for i=1:size(newImg,3)
%  imshow(newImg(:,:,i))
%  endfor
%movie("close","test.mp4",24); close;
%

##-----------------en nacin 
%out_dir = "temp_img";
%mkdir (out_dir);
%for i=1:size(newImg,3)
%    fname = fullfile (out_dir, sprintf ("img%03i.png", i));
%  imwrite (newImg(:,:,i),fname);
%endfor
%cmd = sprintf ("ffmpeg -framerate 25 -i ./%s/img%%03i.png -vf scale=1080:-1 Example1.mp4", out_dir)
%system (cmd)


#--------------drugo
%index1=1+125+87
%index2=1 +87
%mad(prvi.podvzorcene_slike(:,:,index1),drugi.podvzorcene_slike(:,:,index2))
%subplot (2, 1, 1)
%imshow(prvi.podvzorcene_slike(:,:,index1))
%subplot (2, 1, 2)
%imshow(drugi.podvzorcene_slike(:,:,index2))
%drawnow(); 
graphics_toolkit("qt")
endfunction
%>> subplot(2,1,1);imagesc(newimg(:,:,3));subplot(2,1,2);plot(vektor(2))
%>> subplot(2,1,1);colormap("gray");imagesc(newimg(:,:,3));subplot(2,1,2);plot(vektor(2))