pkg load image

korel = normxcorr2(vect_mad,dbwe);
figure(1, 'position',[100,100,800,480]);
plot(korel)
ylabel("normalizirane vrednosti","fontsize", 20)
xlabel("mesto korelacije","fontsize", 20)

#mad fgh 
figure(1, 'position',[100,100,800,480]);
plot(vect_mad)
ylabel("moč razlike","fontsize", 20)
xlabel("razlika med sličico in njenim predhodnikom","fontsize", 20)

#korelacija mad fgh dge
figure(1, 'position',[100,100,800,480]);
plot(xkorel)
ylabel("normalizirane vrednosti","fontsize", 20)
xlabel("mesto korelacije","fontsize", 20)

#abc mad 
figure(1, 'position',[100,100,800,480]);
plot(vect_mad)
ylabel("moč razlike","fontsize", 20)
xlabel("razlika med sličico in njenim predhodnikom","fontsize", 20)

#fghdge korel vrthovi
figure(1, 'position',[100,100,800,480]);
plot(xkorel)
ylabel("normalizirane vrednosti","fontsize", 20)
xlabel("mesto korelacije","fontsize", 20)


#shows


graphics_toolkit("gnuplot")
subplot(1,2,1);
 imshow(manjsilist(:,:,63),[0 255])
 xlabel("manjsi posnetek","fontsize", 20)
subplot(1,2,2);
 imshow(vecjilist(:,:,303),[0 255])
 xlabel("vecji posnetek","fontsize", 20)
 
