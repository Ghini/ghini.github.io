---
layout: post
title:  "software review"
date:   2018-08-05 14:05
categories: software
---

- PlantSnap

it's a (rather heavy) client of a remote expert system.  the 24Mbytes app
lets you take pics, send them for identification, show the results, or in
order of likeliness.  we tested it with Mangifera indica, Coffea arabica,
Cecropia peltata, and Persea americana.  after the time needed to send the
high resolution pictures to the server, we had one correct first choice for
Mangifera indica (second option Pachira aquatica), correct second result for
Coffea arabica (first choice: Olea dioica), and two timeouts.  we repeated
the identification request for the same coffee picture after three minutes,
and this time the right result came as first option.

after every third query, the software demands that you watch at least some
advertisement videos, surely it's referring to the ones we have clicked
away: currently our network connecion is very narrow, so we thought we would
continue some other time.

are we impressed?  not really, but neither do we definitively advise against
PlantSnap.  it's heavy, it heavily relies on a fast internet connection.

in fact, my main perplexity is about knowledge ownership: the PlantSnap
client lets you send pictures to the server, the remote expert system, and
you may suggest identifications.  this is information you voluteer,
information that goes into the knowledge base in the server, and which
contributes to increase the database value that the user community is paying
for.

post hoc ergo propter hoc.  the phone we used for our evaluation got stuck
on internet access, music playback, and just plain froze, something it
doesn't generally do.  all went back to fine after we removed PlantSnap.
maybe just a coincidence.  so we won't evaluate it any further.

- PictureThis

also a (rather heavy, 14MByte) client, it has a shortish timeout, that
prevents us from sending in pictures using our narrow 15kb/s.

once at a faster network connection, we tested PictureThis using precisely
the same pics we took with PlantSnap.  also PictureThis correctly identified
our Mango and Coffee, and not the other plants.

one remark from Seralia, our botanist, was while taking the picture of the
mistery Piperacea: "not just the leave, you need show the nodes, and you
need show that leaves are alternating."  well, the software at PictureThis
offered as possible match for this Piperacea several plant species with very
similar leaves, but opposite, not alternate.  we can't judge PlantSnap
because it didn't manage to propose anything.

- PlantNet

