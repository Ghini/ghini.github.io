---
layout: post
title:  "what does it imply, reloading ghini?"
date:   2019-05-27 15:53
categories: geek
---

So you have been watching the last videos[*], and you wonder where this all is going to take us to.

A user posed the question:

> Betekent dit dat in de toekomst de database ergens in de cloud staat en dat je via een browser in kan loggen?

> (Does it mean that in the future the database stays somewhere "in the cloud" and that we log in via a browser?)

Well, no, and yes, depending on how you look at it.

You can install ghini server on your own server if you think so, and keep all in-house.

Or you can ask me to host it "in the cloud", if you prefer.

![perplex](/images/perplex-man-balding.svg)

Right, I know, and I'm even going to give you a further technical and
necessary explanation, so please take a deep breath, and read on.

![freedom](/images/meditate.svg)

If it still makes any sense to you, please let me understand what you understand, so I'll fix my writing.

You have been using ghini.desktop, and you know its structure, let's review
it together:

- There's a central database server (this doesn't change),

- This database can also be a simple sqlite3 file (also this options stays
  unaltered), 
  
- Or you can use a database server like MySQL, or PostgreSQL, or whatever
  you prefer (again no change here),

- The core of ghini.desktop is a Python data abstraction layer, based on
  SQLAlchemy, connecting to your database.  (This does change.)

  This layer is now isolated from the user interface, it's still written in
  Python, but based on Django, and it's obviously brand new.  You have to
  install this part, sort of how you had to install ghini.desktop.  The
  extra choice now here is that you can ask me to run this part for you 'in
  the cloud'.

- The other part of ghini.desktop is the user interface, the visible part of
  the software, the one offering you menus and buttons windows and input
  fields.  (Here, an even more radical change.)

  This has become a lightweight javascript program, and my goal was to let
  you hardly realize there is any program there.  All you see it's a web
  page, and of course it's a smart web page and quite some work is going
  into it, but I hope that you will not immediately realize that this web
  page is the program you are using.
 
  You are 'installing' this part, in your desktop, laptop, phone, or tablet,
  regardless its operating system, by simply directing your browser to the
  ghini login page.

Makes any sense?

Oh, and an otherwise interesting remark I got: "ben benieuwd hoe het zich
verder ontwikkelt" (I'm curious to see how it develops).  Well, how to put
it.  This software, any **software**, it's written to **solve** problems, or
to help **users** address a **problem**.  How it develops, it depends on the
*understanding* that the *programmer* has of the previous two concepts
'user' and 'problem'.  The great philosopher Bertrand Russel thought there
was *nothing* that can't be done by formal logic.  It took 20 years to have
a German mathematician prove him wrong, but if we stay in the framework of
botany, please be assured that the only limiting factor is not Gödel's
incompleteness theorem, but the lack of criticism.

* For those of you who missed the videos: here's [the link to the new
  playlist](https://www.youtube.com/playlist?list=PLtYRCnAxpinVw9AHl4fNXa15cekxebs9o)
  on youtube.

