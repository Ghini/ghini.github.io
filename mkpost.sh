#!/bin/bash

title='no title'
category=software
picture=abc.png

date=$(date -I $1 2>/dev/null )
name=$date-$(echo $title 2>/dev/null | tr ' ' '-').md
timestamp=$(date -Iminutes $1 2>/dev/null | sed -e 's/T/ /' -e 's/\(...:..\)$/ \1/')

cat <<EOF >> _posts/$name
---
layout: post
title:  "$title"
date:   $timestamp
categories: $category
---


![$picture](/images/$date-$picture)

EOF
