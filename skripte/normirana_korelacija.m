function [korelacija_rezultat manjsi vecji] = normirana_korelacija(A,B)

if length(A{1}) >= length(B{1})
vecji = A;
manjsi = B;
else
manjsi = A;
vecji = B;
endif

manjsi{3}="manjsi";
vecji{3}="vecji";
korelacija_rezultat = normxcorr2 (manjsi{1},vecji{1});
end 
