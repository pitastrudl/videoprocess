
function zamik =  najdi(a,b)

#vektorji
#vect_mad md podvzorcene_pot
prvi_videoposnetek = posnetek(a)
%drugi_videoposnetek = posnetek("cutsample.mp4")
%drugi_videoposnetek = posnetek("drugisample.mp4")
drugi_videoposnetek = posnetek(b)
%ena= prvi{1,1};
%dva=drugi{1,1};
%cl = class(ena)
%printf(cl)

[drugi_videoposnetek.vektor_sprememb, drugi_videoposnetek.podvzorcene_slike, drugi_videoposnetek.pot_do_posnetka]= generacija (drugi_videoposnetek.datoteka); #125cutsam
[prvi_videoposnetek.vektor_sprememb, prvi_videoposnetek.podvzorcene_slike, prvi_videoposnetek.pot_do_posnetka]= generacija (prvi_videoposnetek.datoteka); # 337


[b seznam prvi drugi]= korelacija_v1(drugi_videoposnetek,prvi_videoposnetek);
[vsivektorji,zamik] =najdi_ujemanja(seznam,prvi,drugi);

# sprejme: seznam tauov. 2x direktorij do slik. (spremenit mogoce da bere direkt iz videja. )
endfunction
%clear -a
%%
%a = 2


