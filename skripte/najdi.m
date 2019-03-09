
function zamik =  najdi(a,b)
#dobimo oba videa kot stringa, mora biti video v istem direktoriju , drugace pa navedi absolutni path.

#kreacija structov ,generacija podatkov 
prvi_videoposnetek = generacija(a);
drugi_videoposnetek = generacija(b);

#korelacija 
[b seznam prvi drugi]= korelacija(drugi_videoposnetek,prvi_videoposnetek);

#iskanje moznih zamikov
[vsivektorji,zamik] =najdi_ujemanja(seznam,prvi,drugi);

endfunction
