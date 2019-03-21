function primerjanje_slik (prvi_posnetek, drugi_posnetek,zamik)
  
  if(zamik < 0)
  zamik=zamik*-1;
endif

subplot (2, 1, 1)
imshow(prvi_posnetek.podvzorcene_slike(:,:,zamik))
subplot (2, 1, 2)
imshow(drugi_posnetek.podvzorcene_slike(:,:,1))
pause(0.41667)

endfunction
