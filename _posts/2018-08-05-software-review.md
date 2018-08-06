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
mistery Piperacea: "don't take just the leaves, you need to show the nodes,
and you need show that leaves are alternating."  well, the software at
PictureThis offered as possible match for this Piperacea several plant
species with very similar leaves, but opposite, not alternate, and
regardless the shape of the nodes.  

better than PlantSnap?  PlantSnap didn't manage to propose anything.  but
yes, better: PictureThis is 40% lighter than PlantSnap and did not freeze
the phone.

one more bright side of this one, it feels like a collaborative platform,
and not one where your efforts are greedily monetized by others, as was my
feeling with PlantSnap.  somehow also PictureThis is a commercial
enterprise, but not in an invasive way.  

we didn't check the copyright status of the data you provide, do you keep
ownership and agree on a license, or you just provide the information and
PictureThis becomes its owner?  we ask this question, because depending on
the answer, you know whether you are participating to a community, or you're
putting value into a company.

- PlantNet

we put PlantNet in the crosshairs after we realized that both PictureThis
and PlantSnap were but a client of a remote expert system.  we really
intended to test Android apps that you could run on your phone while deep in
the bushes, we're not insterested in a client-server interaction based on
a reliable internet connection, even less a broadband connection.

PlantNet comes as both on-line expert system and as remote server of a
installable client.  The client is less than 4Mbytes, that's 85% lighter
than PlantSnap and more than 70% lighter than PictureThis.

plantnet.org is part of Floris'Tic, a non commercial organization, based in
France, sponsored by several French scientific public institutions, and
endorsed by tela-botanica, the largest French-speaking botanic community.

anyhow, we hope to review PlantNet soon, in the meanwhile check it for
yourself, at https://identify.plantnet-project.org/

