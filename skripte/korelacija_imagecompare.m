pkg load signal
pkg load image
clear -a 

#%%%%%%%%%%%%%%%%%%%%#

abc_mad = load("/home/arun/Desktop/videoti/abc/abc_vect_mad.mat","vect_mad").vect_mad;
abc_msd = load("/home/arun/Desktop/videoti/abc/abc_vect_msd.mat","vect_msd").vect_msd;

dbe_mad = load("/home/arun/Desktop/videoti/dbe/dbe_vect_mad.mat","vect_mad").vect_mad;
dbe_msd = load("/home/arun/Desktop/videoti/dbe/dbe_vect_msd.mat","vect_msd").vect_msd;

xkorel = normxcorr2 (abc_mad,dbe_mad);
xkorel2 = normxcorr2 (abc_msd,dbe_msd);

#za peake 
[a b ] = max(xkorel)
[a b ] = max(xkorel2)

subplot(3,1,1);
plot(xkorel); 
title("mad xcorr");

subplot(3,1,2)
plot(xkorel2); 
title("msd xcorr");

subplot(3,1,3)
plot(abs(xkorel))
title("msd xcorr");



%tau = getTau(abc_mad,dbe_mad)

%tt2 = imabsdiff(prvitest_vect_mad(180),konkat_vect_mad(390))  #absolutna ralzika med dvema matrikama 

%
%plot(tt2)
%[a b ] = min(tt2)
%






#dobivamo vrhove MAD. 
korelbak = xkorel;
korelmean = mean(xkorel)
korelstd = std(xkorel)
prag = 2
for i = 1:numel(xkorel)
    if i <= 0
      xkorel(i)=0; #ali je to vredu? glede na to da so nekatere vrednosti negativne, pri mad je bilo -0.02
     elseif (xkorel(i) < prag*korelstd)
      xkorel(i) = 0;
    end
end
[vrednosti vrhovi] = findpeaks(xkorel);


break 
#naloudat slike
dirabc = "/home/arun/Desktop/videoti/abc/slike/";
currdir = pwd; 
cd(dirabc);
listabc = glob("*.jpg")
cd(currdir)

dirdbe = "/home/arun/Desktop/videoti/abc/slike/";
currdir = pwd; 
cd(dirdbe);
listdbe = glob("*.jpg")
cd(currdir)

#za tau 
[tempmax tempmaxlen] = max(temp);
tempmaxlen
ret =  tempmaxlen -  length(A);



for i = 1:numel(vrhovi) #za vsak vrh
    vrhovi(i) = getTau()
    k= -5
    for j = -5:5
       # tukaj dat if da ce je out of bounds, v rpimeru da je koralcija na robovih
       
       A = strcat(dirabc,listabc(temptau ,1));
       r = imabsdiff(A,B);
      
      
      
    
        k = k+1;
    end
end




%valuesfrompastebin( abs(valuesfrompastebin-mean(valuesfrompastebin)) < 4*std(valuesfrompastebin) ) = 0;