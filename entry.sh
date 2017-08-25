#!/bin/sh


while read line
do
  echo "$line"
done < "${1:-/dev/stdin}"

youtube-dl $line --no-warnings --quiet -o -
