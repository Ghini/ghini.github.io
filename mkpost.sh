#!/bin/bash

title='no title'
category=software
picture=abc.png

date=$(date -I $1)
name=$date-$(echo $title | tr ' ' '-').md
timestamp=$(date -Iminutes $1 | sed -e 's/T/ /' -e 's/\(...:..\)$/ \1/')

cat <<EOF > _posts/$name
---
layout: post
title:  "$title"
date:   $timestamp
categories: $category
---


![$picture](/images/$date-$picture)

EOF
