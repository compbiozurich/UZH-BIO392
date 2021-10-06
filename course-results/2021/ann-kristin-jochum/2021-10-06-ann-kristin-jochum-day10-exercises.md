# Exercises

## Introduction to Genome Versions

### Most species have more than one versions of the reference genome.
* The name and time of the latest version for Human, Mouse and E Coli:
  * Human: GRCh38/hg38 (17th December 2013)
  * Mouse: GRCm39/mm39 (June 2020)
  * E Coli: 
* The name and time of the first version for Human, Mouse and E Coli:
  * Human: hg1 (May 2000)
  * Mouse: MGSCv2/mm1 (November 2001)
  * E Coli:
* How many reference genomes were released in total for Human, Mouse and E Coli:
  * Human: 18
  * Mouse: 11
  * E Coli:
* Sources:
  - https://genome.ucsc.edu/FAQ/FAQreleases.html#release1

### What do you think of the difference between genome versions?
* Find out the difference in chromosome length between the latest patch of hg38 and the last patch of hg19.

Chromosome | Length (bp) in hg38 | Length (bp) in hg19
-----------|---------------------|--------------------
chr1 |	248,956,422 | 249,250,621
chr2 |	242,193,529 | 243,199,373
chr3 |	198,295,559 | 198,022,430 
chr4 |	190,214,555 | 191,154,276
chr5 |	181,538,259 | 180,915,260
chr6 |	170,805,979 | 171,115,067
chr7 |	159,345,973 | 159,138,663
chr8 |	145,138,636 | 146,364,022
chr9 |	138,394,717 | 141,213,431
chr10 |	133,797,422 | 135,534,747
chr11 |	135,086,622 | 135,006,516
chr12 |	133,275,309 | 133,851,895
chr13 |	114,364,328 | 115,169,878
chr14 |	107,043,718 | 107,349,540 
chr15 |	101,991,189 | 102,531,392
chr16 |	90,338,345 | 90,354,753
chr17 |	83,257,441 | 81,195,210
chr18 |	80,373,285 | 78,077,248
chr19 |	58,617,616 | 59,128,983
chr20 |	64,444,167 | 63,025,520
chr21 |	46,709,983 | 48,129,895
chr22 |	50,818,468 | 51,304,566
chrX |	156,040,895 | 155,270,560
chrY |	57,227,415 | 59,373,566

* With your favorite gene, find out its position in hg38 and hg18.
  * **Gene**: MLANA
  * **hg38**: chr9:5,890,889-5,910,606
  * **hg18**: chr9:5,880,909-5,899,822

## Introduction to the UCSC Genome Browser

### Part 1
* Show gene TP53 in the genome browser.
* Where is this gene? (chromosome, cytoband, and exact start and end positions)
  * **Chromosome**: 17
  * **Cytoband**: 17p13.1
  * **Start**: 7,668,421
  * **End**: 7,687,490
* How many isoforms does it have?
  * **Isoforms**: 17
* How many exons does it have?
  * **Exons**: 12
* What the size of its longest exon? (roughly)
  * **Largest exon**: roughly 1250
* Find the three closest genes in upstream and downstream, respectively.
  * **Upstream**: ATP1B2, SHBG, SAT2
  * **Downstream**: WRAP53, EFNB3, DNAH2

### Part 2
* Switch to hg19 and find TP53.
* What is the start and end positions?
  * **Start**: 7,571,720
  * **End**: 7,590,868
* Switch to zebrafish, can you find TP53?
  * Yes, TP53 at chr5:24,086,227-24,097,799
* Switch to Fruitfly, can you find TP53?
  * Yes, P53 at chr3R:23,049,657-23,053,505

## Introduction to Genome Liftover

### Part 1
* Down-lift: TP53 from hg38 to hg19
* Up-lift: TP53 from hg19 to hg38
* Cross-species-lift: TP53 from human to mouse
* Multi-step-lift: TP53 from hg38 to hg 18

