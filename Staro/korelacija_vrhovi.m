pkg load signal
pkg load image
#clear -a 






#za nromirano korelacijo 
function  [manjsi,vecji]= bigger(A,B)
    if length(A) >= length(B)
      manjsi = B;
      vecji = A;
    else
      manjsi = A;
      vecji = B;
    end
end


function ret = getList(dir)
  ret= glob(strcat(dir,"*.jpg"));
    #returns cell array of paths 
end 



function ret = dir2mat(dir)
  templist = glob(strcat(dir,"*.jpeg"));
  templist = sort_nat(templist) ;

  tempIm = imread(templist{1,1});
  tempArray = zeros(rows(tempIm),   columns(tempIm)  ,numel(templist) );
  
  for i=1:numel(templist)
    tempIm = imread(templist{i,1});
    tempArray(:,:,i) = tempIm;
   end
   ret = tempArray;
 end


#%%%%%%%%%%%%%%%%%%%%#

 load("/home/arun/Desktop/videoti/abc/abc_vect_mad.mat","vect_mad").vect_mad; #krajsi

 dbe = load("/home/arun/Desktop/videoti/dbe/dbe_vect_mad.mat","vect_mad").vect_mad;

 fgh =load("/home/arun/Desktop/videoti/fgh/fgh_vect_mad.mat","vect_mad").vect_mad; #krajsi

 load("/home/arun/Desktop/videoti/dge/dge_vect_mad.mat","vect_mad").vect_mad;


%prvi = load("/home/arun/Desktop/videoti/compressed/compressed_vect_msd.mat","vect_msd").vect_msd;
%drugi =  load("/home/arun/Desktop/videoti/konkat/konkat.mp4_vect_msd.mat","vect_msd").vect_msd;
%dir1 = dir2mat("/home/arun/Desktop/videoti/compressed/resized/");
%dir2 = dir2mat("/home/arun/Desktop/videoti/konkat/resized/");
%


%prvi =load("/home/arun/Desktop/videoti/fgh/fgh_vect_mad.mat","vect_mad").vect_mad;
%drugi = load("/home/arun/Desktop/videoti/dge/dge_vect_mad.mat","vect_mad").vect_mad;
prvi=fgh;
drugi=dbe;

dir1 = dir2mat("/home/arun/Desktop/videoti/fgh/resized/");
dir2 = dir2mat("/home/arun/Desktop/videoti/dbe/resized/");


xkorel = normxcorr2 (prvi,drugi);
korelbak = xkorel;





#dobivamo vrhove MAD. 



#std vs std 
xkorel(end+5)=0;  #kaj pa zacetek , ce je korelacija na zacetku 
for i = 1:numel(xkorel)-5
      % if ( xkorel(i)-mean(xkorel(i:i+5)) < std(xkorel(i:i+5)))
      
        if ( std(xkorel(i:i+5)) < std(xkorel) )
      xkorel(i) = 0;
    end 
    
    #manjse od 0 nas ne znaimajo.....
    if xkorel(i) < 0 
         xkorel(i) = 0;
        end 
%    if xkorel(i) < 0
%      xkorel(i) *= -1;
%      end
end




%#prejsna metoda, z pragom 
%korelmean = mean(xkorel)
%korelstd = std(xkorel)
%prag = 2
%for i = 1:numel(xkorel)
%    if i <= 0
%      xkorel(i)=0; #ali je to vredu? glede na to da so nekatere vrednosti negativne, pri mad je bilo -0.02
%     elseif (xkorel(i) < prag*korelstd)
%      xkorel(i) = 0;
%    end
%end



#iskanje vrhov preostalih , vbistvu nebi rabil.....
[vrednosti vrhovi] = findpeaks(xkorel) 
numel(vrednosti)
numel(vrhovi)
taus = [];

#delamo taue 
for i= 1:numel(vrhovi)
   [manjsi ,vecji] = bigger(prvi,drugi);
  tau =  vrhovi(i) -  length(manjsi);
   taus(i) = tau;
end
taus

# ODKOMENTIRAJ POL
  subplot(2,1,1);
plot(xkorel); 
  subplot(2,1,2)
plot(korelbak); 



[manjsi, vecji]= bigger(prvi,drugi); #tistedva za primerjat 
#naloudat slike------------------------------------------------------------

%save("skompresiran.mat","dir1")
%save("oriignalkat.mat","dir2")

[manjsilist vecjilist] = bigger(dir1,dir2);
"zacenjam" 
length(dir1)
length(dir2)


foundtau=NaN;
"loop"
# preverjanje slik. 
for i =1:length(taus)

      
  if taus(i) < 0 
    abstau = abs(taus(i))
    
        for j=abstau:length(manjsilist)
          A = (manjsilist(:,:,j));
          B=  (vecjilist(:,:,j-abstau+1));
          imgdiff = imabsdiff( A, B );  
          
          if sum(sum(imgdiff)) == 0  #se lahko zgodi tudi samo ce sta mogoce bela obadva. 
            imgdiff
            j
            foundtau= taus(i);
            break 
          endif
          
        endfor
        
      else #-------------------------
        
         for j=1:length(manjsilist)
             if j+taus(i) > length(vecjilist)
               break
             end
            A = (manjsilist(:,:,j)) ; #+1 da ni out of bounds
            B=  (vecjilist(:,:,j+taus(i))); 
            imgdiff = imabsdiff( A, B );  
             if sum(sum(imgdiff)) == 0  #se lahko zgodi tudi samo ce sta mogoce bela obadva. 
              imgdiff
              j
              foundtau= taus(i);
              break 
            end
          endfor
        endif
endfor
  "taus"
foundtau
        

        
break
  
      








%valuesfrompastebin( abs(valuesfrompastebin-mean(valuesfrompastebin)) < 4*std(valuesfrompastebin) ) = 0;



%# funkcija za dobit frame, in jih dat v 3D matrko, ne dela, premal rama. 
%function ret = getFrames(dir)
%  templist = glob(strcat(dir,"*.jpg"));
%   rows= rows(imread(strcat(templist{1,1})));
%    colls= columns(imread(strcat(templist{1,1})));
%    
%    # ret = zeros(rows,colls,numel(templist) );
%    
%    for i=1:numel(templist)
%      ret(:,:,i) = rgb2gray(imread(templist{i,1}));
%    end 
%    
%end 





