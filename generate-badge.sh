#!/bin/bash

if [ "$1" == '[]' ]; then Before="$(date +%F)"; fi
if [ "$2" == '[]' ]; then Dir='.'; fi
if [ "$3" == '[]' ]; then Exclude=[]; fi
if [ "$4" == '[]' ]; then Since='2000-01-01'; fi

pwd
ls
#gem install hoc
Count=$(hoc -d $Dir -e "$Exclude" -s $Since -b $Before -f 'int' )
echo "Hits of code: $Count"

#mkdir ./output
#pip install anybadge
anybadge -l "Hits of Code" -v "$Count" -f ./output/hits.svg -c royalblue
