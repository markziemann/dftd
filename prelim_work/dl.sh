#!/bin/bash

grep -i dft PRJEB21902_samplesheet.tsv | awk '{print $2}' \
| grep -f - variant_metadata_PRJEB21902.tsv | awk '{print $NF}' > urls.tx

for URL in $(cat urls.txt) ; do

axel -n 8 $URL

done
