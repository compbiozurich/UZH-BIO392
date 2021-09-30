# Exercises Imallona

### Ex 1

wc -l

### Ex 2

man head

### Ex 3

head -5 ~/course/data/example.bed

### Ex 4

head -5 ~/course/data/example.bed | wc -l

### Ex 5

curl -L  http://imlspenticton.uzh.ch/imallona/teaching/SP1.fq   > SP1.f

### Ex 6

c -l SP1.fq ; ls -lh SP1.fq 

### Ex 7

awk 'NR % 4 == 2 {print $0}' SP1.fq | wc -l

### Ex 8

@` is a valid quality score, so lines of phred scores will be counted as well when using grep

### Ex 9

```awk 'NR % 4 == 2 {print $0}' SP1.fq``` or ```awk 'NR % 4 == 2' SP1.fq```


### Ex 10

awk '{print NR}' SP1.fq  
prepend linenumbers:  
awk '{print NR, $0 }' SP1.fq  

### Ex 11

awk 'NR % 4 == 1' SP1.fq | head  # get header line  
awk 'NR % 4 == 2' SP1.fq | head  # get sequence line  
awk 'NR % 4 == 3' SP1.fq | head  # get comment line  
awk 'NR % 4 == 0' SP1.fq | head  # get quality line  

### Ex 12

awk 'NR % 4 == 1 {print ">"$1}; NR % 4 == 2 {print $0}' SP1.fq 

### Ex 13

awk 'NR % 4 == 1 {print ">"$1}; NR % 4 == 2 {print $0}' SP1.fq > example.fa

### Ex 14

awk 'NR % 4 == 1' SP1.fq | wc -l
awk 'NR % 2 == 1' example.fa | wc -l

### Ex 15 SAM format

curl -L https://github.com/samtools/samtools/raw/develop/examples/ex1.sam.gz \
  > ex1.sam.gz

gunzip ex1.sam.gz

### Ex 16 BED format BED6 to BED3

awk -v OFS='\t' '{print $1,$2,$3}' a.bed  

```-v OFS='\t'``` specifies the output field separator: a tab (\t).

### Ex 17 BED3 to BED6

awk -v OFS='\t' '{print $1,$2,$3,"unspecified strand",0,"."}' recordsOutOfOrder.bed  

### Ex 18 Add a nucleotide to the start and subtract a nucleotide to the end to all records, regardless of the strand, to the file

awk -v OFS='\t' '{print $1,$2+1,$3-1,$4,$5,$6}' a.bed

### Ex 19

cat ~/course/soft/bedtools2/test/intersect/a.bed  
cat ~/course/soft/bedtools2/test/intersect/b.bed  

-> both files are BED6

### Ex 20

```bedtools intersect -a a.bed -b b.bed```  

**output:**  
chr1    100     101     a2      2       -
chr1    100     110     a2      2       -

### Ex 21

```bedtools intersect -b a.bed -a b.bed```  

**output:**  
chr1    100     101     b2      2       -
chr1    100     110     b3      3       +

### Ex 22

bedtools intersect -s -a a.bed -b b.bed

### Ex 23

bedtools intersect -v -a a.bed -b b.bed

### Ex 24

bedtools intersect -wao -a a.bed -b b.bed

### Ex 25 GTF

curl -L http://genomedata.org/rnaseq-tutorial/annotations/GRCh38/chr22_with_ERCC92.gtf > chr22_with_ERCC92.gtf

### Ex 26 Retrieve the details of transcript ENST00000342247 (tip: use grep) from the chr22_with_ERCC92.gtf file. Then, retrieve the details of the exons of transcript ENST00000342247 (tip: use grep after the grep). How many exons are they?

grep ENST00000342247 chr22_with_ERCC92.gtf | grep "exon\s" | wc -l

### Ex 27

rep start_codon chr22_with_ERCC92.gtf |  wc -l; grep stop_codon chr22_with_ERCC92.gtf |  wc -l

### Ex 28 VCF

Install old version of VCFtools:  


cd ~/course/soft/
curl -L https://sourceforge.net/projects/vcftools/files/vcftools_0.1.13.tar.gz/download > vcftools.tar.gz

tar xzvf vcftools.tar.gz
cd vcftools_0.1.13/
make 

### Ex 29

### Ex 30

find ~/course/soft/vcftools_0.1.13 -name "*vcf*" -type f

### Ex 31

alias vcftools='~/course/soft/vcftools_0.1.13/bin/vcftools'
vcftools

### Ex 32

vcftools --vcf ~/course/soft/vcftools_0.1.13/examples/merge-test-a.vcf

## Project: mobile elements insertions in 1000genomes data

### Ex 33+34

load file: CEU.low_coverage.2010_10.MobileElementInsertions.sites.vcf
and file: exons.bed

--> check bedtools intersect
--> Problem: the 2 files have not same annotation, for one resource `chromosome 1` is encoded as `chr1`, and `1` for the other 

to harmonize the files, we need to remove the 'chr' from the exons.bed file:  

`awk -v OFS='\t' '{print substr($1,4) ,$2,$3,$4,$5,$6}' exons.bed > exons_nochr.bed`  
or  
`sed 's/^chr//g' exons.bed > exons_nochr.bed`

--> ‘s/regexp/replacement/flags’ s: substitute, the regular expression with the replacement (in our case with nothing) and flag /g: do replacement for all matches to regex.  

and then check for intersects and count them:

`bedtools intersect -b exons_nochr.bed -a CEU.low_coverage.2010_10.MobileElementInsertions.sites.vcf | wc -l`  
--> 110 insertions overlapping exons

`wc -l CEU.low_coverage.2010_10.MobileElementInsertions.sites.vcf`  
--> from total 3225 insertions  

110/3225 = 3.4% --> only a small proportion of all insertions are in exones!  

### Ex35 mobile elements insertions, and given they're not particularly present in exons, where do they insert preferentially? In active or inactive regions?

load hesc.chromHmm.bed --> remove 'chr' notation to match CEUlow_coverage.2010_10.MobileElementInsertions.sites.vcf file.  

`sed 's/^chr//g' hesc.chromHmm.bed > hesc.chromHmm_nochr.bed`

To check the abundance of variants per chromatin state, we'll intersect the variants file with the chromatin states one, print the column with the states, and count the number of items output format of uniq -c: number of bed records (first column), grouped by chromatin state (second column).  

`bedtools intersect  -b CEU.low_coverage.2010_10.MobileElementInsertions.sites.vcf   -a  hesc.chromHmm_nochr.bed | awk '{print $4}' | sort | uniq -c | sort -V`  





