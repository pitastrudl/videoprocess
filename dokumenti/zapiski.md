# Todo

- Abstract na KONCU vsega popravit
- -prebrat od brankota slajdi za diplomsko

## Maybe todo

- Mogoče nekakšno tabelo narediti, za določanje praga in mogoče tudi od odvisnosti od videov? [RAJE NE]
- ~~mexopencv pogledat~~ 

# Vprasanja in Zapiski

- Ko se navede pakete ki so se uporabljali, potem dam v footnote? Pri pripravi okolja. 
  - Ne v ootnote, dajat glavne, imabsdiff dat ven footnote, Footnote cim manj uporabljat. Raje dat v reference in vire. 
- Enotne besede:
  - Segmenti
- če hočem angleško al zamenam mentorja al pa notar
- lslistninge treba dodat oznake figur...da se lahko referenciras na njih.

## Vprasanja

- Mad za image compare?
  - avg(abs(a-b)(:)), ---____---- prag npr 
- Problem z video paketom omenit.
  - opencv.
- Zamenjava videjev, kako je lahko problem?  Paziti je treba kje je ničla?
  -  (dolzino prvega odstet. ) 
  - A+2(B-1) to je, ker se lahko b ujema cist na koncu in cist na zacetku za eno slicico. 
- 101 ? in zkaja je en 338
  - 
- Enkrat je bilo omenjeno, da bi dali 30x30, razlog? Da je bolj uniformo?
- Če imamo video A,B,C in je video B sestavljen iz A in C, polovicno. Koliko se to potem kolerira oziroma kkao zgleda potem to v najdi_ujemanja.m. Treba zrezat novega. 







## Zapiski 

### Stvari za v kodo

- Videote poimenovati konsistentno v **metodologiji**, lahko so ABC itd. 

- seprav za celotno procesiranje, damo neko funkcijo. recimo find.m in damo notr video a in video b. 

- ~~Naredit pol glavno funkcijo, find.m.....~~

- ~~ffmpeg zapisavat sam ostevilke, brez leading ničel in isto za podvzorčeno~~

- ~~Podvzorcene slike lahko hranim v spremenljivkah in passam naprej, da se izognem prevelki zmedi.~~ 

  

~~Funkcije poenostavit in dati vsako v svojo datoteko, in se jo lahko kliče direkt. Je bolj modularna koda in jo je lažje predstavit.~~ 

#### mexopencv 

install libopencv-dev , 



libgstreamer-plugins-base1.0-dev gstreamer error .

v .octaverc dodat: 

```octave
cd('~/cv/mexopencv')
addpath('~/cv/mexopencv')
addpath('~/cv/mexopencv/opencv_contrib')
addpath('~/cv/mexopencv/+cv/private')                 % HACK
addpath('~/cv/mexopencv/opencv_contrib/+cv/private')  % HACK
```



#### vrhovi koda

[manjsi vecji] = bigger(A,B)

ret = getList(dir)

ret = dir2mat(dir)

[vrednosti vrhovi] = findpeaks(xkorel) 



**dbe, fgh** 

**prvi**=fgh;
**drugi**=dbe;

**dir1** = dir2mat("/home/arun/Desktop/videoti/fgh/resized/");
**dir2** = dir2mat("/home/arun/Desktop/videoti/dbe/resized/");

**xkorel** = normxcorr2 (prvi,drugi);



### Drugo

Lahko rečemo, da se za iskanje razlik uporablja MAD, lahko omenimo obe, MAD in MSD. MAD naj bi bil boljsi, MSD zazna večje razlike. Večje razlike ti več pomenijo.  

Za razlike uporablamo lahko MAD. Lahko obe omenimo v **pregledu** in eno uporabimo. Mad naj bi bil boljši, MSD pa večje razlike bolj poudari. Večje razlike več pomenijo. Pri MAD je lahko problem, da ti SUM naredi veliko razliko, in če je šum manjši od signala sprememb, potem bo šum recimo ....če je sum večji kot so zaporedne razlike med slikamo, bo to delalo tezave, in te razlike dosti pomenijo. te male spremembe dajo enako teze kot velike stvari. malo spremembe lahko zadusi, ker nisp omembnoe, mad bo pa večje spremembe enakovredno uravnotezil, zato bo msd problem ker ce bo v signalu spremmebn šum večji kot razlike med zaporednimi slikami.

- priprava okolja ni tolk pomembna. samo navedba paketov kako se uporablja.
- Namesto konkateniranja uporabit zdruzevanje. Cim bolj slovenske izraze. 
- Za podvzorcenost pokazem da ni razlike ce podvzorcim 4:3 na 16:9 format ali pa 16:9, na istem videju 16:9. 
- ~~%[dd asd] = system("ls -a | grep jpeg |  sort -V")~~
  - ~~%strsplit(asd(1:end-1),"\n")  branje filenamov, in pol dat v cel array imena, kr uporabno.~~  
- PASSAT IME VIDEJEV DO KONCA, DA SE VE KATERI JE KATERI.

### Zapiski novi sestanek november

Glede kodirnikov

razlicni pojavi bojo v prehodih, in na slikah bo razlicen sum in vse drugo, kar je posledica razlicnih kompresij med mkv, avi itd. Vzame se dva videa in se pri merja. eden je original in drugi je skompresiran.  Al pa recimo   original video vs manjsa locljivost, ali pa manjsa locljivost v vecji locjljivosti. Ni smiselno vsega preverjat, testirat je kljucnio kvaliteto pa locljivost. Lahko tudi vcasih vzames kodirnik in spremenis parametre. 

Za kodirnike, ce so kake spremmebe med njimi, je dobro omenit tudi. To omenim v zgradbi oz osnovah video zpaisa posnetkov...

### Kasneje mogoce

- ~~Naredit kodo da bo bolj streamlined, bolj v ramu ble stvari.~~ 
- premislek: recimo nabor. se lahko naredi skripto.  



# Moja vprasanja - odgovori 

Standardna deviacija celotnega videa in potem se uporabi okno, recmo 10ih vrednosti in potem se uporabi std lokalnega in se gleda ce je lokalna manjsa, potem se da ničlo. ne smes overwritat, samo daš v posebi vektor! rezultat je vektor kandidatov zamikov.

10% prekrivanje videjev pomeni korelacija 0.1, pomeni da je to izhodišče. Rečemo v tem primeru da se prekriva 10% signala..je nek trade-off.  Mogoče bomo imel iveč primerjav ampak bo potem bolj ziher, mogoče narediti neko tabelo primerjav?. 

Potrebno je razložiti, zakaj je ta konstanta, oziroma prag za določevanje videjev primeren, mogoče z testiranjem. Če uporabimo neko vgrajeno funckijo, ni treba preveč opisaovati. 

Ta signal je posledica korelacije ki sta koliko velika. 600 pa 360... (random iz naloge ima veze)

recimo ce imamo kolo, ki se vrti, se lahko prekriva. ta video se med sabo ujema. je dost ujemanja. pustit zaenkrat. 

Od Roglja za iskat zamike, išče signale kateri so dosti razlicni kot v okolici. S tistim ko filtriraš signal v okolici, bo standardna deviacija manjša, zgladi signal .Zmanjšalo bo standardno deviacijo in nas zanima koliko odstopa vrednost, sfiltriraš z nekim širokim filtrom?

naj bi drugače plottal? ta x kaj pomeni podatek v spremenljivki? 

naredit da signala ni manjsi vecji. ??

problem je da če imaš dva signala 0, potem sta lahko dva kolrelirana več?? zato na roboih dobis , mal prevec v detajlih. 

**tezko rect zakaj bi primerjal lokalno std z globalno?** 

Primerjanje z Hashi deluje vbistvu samo z duplikati, če gledamo naprimer md5. 

Mogoče v premislek dodati, zakaj nebi delovala oziroma kako bi delovala pri drugih transformacijah. 

Glede imena naloge, duplikat je lahko tudi cel video, če je vsebovan v drugem video posnetku. 

96x56 je mogoce se vedno kr dost velka resolucija. lahko je tudi manjse, veliko manjse. omenit tukaj, da je samo fiknsa za 16:9, lahko se tudi naredi za 4:3. 

Če imamo video A in video B, A je 4:3 razmerje in B je 16:9. Nacini kako bi lahko to primerjali je, da se poreže na straneh recimo in pol primerja. Lahko bi omenili da so takšne situacije, ampak se s tem nebi ukvarjali.  Če pa spreminjaš iz 4:3 v 16:9 ali obratno, je pa MOGOČE vredu, vseeno primerjamo med sabo.

Je bilo omenjeno, da bi dali slike na enake dimenzije? Naprimer 30x30...Zakaj?

Razmislek, razlicne locljivosti so tudi problem, ali pa recimo da je samo v centru, ali samo del videa, lahko se pa tudi uporabi v predstavitvi...

Ali je pomembno kam se shranjujejo datoteke? zaenkrat se vse generira tam kjer so video posnetki.  Uporabljamo FFMPEG zaradi problemov v AVIread. 

Ker ne dela AVIread, ne moremo direktno shranjevati brez da pišemo v disk. 

Izboljšal sem myxcorr2, sem naredil svojo funkcijo, povedat zakaj. Če se obrača vektorje pri normirana_korelacija, je potem tudi treba rezultat obračat? Paziti je treba kje je ničla? 

Problem pri primerjanju slik je, da če je samo absolutna razlika, abs= 0, potem če so slike čist bele se tudi ujema. Mogoče bo 0 tudi različno zaradi različnega kodiranja. Dobor je potem imeti kakšno povprečno razliko. Moramo nekakšen prag določit. To lahko naredimo z enim prakticnim primerom, vzamemo en video posnetek, ki je zelo močno enkodiran in slabše kvalitete in vidimo koliko se sličice med sabo razlikujejo. Nek maksimalen MAD vrednost, ali absolutna razlika med njivomimi mad vrednsotmi??

Signal korelacije lahko oznacim vertikalne crte ali pa samo krizce tam kjer je ta signal, Lahk tudi v originalnem signalu oznacim kandidate. To niso lokalni maksimumi ampak kandidati. 

Dobro bi bilo, da se pogleda, koliko časa se sličice ujemajo. Sepravi da se vidi če je res cel segment videja notri.  Tist random razmislek nima veze...34, ga lahk ven vržem. 

rotacija, ni glih primerno...oziroma ni neki prakticnega primera. 

vsebinske transofmracije, meh. fps---smieslno razsirit ampak ni treba delat tega trenutno.

35...footnote razen če resn i treba. 



----how to code explain in thesis???

- ce se zamenjata videja potem: rogl: moras naredit prvo imas indekse neke psremneljivke ,ce imas spremenlivko ki je taka pa taka ane se zacne z tuki z 1 elemnt in nti element? gledas vektor od n -1 do 1 in povej mi spremenljivko A od vrednosti n. samo reverse naredim?? flip left/flip right metode??   

-----



~~v prakt impl reces pa da reces, da zmecemo ven tiste k jih nerabmo z finddpeaks. ni treba findpeaks ce imam vse kar je drugo z nic.....wtf delam js. treba probat findpeaks vseeno.~~ 

~~nek error sm dubu, ker normxcorr2 ne mara ce je en vecji od druge al kako ze....svojo normirano korelacijo naredit~~ (omenit to )

~~ce mamo neki pod nicle, bo najdu peaka tudi minimum peake, in to ni. ostanem pr svoji metodi in namesto findpeaks pac uporaibm find, kjer sem uporabu std lokalni.~~

~~definiranje poti, ni tolk pomembno verjetno. pathi v diplomski, je samo neka stvar, nima veze toliko. funckije morajo biti neodvisno. ena skripta centralna, in metoda, da kot parameter dobi stvari al pa neko gloalno spremenjivke...~~



## Stackoverflow

Another Option is
calulating your threshold dynamicly, for exsample by calulating the
mean `m`and the standard deviation `sigma``
`and setting a threshold by only counting peaks that are
`n*sigma`` `above
`m`.



### Drugo

Nato uporabimo Gaussovo konvolucijo s katero "zameglimo" sliko oziroma zgladimo visoke frekvence (katere bi mogoče preveč vplivale na MSE?). Gaussov filter je "low pass" filter, ki zgladi sliko, objekti nimajo več ostrih robov. Z velikostjo standardne deviacije v gaussovem filtru lahko kontroliramo, kako močno izločamo detajle. Večje glajenje pomeni da imamo tudi nižje frekvence.  Kot na slikah z konvolucijo, lahko vidimo rezultat na frekvencah pojavitev pikslov.  Gaussova konvolucija nam "zgladi/zamegli" sliko s katero odstranimo ostre prehode med območji v sliki. Potem naš histogram te slike tudi izgleda bolj umirjen brez velikih in ostrih prehodov. 

Tukaj lahko še povemo o efektivni implementaciji gaussovem filtru, ker naj bi bile matrike razdeljive, lahko prvo naredimo horizontalno in potem navpično, kar nam prihrani na številu operacij. vir

### Insert

	mogoce za neko metodo al neki 

Nato uporabimo Gaussovo konvolucijo s katero "zameglimo" sliko oziroma zgladimo visoke frekvence (katere bi mogoče preveč vplivale na MSE?). Gaussov filter je "low pass" filter, ki zgladi sliko, objekti nimajo več ostrih robov. Z velikostjo standardne deviacije v gaussovem filtru lahko kontroliramo, kako močno izločamo detajle. Večje glajenje pomeni da imamo tudi nižje frekvence.  Kot na slikah z konvolucijo, lahko vidimo rezultat na frekvencah pojavitev pikslov.  Gaussova konvolucija nam "zgladi/zamegli" sliko s katero odstranimo ostre prehode med območji v sliki. Potem naš histogram te slike tudi izgleda bolj umirjen brez velikih in ostrih prehodov. 
​	
​	Tukaj lahko še povemo o efektivni implementaciji gaussovem filtru, ker naj bi bile matrike razdeljive, lahko prvo naredimo horizontalno in potem navpično, kar nam prihrani na številu operacij. vir

linki 
​	https://octave.sourceforge.io/video/overview.html
​	

	3. Združiš procesiranje z zunanjimi knjižnicami in to izvedeš z mex programi (c koda in prevajanje v Octave), nekoliko zahtevneje.
	4. za branje in/ali pisanje video datotek uporabiš OpenCV vmesnik, ki je lahko uporabljen tudi v okolju Matlab/Octave, preko vmesnikov, med katerimi predlagam mexOpenCV: https://github.com/kyamagu/mexopencv, glej ukaze VideoCapture(), VideoWriter().


​	
​	https://octave.sourceforge.io/signal/function/xcorr.html
​	https://octave.sourceforge.io/image/function/normxcorr2.html

https://en.wikipedia.org/wiki/GNU_Octave

https://octave.org/doc/v4.4.0/Controlling-Subprocesses.html

https://octave.org/doc/v4.4.0/System-Utilities.html#System-Utilities

# Naloga layout

1. **uvod**

   1.1 opis problema

   1.2 pregled podrocja

   1.3 zgradba video posnetkov   (osnove zapisovanja video posnetkov )

   mogoce kaksno kodiranje, ce mi pride prav. 

2. **metodologija**

   opis primera ki se ga bo uporabilo. 

   2.1 predobdelava (primer analize )

   2.2 na nekem dolocenm tocnem primeru.  

3. **prakticna** **implemetnacija**

   3.1 programska oprema

   3.2 priprava okolja

   3.4 duplikati

   3.5 predprocesiranje

   3.6 proces analize.

4. **testiranje**
   1. dolocitev testnih primerov
   2. priprava testni podatki 
   3. testiranje
   4. Rezultati
   5. Diskusija o rezultatih

5. **zakljucek nadalnje delo**  



# Popravila za celo nalogo

Verjetno predprocesiranje gre pod testiranje, oziroma del tega. 

## Uvod

V uvodu dodati malo
bolj podroben opis problema kot podpoglavje. Pregled podrocja metod bi moral biti v uvodu tudi kot drugo podpoglavje, v kateri so omenjne metode, katere sem imel prej napisane, dct, hash. Tudi zgradbo video posnetkov damo v uvod, ker to ni povezano z programsko opremo.

### Opis problema

Pri opisu problemaje dobro da se poudari da se išče tudi kje je del enega videa
vkljucen v delu drugega videa.  Da se ne isce samo
duplikate ampak da se isce vsebovanost. 

### Pregled podrocja

Po pregledu metod, lahko se rece da niso direktno uporabne za to. Da se ne gleda po celotu ali pa kaj?

#### Pregled drugih metod

 En odstavek na metodo, odvisno od pomembnosti in povezave z področjem s katerim se ukvarjamo. 

### Zgradba video posnetkov

## Metodologija

V metodologiji bolj sistemsticno lotiti stvari. V metodologiji sproti prikazovat...na enmu primeru pokazat rezultate kakšni so rezultati. In primer analize bi bil v metodologiji, ker je tezko opisat stvar brez
primera... primer analize gre ven seveda ker se zdruzi z metodologijo.  Pri metodologiji razdelit kako se dela to predprocesiranje . To bi morala bit ena slikca, recimo kak tok procesa, nek svoj diagram. Imas dva video
posnetka, potem imas zmanjsevanje locljivosti. Temu se lahko rece tudi predobdelava. kot rezultat tega dobimo sličice na disk.  potem imamo izračun signalov sprememb.  Treba tudi pravilno poimenovati  v ideoposnetke... V metodologiji opisem za vsako od metod, na nekem primeru prakticnem.  **Uporabiti preprost primer, vsebovanost enega videa v drugem** .  V metodologiji so vbistvu samo koraki in kako sem kako kaj naredu z enavbami tudi zraven. 



msd vs mad. 
lahko bi, ko se dela to v metodologij, lahko uporabimo te dve metodi in se na osnovi obeh odlocimo katero se uporabi. ker ne vidimo samo sprememb prehodov ampak tudi spremmebe signala.

### Predobdelava (Primer analize)

Tukaj je bolj podrobno, kako se je kaj naredilo. Treba opisat še primer ki se ga uporabi za ilustracijo. Treba opisat tudi vsak signal ki se bo uporabljal.  



### Primer na nekem videu 

**signal sprememb video posnetka** lahko rečemo. potem imamo iskanje zamikov med video posnekti. potem je vektor kandidatov za zamike. potem imamo neko preverjanje če so te res pravi. v preverjanju preverimo

 \- če je zamik res ustrezen

\- določitev začetek in konec kje se ujema

če določimo začetek in konec, določimo implicinto če je ustrezen ali ne.  

temu bomo rekli iskanje obsega prekrivanja. (sličica po sličica).  

nakoncu pa imamo podatki o ujemanju. bi dal obsege zamike, ta del je podoben tistmu. a-b- == c-d-

1. Nek uvod naredi, se opise cel proces, na kratko, toliko da se ve kaj se bo delalo in kaj bo bil rezultat, nic primerjat kode. Bolje ce dam se sliko in napisem da je bil nek video kot vhod. Krakto in jedrnato. Nic ne napisat kako bo todelovalo, samo kaksen je namen in kaksen je rezultat. Ker bom vsak velik korak opisal v takem nacinu, bom potem imel tocke na katere se lahko referenciram kasneje v nalogi. Ene 2 strani bi moralo biti tega, in jasno treba poimenovati vse, ker bodo to imena naslednih podpoglavij tudi. 
2. 
3. 



#### Na nekem dolocenem primeru

## Prakticna implementacija

Prakticna implemetnacija je vreud, to bo 3.  testiranje poglavje bo recimo, smo imel prej en primer, smo si nastavlali neke konstante...kako naj bi prov della, in zdej uporaibmo nekaj vec primerov, razlicne situacije. Neke situacije druge da se stestira.  Tukaj povemo v čem smo delali. Se slkicujem na zgornje metode iz metodologije ko se razlaga kodo, ne prevec dolgo. Izgled kode v besedilu je vredu. Morajo biti enaki koraki kot pri metodlogiji ko se razlaga. Dosti graficnih prikazovanj je priporočljivo, ne prevelikih seveda. In kljucni deli kode. 

### Programska oprema

 Se naredi pregled orodij recimo ctave ffmpeg itd. 

### Priprava okolja

### Priprava podatkov (ne? že imamo poglavje o pripravi podatkov )

### Duplikati

### Predprocesiranje

Kratki primeri kode. Ne preveč obsežne kode. 

### Proces analize

## Testiranje

- pri testiranju lahko tut testiramo tk oda video prekodiramo večkrat. 
- Pri testiranju, lahko kodirnike primerjam tako, da uporabim dva videja seveda v testih, in uporabim razlicne kodirnike, mkv, mpeg....itd

nova situacija kot prej. zanimvio bi bilo ugotovi kakšen naj bo še del da se ga bo dalo zaznat. seprav ta del ki je vstavljen v drugi  del. Recimo če imamo majhen delcek, recimo par slicic in da te slicice so podobne okolju, potem je tezko najdt razliko. Tezko je majhne segmente zaznatat. ze pr signalu korelacije, tist k korelira, je zle majhno, npr ce je to 10% , potem da je tam pomeni, da npr pr norm korelaciji  0 - 1 bo prsu npr do 0.1. seprav je treba met mansji prag, zato je smiselno tudi pri izhodiscu naloge, pregled enga dela videa v drugem videu,omejit se na tiste izseke ki obsegajo vsaj 10% osnovnega videja. ker zelo podrobno ej tezko tezko naredit. 

**Npr, se naredi procentov izseka, in skripta vzame delcek in ga vsakih zmanjsa ta odsek za 10% in zraven se naredi tabelco, primerjanj in rezultatov.** 

Razlicne kvalitete? 
Ce imamo nek originalen video, potem vzamme orazlicne prekodirnike, s kateirmi prekodiramo video in primerjas med sabo. In da vidmo kok je stvar se podobna. Recim ovzamem a b c d kodeke in potem primerjam v tabeli , glej list. Kako bo kodiranje z kodekom naredil ralziko? pac spremeni kej? to jih podvzorcim?

- Treba trehsolde vredu naštimat. 

ločljviost

enga smo podvzorčl, recimo ta kodek z podvzorcenjem ni delu? seprav en priemr za locljivost, neki tam 100 npr in da se vendno dela...

## Zakljucek in nadalnje delo

