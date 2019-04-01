function rezanje (video,zacetek,dolzina,outputfajl)
  #video string, zacetek je v sekundah kdaj se zacne rez, dolzina je v sekundah koliko odreze, outputfajl je string, outputa
system(["ffmpeg -i " '' video ' ' "-ss" ' ' int2str(zacetek) ' ' "-strict -2 -t" ' ' int2str(dolzina) ' ' outputfajl ])

endfunction
