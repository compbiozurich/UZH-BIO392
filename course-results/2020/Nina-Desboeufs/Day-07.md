# Genome Versions, UCSC genome browser 

## 1. Genome Versions 

### Exercise 1: Reference genomes 

* The name and time of the latest version for Human, Mouse and E Coli: 
> **Human**: GRCh38/hg38 (2013 and 2019 for patch 13), GRCh38.p14 is planned for fall 2020 
> **Mouse**: GRCm39 (2020) 
> **E.Coli**: NCTC 86 (2017), U00096.3 (??)

* The name and time of the first version for Human, Mouse and E Coli.
> **Human**: NCBI Build 33, hg6 (2003)
> **Mouse**: MGSv3 (2002)
> **E.Coli**: K-12 MG1655 (1997) 

* How many reference genomes were released in total for Human, Mouse, and E Coli.
> **Human**: 3 main released (w/o .p)
> **Mouse**: 3 main released 
> **E.Coli**: 

Problematic: reproducibility of the experiments (e.g. the coordinates and the resolution differ, mistakes correction, the version is not specified). 

### Exercise 2: Difference between genome versions 
> Between GRCh37 and 38, the chromosome length changed for Chr 12 from 133,851,895 to 133,275,309. Between GRCh38.p12 and p.13, the chromosomes coordinates did not change. 

## 2. UCSC genome browser 

### Exercise 1: TP53 (with GRCh38)
* Show gene TP53 in the genome browser: 
> [here](https://genome.ucsc.edu/cgi-bin/hgTracks?db=hg38&lastVirtModeType=default&lastVirtModeExtraState=&virtModeType=default&virtMode=0&nonVirtPosition=&position=chr17%3A7668402%2D7687538&hgsid=904782393_o5uzV5yuWQgt4vS7tAC4wKFm95Ov)
* Where is this gene? (chromosome, cytoband, and exact start and end positions)
> chr17:7,668,402-7,687,538, cytoband: p13.1, start: 687, end: 538
*  How many isoforms does it have?
> 30 isoforms 
* How many exons does it have?
> 11 exons 
* What the size of its longest exon? (roughly)
> ~ 2 kb
* Find the three closest genes in upstream and downstream, respectively.
> Downstream: ATP1B2, SHBG, FXR2; Upstream: WRAP53, EFNB3, DNAH2

### Exercise 2: TP53 (with GRCh37)
Switch to hg19 and find TP53.
* What is the start and end positions?
> chr17:7,571,720-7,590,868, start: 590 and end: 868
* Switch to zebrafish, can you find TP53?
> Yes, chr5:24,086,227-24,097,805
* Switch to Fruitfly, can you find TP53?
> No. 
