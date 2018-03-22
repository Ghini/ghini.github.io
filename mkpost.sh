#!/bin/bash

name=$(date -I $1).markdown
timestamp=$(date -Iminutes $1 | sed -e 's/T/ /' -e 's/\(...:..\)$/ \1/')

cat <<EOF > _posts/$name
---
layout: post
title:  "PLEASE REPLACE"
date:   $timestamp
categories: software
---

EOF
