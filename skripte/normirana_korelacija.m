function [korelacija_rezultat prvi drugi] = normirana_korelacija(A,B)

#obracamo
if length(A.vektor_sprememb) >= length(B.vektor_sprememb)
drugi = A;
prvi = B;
else
prvi = A;
drugi = B;
endif

#oznacimo in damo v korelacijo
prvi.prvi=true;
drugi.prvi=false;

korelacija_rezultat = normxcorr2 (prvi.vektor_sprememb,drugi.vektor_sprememb);

#pošljemo nazaj v pravem zaporedju
end 

