

# Koda

{.octave include=/home/arun/videoprocess/skripte/korelacija.m}

Imamo tri primere videjev. Ta glavni je sample.mp4, zraven so še napisani pravilno izračunani zamiki. Če se vzame sample.mp4 in zamakne za omenjen zamik, dobimo istoležne slike. , drugi trije so:

- cutsample.mp4 zamik 100
- drugisample.mp4 zamik 275
- tretjisample.mp4 zamik 150

Testiranje.m se uporablja za testiranje, najdi.m je pa glavno vozlišče kode, notri damo dva video posnetka in nam vrne zamik. V planu je narediti malo lepšo prezentacijo zamika oziroma rezultata. 

## Posnetek.m

To je naš struct, je bila ustvarjena posebi funkcija/struct, katera bo hranila vse podatke o našem video posnetku. Struct se podaja skozi celotni proces in se dopolnjuje. 

```{.octave include=/home/arun/videoprocess/skripte/posnetek.m .numberLines}

```



## Generacija.m 

Prvi postanek, v začetku nastavimo par parametrov in spremenljivk. V naslednem while loopu beremo video in ga pretvarjamo sproti. Nato zračunamo vektor sprememb in nakoncu dodamo parametre v naš struct. Sprejme path do videa in vrne naš struct.

```{.octave include=/home/arun/videoprocess/skripte/generacija.m .numberLines}

```



## Korelacija.m

Sprejme posnetka, vrne vektor korelacije, seznam tau-ov,  in dopolnjene posnetke. Prvo kliče našo funkcijo za normirano korelacijo, ki smo jo ustvarili sami, zato ker funkcija zahteva argumente v določenem vrstnem redu. Vektor korelacije zgladimo z gaussovim filtrom z skalrjem vrednosti 30. Nato izločimo vse vrednosti ki so nad 0.6 in tako dobimo možne vrhove. Vrednost 0.6 je variabilna, nebi smela biti fiksna, mogoče jo lahko damo kot parameter funckije. 



```{.octave include=/home/arun/videoprocess/skripte/korelacija.m .numberLines}

```



## Normirana_korelacija.m

Obracamo vektorje tako, da imamo manjsi/vecji, ker tako sprejme arguemnte normxcorr2. 

```{.octave include=/home/arun/videoprocess/skripte/normirana_korelacija.m .numberLines}

```

## Najdi_ujemanja.m

Spet rabimo najsi/vecji. To zaradi računanja zamikov. Tau dobimo tako da odštejemo tau iz seznama vrhov od korelacije , dolzino manjsega vektorja sprememb. nato za en določen zamik naredimo MAD in nato pogledamo če je maksimalna vrednost večja od nekega tresholda ki ga sami določimo, če je, to velja za zamik ki je lahko uporabljen. 

```{.octave include=/home/arun/videoprocess/skripte/najdi_ujemanja.m .numberLines}

```



