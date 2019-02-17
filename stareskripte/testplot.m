%vect = load('/home/arun/Desktop/videoti/vect_mse.mat','vect');
%#matvid = load("/home/arun/Desktop/videoti/video.mat"); #drugi path za testirat
%
%#dostopamo do shranjene spremenljivke
%vect =vect.vect;
%vect;
%plot(vect )

%
%list = readdir("/home/arun/Desktop/videoti/izrezani/vektorji");
%list
%for i = 3:numel(list)
%  i
%  subplot(4,2,i)
%   vect = load(strcat("/home/arun/Desktop/videoti/izrezani/vektorji/",list{i,1}));
%  plot(vect);
% title(list{i,1})
%end
%





clear


% 
% function s = mad(A,B)
%  r = imabsdiff(A,B);  #absolutna ralzika med dvema matrikama 
%  s = sum(sum(r)) / numel(A); #delimo z število elementov A-ja, 2xni sum 
%end
% 
% 
 
 
#get all the saved variable files and put them into a cell array 
[~,list] = system("ls /home/arun/Desktop/videoti/izrezani/vektorji |grep .mat");
list = strsplit(list,"\n");
list
for i = 1:numel(list)-1
strcat("/home/arun/Desktop/videoti/izrezani/vektorji/",list{1,i}) 

end




#attempt to put the names of the variables into another cell array, since we dont know the names 
%for i = 1:numel(list)-1
%  
%sez{i} = load( strcat("/home/arun/Desktop/videoti/izrezani/vektorji/",list{1,i}) );
% 
%end



 
#get all the saved variable files and put them into a cell array 
[~,list] = system("ls /home/arun/Desktop/videoti/izrezani/vektorji |grep .mat");
list = strsplit(list,"\n");
list

# or just  glob ('*.mat')

#attempt to put the names of the variables into another cell array, since we dont know the names 
for i = 1:numel(list)-1

#
sez{1,i}  = load( strcat("/home/arun/Desktop/videoti/izrezani/vektorji/",list{1,i}) );
#get field name of saved variable, there's only one 
tmp = fieldnames (sez{i}); 
#get the first  value of the (only) field name 
name{i} = tmp{1};
#get the value of the n-th var 
temp = load( strcat("/home/arun/Desktop/videoti/izrezani/vektorji/",list{1,i}),name{i} );
temp.(name{i})
subplot(4,2,i)
plot(temp.(name{i})) 
title( list{1,i})
#figure(1,"position",get(0,"screensize"))

end


%for i = 1:numel(list)-1
%
% 
% #sez{1,i}  = load( strcat("/home/arun/Desktop/videoti/izrezani/vektorji/",list{1,i}) );
% temp.(name{i})
% 
% end


 
 
 # try to display the vars 
% for i = 1:numel(sez)
%     subplot(4,2,i)
%     #sez{1,i}   #explodes here
% plot( sez{1,i} );
%    title(list{1,i})
%end






%sez(1)(1) # ans ={  [1,1] =    scalar structure containing the fields:      vect_mad =  Columns 1 through 12: etc.....) 
%sez(1)(1)(1) # returns the same as above. 
%sez(1,1)(1) # returns the same as above. 
%
%sez(1,1)(1).("vect_mad") # cell cannot be indexed with .
%sez(1)(1) .("vect_mad")  # cell cannot be indexed with .
%
%



 # try to display the vars 
% for i = 1:numel(sez)
%     subplot(4,2,i)
%     #sez{1,i}   #explodes here
% plot( sez{1,i}(1) );
%    title(list{1,i})
%end

%drugi_mad =  load("/home/arun/Desktop/videoti/izrezani/vektorji/drugi_vect_mad.mat ")
% drugi_msd =   load(" /home/arun/Desktop/videoti/izrezani/vektorji/drugi_vect_msd.mat")
% cel_mad =   load(" /home/arun/Desktop/videoti/izrezani/vektorji/famnit_hitripremik.mp4_vect_mad.mat")
% cel_msd =   load(" /home/arun/Desktop/videoti/izrezani/vektorji/famnit_hitripremik.mp4_vect_msd.mat")
%prvi_mad  =   load(" /home/arun/Desktop/videoti/izrezani/vektorji/prvi_mad.mat")
% prvi_msd=   load("/home/arun/Desktop/videoti/izrezani/vektorji/prvi_vect_msd.mat")
% tretji_mad =   load(" /home/arun/Desktop/videoti/izrezani/vektorji/tretji_vect_mad.mat")
% tretji_msd =   load(" /home/arun/Desktop/videoti/izrezani/vektorji/tretji_vect_msd.mat")
%

