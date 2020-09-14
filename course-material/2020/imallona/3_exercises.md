# Introduction

Please notice the comprehensive [SIB Course on UNIX](https://edu.sib.swiss/pluginfile.php/2878/mod_resource/content/4/couselab-html/content.html) (to be run using a Web browser).

You can launch a terminal in MacOS and GNU/Linux. If running another OS, please make use a [a Web-browser based emulator](https://cocalc.com/app?anonymous=terminal).

Exercises are meant to be run in Y01-F50 in the morning; afternoons are for resources/browsing reading.

## Extra information

Cheatsheets:

* [Shell](https://files.fosswire.com/2007/08/fwunixref.pdf)
* [awk](https://gist.github.com/Rafe/3102414)

For extra/advanced reading, please check the following tutorials on bash and awk:

* [Shell](http://www.grymoire.com/Unix/Sh.html)
* [awk](http://www.grymoire.com/Unix/Awk.html)

Quick math reminder (modulo operator, to be used with, mostly, fastqs)

* [Modulo operation](https://en.wikipedia.org/wiki/Modulo_operation)

Papers on bedtools, vcftools, samtools and workflows:

* [Reproducibility](https://www.nature.com/news/1-500-scientists-lift-the-lid-on-reproducibility-1.19970)
* [make/biomake](https://academic.oup.com/bioinformatics/article/33/21/3502/3806980)
* [BEDTools](https://academic.oup.com/bioinformatics/article/26/6/841/244688)
* [VCFtools](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC3137218/)
* [SAMtools](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC2723002/)

Papers on the biology behind of the datasets used

* [Mobile elements, Stewart et al 2011](https://journals.plos.org/plosgenetics/article?id=10.1371/journal.pgen.1002236)
* [chromHMM, Ernst et al](https://www.nature.com/articles/nmeth.1906).
* [Disease-associated variation](https://www.ncbi.nlm.nih.gov/pubmed/22955828)

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

<details><summary>
Output
</summary>

<p>

```bash
[imallona@neutral imallona]$ cd ~ # goes to the home directory
[imallona@neutral ~]$ mkdir -p course
[imallona@neutral ~]$ ls -l course
total 0
[imallona@neutral ~]$ 
[imallona@neutral ~]$ mkdir -p course/soft course/data course/output
[imallona@neutral ~]$ 
[imallona@neutral ~]$ ls -l course
total 12
drwxr-xr-x 2 imallona imallona 4096 Sep 14 08:51 data
drwxr-xr-x 2 imallona imallona 4096 Sep 14 08:51 output
drwxr-xr-x 2 imallona imallona 4096 Sep 14 08:51 soft
```
</p>
</details>


## Retrieving data

Downloading text files and checking their details.

```bash
cd  ~/course/data

curl https://raw.githubusercontent.com/compbiozurich/UZH-BIO392/imallona/course-material/2020/imallona/examples/example.bed \
   > example.bed

curl https://raw.githubusercontent.com/compbiozurich/UZH-BIO392/imallona/course-material/2020/imallona/examples/hg19.genome \
   > hg19.genome

## this will check which kind of file it is
file example.bed

# this its size
ls -lah example.bed

# this will print the first lines
head example.bed

# similarly for the second
file hg19.genome
ls -lah hg19.genome
head hg19.genome

```

## Software compiling (bedtools)

On top of knowing the basics on file inspecting/handling using the terminal, we need to be able to install software.

Here we will install [bedtools v2-25.0](https://bedtools.readthedocs.io/en/latest/), a commonly used compbio software. For that, we will download the source code and make use of its Makefile. 

This way, we will control the software version we are installing, and we will generate binaries that are optimized for our computers.

Makefiles are written as sets of rules and are not only used to install software; workflows for data analysis can be coded as Makefiles. If curious about this, read more about [Makefiles at Wikipedia](https://en.wikipedia.org/wiki/Makefile), and about bioinformatics workflows [Holmes and Mungall, 2017](https://academic.oup.com/bioinformatics/article/33/21/3502/3806980) and reproducibility.


```bash

cd ~/course/soft

## download the source code
curl -L https://github.com/arq5x/bedtools2/releases/download/v2.25.0/bedtools-2.25.0.tar.gz \
  > bedtools-2.25.0.tar.gz

## uncompress
tar zxvf bedtools-2.25.0.tar.gz
cd bedtools2

## follow the install instructions
make  ## will take time!

## to run the final installed package we could use
##    `~/course/soft/bedtools2/bin/bedtools`
##  but this is too long; rather, we will create an alias
##  so typing `bedtools` will do
alias bedtools='~/course/soft/bedtools2/bin/bedtools'

bedtools --help

```

## Exercise 0

All commands have a `man`ual that can be launched typing `man nameofthecommand`. To leave the help page, use `q`.

With a terminal, users interact with the filesystem using the commandline. 

As a first exercise, get familiar with the commands `cd` (to `c`hange `d`irectories), `mkdir` (`m`a`k`e `dir`ectory), `ls` (`l`ist `f`iles), `cd ..` (change directory to parent), `pwd` (`p`rint `w`orking `d`irectory), `head` and `tail` to check the head and tail for plain text files. Also see what happens when you hit the `tab` once or twice (tip: has to do with autocompletion). And how to recover old commands using the `up` arrow.

## Exercise 1

Find the number of lines of the file `~/course/data/example.bed`. Tip: use `wc` (stands for `w`ord `c`ount).

<details><summary>Answer</summary>
<p>

Note the `-l` flag, and that we don't need to go to the directory to check the file, if we use the full path.

```bash
wc -l ~/course/data/example.bed
```

</p>
</details>


## Exercise 2

Get the manual page of `head`, what is this command for?

Tip: to exit the `man` page press `q`.

<details><summary>Answer</summary>
<p>

```bash
man head
```

</p>
</details>

## Exercise 3

Get the first 5 lines of the file `~/course/data/example.bed`. Tip: use `head`.

<details><summary>Answer</summary>
<p>

```bash
head -5 ~/course/data/example.bed
```

</p>
</details>

## Exercise 4

Using pipes (`|`): chain the `head -5` command before with  `wc -l` to make sure the number of lines was as expected (5).

Wikipedia page for [Unix pipelines](https://en.wikipedia.org/wiki/Pipeline_(Unix)).

<details><summary>Answer</summary>
<p>

```bash
head -5 ~/course/data/example.bed | wc -l
```

</p>
</details>


# FASTQ/A Exercises

DISCLAIMER: data was based upon the beautiful Genome Analysis Workshop (MOLB 7621) Course on genome analysis at the University of Colorado SOM at [https://github.com/MOLB7621](https://github.com/MOLB7621) (unavailable in 2020).

## Exercise 5

Retrieve the data for these exercises (mind the path you're working at, should be `~/course/data`).

The path for URL for the data is https://raw.githubusercontent.com/compbiozurich/UZH-BIO392/imallona/course-material/2020/imallona/examples/SP1.fq

Tip: use `curl`.


<details><summary>
Answer
</summary>

<p>

```bash
cd ~/course/data
curl -L https://raw.githubusercontent.com/compbiozurich/UZH-BIO392/imallona/course-material/2020/imallona/examples/SP1.fq  > SP1.fq
```

</p>
</details>


##  Exercise 6

Inspect the file from the previous exercise (file size, number of lines, and visualize its head)

Tips: `ls -l`, `wc`, `head`.

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

The FASTQ file stored at `~/course/data/SP1.fq` is in [FASTQ](https://en.wikipedia.org/wiki/FASTQ_format) format, meaning it contains 4 lines per read sequence. 

```bash
head -n 4 SP1.fq
```

produces

```
@cluster_2:UMI_ATTCCG
TTTCCGGGGCACATAATCTTCAGCCGGGCGC
+
9C;=;=<9@4868>9:67AA<9>65<=>591
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

A common mistake is to use ``grep`` to pattern match the ``@`` in the sequence identifier. Why doesn't this work?

```bash
wc -l SP1.fq | awk '{print $1 / 4}'
```
renders `250`

```bash
grep -c "@" SP1.fq
```
renders `459`.
<details><summary>
Answer
</summary>

<p>
Since `@` is a valid quality score, it's a bad idea to count lines matching `@` with grep (if doing so, we'll have some quality lines as well).
</p>
</details>

## Exercise 9

Next, extract out the read *sequences* from the fastq. This is a bit
complicated as we need to only pull out the second line from each record. 

How could we extract every second line? Tip: think of integer division.

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

Print the line numbers of the file `SP1.fq` using awk.

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
awk '{print NR, $0 }' SP1.fq | head # note output in first column

```

## Exercise 11

Retrieve specific records from a fastq file (e.g. header, comments etc). Tip: use the modulo operator with ``NR`` to only capture specific records from the fastq.


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

FASTA format is a more compact sequence format than FASTQ.

```bash
>sequence_identifier_1
ATCGTCGATGCTAGTCGA
>sequence_identifier_2
AGCTAGCTAGCTAGC
```

Convert fastq to fasta

Tip: use every first and second line using awk and modulo operators.


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

Save the SP1 sequences as a file in fasta format (named `~/course/data/example.fa`).

Tip: extract the sequences as in the previous exercise and use the `>` output redirection.

<details><summary>
Answer
</summary>

<p>

```bash

awk 'NR % 4 == 1 {print ">"$1}; 
     NR % 4 == 2 {print}' SP1.fq \
     > ~/course/data/example.fa
```

or, equivalently (data is one-column),

```bash

awk 'NR % 4 == 1 {print ">"$0}; 
     NR % 4 == 2 {print}' SP1.fq \
     > ~/course/data/example.fa
```

</p>
</details>


## Exercise 14

Make sure the number of sequences is the same in both fastq and fasta files.

Tip: use `wc -l` to count lines, and use the modulo operator to focus on individual records.

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

* [https://samtools.github.io/hts-specs/SAMv1.pdf](SAM v1 format specification).

## Exercise 15

Download the compressed SAM data from ` https://github.com/samtools/samtools/raw/develop/examples/ex1.sam.gz`,  uncompress (tip: `.gz` files can be uncompressed with `gunzip`) and inspect it (check few lines).

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

<details><summary>
Output
</summary>

<p>

```bash
[imallona@neutral bedtools2]$ cd ~/course/data
[imallona@neutral data]$ 
[imallona@neutral data]$ curl -L https://github.com/samtools/samtools/raw/develop/examples/ex1.sam.gz \
>   > ex1.sam.gz
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100   145  100   145    0     0    596      0 --:--:-- --:--:-- --:--:--   596
100  111k  100  111k    0     0   178k      0 --:--:-- --:--:-- --:--:--  736k
[imallona@neutral data]$ 
[imallona@neutral data]$ gunzip ex1.sam.gz
[imallona@neutral data]$ head ex1.sam
B7_591:4:96:693:509	73	seq1	1	99	36M	*	0	0	CACTAGTGGCTCATTGTAAATGTGTGGTTTAACTCG	<<<<<<<<<<<<<<<;<<<<<<<<<5<<<<<;:<;7	MF:i:18	Aq:i:73	NM:i:0	UQ:i:0	H0:i:1	H1:i:0
EAS54_65:7:152:368:113	73	seq1	3	99	35M	*	0	0	CTAGTGGCTCATTGTAAATGTGTGGTTTAACTCGT	<<<<<<<<<<0<<<<655<<7<<<:9<<3/:<6):	MF:i:18	Aq:i:66	NM:i:0	UQ:i:0	H0:i:1	H1:i:0
EAS51_64:8:5:734:57	137	seq1	5	99	35M	*	0	0	AGTGGCTCATTGTAAATGTGTGGTTTAACTCGTCC	<<<<<<<<<<<7;71<<;<;;<7;<<3;);3*8/5	MF:i:18	Aq:i:66	NM:i:0	UQ:i:0	H0:i:1	H1:i:0
B7_591:1:289:587:906	137	seq1	6	63	36M	*	0	0	GTGGCTCATTGTAATTTTTTGTTTTAACTCTTCTCT	(-&----,----)-)-),'--)---',+-,),''*,	MF:i:130	Aq:i:63	NM:i:5	UQ:i:38	H0:i:0	H1:i:0
EAS56_59:8:38:671:758	137	seq1	9	99	35M	*	0	0	GCTCATTGTAAATGTGTGGTTTAACTCGTCCATGG	<<<<<<<<<<<<<<<;<;7<<<<<<<<7<<;:<5%	MF:i:18	Aq:i:72	NM:i:0	UQ:i:0	H0:i:1	H1:i:0
EAS56_61:6:18:467:281	73	seq1	13	99	35M	*	0	0	ATTGTAAATGTGTGGTTTAACTCGTCCCTGGCCCA	<<<<<<<<;<<<8<<<<<;8:;6/686&;(16666	MF:i:18	Aq:i:39	NM:i:1	UQ:i:5	H0:i:0	H1:i:1
EAS114_28:5:296:340:699	137	seq1	13	99	36M	*	0	0	ATTGTAAATGTGTGGTTTAACTCGTCCATGGCCCAG	<<<<<;<<<;<;<<<<<<<<<<<8<8<3<8;<;<0;	MF:i:18	Aq:i:73	NM:i:0	UQ:i:0	H0:i:1	H1:i:0
B7_597:6:194:894:408	73	seq1	15	99	35M	*	0	0	TGTAAATGTGTGGTTTAACTCGTCCATTGCCCAGC	<<<<<<<<<7<<;<<<<;<<<7;;<<<*,;;572<	MF:i:18	Aq:i:43	NM:i:1	UQ:i:9	H0:i:0	H1:i:1
EAS188_4:8:12:628:973	89	seq1	18	75	35M	*	0	0	AAATGTGTGGTTTAACTCGTCCATGGCCCAGCATT	==;=:;:;;:====;=;===:=======;==;===	MF:i:64	Aq:i:0	NM:i:0	UQ:i:0	H0:i:1	H1:i:0
EAS51_66:7:68:402:50	137	seq1	22	99	35M	*	0	0	GTGTGGTTTAACTCGTCCATGGCCCAGCATTTGGG	<<<<<<<<<<<<<<:<<<9<6;9;;&697;7&<55	MF:i:18	Aq:i:66	NM:i:1	UQ:i:5	H0:i:1	H1:i:0

```
</p>
</details>



# BED format

## Exercise 16

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

```
</p>
</details>


## Exercise 17

Transform the BED3 file ` ~/course/soft/bedtools2/test/intersect/recordsOutOfOrder.bed` to BED6 (unspecified strand, 0 score).

Tip: check the [BED6 file specification](https://genome.ucsc.edu/FAQ/FAQformat.html#format1).

Tip: `awk` will print text as is if flanked by quotes (if `'` are already in use, `"` might be useful).

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

Add a nucleotide to the start and subtract a nucleotide to the end to all records, regardless of the strand, to the file `~/course/soft/bedtools2/test/intersect/a.bed`.

Tip: use `awk` and use the standard operators `+` or `-` to add/subtract values to each record.

<details><summary>
Answer
</summary>

<p>

```bash

## to go to the a.bed file directory
cd ~/course/soft/bedtools2/test/intersect/

awk -v OFS='\t' '{print $1,$2-1,$3+1,$4,$5,$6}' a.bed

cd - ## to go back to the previous directory

```
</p>
</details>

## Exercise 19

Use [bedtools intersect](http://bedtools.readthedocs.io/en/latest/content/tools/intersect.html#intersect) to find overlapping genomic features. The [BEDtools paper](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC2832824/) is also very helpful to understand the genomic arithmetics analysis (without sequences, using coordinates).

For this and the next exercises we use some example datasets from the bedtools sourcecode we compiled in one of the first activities. For instance, you could check them i.e. at `~/course/soft/bedtools2/test/intersect/`.

Check the `~/course/soft/bedtools2/test/intersect/a.bed` and `~/course/soft/bedtools2/test/intersect/b.bed` files content. Are they BED3, BED6 or BED12 files? (tip: count the number of columns).

<details><summary>
Answer
</summary>

<p>

```bash

head ~/course/soft/bedtools2/test/intersect/a.bed
head ~/course/soft/bedtools2/test/intersect/b.bed
```
</p>
</details>

## Exercise 20

What will happen if you intersect those files? For example, the `a.bed` region chr1:100-200 overlaps with `b.bed`

```bash
alias bedtools='~/course/soft/bedtools2/bin/bedtools'

bedtools intersect \
  -a  ~/course/soft/bedtools2/test/intersect/a.bed \
  -b  ~/course/soft/bedtools2/test/intersect/b.bed

```

Which is the format of the output? How are results interpreted?

<details><summary>
Answer
</summary>

<p>

The output is a direct intersect:

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

Tip: check the strands.
Tip: read the documentation https://bedtools.readthedocs.io/en/latest/content/tools/intersect.html
</p>
</details>

## Exercise 22

Run bedtools intersect with the `a.bed` file as `-a`,  the `b.bed` file as `-b` but forcing strandness, i.e. reporting hits in B that overlap A on the same strand. [Bedtools intersect documentation](https://bedtools.readthedocs.io/en/latest/content/tools/intersect.html).

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

Use the `-v` to report those intervals in `a.bed` that do not overlap any of the intervals in `b.bed`.  [Bedtools intersect documentation](https://bedtools.readthedocs.io/en/latest/content/tools/intersect.html).


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

</p>
</details>


## Exercise 26

Retrieve the details of transcript `ENST00000342247` (tip: use grep) from the
`chr22_with_ERCC92.gtf` file. Then, retrieve the details of the `exon`s of transcript  `ENST00000342247` (tip: use grep after the grep). How many exons are there?


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

How many start codons and stop codons does the chr22 have? Tip: use the gtf and `grep` for `start_codon` and `stop_codon`.


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

<!-- ## Exercise 28 -->

<!-- Install an old version of VCFtools (disclaimer, this version is convenient for teaching purposes, but please consider installing an up-to-date verson for handling your data in the future). -->

<!-- To download the old version, please use the URL `https://sourceforge.net/projects/vcftools/files/vcftools_0.1.13.tar.gz/download` and compile using `make`. The path you can choose, but you can use for instance `~/course/soft/`. -->

<!-- Tip: to uncompress a `tar.gz` file use `tar xzvf`. -->
<!-- Tip: we compiled `bedtools` as exercise number 0. -->

<!-- <details><summary> -->
<!-- Answer -->
<!-- </summary> -->

<!-- <p> -->

<!-- ```bash -->

<!-- cd ~/course/soft/ -->

<!-- curl -L https://sourceforge.net/projects/vcftools/files/vcftools_0.1.13.tar.gz/download > \ -->
<!--    vcftools.tar.gz -->

<!-- tar xzvf vcftools.tar.gz -->

<!-- cd vcftools_0.1.13/ -->

<!-- make -->

<!-- ``` -->

<!-- </p> -->
<!-- </details> -->

## Exercise 28


Download an example VCF from  https://raw.githubusercontent.com/compbiozurich/UZH-BIO392/imallona/course-material/2020/imallona/examples/example.vcf and save it with the same name in `~/course/data`.


<details><summary>Answer</summary>
<p>


```bash
cd ~/course/data

curl -L  https://raw.githubusercontent.com/compbiozurich/UZH-BIO392/imallona/course-material/2020/imallona/examples/example.vcf > example.vcf
```

</p>
</details>


## Exercise 29

Inspect the first 10 lines of the VCF file `example.vcf`. Which VCF version is it?


<details><summary>Answer</summary>
<p>

VCFv4.1.

```bash
head -10 ~/course/data/example.vcf

## and notice the first line reads
##fileformat=VCFv4.1

```

</p>
</details>



<!-- ## Exercise 29 -->

<!-- Check which is the current version of VCFtools? How should installation be carried out? (tip: Git repositories release tagged versions). -->

<!-- <details><summary> -->
<!-- Answer -->
<!-- </summary> -->

<!-- <p> -->

<!-- Git repository at [https://github.com/vcftools/vcftools](https://github.com/vcftools/vcftools) -->

<!-- Latest tag on Sept the 23rd 2019 is tag named `v0.1.16` (released Aug 2nd 2018) [https://github.com/vcftools/vcftools/releases](https://github.com/vcftools/vcftools/releases) -->

<!-- </p> -->
<!-- </details> -->


<!-- ## Exercise 30 -->

<!-- VCFtools has some data for testing purposes; `find` all the VCF files (filenames similar to `*vcf*`) that you downloaded during installation and inspect them using `head`. -->

<!-- <details><summary> -->
<!-- Answer -->
<!-- </summary> -->

<!-- <p> -->

<!-- ```bash -->

<!-- find ~/course/soft/vcftools_0.1.13 -name "*vcf" -type f -->

<!-- ``` -->

<!-- </p> -->
<!-- </details> -->

<!-- ## Exercise 31 -->

<!-- Alias the vcftool binary (full path) to `vcftools` and then run it with no parameters -->


<!-- <details><summary> -->
<!-- Answer -->
<!-- </summary> -->

<!-- <p> -->

<!-- ```bash -->

<!-- alias vcftools='~/course/soft/vcftools_0.1.13/bin/vcftools' -->
<!-- vcftools -->

<!-- ``` -->

<!-- Should render -->

<!-- ``` -->


<!-- VCFtools (v0.1.13) -->
<!-- © Adam Auton and Anthony Marcketta 2009 -->

<!-- Process Variant Call Format files -->

<!-- For a list of options, please go to: -->
<!-- 	https://vcftools.github.io/examples.html -->

<!-- Questions, comments, and suggestions should be emailed to: -->
<!-- 	vcftools-help@lists.sourceforge.net -->

<!-- ``` -->

<!-- </p> -->
<!-- </details> -->


<!-- ## Exercise 32 -->

<!-- How many variants are kept after filtering at `~/course/soft/vcftools_0.1.13/examples/merge-test-a.vcf`? Tip: use the `--vcf` flag to `vcftools`. What does this result mean? -->



<!-- <details><summary> -->
<!-- Answer -->
<!-- </summary> -->

<!-- <p> -->

<!-- ```bash -->
<!-- vcftools --vcf ~/course/soft/vcftools_0.1.13/examples/merge-test-a.vcf -->

<!-- ``` -->

<!-- </p> -->
<!-- </details> -->

<!-- # Real data integration -->

<!-- Please note these exercises are meant to provide a real use case of computational biology applied to human genetic variation. Even though some of them might be solved in relatively few lines of standard UNIX tools (`curl`, `head`, `wc`, `awk`) and bioinformatics software (`vcftools`), they are complex, and will process somewhat big amounts of data. -->

<!-- ## Exercise 33 -->

<!-- Explore human variation data for mobile elements insertion using the [1000genomes data](http://www.internationalgenome.org/data). More precisely, download the pilot [pilot data](ftp://ftp.1000genomes.ebi.ac.uk/vol1/ftp/pilot_data/paper_data_sets/a_map_of_human_variation/low_coverage/sv/) named `CEU.low_coverage.2010_10.MobileElementInsertions.sites.vcf.gz` (the full path to the remote FTP server is `ftp://ftp.1000genomes.ebi.ac.uk/vol1/ftp/pilot_data/paper_data_sets/a_map_of_human_variation/low_coverage/sv/CEU.low_coverage.2010_10.MobileElementInsertions.sites.vcf.gz`). -->

<!-- Then, explore the number of variants (tip: use `vcftools`), the file contents etc. -->

<!-- Tip: remember where the `bedtools` and `vcftools` binaries are and/or use an alias to them. -->

<!-- Tip: to uncompress `.gz` files (not `tar.gz` but plain `gz`) use `gunzip`. -->

<!-- For further details on mobile elements insertion as a source of human variation please read the paper [Stewart et al 2011](https://journals.plos.org/plosgenetics/article?id=10.1371/journal.pgen.1002236). -->

<!-- <details><summary> -->
<!-- Answer -->
<!-- </summary> -->

<!-- <p> -->

<!-- ```bash -->

<!-- cd ~/course/data -->
<!-- curl -L ftp://ftp.1000genomes.ebi.ac.uk/vol1/ftp/pilot_data/paper_data_sets/a_map_of_human_variation/low_coverage/sv/CEU.low_coverage.2010_10.MobileElementInsertions.sites.vcf.gz > CEU.low_coverage.2010_10.MobileElementInsertions.sites.vcf.gz -->

<!-- gunzip CEU.low_coverage.2010_10.MobileElementInsertions.sites.vcf.gz  -->

<!-- wc -l CEU.low_coverage.2010_10.MobileElementInsertions.sites.vcf  -->

<!-- vcftools --vcf CEU.low_coverage.2010_10.MobileElementInsertions.sites.vcf -->

<!-- ``` -->

<!-- </p> -->
<!-- </details> -->

<!-- ## Exercise 34 -->

<!-- As a first exercise, how many of these overlap human exons? Do you expect it to be a low or high proportion? (tip: deletereous mutations in exons, e.g. coding sequences, are selected against). -->

<!-- To do so download an exons bedfile from `https://s3.amazonaws.com/bedtools-tutorials/web/exons.bed` and then use `bedtools intersect` with the VCF file. -->

<!-- Tip: it won't work on the first attempt because of the chromosome numbering, e.g. `chr10` vs plainly `10`. -->

<!-- Tip: check how chromosome numbers are encoded in both exons.bed and the vcf file, i.e. whether starting with a `chr` or not, and harmonize them using `sed` as needed. -->

<!-- Tip: use `sed` to harmonize files. You could get rid of the `chr` strings from a file, or add them to the file without them. `sed`-based string replacement examples can be found [here](https://linuxize.com/post/how-to-use-sed-to-find-and-replace-string-in-files/). Please remember to append a `g`, e.g. `s/example/example2/g` for global replacement (all occurrences). -->

<!-- Tip: when inspecting large files with long headers, `tail` (showing last lines) might be handier than `head` (showing first lines). -->

<!-- <details><summary> -->
<!-- Answer -->
<!-- </summary> -->

<!-- <p> -->


<!-- ```bash -->

<!-- cd ~/course/data -->

<!-- curl -O https://s3.amazonaws.com/bedtools-tutorials/web/exons.bed -->

<!-- bedtools intersect -a CEU.low_coverage.2010_10.MobileElementInsertions.sites.vcf \ -->
<!--   -b exons.bed -->

<!-- ## this does not work as intended! or, rather, gives some warnings. -->
<!-- ## Why? The chr strings at the coordinates are present in one bedfile but not in the other -->

<!-- tail CEU.low_coverage.2010_10.MobileElementInsertions.sites.vcf -->

<!-- tail exons.bed -->

<!-- ## removing the chr string from the exons bedfile -->

<!-- sed 's/^chr//g' exons.bed > exons_nochr.bed -->

<!-- head exons_nochr.bed -->

<!-- ## this should work (chr naming conventions are equivalent) -->
<!-- bedtools intersect -a CEU.low_coverage.2010_10.MobileElementInsertions.sites.vcf \ -->
<!--   -b exons_nochr.bed -->

<!-- ``` -->

<!-- Are these numbers few or lots? What would you expect? Tip: count the overlaps piping `wc -l` to the intersect command. -->


<!-- ```bash -->

<!-- bedtools intersect -a CEU.low_coverage.2010_10.MobileElementInsertions.sites.vcf   -b exons_nochr.bed | wc -l -->

<!-- ``` -->

<!-- </p> -->
<!-- </details> -->


<!-- ## Exercise 35 -->

<!-- Continuing with the mobile elements insertions, where do they insert preferentially? In active or inactive regions? To briefly explore this get the chromatin states with the highest number of insertions using the `CEU.low_coverage.2010_10.MobileElementInsertions.sites.vcf` and the Ernst's genome segmentation ([more info here](http://compbio.mit.edu/ChromHMM/)) as downloaded from `https://s3.amazonaws.com/bedtools-tutorials/web/hesc.chromHmm.bed`. Tip: then select the fourth column of the ChromHMM bedfile, sort it and count with `uniq -c`. -->

<!-- For further details on what is a ChromHMM segmentation (i.e. assigning functions to genomic ranges) please read [Nature Methods volume 9, pages 215–216 (2012)](https://www.nature.com/articles/nmeth.1906). -->

<!-- <details><summary> -->
<!-- Answer -->
<!-- </summary> -->

<!-- <p> -->


<!-- ```bash -->

<!-- cd ~/course/data -->

<!-- curl -O https://s3.amazonaws.com/bedtools-tutorials/web/hesc.chromHmm.bed -->

<!-- # first removing the chr prepended strings again -->

<!-- sed 's/^chr//g' hesc.chromHmm.bed > hesc.chromHmm_nochr.bed -->

<!-- bedtools intersect\ -->
<!--   -b CEU.low_coverage.2010_10.MobileElementInsertions.sites.vcf \ -->
<!--   -a  hesc.chromHmm_nochr.bed | awk '{print $4}' | sort | uniq -c -->
<!-- ``` -->

<!-- So apparently there is plenty of  heterochromatin/low CNV regions, but is there an overrepresentation? How many  heterochromatin/low CNV regions are there in the whole genome? -->

<!-- ```bash -->

<!-- awk '{print $4}' hesc.chromHmm_nochr.bed | sort | uniq -c -->

<!-- ``` -->

<!-- Still, we could evaluate this statistically. Can you figure out how? is this a contingency-table problem? Please check `bedtools fisher`. -->

<!-- </p> -->
<!-- </details> -->


<!-- ## Exercises block 36 -->

<!-- Play with other real genomic data using the [BEDtools tutorial](http://quinlanlab.org/tutorials/bedtools/bedtools.html) which explores the Maurano et al paper [Systematic Localization of Common Disease-Associated Variation in Regulatory DNA published in Science, 2012](https://www.ncbi.nlm.nih.gov/pubmed/22955828). -->

<!-- Mind that the tutorial recommends creating a folder with `mkdir -p ~/workspace/monday/bedtools`: if you do so and move (`mv`) there, your path (the one you can get using `pwd`) won't be at the standard `~/course` we used till now. -->

<!-- Remember that the bedtools binary can be aliased using ``alias bedtools='~/course/soft/bedtools2/bin/bedtools'``. -->

<!-- * Count the number of exons and CpG islands -->

<!-- <details><summary> -->
<!-- Tip -->
<!-- </summary> -->

<!-- <p> -->

<!-- ```bash -->

<!-- Count the number of lines using `wc -l exons.bed` etc. -->

<!-- ``` -->

<!-- </p> -->
<!-- </details> -->

<!-- * How many CpG islands overlap exons in the genome? -->

<!-- <details><summary> -->
<!-- Tip -->
<!-- </summary> -->

<!-- <p> -->


<!-- Bedtools intersect and count -->

<!-- ```bash -->

<!-- bedtools intersect -a cpg.bed -b exons.bed   | wc -l -->


<!-- ``` -->

<!-- </p> -->
<!-- </details> -->

<!-- * Create a BED file representing all of the intervals in the genome that are NOT exonic. -->

<!-- <details><summary> -->
<!-- Tip -->
<!-- </summary> -->

<!-- <p> -->

<!-- Use bedtools intersect with the `-v` flag -->

<!-- </p> -->
<!-- </details> -->

<!-- * What is the average distance from GWAS SNPs to the closest exon?  -->

<!-- <details><summary> -->
<!-- Tip -->
<!-- </summary> -->

<!-- <p> -->

<!-- (Hint - bedtools closest tool) -->
<!-- </p> -->
<!-- </details> -->


<!-- ## Exercises block 37 -->

<!-- Explore (not necessarily run) more usage examples with biological meaning using UNIX and BEDTools [http://pedagogix-tagc.univ-mrs.fr/courses/jgb53d-bd-prog/practicals/03_bedtools/](http://pedagogix-tagc.univ-mrs.fr/courses/jgb53d-bd-prog/practicals/03_bedtools/) and [bedtools advanced](https://bedtools.readthedocs.io/en/latest/content/advanced-usage.html). -->


## Exercise Sum up

Read an overview of all the file formats available at UCSC. You can upload some of the files you used during the course to the UCSC genome browser to see how do they look like. Anyway you can download, read, edit them using UNIX (i.e. `awk`, `grep` etc). And ask biological questions using bedtools/vcftools.

* [All](https://genome.ucsc.edu/FAQ/FAQformat.html)
* [BED](https://genome.ucsc.edu/FAQ/FAQformat.html#format1)
* [Wiggle](https://genome.ucsc.edu/goldenPath/help/wiggle.html)
* [BedGraph](https://genome.ucsc.edu/goldenpath/help/bedgraph.html)
* [GFF](https://genome.ucsc.edu/FAQ/FAQformat.html#format3)
* [GTF](https://genome.ucsc.edu/FAQ/FAQformat.html#format4)
* [VCF](https://genome.ucsc.edu/FAQ/FAQformat.html#format10.1)

In this course we used plain text data standards. But faster, indexed versions of such formats exist: i.e. bigWig (for wiggle), BCF (for VCF), BAM (for SAM). For instance, you can read how indexing is carried out in [bigWigs](https://genome.ucsc.edu/goldenpath/help/bigWig.html). 
