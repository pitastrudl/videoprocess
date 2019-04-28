function ret = msd(A,B)
ret = sum((A(:)-B(:)).^2)/numel(A) 
endfunction