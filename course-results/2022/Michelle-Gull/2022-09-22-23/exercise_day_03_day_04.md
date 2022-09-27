# Structure and known issues

If run on a terminal within Windows or a git bash: several commands missing, e.g. manpages.

If run on renku: manpages missing (because it's a minimal image). Renku repository to fork/run the exercises with: https://renkulab.io/projects/izaskun.mallona/uzh-bio392

If run on renku: notice you might be either under `/home/rstudio` or `/work/uzh-bio392`, please take this into account when using aliases and check `pwd` to print your current location if you cannot find your files using the terminal.

If run on iMacs: compilation will fail unless defining SDK headers. To fix this:

```
## either run 
(this will stick until you open a new Terminal window or quit and reopen Terminal)
export CPATH=`xcrun --show-sdk-path`/usr/include

## or (permanent solution) add this line to .zshrc or .bashrc
export CPATH=`xcrun --show-sdk-path`/usr/include
```

# Introduction

Please run the tutorial at [SIB Course on UNIX](https://edu.sib.swiss/pluginfile.php/2878/mod_resource/content/4/couselab-html/content.html) first.

Cheatsheets:

* [Shell](https://files.fosswire.com/2007/08/fwunixref.pdf)
* [awk](https://gist.github.com/Rafe/3102414)

For extra/advanced reading, please check the following tutorials on bash and awk:

* [Shell](http://www.grymoire.com/Unix/Sh.html)
* [awk](http://www.grymoire.com/Unix/Awk.html)

# Set up

## Folders

Setting up a working directory with folders


```bash
cd ~ # goes to the home directory
mkdir -p course
ls -l course

mkdir -p course/soft course/data course/output

ls -l course

```

## Retrieving data

Downloading text files and checking their details.

```bash
cd  ~/course/data

curl http://imlspenticton.uzh.ch/imallona/teaching/example.bed \
   > example.bed

curl https://raw.githubusercontent.com/arq5x/bedtools/master/genomes/human.hg19.genome \
   > hg19.genome

## to know the filetype
file example.bed

## to check the size
ls -lah example.bed

## to inspect the first lines of the file (head of the file)
head example.bed

## similarly for the other file, is it a full genome?
file hg19.genome
ls -lah hg19.genome
head hg19.genome

```

## Executable software download

Some authors release their programs as both source code and binaries (executables). First, we'll download `bedToBigBed` as an executable. UCSC offers these executables in several OS flavours in http://hgdownload.soe.ucsc.edu/admin/exe . Please update the URL to retrieve those matching your system (Mac or Linux).

You can skip this step if you are using renku (i.e. `bedToBigBed` is already installed).


```bash

mkdir ~/course/soft/kent
cd ~/course/soft/kent

pwd  # printing current directory

## executable download for Mac (notice the `macOSX.x86_64` part of the URL)
curl http://hgdownload.soe.ucsc.edu/admin/exe/macOSX.x86_64/bedToBigBed \
     > bedToBigBed

## executable download for Linux (notice the `linux.x86_64` part of the URL)
# curl http://hgdownload.soe.ucsc.edu/admin/exe/linux.x86_64/bedToBigBed \
#      > bedToBigBed

file bedToBigBed

## adding exec permissions to the binary
chmod a+x bedToBigBed

```

To test the usage, you could execute the binary specifying its location in the working directory (`./bedToBigBed`) or without if it's in the $PATH (e.g. if using renku)

```bash
## running the actual command if the executable is in this folder
./bedToBigBed ../../data/example.bed ../../data/hg19.genome ~/course/output/out.bb

## running the command if the executable is in the $PATH
bedToBigBed ../../data/example.bed ../../data/hg19.genome ~/course/output/out.bb

ls -lah ~/course/data/example.bed
ls -lah ~/course/output/out.bb
file ~/course/output/out.bb

```

## Software compiling (bedtools)

Retrieving bedtools and compiling it using a Makefile. [Extra reading about Makefiles](https://www.gnu.org/software/make/manual/make.html) and about [compiling from source](https://www.linuxandubuntu.com/home/basics-of-compiling-software-from-source-code-in-linux).

(Run this step regardless of whether using renku/your computer, as it will also retrieve data.)

Note on zlib errors under linux: you might need to install zlib1g-dev or zlib if you find compilation errors related to missing `lz`. For that and under Debian/Ubuntu, please run `sudo apt install zlib1g-dev`.

```bash

cd ~/course/soft

curl -L  https://github.com/arq5x/bedtools2/releases/download/v2.30.0/bedtools-2.30.0.tar.gz \
  > bedtools-2.30.0.tar.gz

tar zxvf bedtools-2.30.0.tar.gz
cd bedtools2
```
 
```bash
## interpret the Makefile recipe, compile bedtools' source code
make  ## will take time!

# we compiled the software as a non-root user; hence, the binary is not in the $PATH
#   (http://www.linfo.org/path_env_var.html)
# alias the binary, so typing `bedtools` will suffice to run the binary,
##   without specifying the full path to the binary
alias bedtools='~/course/soft/bedtools2/bin/bedtools'

# in renku, could be something like:
#alias bedtools='/home/rstudio/course/soft/bedtools2/bin/bedtools'

bedtools --help

```

## Exercise 1

Find the number of lines of the file `~/course/data/example.bed`

<details><summary>Answer</summary>
<p>

Note the `-l` flag
```bash
wc -l ~/course/data/example.bed
```

</p>
</details>


## Exercise 2

Get the manual page of `head`, what is this command for?

<details><summary>Answer</summary>
<p>

```bash
man head
```

</p>
</details>

## Exercise 3

Get the first 5 lines of the file `~/course/data/example.bed`

<details><summary>Answer</summary>
<p>

```bash
head -5 ~/course/data/example.bed
```

</p>
</details>

## Exercise 4

Using pipes (`|`): chain the `head -5` command before with  `wc -l` to make sure the number of lines was as expected (5).



<details><summary>Answer</summary>
<p>

```bash
head -5 ~/course/data/example.bed | wc -l
```

</p>
</details>


# FASTQ/A Exercises

DISCLAIMER: data is based upon the beautiful Genome Analysis Workshop (MOLB 7621) Course on genome analysis at the University of Colorado SOM at [https://github.com/MOLB7621](https://github.com/MOLB7621)

## Exercise 5

Retrieve the data for these exercises (mind the path you're working at, should be `~/course/data`).

The path for URL for the data is http://imlspenticton.uzh.ch/imallona/teaching/SP1.fq


<details><summary>
Answer
</summary>

<p>

```bash
cd ~/course/data
curl -L http://imlspenticton.uzh.ch/imallona/teaching/SP1.fq  \
   > SP1.fq
```

</p>
</details>


##  Exercise 6

(Source: [MOLB7621](https://molb7621.github.io/workshop/Syllabus.html))

Inspect the file from the previous exercise (file size, number of lines, and visualize its head)


<details><summary>
Answer
</summary>

<p>

```bash
cd  ~/course/data
ls -lh SP1.fq
wc -l SP1.fq

head SP1.fq
```

</p>
</details>

## Exercise 7

(Source: [MOLB7621](https://molb7621.github.io/workshop/Syllabus.html))

The FASTQ file stored at `~/course/data/SP1.fq` is in [FASTQ](https://en.wikipedia.org/wiki/FASTQ_format) format, meaning it contains 4 lines per read sequence. 

```bash
head -n 4 SP1.fq
```

produces

```
@A01251:208:HJVFJDRXY:2:2101:23782:1000 1:N:0:CGCTCATT
TNGAAAATGATAAAAACCACACTGTAGAACAGATTAGATGAGTGAGTTACACTGAAAAACACATTCTTTGGAAACGGGATTTGTAGAATAGTGTATATCAATGAGTTACAATGAGAAACATGTAAAATTAAAAAAACCACAAAGTACAACA
+
F#FFFFFFFFFFFFFFFFFFFFFF:F:FFFFFFFFFFFFFFFFFFF:FFFFFFFFFFFFFFFFFFF,FFFFFFFF,FFF,FFFFFFFF,FFFFFFFFFFFFFFFFFFFFFFFFF:FF::,,F,FFF,F,:,FFFFFF,F,F,,F,:,,F,:
```

* So Line 1 contains a sequence identifier that begins with an `@`
* Line 2 contains the read sequence (A,T,C,G,N) 
* Line 3 is a comment line, often unused and only contains a `+` 
* Line 4 is the Phred quality score for each sequence encoded in ASCII format 

First use ``wc`` and ``awk`` to determine the number of *sequences* in the fastq 


<details><summary>
Answer
</summary>

<p>

```bash
cd ~/course/data/
wc -l SP1.fq  # total number of lines
wc -l SP1.fq | awk '{print $1 / 4}' # total number of fastq records

```
</p>
</details>

## Exercise 8

(Source: [MOLB7621](https://molb7621.github.io/workshop/Syllabus.html))

A common mistake is to use ``grep`` to pattern match the ``@`` in the
sequence identifier. Why doesn't this work?

```bash
wc -l SP1.fq | awk '{print $1 / 4}'
```
renders `10`

```bash
grep -c "@" SP1.fq
```
renders `12`.
<details><summary>
Answer
</summary>

<p>
`@` is a valid quality score, so lines of phred scores will be counted as well when using grep
</p>
</details>

## Exercise 9

(Source: [MOLB7621](https://molb7621.github.io/workshop/Syllabus.html))

Next, extract out the read *sequences* from the fastq. This is a bit
complicated as we need to only pull out the second line from each record. 



<details><summary>
Answer
</summary>

<p>


One approach to this problem is to use the ``%`` `modulo
operator` ([Wikipedia](https://en.wikipedia.org/wiki/Modulo_operation)), which returns
the remainder after division of two integers. For example using ``awk``

```bash
awk 'BEGIN { {print 4 % 2}}'
awk 'BEGIN { {print 4 % 3}}'
awk 'BEGIN { {print 5 % 3}}'
awk 'BEGIN { {print 1 % 4}}'
```

In ``awk`` there is a special variable ``NR`` which is equal to the
current line number.

So let's extract the sequences of the fasta file `SP1.fq`


```bash

awk 'NR%4==2'   ~/course/data/SP1.fq

```

</p>
</details>

## Exercise 10

Print the line numbers of the file `SP1.fq`

<details><summary>
Answer
</summary>

<p>

```bash
awk '{print NR}' ~/course/data/SP1.fq
```
</p>
</details>


We can also prepend the line number to the FASTQ file (please note we asume `SP1.fq` is on the working directory)

Tip: `awk '{print $0 }'` filename prints the whole line, to which you can add the ``NR``.

```bash
# first column: line number
# other: all S1.fq content (awk's $0 prints the full line)
awk '{print NR, $0 }' SP1.fq | head

```

## Exercise 11

(Source: [MOLB7621](https://molb7621.github.io/workshop/Syllabus.html))

We can use the modulo operator with ``NR`` to only capture specific
records from the fastq


```bash

awk 'NR % 4 == 1' SP1.fq | head  # get header line
awk 'NR % 4 == 2' SP1.fq | head  # get sequence line
awk 'NR % 4 == 3' SP1.fq | head  # get comment line
awk 'NR % 4 == 0' SP1.fq | head  # get quality line
```

<!-- ## Exercise 12 -->


<!-- Now that we can isolate only the sequences let's use `sort` and `uniq` to -->
<!-- find common sequences.  -->

<!-- ```bash -->

<!-- awk 'NR % 4 == 2' SP1.fq \  # get sequences -->
<!--       | sort \  # sort the sequences  -->
<!--       | uniq -c \ # report number of occurances of each unique sequence -->
<!--       | head  -->
      
<!-- #show most frequent sequences -->
      
<!-- awk 'NR % 4 == 2' SP1.fq \  -->
<!--       | sort \ -->
<!--       | uniq -c \ -->
<!--       | sort -k1,1nr \ # reverse sort to rank by most common sequence -->
<!--       | head -->
<!-- ``` -->


## Exercise 12

(Source: [MOLB7621](https://molb7621.github.io/workshop/Syllabus.html))

FASTA format is a more compact sequence format than FASTQ

```bash
>sequence_identifier_1
ATCGTCGATGCTAGTCGA
>sequence_identifier_2
AGCTAGCTAGCTAGC
```

Convert fastq to fasta (tip: use lines 1 and 2). (There are many solutions for this.)


<details><summary>
Answer
</summary>

<p>

```bash

awk 'NR % 4 == 1 {print ">"$1}; 
     NR % 4 == 2 {print}' SP1.fq \
     | head 
```
</p>
</details>


## Exercise 13

Save the SP1 sequences as a file in fasta format (named `~/course/data/example.fa`)

<details><summary>
Answer
</summary>

<p>



```bash

awk 'NR % 4 == 1 {print ">"$1}; 
     NR % 4 == 2 {print}' SP1.fq \
     > ~/course/data/example.fa
```

</p>
</details>


## Exercise 14

Make sure the number of sequences is the same in both fastq and fasta files

<details><summary>
Answer
</summary>

<p>

```bash
awk 'NR % 4 == 1' SP1.fq | wc -l
awk 'NR % 2 == 1' example.fa | wc -l

```
</p>
</details>


# SAM format

## Exercise 15

Download the compressed SAM data from `https://github.com/samtools/samtools/raw/develop/examples/ex1.sam.gz`,  uncompress (`.gz` files need to be uncompressed with `gunzip`) and inspect it.

<details><summary>
Answer
</summary>

<p>

```bash
cd ~/course/data

curl -L https://github.com/samtools/samtools/raw/develop/examples/ex1.sam.gz \
  > ex1.sam.gz

gunzip ex1.sam.gz
head ex1.sam
```
</p>
</details>

# BED format

## Exercise 16

<!-- bed6 to bed3 -->

Transform the file `~/course/soft/bedtools2/test/intersect/a.bed` (BED6) to BED3 (tip: use awk to extract the first three columns).

Tip: `OFS='\t'` in awk specifies the output field separator: a tab (`\t`).

<details><summary>
Answer
</summary>

<p>

```bash

## to go to the a.bed file directory
cd ~/course/soft/bedtools2/test/intersect/

awk -v OFS='\t' '{print $1,$2,$3}' a.bed

cd - ## to go back to the previous directory

```
</p>
</details>


## Exercise 17

Transform the BED3 file ` ~/course/soft/bedtools2/test/intersect/recordsOutOfOrder.bed` to BED6 (unspecified strand, 0 score)

Tip: check the [BED6 file specification](https://genome.ucsc.edu/FAQ/FAQformat.html#format1)

<details><summary>
Answer
</summary>

<p>

```bash

## to go to the a.bed file directory
cd ~/course/soft/bedtools2/test/intersect/

awk -v OFS='\t' '{print $1,$2,$3,".",0,"."}' \
  recordsOutOfOrder.bed

cd - ## to go back to the previous directory

```
</p>
</details>


## Exercise 18

Add a nucleotide to the start and subtract a nucleotide from the end to all records, regardless of the strand, to the file `~/course/soft/bedtools2/test/intersect/a.bed`.

Tip: using the relevant coordinates, modify the column's content using `awk`.

<details><summary>
Answer
</summary>

<p>

```bash

## to go to the a.bed file directory
cd ~/course/soft/bedtools2/test/intersect/

awk -v OFS='\t' '{print $1,$2+1,$3-1,$4,$5,$6}' a.bed

cd - ## to go back to the previous directory

```

Please notice this is not trivial at all, what happens if interested in doing that strand aware? are the add/subtract arithmetics dependent upon the strand? What if we get out of the chromosome sizes bounds? Extra task: browse https://bedtools.readthedocs.io/en/latest/content/tools/slop.html and https://bedtools.readthedocs.io/en/latest/content/tools/flank.html . Also, how would choices on 0/1 counting, closed/open interval encodings impact this task?
</p>
</details>



<!-- awk half open etc -->


## Exercise 19


Use [bedtools intersect](http://bedtools.readthedocs.io/en/latest/content/tools/intersect.html#intersect) to find overlapping genomic features. The [BEDtools paper](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC2832824/) is also very helpful to understand the genomic arithmetics analysis (without sequences, using coordinates).

For this and the next exercises we use some example datasets from the bedtools sourcecode we compiled in one of the first activities. For instance, you could check them i.e. at `~/course/soft/bedtools2/test/intersect/`.

Check the `~/course/soft/bedtools2/test/intersect/a.bed` and `~/course/soft/bedtools2/test/intersect/b.bed` files content. Are they BED3, BED6 or BED12 files?

<details><summary>
Answer
</summary>

<p>

```bash

cat ~/course/soft/bedtools2/test/intersect/a.bed
cat ~/course/soft/bedtools2/test/intersect/b.bed
```
</p>
</details>

## Exercise 20

What will happen if you intersect those files? For example, the `a.bed` region chr1:100-200 overlaps with `b.bed`

```bash
# you might need to alias bedtools if it's not in your $PATH
# alias bedtools='~/course/soft/bedtools2/bin/bedtools'

bedtools intersect \
  -a  ~/course/soft/bedtools2/test/intersect/a.bed \
  -b  ~/course/soft/bedtools2/test/intersect/b.bed

```

Which is the format of the output? How are results interpreted?

<details><summary>
Answer
</summary>

<p>

The output (BED6) is a direct intersect:

```bash

chr1	100	101	a2	2	-
chr1	100	110	a2	2	-
```

Starting from the original interval from a.bed:

```bash
chr1        100     200     a2      2       -

```

And the overlapping intervals from b.bed:

```bash
chr1        90      101     b2      2       -
chr1        100     110     b3      3       +
```

</p>
</details>

## Exercise 21

What does it happen if running `bedtools intersect` with the `a.bed` file as `-b` and the `b.bed` file as `-a`?


<details><summary>
Answer
</summary>

<p>

```bash

bedtools intersect \
  -b  ~/course/soft/bedtools2/test/intersect/a.bed \
  -a  ~/course/soft/bedtools2/test/intersect/b.bed
```

```
chr1    100     101     b2      2       -
chr1    100     110     b3      3       +
```

Tip: to understand the output, check the strands
</p>
</details>

## Exercise 22

Run bedtools intersect with the `a.bed` file as `-a`,  the `b.bed` file as `-b` but forcing strandness, i.e. reporting hits in B that overlap A on the same strand

<details><summary>
Answer
</summary>

<p>

```bash

bedtools intersect \
  -s \
  -a  ~/course/soft/bedtools2/test/intersect/a.bed \
  -b  ~/course/soft/bedtools2/test/intersect/b.bed
```
  
</p>
</details>

## Exercise 23

Use the `-v` to report those intervals in `a.bed` that do not overlap any of the intervals in `b.bed`.


<details><summary>
Answer
</summary>

<p>

```bash

bedtools intersect \
  -v \
  -a  ~/course/soft/bedtools2/test/intersect/a.bed \
  -b  ~/course/soft/bedtools2/test/intersect/b.bed
```

You can explore what happens if inverting the -a and -b flags; for this the -wa and -wb flags might be helpful

```bash

bedtools intersect \
  -v \
  -wa -wb \
  -b  ~/course/soft/bedtools2/test/intersect/a.bed \
  -a  ~/course/soft/bedtools2/test/intersect/b.bed
  ```
  
</p>
</details>


## Exercise 24


Use the `-wao` flag to report the amounts of overlap for all features when comparing `a.bed` and `b.bed`, including those that do not overlap. How are non overlaps encoded? Which strand are they on?

<details><summary>
Answer
</summary>

<p>

```bash

bedtools intersect \
  -wao \
  -a  ~/course/soft/bedtools2/test/intersect/a.bed \
  -b  ~/course/soft/bedtools2/test/intersect/b.bed
```

</p>
</details>



# GTF

## Exercise 25

Download and visualize the GTF estructure from the chr22 GRCh38 human genome (available at `http://genomedata.org/rnaseq-tutorial/annotations/GRCh38/chr22_with_ERCC92.gtf`)


<details><summary>
Answer
</summary>

<p>

```bash

cd ~/course/data
curl -L http://genomedata.org/rnaseq-tutorial/annotations/GRCh38/chr22_with_ERCC92.gtf > chr22_with_ERCC92.gtf

head chr22_with_ERCC92.gtf

wc -l chr22_with_ERCC92.gtf

```

How many exons are there?

```
# grep exon_number chr22_with_ERCC92.gtf | wc -l
awk '$3== "exon"' chr22_with_ERCC92.gtf
## or (if perl is available)
grep -P "\texon\t" chr22_with_ERCC92.gtf  | wc -l
# tip
grep -P "\texon\t" chr22_with_ERCC92.gtf | cut -f3 | uniq -c
```

</p>
</details>


## Exercise 26

Retrieve the details of transcript `ENST00000342247` (tip: use grep) from the
`chr22_with_ERCC92.gtf` file. Then, retrieve the details of the `exon`s of transcript  `ENST00000342247` (tip: use grep after the grep). How many exons are they?


<details><summary>
Answer
</summary>

<p>

```bash

cd ~/course/data

grep ENST00000342247 chr22_with_ERCC92.gtf | grep "exon\s"

grep ENST00000342247 chr22_with_ERCC92.gtf | grep "exon\s" | wc -l

```

</p>


</details>

## Exercise 27

How many start codons and stop codons does the chr22 have? Tip: use the gtf and grep for `start_codon` and `stop_codon`.


<details><summary>
Answer
</summary>

<p>

```bash

cd ~/course/data

grep start_codon chr22_with_ERCC92.gtf | wc -l

grep stop_codon chr22_with_ERCC92.gtf | wc -l


```

</p>


</details>



# VCF

## Exercise 28

Install an old version of VCFtools (disclaimer, this is old! this version is ok for teaching purposes, but please consider installing an up-to-date verson for handling your data in the future) you can download from `https://sourceforge.net/projects/vcftools/files/vcftools_0.1.13.tar.gz/download` using `make`. The path you can choose, but you can use for instance `~/course/soft/`.

<details><summary>
Answer
</summary>

<p>

```bash

cd ~/course/soft/

curl -L https://sourceforge.net/projects/vcftools/files/vcftools_0.1.13.tar.gz/download > \
   vcftools.tar.gz

tar xzvf vcftools.tar.gz

cd vcftools_0.1.13/

make

```

</p>
</details>


## Exercise 29

Check which is the current version of VCFtools? How should installation be carried out? (tip: Git repositories release tagged versions).

<details><summary>
Answer
</summary>

<p>

Git repository at [https://github.com/vcftools/vcftools](https://github.com/vcftools/vcftools)

There is a tag named v0.1.16 (from 2nd Aug 2018) [https://github.com/vcftools/vcftools/releases](https://github.com/vcftools/vcftools/releases)

Nonetheless, we installed an older version

```
~/course/soft/vcftools_0.1.13/bin/vcftools
```
</p>
</details>


## Exercise 30

VCFtools has some data for testing purposes; find all the VCF files (filenames similar to `*vcf*`) that you downloaded during installation and inspect them using `head`.

<details><summary>
Answer
</summary>

<p>

```bash

find ~/course/soft/vcftools_0.1.13 -name "*vcf" -type f

```

</p>
</details>

## Exercise 31

Alias the vcftool binary (full path) to `vcftools` and then run it with no parameters


<details><summary>
Answer
</summary>

<p>

```bash

alias vcftools='~/course/soft/vcftools_0.1.13/bin/vcftools'
vcftools

```

Should render

```


VCFtools (v0.1.13)
© Adam Auton and Anthony Marcketta 2009

Process Variant Call Format files

For a list of options, please go to:
	https://vcftools.github.io/examples.html

Questions, comments, and suggestions should be emailed to:
	vcftools-help@lists.sourceforge.net

```

</p>
</details>


## Exercise 32

How many variants are kept after filtering at `~/course/soft/vcftools_0.1.13/examples/merge-test-a.vcf`? Tip: use the `--vcf` flag to `vcftools`. What does this result mean?



<details><summary>
Answer
</summary>

<p>

```bash
vcftools --vcf ~/course/soft/vcftools_0.1.13/examples/merge-test-a.vcf

```

</p>
</details>

# Project: mobile elements insertions in 1000genomes data

## Exercise 33

Explore human variation data for mobile elements insertion using the [1000genomes data](http://www.internationalgenome.org/data). More precisely, download the pilot [pilot data](ftp://ftp.1000genomes.ebi.ac.uk/vol1/ftp/pilot_data/paper_data_sets/a_map_of_human_variation/low_coverage/sv/) named `CEU.low_coverage.2010_10.MobileElementInsertions.sites.vcf.gz` (the full path to the remote FTP server is `ftp://ftp.1000genomes.ebi.ac.uk/vol1/ftp/pilot_data/paper_data_sets/a_map_of_human_variation/low_coverage/sv/CEU.low_coverage.2010_10.MobileElementInsertions.sites.vcf.gz`).

Then, explore the number of variants (tip: use `vcftools`), the file contents (head, less), etc.

Tip: remember where the `bedtools` and `vcftools` binaries are and/or use an alias to them.

For further details on mobile elements insertion as a source of human variation please check the paper [Stewart et al 2011](https://journals.plos.org/plosgenetics/article?id=10.1371/journal.pgen.1002236).

<details><summary>
Answer
</summary>

<p>

```bash
## path we'll download the data to
cd ~/course/data

## download command (will generate a compressed file)
curl -L ftp://ftp.1000genomes.ebi.ac.uk/vol1/ftp/pilot_data/paper_data_sets/a_map_of_human_variation/low_coverage/sv/CEU.low_coverage.2010_10.MobileElementInsertions.sites.vcf.gz > CEU.low_coverage.2010_10.MobileElementInsertions.sites.vcf.gz

## to check the filetype
file CEU.low_coverage.2010_10.MobileElementInsertions.sites.vcf.gz

## this will uncompress the file, resulting in a file named
## gunzip CEU.low_coverage.2010_10.MobileElementInsertions.sites.vcf
gunzip CEU.low_coverage.2010_10.MobileElementInsertions.sites.vcf.gz

## to check it's uncompressed text
file CEU.low_coverage.2010_10.MobileElementInsertions.sites.vcf

## to evaluate the number of reported insertions
wc -l CEU.low_coverage.2010_10.MobileElementInsertions.sites.vcf 

## to get a summary of the quality-fiiltered variants, as well as other stats
vcftools --vcf CEU.low_coverage.2010_10.MobileElementInsertions.sites.vcf

```

</p>
</details>

To evaluate the VCF structure, we can browse the 1000 Genomes' documentation: [README for low coverage mobile elements insertions](http://ftp.1000genomes.ebi.ac.uk/vol1/ftp/pilot_data/paper_data_sets/a_map_of_human_variation/low_coverage/sv/README.2010_10.low_coverage_MobileElementInsertions). Some items from the document linked above:

```
POS
NCBI build 36.3 position of insertion

ALT 
<INS:ME:ALU> is used for Alu element insertions. 
<INS:ME:L1> is used for L1 element insertions. 
<INS:ME:SVA> is used for SVA element insertions. 

QUAL
The phred quality (with some definition)

FILTER
Filter flags indicate that the given event was likely to be an artifact

INFO fields:

SVTYPE
'INS' for insertion.

SVLEN
Estimated length of the inserted sequence.

VALIDATED, VALMETHOD
Flag indicating that the given loci was validated by PCR experiments done at LSU, 
EMBL, or Yale.
```

## Exercise 34

As a first exercise, let's evaluate how many of these mobile elements insertions overlap human exons? Do you expect it to be a low or high proportion?

To do so download an exons bedfile from `https://s3.amazonaws.com/bedtools-tutorials/web/exons.bed` and then use bedtools intersect. Tip: it won't work because of the chromosome numbering (tip: check how chromosome numbers are encoded in both exons.bed and the vcf file, i.e. whether starting with a `chr` or not, and harmonize them using `awk`).

Also, which genomic assembly does this file belong to? How much does this matter? (e.g. put in context with human genome reference liftovers).

<details><summary>
Answer
</summary>

<p>


```bash

cd ~/course/data

## download the exons location (bedfile)
curl -O https://s3.amazonaws.com/bedtools-tutorials/web/exons.bed > exons.bed

## explore the file
head exons.bed

## how many exons are there in total?
wc -l exons.bed

## look for the VCF records overlapping exons; that is, bedtools intersect
## with the VCF as `a` file, and the exons as `b` file
bedtools intersect -a CEU.low_coverage.2010_10.MobileElementInsertions.sites.vcf \
  -b exons.bed

## this does not work as intended! or, rather, gives some warnings.
## Why does it crash? The chr strings at the coordinates are present in one bedfile but not in the other
tail CEU.low_coverage.2010_10.MobileElementInsertions.sites.vcf

tail exons.bed

## so chromosomes have/not have 'chr' strings on them depending on the file; e.g.
## for one resource, `chromosome 1` is encoded as `chr1`, and `1` for the other

## removing the chr string from the exons bedfile to harmonize both
sed 's/^chr//g' exons.bed > exons_nochr.bed

# check they're gone
head exons_nochr.bed

## now the bedtools intersect should work (chr naming conventions are equivalent)
bedtools intersect -a CEU.low_coverage.2010_10.MobileElementInsertions.sites.vcf \
  -b exons_nochr.bed

```

Are these few or lots of insertiosn in exons? Biologically, would you expect lots of little events of exon disruption by mobile elements insertion?


```bash
## number of variants overlapping exons
bedtools intersect -a CEU.low_coverage.2010_10.MobileElementInsertions.sites.vcf   -b exons_nochr.bed | wc -l

## number of variants 
wc -l CEU.low_coverage.2010_10.MobileElementInsertions.sites.vcf

## if dividing former by the latter, is the ratio low or high?
```

</p>
</details>


## Exercise 35

Continuing with the mobile elements insertions, and given they're not particularly present in exons, where do they insert preferentially? In active or inactive regions? How do we know where active regions are?

To briefly explore this we'll make use of the chromatin states models, and will find the ones with the highest number of insertions using the `CEU.low_coverage.2010_10.MobileElementInsertions.sites.vcf` and the Ernst's chromatin states segmentation ([more info here](http://compbio.mit.edu/ChromHMM/)) as downloaded from `https://s3.amazonaws.com/bedtools-tutorials/web/hesc.chromHmm.bed`. Tip: then select the fourth column of the ChromHMM bedfile, sort it and count with `uniq -c`.

For further details on what is a ChromHMM segmentation (i.e. assigning functions to genomic ranges) please read [Nature Methods volume 9, pages 215–216 (2012)](https://www.nature.com/articles/nmeth.1906).

<details><summary>
Answer
</summary>

<p>


```bash

cd ~/course/data

curl -O https://s3.amazonaws.com/bedtools-tutorials/web/hesc.chromHmm.bed

head hesc.chromHmm.bed

## the fourth column assigns a chromatin state to a coordinate (left)
# chr1	10000	10600	15_Repetitive/CNV
# chr1	10600	11137	13_Heterochrom/lo


## this chromHMM file again encodes `chromosome 1` as `chr1`, whilst our VCF encodes it as `1`.
## so we'll remove `chr``strings from it
sed 's/^chr//g' hesc.chromHmm.bed > hesc.chromHmm_nochr.bed

## to check the abundance of variants per chromatin state, we'll intersect the variants file
## with the chromatin states one, print the column with the states, and count the number of items
## output format of uniq -c:
## number of bed records (first column), grouped by chromatin state (second column)
bedtools intersect\
  -b CEU.low_coverage.2010_10.MobileElementInsertions.sites.vcf \
  -a  hesc.chromHmm_nochr.bed | awk '{print $4}' | sort | uniq -c
```

So apparently there is plenty of heterochromatin/low CNV regions, but is there an overrepresentation? How many heterochromatin/low CNV regions are there in the whole genome?

```bash
## we similarly count the number of active promoters, weak txn etc records
## of the whole genome (background/baseline)
awk '{print $4}' hesc.chromHmm_nochr.bed | sort | uniq -c

```
</p>
</details>

We're not evaluating this overrepresentation statistically, but how do we biologically interpret this? Random thoughts: selective pressure (do transposon integrations interrupt open reading frames, distort protein generation, and impair fitness? would a deletereous insertion give rise to an adult?); retrotransposition mechanisms (homology with prior retrotransposons/repetitive elements), etc.

Also, numerically: are this calculations fair? We were counting BED records, but we didn't take into account the actual span (in nucleotides) of the different genomic compartments. How could we do that?

## Extra exercises block 36

If interested, you could play with other real genomic data using the [BEDtools tutorial](http://quinlanlab.org/tutorials/bedtools/bedtools.html) which explores the Maurano et al paper [Systematic Localization of Common Disease-Associated Variation in Regulatory DNA published in Science, 2012](https://www.ncbi.nlm.nih.gov/pubmed/22955828).

Mind that the tutorial recommends creating a folder with `mkdir -p ~/workspace/monday/bedtools`: if you do so and move (`mv`) there, your path (the one you can get using `pwd`) won't be at the standard `~/course` we used till now.

Remember that the bedtools binary can be aliased using ``alias bedtools='~/course/soft/bedtools2/bin/bedtools'``.

Some of the puzzles include:

* Count the number of exons and CpG islands

<details><summary>
Tip
</summary>

<p>

```bash

Count the number of lines using `wc -l exons.bed` etc.

```

</p>
</details>

* How many CpG islands overlap exons in the genome?


<details><summary>
Tip
</summary>

<p>


Intersect and count

```bash

bedtools intersect -a cpg.bed -b exons.bed   | wc -l


```

</p>
</details>

* Create a BED file representing all of the intervals in the genome that are NOT exonic.

<details><summary>
Tip
</summary>

<p>

Use intersect with the `-v` flag

</p>
</details>

* What is the average distance from GWAS SNPs to the closest exon? 

<details><summary>
Tip
</summary>

<p>

(Hint - have a look at the closest tool.)
</p>
</details>

* What fraction of the GWAS SNPs are exonic?


## Extra exercises block 37

Explore (not necessarily run) more usage examples with biological meaning using UNIX and BEDTools [http://pedagogix-tagc.univ-mrs.fr/courses/jgb53d-bd-prog/practicals/03_bedtools/](http://pedagogix-tagc.univ-mrs.fr/courses/jgb53d-bd-prog/practicals/03_bedtools/).


## Exercise 38 Sum up

Read an overview of all the file formats available at UCSC. You can upload some of the files you used during the course to the UCSC genome browser to see how do they look like. Anyway you can download, read, edit them using UNIX (i.e. `awk`, `grep` etc). And ask biological questions using bedtools/vcftools.

* [All](https://genome.ucsc.edu/FAQ/FAQformat.html)
* [BED](https://genome.ucsc.edu/FAQ/FAQformat.html#format1)
* [Wiggle](https://genome.ucsc.edu/goldenPath/help/wiggle.html)
* [BedGraph](https://genome.ucsc.edu/goldenpath/help/bedgraph.html)
* [GFF](https://genome.ucsc.edu/FAQ/FAQformat.html#format3)
* [GTF](https://genome.ucsc.edu/FAQ/FAQformat.html#format4)
* [VCF](https://genome.ucsc.edu/FAQ/FAQformat.html#format10.1)

In this course we used plain text data standards. But faster, indexed versions of such formats exist: i.e. bigWig (for wiggle), BCF (for VCF), BAM (for SAM). For instance, you can read how indexing is carried out in [bigWigs](https://genome.ucsc.edu/goldenpath/help/bigWig.html). 
