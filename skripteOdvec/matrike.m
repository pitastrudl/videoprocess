pkg load video
pkg load image
#smo zapisaoval v matriko in pol semizdi da shranil

direktorij="/home/arun/Desktop/videoti/frames/resized/"
list = readdir(direktorij);

numelts = numel(list)-3; #st datotek, ker so druge reci v direktoriju 
saved_frames = zeros(54 ,96,numelts) ; #3D matrika init 


for i = 3:numel(list)
  
  #pot do slike
  path_to_img = strcat(direktorij,list{i,1});
  
  #to samo scale, ne resize slike na manj. 
  
  #beremo sliko
  img = imread(path_to_img);

  #zgeneriramo ime kjer ga bo zapisal
  # newimg_name = strcat(direktorij,"resized/",int2str(i),"resized.jpeg")
  #damo v gray 
 
  #stevilo pikslov 
  # numPixels = imfinfo(path_to_img).Width * imfinfo(path_to_img).Height;
  
  #get pixel value at something
  %resized(i,1)
  #dajemo v 3d matriko
  

  #slike se shranijo kot 2x2 arrayi v ta 3d array. 
   saved_frames(:,:,i) = img;
    if i == 200

      # to dela 
      #imshow( saved_frames(:,:,i), [0 255])
      
      end
  #gledamo kaj se dogaja. 
  #sum(sum(saved_frames(:,:,i)))
  
  #zapisemo
  %imwrite(resized,newimg_name);   
  
end
save("/home/arun/Desktop/videoti/frames/resized/myfile.mat","saved_frames")

#shown = saved_frames(:,:,100)
# imshow(shown)
%save(direktorij,'a1_var.mat','V1','V2');
clear imwrite
clear concat
clear resized
clear direktorij 
clear list


  %imfinfo(resized)
%  grayimg = rgb2gray(resized);
% concat = strcat(i,"gray.jpeg");
%  imwrite(grayimg,concat);
