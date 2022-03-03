#!/bin/bash

wget ftp://ftp.ensembl.org/pub/release-90/gtf/sarcophilus_harrisii/*

zcat Sarcophilus_harrisii.DEVIL7.0.90.gff3.gz | grep -w CDS | cut -f1,4,5 | bedtools sort | bedtools merge > Sarcophilus_harrisii.DEVIL7.0.90.gff3.exons.bed

