# Prelim work

This analysis is based around the following question:

>"If we did RNA-seq on a co-culture of DFTD1 and DFTD2 cells, 
>would we be able to distinguish the expression of each cell line?"

To answer this we need two pieces of information about each gene:

* Are there sufficient SNPs which can distinguish the origin of the transcript?

* Is the gene expressed highly enough so that we will obtain sufficient coverage?

To answer these questions we will need:

1. Information on the genetic variants which are specific to the DFTD1 and DFTD2 cell lines.
Preferably this will be a VCF file which contains all the variants which can distinguish the two
cell lines.
If provided with BAM files, varscan can identify those variants using "somatic" variant calling.

`java -jar VarScan.jar somatic normal.pileup tumor.pileup output.basename`

Then these variants will be filtered, so we discard variants that occur outside of exon regions.

2. RNA-seq data. We need some transcriptome data in order to identify the complement genes that 
are expressed.
This way we can say that out of the top 15,000 expressed genes, some proportion have variants 
that can distinguish cell lines.
