#!/bin/bash

#source activate root

pkill -f nbconvert

notebooks="$( cd ../notebooks && pwd )"
slides="$( cd ../slides && pwd )"
port=8001

cd $slides

for filename in $notebooks/*.ipynb; do
    fileshort=$(basename "${filename%.*}")
    jupyter nbconvert "$filename" --to slides --ServePostProcessor.port=$port --post serve & #$slides/"${fileshort// /_}"
    port=$((port + 1))
done

