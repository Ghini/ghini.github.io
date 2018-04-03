---
layout: post
title:  "enhancing mobile data collection (pocket 1.5)"
date:   2018-04-03 10:46 -05:00
categories: software
---

Initially, ghini.pocket was really just thought as a ways to take some of
your data to the field, to show it off, as for example in case of an
inspection: you could tell what plant you were looking at, when it entered
the collection, and a few more selected properties.

Soon the need arose to use it to collect data, and we chose not to write any
code, but to rely upon the already exisiting ODK Collect and the
corresponding ODK Aggregator.

Next addition was using it for quick inventory review, and going through a
remote aggregator felt as incredible overkill, so we started producing
importable logs.

### what changed today?

Now we have phased out ODK Collect and we're storing all the collectable
data straight into the log, including file names of the pictures you take,
always within ghini.pocket.

### is that all?

No, that's definitely not the whole story.  In ghini.pocket we already had a
rather complete taxonomic database, used to hint users with the 30k taxa at
rank genus or above.  We're now extending its use, to computer assisted data
insertion.

You want an example...

![pocket helps spelling](/images/2018-04-03-enhancing-mobile-data-collection.md_20180403_105948_5224IaO.png)

Here you're entering the taxon name *Xylanthemum*, and in your complete
trust of our software, you just type »silante«, and there you are.  Click on
the best proposed completion and you're ready to type the species epithet.

![pocket helps spelling](/images/2018-04-03-enhancing-mobile-data-collection.md_20180403_110641_5224VkU.png)
