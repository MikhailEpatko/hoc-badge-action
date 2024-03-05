#!/bin/bash

if [ "$1" == '[]' ]; then Before="$(date +%F)"; else Before=$1; fi
Dir=$2
Exclude=$3
Since=$4
OutDir=$5
Filename=$6

gem install hoc
pip install anybadge
mkdir -p "$OutDir"

Count=$(hoc -d "$Dir" -e "$Exclude" -s "$Since" -b "$Before" -f "int")
echo "Hits of code: $Count"

anybadge -l "Hits of Code" -v "$Count" -f "$OutDir/$Filename" -c royalblue