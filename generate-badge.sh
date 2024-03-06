#!/bin/bash

while getopts 'b:d:e:f:o:s:' opt; do
  case "$opt" in
    b)
      Before="$OPTARG"
      if [ "$Before" == '[]' ]; then Before="$(date +%F)"; else Before=$1; fi
      ;;
    d)
      Dir="$OPTARG"
      ;;
    e)
      Exclude="$OPTARG"
      ;;
    f)
      Filename="$OPTARG"
      ;;
    o)
      OutDir="$OPTARG"
      ;;
    s)
      Since="$OPTARG"
      ;;
    :)
      echo "Usage: $(basename "$0") [-b Before] [-d Dir] [-e Exclude] [-f Filename] [-o OutputDir] [-s Since]"
      exit 1
      ;;
    ?)
      echo "Usage: $(basename "$0") [-b Before] [-d Dir] [-e Exclude] [-f Filename] [-o OutputDir] [-s Since]"
      exit 1
      ;;
  esac
done

if [ "$Before" == '[]' ]; then Before="$(date +%F)"; fi

echo "$Dir ${Exclude[*]} $Since $Before"

mkdir -p "$OutDir"

Count=$(hoc -d "$Dir" ${Exclude:+"-e" "${Exclude[@]}"} -e "${Exclude[@]}" -s "$Since" -b "$Before" -f "int")
echo "Hits of code: $Count"

anybadge -l "Hits of Code" -v "$Count" -f "$OutDir/$Filename" -c royalblue
