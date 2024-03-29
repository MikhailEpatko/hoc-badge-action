#!/bin/bash

while getopts 'b:c:d:e:f:o:r:s:' opt; do
  case "$opt" in
    b)
      Before="$OPTARG"
      if [ "$Before" == '[]' ]; then Before="$(date +%F)"; else Before=$1; fi
      ;;
    c)
      Color="$OPTARG"
      ;;
    d)
      Dir="$OPTARG"
      ;;
    e)
      Excld="$OPTARG"
      ;;
    f)
      Filename="$OPTARG"
      ;;
    o)
      OutDir="$OPTARG"
      ;;
    r)
      Rounding="$OPTARG"
      ;;
    s)
      Since="$OPTARG"
      ;;
    :)
      echo "Usage: $(basename "$0") [-b Before] [-c Color] [-d Dir] [-e Exclude] [-f Filename] [-o OutputDir] [-r Rounding] [-s Since]"
      exit 1
      ;;
    ?)
      echo "Usage: $(basename "$0") [-b Before] [-c Color] [-d Dir] [-e Exclude] [-f Filename] [-o OutputDir] [-r Rounding] [-s Since]"
      exit 1
      ;;
  esac
done

if [ "$Excld" != '[]' ]; then
  IFS=$'\n' read -rd '' -a array <<< "$Excld"
  for word in "${array[@]}"; do
    Exclude="${Exclude} -e $word"
  done
fi

Count=$(hoc -d "$Dir" ${Exclude:+${Exclude[@]}} -s "$Since" -b "$Before" -f "int")
echo "Hits of code: $Count"

if   [ "$Rounding" == "K" ]; then Count="$(python -c "print(round($Count/1000, 1))")K"
elif [ "$Rounding" == "M" ]; then Count="$(python -c "print(round($Count/1000000, 1))")M"
elif [ "$Rounding" == "G" ]; then Count="$(python -c "print(round($Count/1000000000, 1))")G"
else Count=$(python -c "print(format($Count, ',d'))")
fi

echo "Hits of code: $Count"

mkdir -p "$OutDir"
anybadge -l "Hits of Code" -v "$Count" -f "$OutDir/$Filename" -o -c "$Color"
