---
layout: post
title:  "La vetrina con PostgreSQL"
date:   2019-07-12 08:38
categories: software
---

pensierini tecnici, ovvero come avanzare passo a passo.

avevo iniziato lo sviluppo di Ghini con Django, avendone deciso solo il nome: "Ghini Reloaded".  ora è ne
abbastanza chiara anche la struttura: un servitore centrale, una quantità di clienti, fra cui un cliente
web.  inizialmente, la base dati è stata su in un file sqlite3, ora mi sembra raggiunto il momento di
aggiungere informazione geografica, cosa per cui penso sia meglio appoggiarsi ad un gestore di basi di dati
vero, come PostgreSQL.  qui descrivo le operazioni svolte recentemente.

l'obiettivo è: aggiungere informazione geografica, cambiare il gestore di basi di dati.

la prima cosa si fa in Django, con migrazioni successive, la seconda è questione esterna alla applicazione,
ed ha impatto sulla configurazione.

prima di tutto, iniziamo con l'istallazione di
[pgloader](https://pgloader.readthedocs.io/en/latest/tutorial/tutorial.html).  questo permette la migrazione di una base dati sqlite a posgtresql in un solo comando.

poi sì, manca ancora installare PostgreSQL.  ho appena aggiornato il nostro servitore a Debian 10, così
all'installare PostgreSQL ho ricevuto la versione 11.4.  dovrò aggiornare il pc su cui lavoro su cui ho
ancora solo PostgreSQL 9.6.  lo faccio appena ho accesso ad una rete senza limiti di traffico.

una volta istallato PostgreSQL, creata una base dati con lo stesso nome della configurazione, e migrati i
dati, c'è da cambiare un paio di parametri nella configurazione.  creazione base dati nel sistema di
gestione, e la relativa configurazione, va fatto manualmente, sul servitore.  tutto il resto sono cose che
stanno nel repositorio GIT.

con sqlite era:

```
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.sqlite3',
        'NAME': os.path.join(BASE_DIR, 'cuaderno.sqlite3'),
    }
}
```

con PSQL+PostGIS questa parte diventa:

```
DATABASES = {
    'default': {
        'ENGINE': 'django.contrib.gis.db.backends.postgis',
        'NAME': 'cuaderno',
        'USER': 'mario',
        'TEST': {
        },
    }
}
```

inoltre, c'è stato da aggiungere 'django.contrib.gis' alla lista delle `INSTALLED_APPS` e `psycopg2` alla
lista delle dipendenze, per cui bisogna richiedere l'installazione, con `pip`.  non è tutto, perché
`psycopg2` se installato con `pip` ha bisogno dei file di sviluppo di postgresql, nel nostro caso
`postgresql-server-dev-11`, che sono una cinquantina di megabyte da scaricare, mentre perché funzioni
PostGIS ci servono gdal20, ed ovviamente `postgresql-postgis` (un pacchetto virtuale, che si risolve in
quello che si risolve).

dopo la creazione base dati, migrazione con pgloader, del git-pull, vediamo se funziona ancora
