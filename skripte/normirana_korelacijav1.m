function [korelacija_rezultat manjsi vecji] = normirana_korelacijav1(A,B)

if length(A.vektor_sprememb) >= length(B.vektor_sprememb)
vecji = A;
manjsi = B;
else
manjsi = A;
vecji = B;
endif

manjsi.vecji=false;
vecji.vecji=true;
korelacija_rezultat = normxcorr2 (manjsi.vektor_sprememb,vecji.vektor_sprememb);
end 
