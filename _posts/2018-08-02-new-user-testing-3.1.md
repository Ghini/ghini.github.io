---
layout: post
title:  "new user testing 3.1"
date:   2018-08-02 11:04
categories: proud
---

I'm glad to publish a user contribution, from archlinux, a different Linux
distribution, one that I had never tested, confirming a complete successful
install.

![screenshot@20180802110806](/images/screenshots/ghini-3.1.6-choose_location.jpeg)

### Installing Ghini on ArchLinux

- First Step: 
Install python3 libraries:

``` bash
sudo pacman -S libchamplain python-gobject
```

- Make a dir where you want install Ghini.

``` bash
mkdir Ghini
cd Ghini
virtualenv3  --system-site-packages env
source env/bin/activate
git clone git@github.com:Ghini/ghini.desktop.git
cd ghini.desktop
pip install
python3.6 setup.py build
python3.6 setup.py install
```

- If all is ok: launch ghini


``` bash
ghini
```

---------------------------

### still-to-do

don't tell me, I totally agree that the above steps are for the strong of
heart, at least until I have processed them into the `devinstall` script, or
I have published ghini 3.1 on pip.

but in the meanwhile, if you want to put your hands on the geographic
awareness included in ghini 3.1, you can follow these lines, and help with
your feedback, hints, complaints.
