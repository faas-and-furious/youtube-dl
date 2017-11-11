#!/bin/sh

if [ -z "$1" ]; then
  LINE="`cat /dev/stdin`"
else
  LINE="$1"
fi

youtube-dl $LINE --no-warnings --quiet -o -
