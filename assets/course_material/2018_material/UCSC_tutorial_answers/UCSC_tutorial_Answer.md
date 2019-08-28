# UCSC genome browser workshop (adapted from ASHG 2014 conference)

* Go to [UCSC Genome Browser](http://genome-euro.ucsc.edu/)
* Choose [Genome Browser]
* For 'Human Assembly', choose 'Feb.2009 (GRCh37/hg19)'
* Where is the current genomic locations shown?
__Answer__: If you used the default, you have chr21:33,031,597-33,041,570.
* What do the tracks represent? (Hint: move your cursor on the gray box on the left, you will see the description)
__Answer__: Base position, genes represented by UCSC, NCBI Refseq, Human tissue-specific expression data from GTEx, Cross-species conserved regions and common SNPs.
* Play around with the track display options below in the field "Phenotype and Disease Associations" and "Variation and Repeats".
* Click on the title of each track, e.g. Common SNPs(150) for documentation.
* What is defined as "common SNPs"? Which SNPs are shown "green" or "red"?
__Answer__: Here the SNPs from dbSNP database, using the frequency data from 1000 Genomes project. A variant is defined as if it has a MAF of at least 0.01 in any of the five super-populations: African, Admixed American, East Asian, European and South Asian.
__Answer__: Green: Coding - Synonymous; Red: Coding - Non-Synonymous/ Splice Site.

### Load custom tracks.
* Now, [hide all]
* In the Genes and Gene Prediction bluebar track group, turn on UCSC Genes to “pack”
[refresh]
* Below the Browser graphic, find button: [add custom tracks]
* See the content from [ctExamples](https://genome-euro.ucsc.edu/training/ashg2014/ctExamples.txt)
* With help from [FAQ Data File Formats](http://genome.ucsc.edu/FAQ/FAQformat.html) try to understand the track information which will be loaded.
__Answer__:
    * _BED_: contains at least three columns, chromosome, start and end. Then additional info columns. Allows visualization of genomic positions.
    * _bedGraph_: contains at least 4 columns, chromosome, start, end and data value. Allows display for data associated with values, e.g. coverage, expression level.
    * _Wiggle_: displays continuous data value, step-wise.
    * _pgSnp_: Personal Genome SNP format. For each SNP, one can upload the allele counts, frequency and quality score.

* Copy the content above into the upper box on the Custom Track input page and [Submit]
* On the new page, click into top link in the “Pos” column, labeled “chr6”
* Zoom out 10X a few times and observe the tracks.

### Visualize a list of genes.
* Go back to [UCSC Genome Browser](http://genome-euro.ucsc.edu/)
* Choose [Table Browser]
* select:
    * __group__: Genes and Gene Predictions table: knownGene
    * __table__: knownGene
    * __track__: UCSC Genes
    * __region__: genome
    * __identifiers__: copy content from [genelist](https://genome-euro.ucsc.edu/training/ashg2014/genelist)
    * __output format__: selected fields from primary and related tables
    * and [get output]
* On the new page, select from the knownGene table:
    * chrom
    * txStart
    * txEnd
* From the kgXref table, select:
    * geneSymbol
    * description
* and [get output]
* Notice that for each gene, there are more than one line of output.
* Go back to 'select':
	* __table__: knownCanonical
	and follow same steps, now you get only one isoform per gene.


### Visualize a BAM-file Custom Track.
* Now, [manage custom tracks]
* At the top of the page, select: __assembly__: hg18
* In the upload (upper) box, paste `track name=chr21_export type=bam bigDataUrl=http://genome-test.cse.ucsc.edu/ABRF2010/chr21.bam visibility=pack` and [submit]
* Navigate to this location represented in the BAM file: chr21:37,366,714-37,366,825
* Turn on the UCSC Genes and SNPs (130) tracks (This older version works because we are on hg18).
* Zoom out 10X a few times and observe the tracks
* What are the overlapping sequences? What are the red lines?
__Answer__: They are sequencing reads. Red lines are mis-alignments to the reference genome in UCSC. They can be SNPs (some do exist already in the dbSNP records) or sometimes sequencing errors.
