---
layout: post
title:  "connecting desktop to web"
date:   2016-01-12 08:28 -0500
categories: proud
---

this already "sort of works" in the sense that:

- preparation

  - database server contains notifying function and defines a table trigger.
  - Ghini listens to the notification slot.

- in function

  -  any client (can be Bauble classic) inserts or updates a plant.
  -  database fires the trigger.
  -  Ghini is notified of the change.
  -  (and not much happens with the information, just log to console).
