function rezanje (video,zacetek,dolzina,outputfajl)
system(["ffmpeg -i " '' video ' ' "-ss" ' ' int2str(zacetek) ' ' "-strict -2 -t" ' ' int2str(dolzina) ' ' outputfajl ])
endfunction

#2107842