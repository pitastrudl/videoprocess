function [korelacija_rezultat manjsi vecji] = normirana_korelacija(A,B)

#obracamo
if length(A.vektor_sprememb) >= length(B.vektor_sprememb)
vecji = A;
manjsi = B;
else
manjsi = A;
vecji = B;
endif

#oznacimo in damo v korelacijo
manjsi.vecji=false;
vecji.vecji=true;
korelacija_rezultat = normxcorr2 (manjsi.vektor_sprememb,vecji.vektor_sprememb);
end 