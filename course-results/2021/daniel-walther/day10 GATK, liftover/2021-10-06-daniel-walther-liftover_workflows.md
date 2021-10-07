_daniel walther_

# day 10, liftover

## Introduction to Genome Versions

### 1: Exercise:

Most species have more than one versions of the reference genome. Please find out:
1. The name and time of the latest version for Human, Mouse and E Coli.
2. The name and time of the first version for Human, Mouse and E Coli.
3. How many reference genomes were released in total for Human, Mouse, and E Coli.

__My Answers:__
First, I searched on wikipedia, which led me to the official [List of UCSC genome releases](https://genome.ucsc.edu/FAQ/FAQreleases.html#release1) as the source for my answers:
1. latest versions
  * Human: UCSC version: hg38, Release date: Dec. 2013, Release name: Genome Reference Consortium GRCh38
  * Mouse: UCSC version: mm39, Release date: Jun. 2020, Release name: Genome Reference Consortium Mouse Build 39
  * [E. coli](https://genome-euro.ucsc.edu/cgi-bin/hgGateway?redirect=manual&source=genome.ucsc.edu): Date: 2013/09/26, GenBank assembly accession: GCA_000005845.2 (latest), RefSeq assembly accession: GCF_000005845.2 (latest)
2. first versions
  * Human: UCSC version: hg1, Release date: May 2000, Release name: UCSC-assembled (same name for the first few releases)
  * Mouse: UCSC version: mm1, Release date: Nov. 2001, Release name: MGSCv2
  * E. coli: [NCBI link](https://www.ncbi.nlm.nih.gov/nuccore/AAKB00000000.1), the oldest I could find, Date: 17 January 2007, name: AAKB01000000 (has sequences AAKB01000001 - AAKB01000019, confusing naming technique)
3. number of assemblies released:
  * Human: 18 versions
  * Mouse: 11 versions
  * E. coli: [AAKB00000000.1](https://www.ncbi.nlm.nih.gov/nuccore/AAKB00000000.1), [...0.2](https://www.ncbi.nlm.nih.gov/nuccore/AAKB00000000.2), these seem to be the oldest and newest ones. the new date seems roughly with the one I found above on UCSC (NCBI date of ...0.2: 05-DEC-2013)

### 2: Challenges:

- For human genomic data generated before 2013 , it was for sure based on an older version.
- Most data generated a few years ago were still using the old assembly.
- It creates a big pitfall when using genomic data
Can you imagine some troubles it may bring to your study or research?

__My Imaginations:__
Using the latest version (hg38), it might be hard to find other studies to compare to when many other scientists stick to older assemblies. Not using the latest version, you could investigate supposed pathogenic genome variants later deemed to be non-pathogenic and part of a new assembly. Whatever the case, the main problem and challenge will be in making sure to compare the truly homologous sequences because their corresponding positions almost certainly change between assembly versions. Liftover offer a partial resolve to this problem, fortunately.

### 3: Exercise:

What do you think of the difference between genome versions?
1. Find out the difference in _chromosome length_ between the latest patch of hg38 and the last patch of hg19. (The name and time of the first version for Human, Mouse and E Coli. - already answered in first Exercise block in this file)
2. With your favorite gene, find out its position in hg38 and hg18.

__My answers:__
1. [NCBI GRCh38](https://www.ncbi.nlm.nih.gov/grc/human/data?asm=GRCh38) vs. [NCBI GRCh37 (hg19)](https://www.ncbi.nlm.nih.gov/assembly/GCF_000001405.13/); total bases: 3,209,286,105 vs. 3,101,788,170 - hg38 is 107’497’935 bases longer.
2. position of DBN1 (Drebrin-1): in hg38 chr5:177,456,936-177,473,637 [see ucsc gen. brows.](https://genome-euro.ucsc.edu/cgi-bin/hgTracks?db=hg38&lastVirtModeType=default&lastVirtModeExtraState=&virtModeType=default&virtMode=0&nonVirtPosition=&position=chr5%3A177456936%2D177473637&hgsid=275821220_gj1fu4m7AqQkaBx81UjzaaQQszXu); in hg18 chr5:176,816,220-176,833,300 (DBN1 isoform a) [see ucsc gen. brows.](https://genome-euro.ucsc.edu/cgi-bin/hgTracks?db=hg18&lastVirtModeType=default&lastVirtModeExtraState=&virtModeType=default&virtMode=0&nonVirtPosition=&position=chr5%3A176816220%2D176833300&hgsid=275821330_5ac4N8EuYsAwiBWHt5kjpzWRYRi5)

## Introduction to the UCSC Genome Browser

### 1: Exercise:
1. Show gene TP53 in the genome browser.
2. Where is this gene? (chromosome, cytoband, and exact start and end positions)
3. How many isoforms does it have?
4. How many exons does it have?
5. What is the size of its longest exon? (roughly)
6. Find the three closest genes in upstream and downstream, respectively.

__My answers:__
1. [UCSC browser, position of TP53](https://genome-euro.ucsc.edu/cgi-bin/hgTracks?db=hg38&lastVirtModeType=default&lastVirtModeExtraState=&virtModeType=default&virtMode=0&nonVirtPosition=&position=chr17%3A7668421%2D7687490&hgsid=275821490_RcgzzhnB8lbtrSKY1u4qnfUaUZ8P)
2. chr17:7,668,421-7,687,490 cytoband p13.1
3. it looks like there is just 1 isoform of TP53 ([link](https://genome-euro.ucsc.edu/cgi-bin/hgTracks?hgsid=275821490_RcgzzhnB8lbtrSKY1u4qnfUaUZ8P&org=Human&db=hg38&position=TP53&pix=1177 )), if haplotypes are not isoforms - but I think they are (in retrospect), so 17.
4. [12 exons](https://genome-euro.ucsc.edu/cgi-bin/hgGene?hgg_gene=ENST00000620739.4&hgg_chrom=chr17&hgg_start=7668401&hgg_end=7687538&hgg_type=knownGene&db=hg38) (some haplotypes have 11, some even less)
5. roughly [7kbp long](https://genome-euro.ucsc.edu/cgi-bin/hgGene?hgg_gene=ENST00000269305.9&hgg_chrom=chr17&hgg_start=7668420&hgg_end=7687490&hgg_type=knownGene&db=hg38)
6. upstream (furthest to closest): SAT2, SHBG, ATP1B2; downstream (closest to furthest): WRAP53, EFNB3, DNAH2

### 2: Exercise:
1. Switch to hg19 and find TP53.
2. What are the start and end positions?
3. Switch to zebrafish, can you find TP53?
4. Switch to Fruitfly, can you find TP53?

__My answers:__
1. [here](https://genome-euro.ucsc.edu/cgi-bin/hgTracks?db=hg19&lastVirtModeType=default&lastVirtModeExtraState=&virtModeType=default&virtMode=0&nonVirtPosition=&position=chr17%3A7571720%2D7590868&hgsid=275822566_P7WrIEOFcGuTvNJpDuOnhDFWJYiA), although there are many transcipt variants (isoforms, alt. haplotypes). this one is trasncript variant 3
2. including UTRs hg19 chr17:7,571,720-7,590,868; coding region: hg19 chr17:7,572,927-7,579,569
3. [zebrafish tp53](https://genome-euro.ucsc.edu/cgi-bin/hgc?hgsid=275822566_P7WrIEOFcGuTvNJpDuOnhDFWJYiA&db=danRer11&c=chr5&l=24085750&r=24097329&o=24086226&t=24097805&g=ncbiRefSeqCurated&i=NM_001328587.1); [not found in fruitflies](https://genome-euro.ucsc.edu/cgi-bin/hgTracks?hgsid=275822566_P7WrIEOFcGuTvNJpDuOnhDFWJYiA&org=D.+melanogaster&db=dm6&position=tp53&pix=1177)

## Introduction to Genome Liftover

### 1: Exercise:

Liftover with UCSC Genome Browser
1. Down-lift: TP53 from hg38 to hg19
  * [this isoform used](https://genome-euro.ucsc.edu/cgi-bin/hgTracks?db=hg38&lastVirtModeType=default&lastVirtModeExtraState=&virtModeType=default&virtMode=0&nonVirtPosition=&position=chr17%3A7668421%2D7687490&hgsid=275821490_RcgzzhnB8lbtrSKY1u4qnfUaUZ8P)
  * [get bed file here](https://genome.ucsc.edu/cgi-bin/hgTables)
  * see files TP53-hg38.bed and TP53-hg19-downlift-...bed

2. Up-lift: TP53 from hg19 to hg38

3. Cross-species-lift: TP53 from human to mouse

4. Multi-step-lift: TP53 from hg38 to hg 18
