* download liftOver
* Download chain file from http://hgdownload.soe.ucsc.edu/downloads.html
* In Terminal:  /pathToLiftover/liftOver oldFile /pathToLiftover/map.chain newFile unMapped

### generall liftOver code

./liftOver /home/durzo/github/UZH-BIO392/course-results/2020/Nico-Giger/example-bed.bed hg38ToHg19.over.chain.gz unMapped

e.g.
### input
(base) [durzo@durzo-hpspectrex360convertible13ac0xx ~]$ ./liftOver /home/durzo/github/UZH-BIO392/course-results/2020/Nico-Giger/example-bed.bed hg38ToHg19.over.ch ain.gz example-newbed.bed unMapped

### output

Reading liftover chains
Mapping coordinates
