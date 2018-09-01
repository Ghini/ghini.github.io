---
layout: post
title:  "valutazione milestone"
date:   2018-09-01 13:08
categories: software
---

chiuso milestone Tanager-2018-08, ovviamente non ho concluso tutti i 36 bug
che ci avevo infilato, davvero non era nemmeno un eccesso di ottimismo, era
puro e semplice irrealismo.  10.  dieci mi sembra un buon numero,
considerato l'impatto che alcuni di loro hanno sul software e la
documentazione.  

sono tutti relativi alla linea di sviluppo 3.1, ma un paio li ho anche
applicati alla 1.0, qui marcati con il testo `[1.0]`.

vediamoli in dettaglio, raggruppati.

### produzione di rapporti

con il [395](https://github.com/Ghini/ghini.desktop/issues/395) abbiamo
completamente ridefinito l'interfaccia utente del modulo.  ora l'utente
sceglie quali modelli vuol utilizzare, a ciascuno associa un nome, e la
scelta del nome associato al modello resta definitiva.  chiamiamo questa
operazione "attivare un modello".  l'utente può scegliere fra i modelli
attivati, o addiungerne.

dato che ciascun modello è scritto per un formattatore, ed uno solo, la
scelta del modello implica la scelta del formattatore.  questa viene ora
comunicata all'utente, non più richiesta addizionalmente.

considerando che i modelli Mako generalmente sono scritti in modo da
funzionare per un solo dominio, mentre i modelli XSL possono aver senso su
domini diversi, il software ora favorisce Mako, senza tuttavia impedire la
logica XSL: l'autore del modello dichiara, in un commento nel modello, il
dominio su cui iterare, così che il modello riceve da ghini una lista di
oggetti del dominio dichiarato.  ciascun modello può anche voler agire
direttamente sulla selezione, in questo caso l'autore specifica come dominio
``raw``.  in ogni caso, nell'interfaccia utente il programma mostra quale
dominio sarà utilizzato nella produzione del rapporto.

altri dettagli del modello selezionato sono il nome del file del modello, e
la sua ubicazione.  

tutti questi dati sono in sola lettura, e sono contenuti nella sezione
'dettagli'.

la sezione 'opzioni' permette all'utente di influenzare la produzione del
rapporto, cambiando il valore dei parametri richiesti dal modello.

con il [408](https://github.com/Ghini/ghini.desktop/issues/408) abbiamo
invece permesso al ``Quick CSV`` di agire sulla selezione, anziché su tutto
il contenuto del database.  questo ci ha portato a riconsiderare il
posizionamento della funzione ``Quick CSV`` sia dal punto di vista utente
quanto dal punto di vista struttura del software, vedi richiesta
[400](https://github.com/Ghini/ghini.desktop/issues/400).  ``Quick CSV`` si
trova ora nel plugin ``report``, e nei menu appare nel nuovo menu
``Report``, al lato della funzione ``From Template``.  questo torna a
chiudere la richiesta
[62](https://github.com/Ghini/ghini.desktop/issues/62).

### interfaccia utente

tutti gli oggetti di menu creati dai plugin erano privi di icona, in
particolare le "categorie", cioè i menu che attivano altri menu.  questo era
l'argomento del [396](https://github.com/Ghini/ghini.desktop/issues/396).
per il menu ``tools``, ho utilizzato icone standard di gnome, mentre per il
menu ``inserisci`` ho creato un paio di icone, basadomi su alcuni oggetti
grafici della wikipedia.

io non parlo francese, però a volte mi metto a leggerne, diciamo per
stimolare il cervello.  leggendo documentazione tecnica di django, avevo
notato nomi tradotti in modo che non avevo mai sentito prima.
[389](https://github.com/Ghini/ghini.desktop/issues/389).  se lo dice
django!

### un paio di bug importanti

non in grado di rompere la funzionalità del programma, ma abbastanza per
creare problemi in casi particolari:
[392](https://github.com/Ghini/ghini.desktop/issues/392).  `[1.0]`.

un altro invece decisamente serio, nella linea giustamente ancora non
pubblicata 3.1: [361](https://github.com/Ghini/ghini.desktop/issues/361).


### varie ed eventuali (documentazione)

[404](https://github.com/Ghini/ghini.desktop/issues/404), dopo tanto tempo
che ne parlavo, finalmente ho pubblicato un database di esempio, relativo
all'orto informale "el Cuchubo" in Mompox, Colombia.  `[1.0]`.

[386](https://github.com/Ghini/ghini.desktop/issues/386), o come essere
chiari con chi pensa in maniera diversa da te.  la cosa migliore quando non
mi si capisce, è che mi si dica "scusa, non ho capito", eventualmente anche
senza lo "scusa".  `[1.0]`.

as always: enjoy.
