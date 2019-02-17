
function ret =  najdi(a,b)

#vektorji
#vect_mad md podvzorcene_pot
[mad_a, podvzorcene_slike, pot_do_video_posnetka_a]= generacija (a)
[mad_b, podvzorcene_slike, pot_do_video_posnetka_b]= generacija (b)
%ena= prvi{1,1};
%dva=drugi{1,1};
%cl = class(ena)
%printf(cl)
[seznam_tau prvivektor drugivektor]  = korelacija(mad_a,mad_b,pot_do_video_posnetka_a,pot_do_video_posnetka_b);

# sprejme: seznam tauov. 2x direktorij do slik. (spremenit mogoce da bere direkt iz videja. )
endfunction
%clear -a
%%
%a = 2


