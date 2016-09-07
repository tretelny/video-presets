for f in *.json; do
  curl -X POST -d @$f $1/presets;
done
