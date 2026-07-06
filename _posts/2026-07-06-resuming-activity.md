---
layout: post
title:  "ghini.desktop activity resumed after long gap"
date:   2026-07-06 17:00
categories: software
---

After a long period without visible updates on this repository, development activity on Ghini.desktop has resumed.

## Background

While the main repository appeared inactive for several years, a long-term user (@cwyse) continued development independently on his **public GitHub fork**.

This work was not integrated into the main repository, but it was fully visible and accumulated a substantial amount of changes over time.

## Trigger

While experimenting with a few AI-assisted commits to address issues in Ghini 3, I pushed two small changes to the main repository.

Shortly afterwards, Chris contacted the mailing list asking whether Ghini was still being maintained. 
At that point I had not yet reviewed the full extent of his work: a large body of changes in his fork, 
including broad updates across the codebase and dependencies.

At that stage the situation was effectively:

- contributions existed, but were not integrated into the main development line
- most dependencies had already been updated in the fork
- the fork represented a substantially modernized version of the system

## Integration approach

Given the size and interdependence of the changes, I chose to import the fork as a whole into the `ghini-3.1-dev` 
branch rather than attempt a commit-by-commit integration.

This provided a single coherent baseline from which to proceed with cleanup and stabilization.

## Current work

The following weeks were spent stabilizing and cleaning up the integrated codebase:

- publishing and enabling unit tests via GitHub Actions
- resolving regressions introduced by the merge
- reviewing and adapting to changes in SQLAlchemy behaviour introduced by the updated dependency set

Further work focused on earlier design assumptions that no longer held:

- fixing session and editor-related inconsistencies
- restoring core workflows (search, selection, editing)

## Current status

Ghini.desktop is functional again for core usage paths, and active development has resumed on a unified codebase.

Ongoing work includes:

- improving stability and test coverage
- reducing legacy complexity
- continuing incremental modernization

---

Development is active again and updates will continue to be published here.
