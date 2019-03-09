%datoteke = glob ('*.mat');
%n = numel (datoteke);
%data = cell (n, 1);
%for i = 1:n
%  tmp = load (datoteke{i});
%  if (numfields (tmp) != 1)
%    error ("...");
%  endif
%  data{i} = tmp.(fieldnames (tmp){1});
%  data{i}
%endfor

#dobimo seznam *.mat daottek v trenutnem direktoriju 
datoteke = glob ('*.mat');
#stevilo datotek 
n = numel (datoteke);
#naredimo nx1 cell array 
data = cell (n, 1);
n
#najdemo vsep odatke 
for i = 1:n
  #nalozimo datoteko 
  tmp = load (datoteke{i});
  #ce je stevilo spremenljivk razlicno od ena se konca. 
  if (numfields (tmp) != 1)
    error ("...");
  endif
  
  data{i} = tmp.(fieldnames (tmp){1});
  data{i}

  
  h = figure;
set (h,'papertype', '<custom>')
set (h,'paperunits','inches');
set (h,'papersize',[3 2.5])
set (h,'paperposition', [0,0,[3 2.5]])
set (h,'defaultaxesposition', [0.15, 0.15, 0.75, 0.75])
set (0,'defaultaxesfontsize', 14)
  subplot(4,2,i)
plot(data{i}) 
title(datoteke{i})
endfor




