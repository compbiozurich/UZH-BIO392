It is almost impossible to get a reference genome since all the humans have different polymorphisms.

## Exercises (slide 4)
1. Name and time of the latest version for Human ,Mouse and E.Coli: GRCh38 (for humans)
2. Name and time of the first verion for Human, Mouse and E.Coli:
3. How many reference genomes were release in total for Human, Mouse and E.Coli:

|      |Latest Version|First Version|# released reference genomes in total|
-------|--------------|-------------|-------------------------------------|
Human | hg38 (2013) | hg1 (2000) | 18
Mouse | mm39 (2020) | mm1(2001) | 11
E. Coli | ASM584v2 (2013) | ASM584v2 (2013) | 1

## Exercises (slide 6)
1. Find out the difference in chromosome length between the latest patch of hg38 and the last patch of hg19.

    | Chromosome | Difference (from hg19 to hg38) |
    |----------|------------------------------|
    | 1 | -294199 |
    | 2 | -1005844 |
    | 3 | -4726871 |
    | 4 | -939721 |
    5 | +622999
    6 | -309088
    7 | +207310
    8 | -1225386
    9 | -2818714
    10 | -1737325
    11 | +80106
    12 | -576586
    13 | -805550
    14 | -305822
    15 | -540203
    16 | -16408
    17 | +2062231
    18 | +2296037
    19 | 0
    20 | +1418647
    21 | -1419912
    22 | -486098
    X | +770335
    Y | -2146151

2. With your favourite gene, find out its position in hg38 and hg18.
hg38: chr3  46370 46380
hg18: chr3	88052	88062

## Exercises (slide 10)
1. Show gene TP53 in the genome browser: https://genome.ucsc.edu/cgi-bin/hgGene?hgg_gene=ENST00000269305.9&hgg_chrom=chr17&hgg_start=7668420&hgg_end=7687490&hgg_type=knownGene&db=hg38
2. Where is this gene? (chromosome, cytoband, and exact start and end positions): chr17:7,668,421-7,687,490
3. How many isoforms does it have? 9
4. How many exons does it have? 11
5. What is the size of its longest exon (roughly)? 160 nt
6. Find the three closest genes in upstream and downstream, respectively. Upstream: WRAP53, EFNB3, DNAH2. Downstream: ATP1B2, SHBG, SAT2.

## Exercises (slide 11)
1. Switch to hg19 and find TP53.
2. What is the start and end positions? chr17:7,571,720-7,590,868
3. Switch to zebrafish, can you find TP53? chr5:24,086,227-24,097,799
4. Switch to fruitly, can you find TP53? No

## Exercises (slide 14)
1. Down-lift: TP53 from hg38 to hg19: chr17:7765103-7784172
2. Up-lift: TP53 from hg19 to hg38: chr17:7668402-7687550
3. Cross-species-lift: TP53 from human to mouse: chr11:69471228-69482695
4. Multi-step-lift: TP53 from hg38 to hg18: chr17:7705828-7724897

## Exercises (slide 15)
1. Liftover multiple positions with a BED file.
2. Lift a larger range and interpret the result.
3. Limitations of the liftover: The liftover fails to convert if for example the sequence intersects no chains, if the sequence insufficiently intersects one or multiple chains or if the start or end base in an exon is missing.
