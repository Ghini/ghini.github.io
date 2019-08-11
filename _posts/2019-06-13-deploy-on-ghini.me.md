---
layout: post
title:  "deploy on ghini.me"
date:   2019-06-13 09:14
categories: technical
---

This is a technical entry, something like the "for me from myself" presents
we used to include among the Christmas presents.  The intention is to share
the pleasure to receive a welcome present with the rest of you.

If the technicalities scare you, the message here is simply: ghini reloaded
is going on-line at http://cuaderno.ghini.me, and the reason behind the name
is that the collection shown is a 'cuaderno de colecta'.

## let's start.

First of all, we need a recent Python version, that's at least 3.5.  Any recent distribution
should have that, now that Debian has released its 10th version, with Python 3.7.

We want virtualenv and pip.  Look for the details somewhere else, it should be contained in
the package `python3-venv`.  Keep in mind that to create virtual environment, you use
`python3 -m venv`.

## So what do we do …

```bash
mkdir -p ~/Local/github/Ghini
cd ~/Local/github/Ghini
( git clone git@github.com:Ghini/server.git ||
  git clone https://github.com/Ghini/server.git )
sudo apt-get install python3-venv
python3 -m venv ~/.virtualenvs/ghini/
cd server
. ~/.virtualenvs/ghini/bin/activate
pip install -r requirements.txt
```

This is just the standard installation procedure for any python3 program: decide where to
download the software, download it, make sure you can create virtual environments, create a
virtual environment for the software, activate it, and install the software in its isolated
new virtual environment.

## iterate for each site

All the above is about installing the software.  The software can be used to serve as many
sites as you wish, as long as you separate them, each on its port, or socket, each with its
database.  This is information that will be used by the `./manage.py` script, or by `uwsgi`,
or by `nginx`, and every one of these programs uses a different configuration file.

Ghini server tries to make things a bit easier: we have a modified `./manage.py` script
which allows for a `RUNSERVER_PORT` entry in the settings file (useful with the `runserver`
command), and we have a small bash script that will collect the `uwsgi` socket options from
the `nginx/sites-available` directory, and produce the matching `wsgi.ini` files.

Are you only interested in running ghini server for a single site?  That's also possible, it
doesn't change the basic schema, that is to start the server using uwsgi, to keep the socket
open only for local requests, and to handle the outside communication with `nginx`.

Let's call the two scenarios `runserver` and `uwsgi`.  First case you specify the
`RUNSERVER_PORT` option in the settings file, and you access your server on that port.
Second case, which you can use in deployment, you have a `nginx` configuration, and you
create the matching `uwgsi` ini file with the `uwsgi.d/create-ini-files.sh` script.  In this
case you do not need the `RUNSERVER_PORT` option.

### configure for deployment

Combine both the django pages and the static files in a single nginx configuration, not
relying on the django `runserver` development command.  That's a few connected issues, none
of which complex, but they all refer to each other, and it's easy to loose track.

First of all, configure the location for the static data.  I don't mean `STATIC_URL`, that's
`/static` and it won't change, I mean the physical location in the file system, that's the
`STATIC_ROOT` variable.  Set that to something reasonable, create the directory, give
yourself permission to write, then you may run the `collectstatic` from django.  It takes a
split second and it should tell you 200 files or so.  Next step is to make these files
served by nginx.  Open the site-available file, and add a `location` setting in the `server`
block, something like `location /static { alias /var/www/ghini/static/; }`.

### tell nginx about our server

`nginx` role here is to make sure clients are using https, not plain http, then redirect all
incoming traffic relative to our site to the internal port or socket where the server is
running.  This is specified by the customary `nginx/sites-available/` file and its
corresponding symbolic link from the `nginx/sites-enabled` directory.

The `nginx` file for our `cuaderno` iteration has a first block redirecting all `80` traffic
to `https`.

```
server {
    listen       80;
    listen       [::]:80;
    server_name  cuaderno.ghini.me cuaderno;
    return 301 https://$server_name$request_uri;
}
```

Maybe we could make this a more general redirect, in its own file, redirecting all incoming
http traffic to https regardless any other consideration.  See it yourself.

All our https server block have this structure:

```
server {
    server_name      cuaderno.ghini.me;
    listen           443 ssl;
    listen           [::]:443 ssl;
    ssl_certificate     /etc/letsencrypt/live/server.ghini.me/fullchain.pem;
    ssl_certificate_key /etc/letsencrypt/live/server.ghini.me/privkey.pem;

    ## location blocks
}
```

The `location /` declaration is where we tell nginx that the requests are to be handled by
uwgsi, on a specific port.  This is server-specific, and it is the only place where we
specify the port.  Make sure there's no conflict in your settings.  On the Python side, we
grab the setting from here and put into the ini file corresponding to each of our servers.

```
    location / {
        include uwsgi_params;
        uwsgi_pass 127.0.0.1:44410;
    }
```

The other three declarations are for the certbot, static files, and for media files.  Only
the media files `location` is server-specific:

```
    location ~ /.well-known/acme-challenge {
        root /usr/share/nginx/html;
    }
    location /static {
        alias /var/www/server.ghini.me/static/;
    }
    location /media {
        alias /var/www/cuaderno.ghini.me/media/;
    }
```

We leave the acme-challenge location in place, because our certificates last 90 days and
need to be renewed periodically, so it's easier to just keep the declaration even if we only
use it for certificate renewal.

### set up the database

We should have the `ghini` database user, with the `create database` privilege.

Here we create the `cuaderno` postgresql/postgis database, it's just two operations:

```bash
$ createdb -U ghini cuaderno
$ psql -U ghini cuaderno -c 'CREATE EXTENSION postgis;'
CREATE EXTENSION
$
```

Refer to this database from the `ghini/settings_cuaderno.py` config file, like this (the
`RUNSERVER_PORT` option is very optional):

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

Then we are all set to bootstrap the database using the customary Django method, after which
we immediately create a superuser, and a guest:

```bash
./manage.py migrate --config ghini.settings_cuaderno
./manage.py collectstatic --config ghini.settings_cuaderno
./manage.py createsuperuser --config ghini.settings_cuaderno
./manage.py createguestuser --config ghini.settings_cuaderno
```

### create the uwsgi ini file

We have a script for it.  Edit, adjust, run.  It's in the uwsgi.d directory in the project
structure.

### register the name

In deployment, we have to register a name for the outside site.  Use your domain registrar
to tell the world that `cuaderno` is among the names you offer.

## we need https

This we do after all iterations.  No need to iterate per server name.

Install `certbot` (it's both the program name and the Debian package name containing the
program), do read the docs, or at least follow a guide, and if you refuse to do either
things then at least use the `--dry-run` option, before you get banned for abusing patience.

Remember, we're handling all external communication with `nginx`, so that's easy, we already
tweaked our virtual sites configurations to serve the "challenge", all from the same
directory, now we run the `certbot` using that same setting:

```
sudo certbot certonly --webroot -w /usr/share/nginx/html/ -d cuaderno.ghini.me
```

Add as many server names as needed.

Summing up: (1) serve the site on port 443, for https; (2) add a redirect (301) from http
(port 80) to https; (3) keep record of each site name with its corresponding internal port;
(4) add a crontab to renew the certificate, running the 1st and 15th of each month: the
certbot will decide if it's indeed time to renew, or if the certificate still has more than
30 days to go.

## reload-restart nginx

When done, we reload the nginx configuration.

```bash
sudo service nginx reload
```

## run the services

We put all our uwsgi files are in the same directory, so we can use `uwsgi` in 'emperor'
mode.  Did you already install uwsgi?  you can put it in the same virtual environment as our
django apps.  Activate the environment, move to the project directory, then run the command:

```bash
$ uwsgi --emperor $(pwd)/uwsgi.d/
```
