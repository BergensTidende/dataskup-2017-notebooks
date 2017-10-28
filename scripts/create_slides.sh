#!/bin/bash

#source activate root

pkill nbconvert

notebooks="$( cd ../notebooks && pwd )"
slides="$( cd ../slides && pwd )"
port=8001

for filename in $notebooks/*.ipynb; do
    fileshort=$(basename "${filename%.*}")
    jupyter nbconvert "$filename" --to slides --ServePostProcessor.port=$port --post serve & #$slides/"${fileshort// /_}"
    port=$((port + 1))
done

cd $slides
