---
layout: post
title:  "our underestimated query builder"
date:   2015-07-04 18:59 -05:00
categories: software
---

last year when I picked up Bauble and updated it to the latest libraries, I inadvertently broke the query builder.

I just realized a few weeks ago, reviewing the docs and reading about the Query Builder.

it's now fixed and will be released with 1.0.44

this regression could happen because the query builder falls in that 60% of
the code that isn't yet unit tested.  definitely a situation I will address
as soon as possible.