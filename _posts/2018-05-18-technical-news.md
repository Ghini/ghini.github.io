---
layout: post
title:  "technical news"
date:   2018-05-18 10:42
categories: technical
---

writing software for the botanic wolrd is still mostly about writing software,
these last few weeks I've been focusing on some less visible issues, related to:

- distributing software
- updating libraries
- setting priorities

Python 2 is reaching end-of-life on January 1st, 2020, meaning we must now really
migrate to Python 3.

PyGTK, not being supported by Python 3, is also reaching end-of-life together with
Python 2, meaning we need migrating to Gtk3.

Our GUI still makes extensive usage of a deprecated Gtk2 widget, which does not
exist in Gtk3, meaning we need rewriting part of our user interface.

While packaging for Debian (which gets included in ubuntu) I've been advised
against some of the file naming practices in our software.

Does it sound like lots of work?  It is.

You don't get the point?  All these necessary changes, if done correctly, will not
change anything in user experience.