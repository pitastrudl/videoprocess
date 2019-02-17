function s = mad(A,B)
  r = imabsdiff(A,B);  #absolutna ralzika med dvema matrikama 
  s = sum(sum(r)) / numel(A); #delimo z število elementov A-ja, 2xni sum 
end