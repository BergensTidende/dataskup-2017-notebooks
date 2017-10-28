#!/bin/bash

#source activate root

notebooks="$( cd ../notebooks && pwd )"
slides="$( cd ../slides && pwd )"

for filename in $notebooks/*.ipynb; do
    fileshort=$(basename "${filename%.*}")
    jupyter nbconvert "$filename" --to slides --output $slides/"${fileshort// /_}"
done

cd $slides
python -m http.server 8000