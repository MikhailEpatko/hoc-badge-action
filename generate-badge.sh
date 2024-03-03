#!/bin/bash

echo "|| $1 || $2 || $3 || $4 ||"
if [ "$1" == '[]' ]; then Before="$(date +%F)"; else Before=$1; fi
if [ "$2" == '[]' ]; then Dir='.'; else Dir=$2; fi
if [ "$3" == '[]' ]; then Exclude=[]; else Exclude=$3; fi
if [ "$4" == '[]' ]; then Since='2000-01-01'; else Since=$4; fi

Count=$(hoc -d "$Dir" -e "$Exclude" -s "$Since" -b "$Before" -f 'int' )
echo "Hits of code: $Count"

anybadge -l "Hits of Code" -v "$Count" -f ./output/hits.svg -c royalblue
