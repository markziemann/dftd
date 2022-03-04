#!/bin/bash

wget ftp://ftp.ensembl.org/pub/release-90/gtf/sarcophilus_harrisii/*

#zcat Sarcophilus_harrisii.DEVIL7.0.90.gff3.gz | grep -w CDS | cut -f1,4,5 | bedtools sort | bedtools merge > Sarcophilus_harrisii.DEVIL7.0.90.gff3.exons.bed


# use the GTF file is better because we can get the gene ID
zcat Sarcophilus_harrisii.DEVIL7.0.90.gtf.gz | grep -w CDS | cut -f1,4,5,9 | cut -d ';' -f1 \
| sed 's/gene_id "//' | tr -d '"' | bedtools sort |bedtools merge -c 4 -o distinct \
| cut -d ',' -f1 > Sarcophilus_harrisii.DEVIL7.0.90.gtf.cds.bed
