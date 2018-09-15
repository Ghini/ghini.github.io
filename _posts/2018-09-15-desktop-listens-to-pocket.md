---
layout: post
title:  "desktop listens to pocket"
date:   2018-09-15 12:30
categories: software
---

good news, and of great impact within the Ghini family.  We finally have
real integration between ghini pocket and desktop.  I dedicated most of the
last two weeks descrbing and building a web service inside ghini.desktop,
and the corresponding client in ghini.pocket.  More specifically,
ghini.desktop now has an xml-rpc server, and ghini.pocket now contains a
client activity that interacts with it.

You can now send all the data you have been collecting in your ghini pocket
to the desktop database, and receive it back in ghini.pocket, without
touching any cables, just connecting your devices to the same local network,
and use the new functionality.

Start the server on ghini.desktop, register your Android device, send your
collected data (inventory, corrections, pictures), get the new database
snapshot back on ghini.pocket.

![screenshot@20180915171903](images/2018-09-15-desktop-listens-to-pocket-20180915171903.png)

I started by first documenting the functionality, then designing the user
interface, while constantly reviewing the documentation, then go in the
technical details, constantly keeping an eye on the user manual, so that it
would still match with the evolving idea.

Read all about it in the manual, and test it by yourself, installing the
(still unstable) ghini-3.1 version.  I am considering porting this back to
the ghini-1.0 line, just not quite yet.

