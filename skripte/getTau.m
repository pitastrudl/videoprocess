function ret = getTau(A,B)
  
  
  
  
  
 #a je krajsi, b daljsi , kako pol ce sta obratno? al neki kaj pa ce sta enaka 
  #mogoce se ustimat da cekira argumente, da so pravilni
temp = normxcorr2 (A,B);
[tempmax tempmaxlen] = max(temp) # vrne prvi najvecji element in vrne njegovo pozicijo., amapk to treba spremenit. 
tempmaxlen
ret =  tempmaxlen -  length(A);

end

