function obseg_ujemanja =  najdi(a,b,meja,stevilo_ujemanj)
#dobimo oba videa kot stringa, mora biti video v istem direktoriju , drugace pa navedi absolutni path.
if (exist("meja", "var") != 1)
meja = 0.5;
printf("  ni bil nastiman meja, default='%d' \n",meja)
endif

if (exist("stevilo_ujemanj", "var") != 1)
stevilo_ujemanj = 10;
printf("  ni bil nastiman stevilo_ujemanj, default='%d' \n",stevilo_ujemanj)
endif


#kreacija structov ,generacija podatkov 
prvi_videoposnetek = predprocesiranje(a);
drugi_videoposnetek = predprocesiranje(b);

#korelacija 
[b seznam prvi drugi]= iskanje_kandidatov(drugi_videoposnetek,prvi_videoposnetek,meja);

#iskanje moznih zamikov
[vsivektorji,zamik,obseg_ujemanja] =iskanje_ujemanj(seznam,prvi,drugi,meja,stevilo_ujemanj);


endfunction

