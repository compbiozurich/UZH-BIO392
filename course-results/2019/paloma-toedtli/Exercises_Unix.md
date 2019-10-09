
# Exercises in the terminal


## Exercise 1

``` bash
cd ~/course/data
wc -l example.bed # displays nb of lines

# output
	9 example.bed
```

## Exercise 2

``` bash
man head
q # to exit
```

## Exercise 3

``` bash
head -5 example.bed

#output
chr7  127471196  127472363  Pos1  0  +  127471196  127472363  255,0,0
chr7  127472363  127473530  Pos2  0  +  127472363  127473530  255,0,0
chr7  127473530  127474697  Pos3  0  +  127473530  127474697  255,0,0
chr7  127474697  127475864  Pos4  0  +  127474697  127475864  255,0,0
chr7  127475864  127477031  Neg1  0  -  127475864  127477031  0,0,255
```

## Exercise 4 

``` bash
head -5 example.bed | wc -l #displays nb of lines in head -5

# output
	5
```

## FASTQ/A Exercises 


## Exercise 5

``` bash
curl -L https://molb7621.github.io/workshop/_downloads/SP1.fq > SP1.fq # -L, --location (HTTP)  If  the server reports that the requested page has moved to a different location (indicated with a Location: header and a 3XX response code), this option will make curl redo the request on the  new  place.
# the line creates a file SP1.fq and paste the content of the link in it
```

## Exercise 6

``` bash
wc -l SP1.fq #nb of lines
ls -lh SP1.fq # ls -h      When used with the -l option, use unit suffixes: Byte, Kilobyte, Megabyte, Gigabyte, Terabyte and Petabyte in order to reduce the number of digits to three or less using base 2 for sizes.
head SP1.fq # visualize the 10 first lines of SP1.fq
```

## Exercise 7

```bash
wc -l SP1.fq | awk '{print $1/4}' # awk print the first variable of wc -l (=1000) and divides by 4

# output 
250
```

## Exercise 8

```bash grep``` doesn't work because the Phred quality can contain the ```bash @```character, as it is encoded in ASCII format.

## Exercise 9

```bash
awk 'NR%4==2' SP1.fq > extracted_sqSP1.txt #extract the sequences and put it in a separated new file.

```

## Exercise 10

```bash
awk '{print NR}' SP1.fq # prints the number of each line
awk '{print NR, $0}' SP1.fq #prints the number of each line followed by the entire line

```

## Exercise 11

```bash
awk 'NR % 4 == 1' SP1.fq | head  # 10 first headers
awk 'NR % 4 == 2' SP1.fq | head  # 10 first sequences
awk 'NR % 4 == 3' SP1.fq | head  # 10 first comment lines 
awk 'NR % 4 == 0' SP1.fq | head  # 10 first quality lines
```

## Exercise 12

```bash
awk 'NR%4==1 {printf(">%s\n",substr($0,2))}; NR%4==2 {print}' SP1.fq | head

# output
>cluster_2:UMI_ATTCCG
TTTCCGGGGCACATAATCTTCAGCCGGGCGC
>cluster_8:UMI_CTTTGA
TATCCTTGCAATACTCTCCGAACGGGAGAGC
>cluster_12:UMI_GGTCAA
GCAGTTTAAGATCATTTTATTGAAGAGCAAG
>cluster_21:UMI_AGAACA
GGCATTGCAAAATTTATTACACCCCCAGATC
>cluster_29:UMI_GCAGGA
CCCCCTTAAATAGCTGTTTATTTGGCCCCAG
```

## Exercise 13

```bash
awk 'NR%4==1 {printf(">%s\n",substr($0,2))}; NR%4==2 {print}' SP1.fq > SP1.fa


```

## Exercise 14

```bash
awk 'NR%4==2' SP1.fq | wc -l # counts the sequences in fq file

# output
	250

awk 'NR%2==0' SP1.fa | wc -l # counts also sequences (=each second lines) but in fa file

# output
	250
```

## Exercise 15

```bash
curl -L https://github.com/samtools/samtools/raw/develop/examples/ex1.sam.gz > ex1.sam.gz
gunzip ex1.sam.gz # unzip
head ex1.sam # enough to inspect it 
```

## Exercise 16

```bash
awk 'BEGIN {OFS="\t"} {print $1, $2, $3}' a.bed > a_bed3.bed

head a.bed

# output
chr1    10      20      a1      1       +
chr1    100     200     a2      2       -

head a_bed3.bed

# output
chr1    10      20
chr1    100     200
```

## Exercise 17

```bash
awk -v OFS='\t' '{print $1,$2,$3," ","0","."}' recordsOutOfOrder.bed > recordsOutOfOrder_bed6.bed 

# or

awk 'BEGIN {OFS = "\t"} {print $1,$2,$3," ",0,"."}' recordsOutOfOrder.bed > recordsOutOfOrder_bed6.bed

head recordsOutOfOrder.bed

# output 
chr1    20      30
chr1    40      50
chr1    15      60
chr1    70      80

head recordsOutOfOrder_bed6.bed

# output
chr1    20      30              0       .
chr1    40      50              0       .
chr1    15      60              0       .
chr1    70      80              0       .
```

## Exercise 18

```bash
awk -v OFS='\t' '{print $1,$2-1,$3+1,$4,$5,$6}' a.bed > a_changed.bed #to add a nucleotide to the start, the previous one is added -> $2-1, to subtract a nucleotide to the end, the end corresponds to the previous one -> $3-1

head a.bed

# output
chr1    10      20      a1      1       +
chr1    100     200     a2      2       -

head a_bed3.bed

# output
chr1    9      21
chr1    99     201
```

## Exercise 19

```bash
head a.bed 

# output
chr1	10	20	a1	1	+
chr1	100	200	a2	2	-

head b.bed 

# output
chr1	20	30	b1	1	+
chr1	90	101	b2	2	-
chr1	100	110	b3	3	+
chr1	200	210	b4	4	+

#They are both BED6 format
```

## Exercise 20

```bash
bedtools intersect -a a.bed -b b.bed

# output
chr1	100	101	a2	2	-
chr1	100	110	a2	2	-
```

## Exercise 21

```bash
bedtools intersect -b a.bed -a b.bed

# output
chr1	100	101	b2	2	-
chr1	100	110	b3	3	+

```

## Exercise 22

```bash
bedtools intersect -s -a a.bed -b b.bed # -s = strandedness only reports hits in B that overlap A on the same strand. By default, overlaps are reported without respect to strand.

# output
chr1	100	101	a2	2	-
```

## Exercise 23

```bash
bedtools intersect -v -a a.bed -b b.bed # Only report those entries in A that have no overlap in B

# output
chr1	10	20	a1	1	+
```

## Exercise 24

```bash
bedtools intersect -wao -a a.bed -b b.bed # write the original A and B entries plus the number of base pairs of overlap between the two features.

# output
chr1	10	20	a1	1	+	.	-1	-1	.	-1	.	0
chr1	100	200	a2	2	-	chr1	90	101	b2	2	-	1
chr1	100	200	a2	2	-	chr1	100	110	b3	3	+	10
```

## Exercise 25

```bash
curl -L http://genomedata.org/rnaseq-tutorial/annotations/GRCh38/chr22_with_ERCC92.gtf > chr22_with_ERCC92.gtf

head -n 2 chr22_with_ERCC92.gtf

# output
22	ensembl	gene	10736171	10736283	.	-	.	gene_id "ENSG00000277248"; gene_version "1"; gene_name "U2"; gene_source "ensembl"; gene_biotype "snRNA";
22	ensembl	transcript	10736171	10736283	.	-	.	gene_id "ENSG00000277248"; gene_version "1"; transcript_id "ENST00000615943"; transcript_version "1"; gene_name "U2"; gene_source "ensembl"; gene_biotype "snRNA"; transcript_name "U2.14-201"; transcript_source "ensembl"; transcript_biotype "snRNA"; tag "basic"; transcript_support_level "NA";

wc -l chr22_with_ERCC92.gtf

# output
56295 chr22_with_ERCC92.gtf
```

## Exercise 26

 The grep utility searches any given input files, selecting lines that match one or more patterns.

```bash
grep ENST00000342247 chr22_with_ERCC92.gtf # searches for the transcripts of this ID

grep ENST00000342247 chr22_with_ERCC92.gtf | grep "exon\s" # searches for the exons corresponding to this ID

grep ENST00000342247 chr22_with_ERCC92.gtf | grep "exon\s" | wc -l # number of exon types. \s = space

# output
	20
```

## Exercise 27

```bash
grep start_codon chr22_with_ERCC92.gtf | wc -l

# output 
	1856

grep stop_codon chr22_with_ERCC92.gtf | wc -l

# output
	1613
```

## Exercise 28

```bash
curl -L https://sourceforge.net/projects/vcftools/files/vcftools_0.1.13.tar.gz/download > vcftools.tar.gz # to download the content of the link into a new file 

tar xzvf vcftools.tar.gz
cd vcftools_0.1.13/
make
```

## Exercise 29

Latest tag on Sept the 23rd 2019 is tag named v0.1.16 (released Aug 2nd 2018) https://github.com/vcftools/vcftools/releases

## Exercise 30

```bash
find ~/course/soft/vcftools_0.1.13 -name "*vcf" -type f # have to write the entire path ?  -type f True if the file is of the specified type f = regular file

#output
/Users/ptoedt/course/soft/vcftools_0.1.13/perl/tab-to-vcf
/Users/ptoedt/course/soft/vcftools_0.1.13/examples/cmp-test-b.vcf
/Users/ptoedt/course/soft/vcftools_0.1.13/examples/valid-3.3.vcf
/Users/ptoedt/course/soft/vcftools_0.1.13/examples/cmp-test-a.vcf
/Users/ptoedt/course/soft/vcftools_0.1.13/examples/consensus.vcf
/Users/ptoedt/course/soft/vcftools_0.1.13/examples/subset.vcf
/Users/ptoedt/course/soft/vcftools_0.1.13/examples/parse-test.vcf
/Users/ptoedt/course/soft/vcftools_0.1.13/examples/concat-c.vcf
/Users/ptoedt/course/soft/vcftools_0.1.13/examples/merge-test-a.vcf
/Users/ptoedt/course/soft/vcftools_0.1.13/examples/concat-b.vcf
/Users/ptoedt/course/soft/vcftools_0.1.13/examples/merge-test-b.vcf
/Users/ptoedt/course/soft/vcftools_0.1.13/examples/fix-ploidy.vcf
/Users/ptoedt/course/soft/vcftools_0.1.13/examples/merge-test-c.vcf
/Users/ptoedt/course/soft/vcftools_0.1.13/examples/concat-a.vcf
/Users/ptoedt/course/soft/vcftools_0.1.13/examples/valid-4.1.vcf
/Users/ptoedt/course/soft/vcftools_0.1.13/examples/valid-4.0.vcf
/Users/ptoedt/course/soft/vcftools_0.1.13/examples/floats.vcf
/Users/ptoedt/course/soft/vcftools_0.1.13/examples/indel-stats.vcf
/Users/ptoedt/course/soft/vcftools_0.1.13/examples/shuffle-test.vcf
/Users/ptoedt/course/soft/vcftools_0.1.13/examples/contrast.vcf
/Users/ptoedt/course/soft/vcftools_0.1.13/examples/annotate-test.vcf
/Users/ptoedt/course/soft/vcftools_0.1.13/examples/cmp-test-b-3.3.vcf
/Users/ptoedt/course/soft/vcftools_0.1.13/examples/invalid-4.0.vcf
/Users/ptoedt/course/soft/vcftools_0.1.13/examples/cmp-test-a-3.3.vcf
```

## Exercise 31

```bash
alias vcftools='~/course/soft/vcftools_0.1.13/bin/vcftools'
vcftools

# output
VCFtools (v0.1.13)
© Adam Auton and Anthony Marcketta 2009

Process Variant Call Format files

For a list of options, please go to:
	https://vcftools.github.io/examples.html

Questions, comments, and suggestions should be emailed to:
	vcftools-help@lists.sourceforge.net


```


## Exercise 32

VCFtools analyses the VCFtools files and outputs the number of variants and the number of individuals in the files.

```bash
cd ~/course/soft/vcftools_0.1.13/examples
vcftools --vcf merge-test-a.vcf 

# output
VCFtools - v0.1.13
(C) Adam Auton and Anthony Marcketta 2009

Parameters as interpreted:
	--vcf merge-test-a.vcf

After filtering, kept 1 out of 1 Individuals
After filtering, kept 9 out of a possible 9 Sites
Run Time = 0.00 seconds
```

## Real data Integration


## Exercise 33

```bash
cd ~/course/data

curl -L ftp://ftp.1000genomes.ebi.ac.uk/vol1/ftp/pilot_data/paper_data_sets/a_map_of_human_variation/low_coverage/sv/CEU.low_coverage.2010_10.MobileElementInsertions.sites.vcf.gz > CEU.low_coverage.2010_10.MobileElementInsertions.sites.vcf.gz

gunzip CEU.low_coverage.2010_10.MobileElementInsertions.sites.vcf.gz

wc -l CEU.low_coverage.2010_10.MobileElementInsertions.sites.vcf
    
# output
	3225 CEU.low_coverage.2010_10.MobileElementInsertions.sites.vcf


vcftools --vcf CEU.low_coverage.2010_10.MobileElementInsertions.sites.vcf

# output
VCFtools - v0.1.13
(C) Adam Auton and Anthony Marcketta 2009

Parameters as interpreted:
	--vcf CEU.low_coverage.2010_10.MobileElementInsertions.sites.vcf

After filtering, kept 0 out of 0 Individuals
After filtering, kept 3201 out of a possible 3201 Sites
Run Time = 0.00 seconds
```
## Exercise 34

```bash
curl -O https://s3.amazonaws.com/bedtools-tutorials/web/exons.bed # -O : Write output to a local file named like the remote file we get.  (Only  the  file part of the remote file is used, the path is cut off.)

bedtools intersect -a CEU.low_coverage.2010_10.MobileElementInsertions.sites.vcf -b exons.bed

# this doesn't work because it doesn't have the same names. In exon.bed the name of Christ are chr1, chr2 ... while in CEU file it's 1,2,... 

sed 's/^chr//g' exons.bed > exons_nochr.bed # remove the chr in exon file = convention name. g = global replacement (all occurrences).

bedtools intersect -a CEU.low_coverage.2010_10.MobileElementInsertions.sites.vcf -b exons_nochr.bed

tail CEU.low_coverage.2010_10.MobileElementInsertions.sites.vcf
tail exons.bed # shows 10 last lines, used instead of head because of long headers

bedtools intersect -a CEU.low_coverage.2010_10.MobileElementInsertions.sites.vcf -b exons_nochr.bed | wc -l

# output 
	110
```
## Exercise 35

```bash
curl -O https://s3.amazonaws.com/bedtools-tutorials/web/hesc.chromHmm.bed
sed 's/^chr//g' hesc.chromHmm.bed > hesc.chromHmm_nochr.bed # removes chr


bedtools intersect -b CEU.low_coverage.2010_10.MobileElementInsertions.sites.vcf -a  hesc.chromHmm_nochr.bed | head -n 4 # first four elements just to see

# output
1	4188314	4188313	13_Heterochrom/lo
1	5856873	5856872	13_Heterochrom/lo
1	8369213	8369212	13_Heterochrom/lo
1	8424578	8424577	10_Txn_Elongation


bedtools intersect -b CEU.low_coverage.2010_10.MobileElementInsertions.sites.vcf -a  hesc.chromHmm_nochr.bed | awk '{print $4}' | sort | uniq -c # selects the 4th column, sorts it and counts the different items

# output
  74 10_Txn_Elongation
 490 11_Weak_Txn
  31 12_Repressed
2334 13_Heterochrom/lo
   2 14_Repetitive/CNV
   3 15_Repetitive/CNV
   3 1_Active_Promoter
  20 2_Weak_Promoter
  19 3_Poised_Promoter
   7 4_Strong_Enhancer
   7 5_Strong_Enhancer
  45 6_Weak_Enhancer
  79 7_Weak_Enhancer
  33 8_Insulator
  24 9_Txn_Transition

awk '{print $4}' hesc.chromHmm_nochr.bed | sort | uniq -c # to compare the intersect result with the original file

# output
17027 10_Txn_Elongation
118002 11_Weak_Txn
17589 12_Repressed
91228 13_Heterochrom/lo
3716 14_Repetitive/CNV
2439 15_Repetitive/CNV
12475 1_Active_Promoter
31965 2_Weak_Promoter
11570 3_Poised_Promoter
5264 4_Strong_Enhancer
12812 5_Strong_Enhancer
84576 6_Weak_Enhancer
137484 7_Weak_Enhancer
60691 8_Insulator
12223 9_Txn_Transition

```
## Exercise 36

BEDtools tutorial
