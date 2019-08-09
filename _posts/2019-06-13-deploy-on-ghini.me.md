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

## iterate for each site

All the above is about installing the software, with its dependencies.  The software can be
used to serve as many sites as you wish, as long as you separate them, each on its port,
each with its database, that is, each configured with its `settings` file.  Our
`./manage.py` script allows for a `RUNSERVER_PORT` entry in the settings file.

Or you only run it for a single site, that's also possible, it doesn't change the basic
schema, that is to run the server on a "high" port, have the port open only for local
requests, and to handle the outside communication with `nginx`.

Right, let's assume we are doing the `cuaderno` site, on port `8088`.  We create the
`ghini/settings_cuaderno.py` file, specifying the `RUNSERVER_PORT` and from there we refer to
the `cuaderno` database, possibly like this:

```
DATABASES = {
    'default': {
        'ENGINE': 'django.contrib.gis.db.backends.postgis',
        'NAME': 'cuaderno',
        'USER': 'ghini',
    }
}
RUNSERVER_PORT = 8088
```

We should have the `ghini` database user, with the `create database` privilege, then we are
all set to bootstrap the database using the customary Django method:

```bash
./manage.py --config ghini.settings_cuaderno migrate
./manage.py --config ghini.settings_cuaderno import_genera_derivation
```

## register the name

We have to register a name for the outside site.  So let's tell our domain
registrar that `cuaderno` is among the names we want to offer.

## tell nginx about our django app

Next, we have to couple all http requests relative to `cuaderno` to an
internal port.  That's something for nginx.  Create an 'available' site, and
enable it, using some templates, or copying around stuff, and adapting.

Decide if you're doing things properly or not.  Doing things not properly is easier, you
just run the server from the django `manage` script and disregard all considerations about
security and efficiency.  An other option is to use `WSGI` sockets, start each server on a
different socket, and to have nginx connect the incoming traffic for each registered name
with the corresponding socket.

When done, we need to reload the nginx configuration.  What other command
makes sense, other than this:

```bash
sudo service nginx reload
```

### collect static files

```
./manage.py --config ghini.settings_cuaderno collectstatic
```

### configure for deployment

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

### we need https

That's easy, just install `certbot` (it's both the program name and the Debian package name
containing the program), do read the docs, or at least follow a guide, and if you refuse to
do either things then at least use the `--dry-run` option, before you get banned for abusing
 patience.

Remember, we're handling all external communication with `nginx`, so that's easy, we only
need to tweak our enabled virtual sites configurations to serve the "challenge" from the
same directory where `certbot` will write it, so assuming you run this:

```
sudo certbot certonly --webroot -w /usr/share/nginx/html/ -d cuaderno.ghini.me
```

you should have the following `location` definition in each of the site definition files:

```
    location ~ /.well-known/acme-challenge {
        root /usr/share/nginx/html;
    }
```

A few more things: (1) serve the site on port 443, for https; (2) add a redirect (301) from
http (port 80) to https; (3) keep record of each site name with its corresponding internal
port; (4) add a crontab to renew the certificate, running the 1st and 15th of each month:
the certbot will decide if it's indeed time to renew, or if the certificate still has more
than 30 days to go.

### we need some data.
