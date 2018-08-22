---
layout: post
title:  "two weeks sprint"
date:   2018-08-22 09:39
categories: software
---

<style type="text/css">
   hr {margin: 0px;}
   tr {padding: 0px;}
   td {padding: 5px 15px 8px 8px; }
   .issue-tag { border-radius: 3px; }
   .i-red { background: #EE3F46; color:#FFF;}
   .i-lightblue { background: #bfd4f2;}
   .i-tan { background: #fef2c0;}
   .i-orange { background: #FFC274;}
   .i-purple { background: #cc317c; color:#FFF;}
   .i-gray { background: #D2DAE1;}
   .i-blue { background: #5EBEFF;}
   .i-green { background:#91ca55;}
   .i-yellow { background:#fbca04;}
   .i-salmon { background:#fad8c7;}
   .i-black { background: #000000; color:#FFF;}
</style>

I have a couple of weeks, that's until the first days of September, and I sit at a nice place with unstable
internet connection.  Good enough for email and committing work, definitely not for much distraction.

Last months I have been working at a different project, and some ideas can be applied here, too.  One is about
organizing sprints in a more defined way, and reading and gathering information, we got to ZenHub, and a nice
idea about labelling issues.

## labelling issues

Coming from ``trac``, I was never particularly satisfied with github issues.  ``trac`` issues have a priority,
in github you only have labels, and they work independetly of each other.  I had sort of built something
mimicking it, combining label names and colours, and I'm happy to see it taken several steps further in
[this blog post](https://robinpowered.com/blog/best-practice-system-for-organizing-and-tagging-github-issues/).

> We group labels by color, according to broad themes. Labels are consistent across repositories […].  This
> makes switching between projects easy […].  New team members can learn the system once, and use it
> everywhere.

<table>
<tr>
<td class="issue-tag i-purple"><p>Feedback</p></td>
<td><p>Requires further conversation to figure out the action steps. Most feature ideas start here.</p><p><code class="issue-tag i-purple">discussion</code>, <code class="issue-tag i-purple">rfc</code>, <code class="issue-tag i-purple">question</code></p></td>
</tr>
<tr><td colspan="2" style="padding:0px;"><hr/></td></tr>
<tr>
<td class="issue-tag i-red"><p>Problems</p></td>
<td><p>Issues that make the product feel broken. High priority, especially if its present in production.</p><p> <code class="issue-tag i-red">bug</code></p></td>
</tr>
<tr>
<td class="issue-tag i-orange"><p>Experience</p></td>
<td><p>Affect user’s comprehension, or overall enjoyment of the product. These can be both opportunities and “UX bugs”, or failing documentation.</p><p><code class="issue-tag i-orange">documentation</code>, <code class="issue-tag i-orange">opportunity</code>, <code class="issue-tag i-orange">ux</code>.</p></td>
</tr>
<tr>
<td class="issue-tag i-tan"><p>Mindless</p></td>
<td><p>Converting measurements, reorganizing folder structure, and other necessary (but less impactful) tasks.</p><p><code class="issue-tag i-tan">chore</code>.</p></td>
</tr>
<tr><td colspan="2" style="padding:0px;"><hr/></td></tr>
<tr>
<td class="issue-tag i-blue"><p>Improvements</p></td>
<td><p>Iterations on existing features or infrastructure. Generally these update speed, or improve the quality of results. Adding a new “Owner” field to an existing “Calendar” model in the API, for example.</p><p> <code class="issue-tag i-blue">enhance</code></p></td>
</tr>
<tr>
<td class="issue-tag i-green"><p>Additions</p></td>
<td><p>Brand new functionality. New pages, workflows, endpoints, etc.</p><p> <code class="issue-tag i-green">feature</code>.</p></td>
</tr>
<tr><td colspan="2" style="padding:0px;"><hr/></td></tr>
<tr>
<td class="issue-tag i-yellow"><p>Pending</p></td>
<td><p>Taking action, but need a few things to happen first. A feature that needs dependencies merged, or a bug that needs further data.</p><p> <code class="issue-tag i-yellow">need-stuff</code>, <code class="issue-tag i-yellow">need-info</code>, <code class="issue-tag i-yellow">need-issue</code></p></td>
</tr>
<tr><td colspan="2" style="padding:0px;"><hr/></td></tr>
<tr>
<td class="issue-tag i-lightblue"><p>Platform</p></td>
<td><code class="issue-tag i-lightblue">Android</code>, <code class="issue-tag i-lightblue">Windows</code>, <code class="issue-tag i-lightblue">OSX</code>, <code class="issue-tag i-lightblue">GNU/Linux</code>. </td>
</tr>
<tr>
<td class="issue-tag i-salmon"><p>Environment</p></td>
<td><p>Production line.</p> <p><code class="issue-tag i-salmon">ghini-1.0</code>, <code class="issue-tag i-salmon">ghini-3.1</code>, <code class="issue-tag i-salmon">ghini-3.2</code>, <code class="issue-tag i-salmon">mobile</code>.</p></td>
</tr>
<tr>
<td class="issue-tag i-gray"><p>Inactive</p></td>
<td><p>No action needed or possible. The issue is either fixed, addressed better by other issues, or just out of product scope.</p><p><code class="issue-tag i-gray">duplicate</code>, <code class="issue-tag i-gray">invalid</code>, <code class="issue-tag i-gray">wontfix</code>.</p></td>
</tr>
<tr><td colspan="2" style="padding:0px;"><hr/></td></tr>
<tr>
<td class="issue-tag i-black"><p>Not an issue</p></td>
<td><p>much more than just an issue.</p> <p><code class="issue-tag i-black">epic</code>.</p> </td>
</tr>
</table>
