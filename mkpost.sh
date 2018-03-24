#!/bin/bash
## create a template post and open it in emacs
##
## t - title, 
## c - category, 
## p - picture, include a link to a picture
## and the timestamp, mmddHHMMYY

# make sure we are in the project root dir, same as script location.
cd $(dirname $0)

# default values
#
title='no title'
category=software
picture=abc.png

# overwrite from command line
#
OPTIONS=t:c:p:
LONGOPTIONS=title:,category:,picture:
PARSED=$(getopt --options=$OPTIONS --longoptions=$LONGOPTIONS --name "$0" -- "$@")

if [[ $? -ne 0 ]]; then
    # e.g. $? == 1
    #  then getopt has complained about wrong arguments to stdout
    exit 2
fi
# read getopt’s output this way to handle the quoting right:
eval set -- "$PARSED"

outfile=$(tempfile --suffix .mp3)

while true; do
    case "$1" in
        -t|--title)
            title="$2"
            shift 2
            ;;
        -c|--category)
            category="$2"
            shift 2
            ;;
        -p|--picture)
            picture="$2"
            shift 2
            ;;
        --)
            shift
            break
            ;;
        *)
            echo "Programming error"
            exit 3
            ;;
    esac
done

# remaining arguments, should be one, is the timestamp

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

emacsclient -n _posts/$name
