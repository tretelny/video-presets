#!/bin/bash -e

if [ -z "$1" ]; then
  echo >&2 "please specify the URL of the transcoding-api"
  exit 2
fi

endpoint=$(echo $1 | sed -e 's;/*$;;')

for f in *.json; do
  curl -X POST -d @${f} ${endpoint}/presets;
done
