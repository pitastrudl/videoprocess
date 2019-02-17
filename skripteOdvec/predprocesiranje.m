pkg load video
pkg load image

#PREDPROCESIRANJE
# razdelimo video v slike, zmanjsamo in damo v grayscale. koda dela trenutno

#system('ffmpeg -i /home/arun/Desktop/videoti/famnit_hitripremik.mp4 "/home/arun/Desktop/videoti/frames_test/%03d.jpg" ')

direktorij="/home/arun/Desktop/videoti/frames_test/"
list = readdir(direktorij);

numelts = numel(list)-3; #st datotek, ker so druge reci v direktoriju 
saved_frames = zeros(54 ,96,numelts) ; #3D matrika init 

#sprehajamo po datotekah. 
for i = 3:numel(list)-1
  #pot do slike
  path_to_img = strcat(direktorij,list{i,1})
  #beremo
  img = imread(path_to_img);
  #resizamo 20x manjsi, seprav na to resolucijo
  resized = imresize(img,[54 96]);
  #zgeneriramo ime kjer ga bo zapisal
  newimg_name = strcat("/home/arun/Desktop/videoti/frames_test/resized_test/",int2str(i),"resized.jpeg");
  #damo v grayscale
  resized = rgb2gray(resized);
  #zapisemo
  imwrite(resized,newimg_name);
  #shranimo v variable
  saved_frames(:,:,i-2) = resized;
  sum(sum(saved_frames(:,:,i-2)))
end
save('/home/arun/Desktop/videoti/video.mat','saved_frames');


%neuprabne reci
  %#stevilo pikslov 
  %  numPixels = imfinfo(path_to_img).Width * imfinfo(path_to_img).Height;
   %imfinfo(resized)
  %  grayimg = rgb2gray(resized);
  % concat = strcat(i,"gray.jpeg");
  %  imwrite(grayimg,concat);



clear imwrite
clear concat
clear resized
clear direktorij 
clear list
