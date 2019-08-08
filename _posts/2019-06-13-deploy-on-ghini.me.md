---
layout: post
title:  "deploy on ghini.me"
date:   2019-06-13 09:14
categories: technical
---

This is a technical entry, something like the "for me from myself" presents
we used to include among the Christmas presents. The intention is to share
the pleasure to receive a welcome present with the rest of you.

if the technicalities scare you, the message here is simply: ghini reloaded
is going on-line at http://cuaderno.ghini.me, and the reason behind the name
is that the collection shown is a 'cuaderno de colecta'.

## let's start.

First of all, we need a recent Python version, that's at least 3.5.  We
first considered installing from source, that would give us 3.7.4, but we
got entangled in such a cascade of dependencies, that after some three hours
not seeing the end of it, we just decided we would make the step from debian
8 (oldstable) to debian 9 (stable).  There's something funny about this, and
that's we are about to end again in 'oldstable', because Debian 10 is
expected soon.

pip and virtualenv are both included, but if we keep calling them this way,
we end up with python2.  so no pip, it's now pip3, and no virtualenv, it's
now the much less memorizable `python3 -m venv`.  so much for
'deprecated'.  uff.

## So what do we do … 

```bash
sudo apt-get install python3-venv
python3 -m venv ~/.virtualenvs/ghini/
mkdir -p ~/Local/github/Ghini
cd ~/Local/github/Ghini
( git clone git@github.com:Ghini/server.git ||
  git clone https://github.com/Ghini/server.git )
cd server
. ~/.virtualenvs/ghini/bin/activate
pip3 install -r requirements.txt
```

This goes without hassle, it's just standard ways to any python3 program.
Make sure you can create virtual environments, download the software, create
a virtual environment for the software, activate it, and install the
software in its isolated new virtual environment.

Since all went fine, let's also initialize a database and bootstrap it with
some 20k taxa, mostly with synonymy and authorship.

```bash
./manage.py migrate
./manage.py import_genera_derivation
```

## now the more difficult parts come.

We have to register a name for the outside site.  So let's tell our domain
registrar that `cuaderno` is among the names we want to offer.

Next, we have to couple all http requests relative to `cuaderno` to an
internal port.  That's something for nginx.  Create an 'available' site, and
enable it, using some templates, or copying around stuff, and adapting.

When done, we need to reload the nginx configuration.  What other command
makes sense, other than this:

```bash
sudo service nginx reload
```

what else, many bits, none of them so complex:

### install gunicorn

that is nothing more than `pip3 install gunicorn`, that's it.

### enable cuaderno to reach django,
#### configure for deployment
#### collect static files

well, by these points I mean: combine both the django pages and the static files in a single
nginx configuration, not relying on the django `runserver` development command.  that's a
few connected issues, none of which complex, but they all refer to each other, and it's easy
to loose track.

first of all, configure the location for the static data.  I don't mean STATIC_URL, that's
`/static` and it won't change, I mean the physical location in the file system, that's the
`STATIC_ROOT` variable.  set that to something reasonable, create the directory, give
yourself permission to write, then you may run the `collectstatic` from django.  it takes a
split second and it should tell you 200 files or so.  next step is to make these files
served by nginx.  open the site-available file, and add a `location` setting in the `server`
block, something like `location /static { alias /var/www/ghini/static/; }`.  done this, we
are all set, just run `gunicorn --bind 0.0.0.0:8080 ghini.wsgi`, or, better, replace that
`0.0.0.0` with your server's IP address.

### put a supervisor

precisely: with the above description, in order to run the server, we are requiring that you
log in into the server, and run a script to start the program.  we can put this all in a
configuration for a supervisor.  there is one named `supervisor`, written in python, fitting
in a virtual environment.

This isn't going to happen today.  I'll leave the program up and running,
there's a guest/guest user, with full access to the data, so you may have a
look, and experiment.

### we need https,

### we need some data.
