## liftOver

### Prerequ.

* download liftOver
* Download chain file from http://hgdownload.soe.ucsc.edu/downloads.html

### Usage

´./*path*/liftOver old-bed-file-path chain-file-path new-file-path unMapped-file-path´

e.g.  

´(base) [durzo@durzo-hpspectrex360convertible13ac0xx ~]$ ./liftOver /home/durzo/github/UZH-BIO392/course-results/2020/Nico-Giger/example-bed.bed hg38ToHg19.over.ch ain.gz example-newbed.bed unMapped´


## segment liftover

converts continuous segments instead of breaking them --> less allocation problems

### Usage

* -i input folder path
* -o output folder path
* chain file path
* -si input file name
* -so output file name

e.g.

´segment_liftover -l ./liftOver -i /home/durzo/github/UZH-BIO392/course-material/2020/Sep24/ -o /home/durzo/github/UZH-BIO392/course-results/2020/Nico-Giger/ -c hg38ToHg19.over.chain.gz -si segments.tsv -so seg.tsv´
