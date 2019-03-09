function primerjanje_slik (prvi_posnetek, drugi_posnetek,zamik)

  for j = 1:length(zamik) figure(1)
    
        if(prvi_posnetek.vecji == false )
          manjsivektor = prvi_posnetek;
          vecjivektor = drugi_posnetek;
        else
          manjsivektor = drugi_posnetek;
          vecjivektor = prvi_posnetek;
        endif

title("video 1")
imshow(video1(:,:,1))
figure(2)
title("video 2 + zamik")
imshow(video2(:,:,1+zamik)) primerjalni_vektor(j)= mad( vecjivektor.vektor_sprememb(tau+j) , manjsivektor.vektor_sprememb(j) );
        endfor






endfunction
