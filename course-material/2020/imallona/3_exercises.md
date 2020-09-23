# Introduction

Please notice the comprehensive [SIB Course on UNIX](https://edu.sib.swiss/pluginfile.php/2878/mod_resource/content/4/couselab-html/content.html) (to be run using a Web browser).

You can launch a terminal in MacOS and GNU/Linux. If running another OS, please make use a [a Web-browser based emulator](https://cocalc.com/app?anonymous=terminal), or use a Linux virtual machine.

Exercises are meant to be run in Y01-F50 in the morning (learning by doing); afternoons are meant for resources/browsing and reading. In any case, the outputs from all snippets are available within this document, in case it was needed to check them without access to an Unix machine.

Some of the exercises are meant to be solved/committed the GitHub repo (see them below).

## Exercises to report to the GitHub repo

Please commit to the BIO392 github a markdown report (*due date Oct 6 5pm*) describing:

- Why do we use the terminal in bioinformatics?

- What is a plain text file?

- In bioinformatics, most of the data are stored in plain text files with added syntax/structure (and commonly compressed afterwards). For instance, fasta or fastq, but also SAM, BED, GTF, VCF and others. Why is that?

- How can we list files are in a directory? Please provide the command(s).

- What `|` and  `>` do in a terminal?

- How do we print the last 10 lines of the file named `/mnt/test/test.txt`? Please provide the command(s).

- How do we print the first column of the file named `/mnt/test/test.txt` whose columns are separatedby tabs? Please provide the command(s).

- How can we print every third line of a text file? Please provide the command(s), and discuss what they do.

- How can we transform FASTQ into FASTA files using standard Unix tools (sed, awk, etc)? Please provide the command(s), and discuss what they do.

- Which are the advantages of BED/coordinate files as compared to storing just sequences?

- Which QC values are tracked during a bioinformatic variant calling NGS workflow? (from sequencing to variant calling)?

We'd like to store the following information. You can decide to encode them counting by 0, 1, and closed/open at your convenience (but please specify).
 
We have three genomic intervals. All intervals are 1000 nt long. They are contiguous (head to tail). All in the plus strand. The first one starts (we'd like to include the start nucleotide too) in position 1000 of chr2. We don't have reads nor alignments, just scores (integers). Intervals A and B have a score of 0, and interval C has a score of 1000.

- Can we store this in SAM file? Why / why not?

- Can we store this in a BED3? How (please write down the BED file)? Are we losing any information?

- And in BED6? How? Are we losing any information?

- And in BED12? How? Are we losing any information?

- And in the most compact Wiggle as possible? How? Are we losing any information?


## Extra information

Cheatsheets:

* [Shell](https://files.fosswire.com/2007/08/fwunixref.pdf)
* [awk](https://gist.github.com/Rafe/3102414)

For extra/advanced reading, please check the following tutorials on bash and awk:

* [Shell](http://www.grymoire.com/Unix/Sh.html)
* [awk](http://www.grymoire.com/Unix/Awk.html)

Quick math reminder (modulo operator, to be used with, mostly, fastqs)

* [Modulo operation](https://en.wikipedia.org/wiki/Modulo_operation)

Additional information regarding bedtools, vcftools and samtools.

* [Reproducibility](https://www.nature.com/news/1-500-scientists-lift-the-lid-on-reproducibility-1.19970)
* [BEDTools](https://academic.oup.com/bioinformatics/article/26/6/841/244688)
* [VCFtools](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC3137218/)
* [SAMtools](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC2723002/)

<!-- Papers on the biology behind of the datasets used -->

<!-- * [Mobile elements, Stewart et al 2011](https://journals.plos.org/plosgenetics/article?id=10.1371/journal.pgen.1002236) -->
<!-- * [chromHMM, Ernst et al](https://www.nature.com/articles/nmeth.1906). -->
<!-- * [Disease-associated variation](https://www.ncbi.nlm.nih.gov/pubmed/22955828) -->

# Set up

## Folders

Setting up a working directory with folders

```bash
cd  # goes to the home directory
mkdir -p course
ls -l course

mkdir -p course/soft course/data course/output

ls -l course
```

<details><summary>
Output
</summary>

<p>

```
[user@machine ~]$ cd  # goes to the home directory
[user@machine ~]$ mkdir -p course
[user@machine ~]$ ls -l course
total 0
[user@machine ~]$ 
[user@machine ~]$ mkdir -p course/soft course/data course/output
[user@machine ~]$ 
[user@machine ~]$ ls -l course
total 12
drwxr-xr-x 2 imallona imallona 4096 Sep 14 18:15 data
drwxr-xr-x 2 imallona imallona 4096 Sep 14 18:15 output
drwxr-xr-x 2 imallona imallona 4096 Sep 14 18:15 soft

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

<details><summary>
Output
</summary>

<p>

```
[user@machine ~]$ cd  ~/course/data
[user@machine data]$ 
[user@machine data]$ curl https://raw.githubusercontent.com/compbiozurich/UZH-BIO392/imallona/course-material/2020/imallona/examples/example.bed \
>    > example.bed
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100  3471  100  3471    0     0  12094      0 --:--:-- --:--:-- --:--:-- 12094
[user@machine data]$ 
[user@machine data]$ curl https://raw.githubusercontent.com/compbiozurich/UZH-BIO392/imallona/course-material/2020/imallona/examples/hg19.genome \
>    > hg19.genome
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
  0     0    0     0    0     0      0      0 --:--:-- --:--:-- --:--:--     0
100  1971  100  1971    0     0   6217      0 --:--:-- --:--:-- --:--:--  6217
[user@machine data]$ 
[user@machine data]$ ## this will check which kind of file it is
[user@machine data]$ file example.bed
example.bed: ASCII text
[user@machine data]$ 
[user@machine data]$ # this its size
[user@machine data]$ ls -lah example.bed
-rw-r--r-- 1 imallona imallona 3.4K Sep 14 18:16 example.bed
[user@machine data]$ 
[user@machine data]$ # this will print the first lines
[user@machine data]$ head example.bed
chr1	558358	822262	0	0.1164	4
chr1	1598122	70541062	0	-0.1346	103
chr1	71679114	180533364	0	0.0324	116
chr1	181351615	196333968	1	0.24	16
chr1	197555049	246405976	0	0.147	55
chr1	246499124	247086071	1	0.314	8
chr2	60038	81349722	0	-0.0134	107
chr2	82603782	110970825	0	0.088	27
chr2	112466561	127666737	1	0.2419	17
chr2	127716603	218862592	0	0.0679	91
[user@machine data]$ 
[user@machine data]$ # similarly for the second
[user@machine data]$ file hg19.genome
hg19.genome: ASCII text
[user@machine data]$ ls -lah hg19.genome
-rw-r--r-- 1 imallona imallona 2.0K Sep 14 18:16 hg19.genome
[user@machine data]$ head hg19.genome
chr1	249250621
chr2	243199373
chr3	198022430
chr4	191154276
chr5	180915260
chr6	171115067
chr7	159138663
chrX	155270560
chr8	146364022
chr9	141213431
```
</p>
</details>


## Software compiling (bedtools)

On top of knowing the basics on file inspecting/handling using the terminal, we need to be able to install software.

Here we will install [bedtools v2-25.0](https://bedtools.readthedocs.io/en/latest/), a commonly used compbio software. For that, we will download the source code and make use of its Makefile. 

This way, we will control the software version we are installing, and we will generate binaries that are optimized for our computers.

Makefiles are written as sets of rules and are not only used to install software; workflows for data analysis can be coded as Makefiles. If curious about this, read more about [Makefiles at Wikipedia](https://en.wikipedia.org/wiki/Makefile), and about bioinformatics workflows [Holmes and Mungall, 2017](https://academic.oup.com/bioinformatics/article/33/21/3502/3806980) and reproducibility.

In our case, we add a CPATH export to get the headers (wchar.h). By default, we get them at `xcrun --show-sdk-path`. After the export, will look for them at `xcrun --show-sdk-path`/usr/include.


```bash

cd ~/course/soft

# to avoid the following error, export the CPATH
# 
# /usr/local/include/c++/4.9.2/cwchar:44:19: fatal error: wchar.h: No such file or directory
#  #include <wchar.h>
#                    ^
# compilation terminated.
# make[1]: *** [../../../obj//bedFile.o] Error 1
# make: *** [src/utils/bedFile] Error 2
export CPATH=`xcrun --show-sdk-path`/usr/include

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
<details><summary>
Output
</summary>

<p>

```
[user@machine data]$ cd ~/course/soft
[user@machine soft]$ 
[user@machine soft]$ ## download the source code
[user@machine soft]$ curl -L https://github.com/arq5x/bedtools2/releases/download/v2.25.0/bedtools-2.25.0.tar.gz \
>   > bedtools-2.25.0.tar.gz
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100   646  100   646    0     0   1809      0 --:--:-- --:--:-- --:--:--  1809\
100 18.6M  100 18.6M    0     0  5985k      0  0:00:03  0:00:03 --:--:-- 7729k
[user@machine soft]$ 
[user@machine soft]$ ## uncompress
[user@machine soft]$ tar zxvf bedtools-2.25.0.tar.gz

<- very long chunk here, as compilation might take minutes ->

  * compiling windowMakerMain.cpp
  * compiling windowMaker.cpp
- Building main bedtools binary.
done.
- Creating executables for old CLI.
done.
[user@machine bedtools2]$ 
[user@machine bedtools2]$ ## to run the final installed package we could use
[user@machine bedtools2]$ ##    `~/course/soft/bedtools2/bin/bedtools`
[user@machine bedtools2]$ ##  but this is too long; rather, we will create an alias
[user@machine bedtools2]$ ##  so typing `bedtools` will do
[user@machine bedtools2]$ alias bedtools='~/course/soft/bedtools2/bin/bedtools'
[user@machine bedtools2]$ 
[user@machine bedtools2]$ bedtools --help
bedtools: flexible tools for genome arithmetic and DNA sequence analysis.
usage:    bedtools <subcommand> [options]

The bedtools sub-commands include:

[ Genome arithmetic ]
    intersect     Find overlapping intervals in various ways.
    window        Find overlapping intervals within a window around an interval.
    closest       Find the closest, potentially non-overlapping interval.
    coverage      Compute the coverage over defined intervals.
    map           Apply a function to a column for each overlapping interval.
    genomecov     Compute the coverage over an entire genome.
    merge         Combine overlapping/nearby intervals into a single interval.
    cluster       Cluster (but don't merge) overlapping/nearby intervals.
    complement    Extract intervals _not_ represented by an interval file.
    subtract      Remove intervals based on overlaps b/w two files.
    slop          Adjust the size of intervals.
    flank         Create new intervals from the flanks of existing intervals.
    sort          Order the intervals in a file.
    random        Generate random intervals in a genome.
    shuffle       Randomly redistrubute intervals in a genome.
    sample        Sample random records from file using reservoir sampling.
    spacing       Report the gap lengths between intervals in a file.
    annotate      Annotate coverage of features from multiple files.

[ Multi-way file comparisons ]
    multiinter    Identifies common intervals among multiple interval files.
    unionbedg     Combines coverage intervals from multiple BEDGRAPH files.

[ Paired-end manipulation ]
    pairtobed     Find pairs that overlap intervals in various ways.
    pairtopair    Find pairs that overlap other pairs in various ways.

[ Format conversion ]
    bamtobed      Convert BAM alignments to BED (& other) formats.
    bedtobam      Convert intervals to BAM records.
    bamtofastq    Convert BAM records to FASTQ records.
    bedpetobam    Convert BEDPE intervals to BAM records.
    bed12tobed6   Breaks BED12 intervals into discrete BED6 intervals.

[ Fasta manipulation ]
    getfasta      Use intervals to extract sequences from a FASTA file.
    maskfasta     Use intervals to mask sequences from a FASTA file.
    nuc           Profile the nucleotide content of intervals in a FASTA file.

[ BAM focused tools ]
    multicov      Counts coverage from multiple BAMs at specific intervals.
    tag           Tag BAM alignments based on overlaps with interval files.

[ Statistical relationships ]
    jaccard       Calculate the Jaccard statistic b/w two sets of intervals.
    reldist       Calculate the distribution of relative distances b/w two files.
    fisher        Calculate Fisher statistic b/w two feature files.

[ Miscellaneous tools ]
    overlap       Computes the amount of overlap from two intervals.
    igv           Create an IGV snapshot batch script.
    links         Create a HTML page of links to UCSC locations.
    makewindows   Make interval "windows" across a genome.
    groupby       Group by common cols. & summarize oth. cols. (~ SQL "groupBy")
    expand        Replicate lines based on lists of values in columns.
    split         Split a file into multiple files with equal records or base pairs.

[ General help ]
    --help        Print this help menu.
    --version     What version of bedtools are you using?.
    --contact     Feature requests, bugs, mailing lists, etc.

```
</p>
</details>


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

<details><summary>
Output
</summary>

<p>

```
[user@machine bedtools2]$ wc -l ~/course/data/example.bed
98 /home/imallona/course/data/example.bed

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

<details><summary>
Output
</summary>

<p>

```
HEAD(1)                                                                User Commands                                                               HEAD(1)

NAME
       head - output the first part of files

SYNOPSIS
       head [OPTION]... [FILE]...

DESCRIPTION
       Print the first 10 lines of each FILE to standard output.  With more than one FILE, precede each with a header giving the file name.

       With no FILE, or when FILE is -, read standard input.

       Mandatory arguments to long options are mandatory for short options too.

       -c, --bytes=[-]NUM
              print the first NUM bytes of each file; with the leading '-', print all but the last NUM bytes of each file

       -n, --lines=[-]NUM
              print the first NUM lines instead of the first 10; with the leading '-', print all but the last NUM lines of each file

       -q, --quiet, --silent
              never print headers giving file names

       -v, --verbose
              always print headers giving file names

       -z, --zero-terminated
              line delimiter is NUL, not newline

       --help display this help and exit

       --version
              output version information and exit

       NUM may have a multiplier suffix: b 512, kB 1000, K 1024, MB 1000*1000, M 1024*1024, GB 1000*1000*1000, G 1024*1024*1024, and so on for T, P, E, Z,
       Y.

AUTHOR
       Written by David MacKenzie and Jim Meyering.

REPORTING BUGS

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

<details><summary>
Output
</summary>

<p>

```
[user@machine bedtools2]$ head -5 ~/course/data/example.bed
chr1	558358	822262	0	0.1164	4
chr1	1598122	70541062	0	-0.1346	103
chr1	71679114	180533364	0	0.0324	116
chr1	181351615	196333968	1	0.24	16
chr1	197555049	246405976	0	0.147	55

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

<details><summary>
Output
</summary>

<p>

```
[user@machine bedtools2]$ head -5 ~/course/data/example.bed | wc -l
5
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

file SP1.fq
```

</p>
</details>



<details><summary>
Output
</summary>

<p>

```
[user@machine data]$ curl -L https://raw.githubusercontent.com/compbiozurich/UZH-BIO392/imallona/course-material/2020/imallona/examples/SP1.fq  > SP1.fq
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
  0     0    0     0    0     0      0      0 --:--:-- --:--:-- --:--:--     0
100 22471  100 22471    0     0   119k      0 --:--:-- --:--:-- --:--:--  119k
[user@machine data]$ 
[user@machine data]$ file SP1.fq
SP1.fq: ASCII text

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


<details><summary>
Output
</summary>

<p>

```
[user@machine data]$ cd  ~/course/data
[user@machine data]$ ls -lh SP1.fq
-rw-r--r-- 1 imallona imallona 22K Sep 14 18:21 SP1.fq
[user@machine data]$ wc -l SP1.fq
1000 SP1.fq
[user@machine data]$ 
[user@machine data]$ head SP1.fq
@cluster_2:UMI_ATTCCG
TTTCCGGGGCACATAATCTTCAGCCGGGCGC
+
9C;=;=<9@4868>9:67AA<9>65<=>591
@cluster_8:UMI_CTTTGA
TATCCTTGCAATACTCTCCGAACGGGAGAGC
+
1/04.72,(003,-2-22+00-12./.-.4-
@cluster_12:UMI_GGTCAA
GCAGTTTAAGATCATTTTATTGAAGAGCAAG

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


<details><summary>
Output
</summary>

<p>

```
[user@machine data]$ wc -l SP1.fq  # total number of lines
1000 SP1.fq
[user@machine data]$ wc -l SP1.fq | awk '{print $1 / 4}' # total number of fastq records
250

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
renders `459`. How can this be? Tip: does ``@`` have multiple meanings?

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



<details><summary>
Output
</summary>

<p>

```
[user@machine data]$ awk 'NR%4==2'   ~/course/data/SP1.fq
TTTCCGGGGCACATAATCTTCAGCCGGGCGC
TATCCTTGCAATACTCTCCGAACGGGAGAGC
GCAGTTTAAGATCATTTTATTGAAGAGCAAG
GGCATTGCAAAATTTATTACACCCCCAGATC
CCCCCTTAAATAGCTGTTTATTTGGCCCCAG
TCTTGCAAAAACTCCTAGATCGGAAGAGCAC
TCCCCCCCCCAAATCGGAAAAACACACCCCC
GTCTTTGTACAAAATTTTATTAAAGGTCTTT
CCTTCCATCACCAGATCGGAAAAACACACGC

<- trimmed for the sake of brevity ->

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


<details><summary>
Output
</summary>

<p>

```
[user@machine data]$ awk '{print NR}' ~/course/data/SP1.fq
1
2
3
4
5
6
7
8
9
10
11
12
13
14

<- trimmed for the sake of brevity ->


```
</p>
</details>


We can also prepend the line number to the FASTQ file (please note we asume `SP1.fq` is on the working directory)

Tip: `awk '{print $0 }'` filename prints the whole line, to which you can add the ``NR``.

```bash
awk '{print NR, $0 }' SP1.fq | head # note output in first column

```



<details><summary>
Output
</summary>

<p>

```
[user@machine data]$ awk '{print NR, $0 }' SP1.fq | head # note output in first column
1 @cluster_2:UMI_ATTCCG
2 TTTCCGGGGCACATAATCTTCAGCCGGGCGC
3 +
4 9C;=;=<9@4868>9:67AA<9>65<=>591
5 @cluster_8:UMI_CTTTGA
6 TATCCTTGCAATACTCTCCGAACGGGAGAGC
7 +
8 1/04.72,(003,-2-22+00-12./.-.4-
9 @cluster_12:UMI_GGTCAA
10 GCAGTTTAAGATCATTTTATTGAAGAGCAAG

```
</p>
</details>


## Exercise 11

Retrieve specific records from a fastq file (e.g. header, comments etc). Tip: use the modulo operator with ``NR`` to only capture specific records from the fastq.


```bash

awk 'NR % 4 == 1' SP1.fq | head  # get header line
awk 'NR % 4 == 2' SP1.fq | head  # get sequence line
awk 'NR % 4 == 3' SP1.fq | head  # get comment line
awk 'NR % 4 == 0' SP1.fq | head  # get quality line
```


<details><summary>
Output
</summary>

<p>

```
[user@machine data]$ awk 'NR % 4 == 1' SP1.fq | head  # get header line
@cluster_2:UMI_ATTCCG
@cluster_8:UMI_CTTTGA
@cluster_12:UMI_GGTCAA
@cluster_21:UMI_AGAACA
@cluster_29:UMI_GCAGGA
@cluster_34:UMI_AGCTCA
@cluster_36:UMI_AACAGA
@cluster_37:UMI_GAGGAG
@cluster_39:UMI_GAACCG
@cluster_43:UMI_GGATTG
[user@machine data]$ awk 'NR % 4 == 2' SP1.fq | head  # get sequence line
TTTCCGGGGCACATAATCTTCAGCCGGGCGC
TATCCTTGCAATACTCTCCGAACGGGAGAGC
GCAGTTTAAGATCATTTTATTGAAGAGCAAG
GGCATTGCAAAATTTATTACACCCCCAGATC
CCCCCTTAAATAGCTGTTTATTTGGCCCCAG
TCTTGCAAAAACTCCTAGATCGGAAGAGCAC
TCCCCCCCCCAAATCGGAAAAACACACCCCC
GTCTTTGTACAAAATTTTATTAAAGGTCTTT
CCTTCCATCACCAGATCGGAAAAACACACGC
GAGTTATAATCCAATCTTTATTTAAAAATCT
[user@machine data]$ awk 'NR % 4 == 3' SP1.fq | head  # get comment line
+
+
+
+
+
+
+
+
+
+
[user@machine data]$ awk 'NR % 4 == 0' SP1.fq | head  # get quality line
9C;=;=<9@4868>9:67AA<9>65<=>591
1/04.72,(003,-2-22+00-12./.-.4-
?7?AEEC@>=1?A?EEEB9ECB?==:B.A?A
>=2.660/?:36AD;0<14703640334-//
8;;;>DC@DAC=B?C@9?B?CDCB@><<??A
-/CA:+<599803./2065?6=<>90;?150
5?:5;<02:@977=:<0=9>@5>7>;>*3,-
?B?DEC@A=?ADDAEEEC?EC@D6A@@>DE4
00>7;8@5<192?/8;0;;>=3=/3239713
>=AEC?C@;??0A>?0DEB9EEB@DDC1?=6

```
</p>
</details>




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

```
>sequence_identifier_1
ATCGTCGATGCTAGTCGA
>sequence_identifier_2
AGCTAGCTAGCTAGC
```

Convert fastq to fasta. Not an easy exercise. Tip: extract every first and second line using awk and modulo operators; and add the `>` to the sequence identifier (prepend it to the fastq identifier).


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



<details><summary>
Output
</summary>

<p>

```
[user@machine data]$ awk 'NR % 4 == 1 {print ">"$1}; 
>      NR % 4 == 2 {print}' SP1.fq \
>      | head 
>@cluster_2:UMI_ATTCCG
TTTCCGGGGCACATAATCTTCAGCCGGGCGC
>@cluster_8:UMI_CTTTGA
TATCCTTGCAATACTCTCCGAACGGGAGAGC
>@cluster_12:UMI_GGTCAA
GCAGTTTAAGATCATTTTATTGAAGAGCAAG
>@cluster_21:UMI_AGAACA
GGCATTGCAAAATTTATTACACCCCCAGATC
>@cluster_29:UMI_GCAGGA
CCCCCTTAAATAGCTGTTTATTTGGCCCCAG

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

<details><summary>
Output
</summary>

<p>

```
(empty, redirects it to a file so the standard output / screen shows nothing)

```
</p>
</details>

## Exercise 14

Make sure the number of sequences is the same in both fastq and fasta files.

Tip: use `wc -l` to count lines, and use the modulo operator to focus on individual records for the both fastq and fasta. Remember that one sequence is encoded in two lines in fasta, and in four in fastq.

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

<details><summary>
Output
</summary>

<p>

```
[user@machine data]$ awk 'NR % 4 == 1' SP1.fq | wc -l
250
[user@machine data]$ awk 'NR % 2 == 1' example.fa | wc -l
250


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

```
[user@machine bedtools2]$ cd ~/course/data
[user@machine data]$ 
[user@machine data]$ curl -L https://github.com/samtools/samtools/raw/develop/examples/ex1.sam.gz \
>   > ex1.sam.gz
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100   145  100   145    0     0    596      0 --:--:-- --:--:-- --:--:--   596
100  111k  100  111k    0     0   178k      0 --:--:-- --:--:-- --:--:--  736k
[user@machine data]$ 
[user@machine data]$ gunzip ex1.sam.gz
[user@machine data]$ head ex1.sam
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


<details><summary>
Output
</summary>

<p>

```
[user@machine data]$ cd ~/course/soft/bedtools2/test/intersect/
[user@machine intersect]$ 
[user@machine intersect]$ awk -v OFS='\t' '{print $1,$2,$3}' a.bed
chr1	10	20
chr1	100	200

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


<details><summary>
Output
</summary>

<p>

```
[user@machine intersect]$ cd ~/course/soft/bedtools2/test/intersect/
[user@machine intersect]$ 
[user@machine intersect]$ awk -v OFS='\t' '{print $1,$2,$3,".",0,"."}' \
>   recordsOutOfOrder.bed
chr1	20	30	.	0	.
chr1	40	50	.	0	.
chr1	15	60	.	0	.
chr1	70	80	.	0	.
[user@machine intersect]$ 
[user@machine intersect]$ cd - ## to go back to the previous directory
/home/imallona/course/soft/bedtools2/test/intersect

```
</p>
</details>

## Exercise 18

Add a nucleotide to the start and to the end to all records, regardless of the strand, to the file `~/course/soft/bedtools2/test/intersect/a.bed`.

Tip: use `awk` and use the standard operators `+` or `-` to add/subtract values to each record.

Tip: add means adding a nucleotide, that might be substracting a value to the 5' (start) nucleotide.

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


<details><summary>
Output
</summary>

<p>

```
[user@machine intersect]$ cd ~/course/soft/bedtools2/test/intersect/
[user@machine intersect]$ 
[user@machine intersect]$ awk -v OFS='\t' '{print $1,$2-1,$3+1,$4,$5,$6}' a.bed
chr1	9	21	a1	1	+
chr1	99	201	a2	2	-
[user@machine intersect]$ 
[user@machine intersect]$ cd - ## to go back to the previous directory
/home/imallona/course/soft/bedtools2/test/intersect

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


<details><summary>
Output
</summary>

<p>

```
[user@machine intersect]$ head ~/course/soft/bedtools2/test/intersect/a.bed
chr1	10	20	a1	1	+
chr1	100	200	a2	2	-
[user@machine intersect]$ head ~/course/soft/bedtools2/test/intersect/b.bed
chr1	20	30	b1	1	+
chr1	90	101	b2	2	-
chr1	100	110	b3	3	+
chr1	200	210	b4	4	+

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

```

chr1	100	101	a2	2	-
chr1	100	110	a2	2	-
```

Starting from the original interval from a.bed:

```
chr1        100     200     a2      2       -

```

And the overlapping intervals from b.bed:

```
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



<details><summary>
Output
</summary>

<p>

```
[user@machine intersect]$ bedtools intersect \
>   -b  ~/course/soft/bedtools2/test/intersect/a.bed \
>   -a  ~/course/soft/bedtools2/test/intersect/b.bed
chr1	100	101	b2	2	-
chr1	100	110	b3	3	+


```
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


<details><summary>
Output
</summary>

<p>

```
[user@machine intersect]$ bedtools intersect \
>   -s \
>   -a  ~/course/soft/bedtools2/test/intersect/a.bed \
>   -b  ~/course/soft/bedtools2/test/intersect/b.bed
chr1	100	101	a2	2	-

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

<details><summary>
Outputs
</summary>

<p>

```
[user@machine intersect]$ bedtools intersect \
>   -v \
>   -a  ~/course/soft/bedtools2/test/intersect/a.bed \
>   -b  ~/course/soft/bedtools2/test/intersect/b.bed
chr1	10	20	a1	1	+
[user@machine intersect]$ 
[user@machine intersect]$ bedtools intersect \
>   -v \
>   -wa -wb \
>   -b  ~/course/soft/bedtools2/test/intersect/a.bed \
>   -a  ~/course/soft/bedtools2/test/intersect/b.bed
chr1	20	30	b1	1	+
chr1	200	210	b4	4	+

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

## so the overlaps are encoded as -1
```

</p>
</details>


<details><summary>
Output
</summary>

<p>

```
[user@machine intersect]$ bedtools intersect \
>   -wao \
>   -a  ~/course/soft/bedtools2/test/intersect/a.bed \
>   -b  ~/course/soft/bedtools2/test/intersect/b.bed
chr1	10	20	a1	1	+	.	-1	-1	.	-1	.	0
chr1	100	200	a2	2	-	chr1	90	101	b2	2	-	1
chr1	100	200	a2	2	-	chr1	100	110	b3	3	+	10


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


<details><summary>
Output
</summary>

<p>

```
[user@machine data]$ curl -L http://genomedata.org/rnaseq-tutorial/annotations/GRCh38/chr22_with_ERCC92.gtf > chr22_with_ERCC92.gtf
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
  0     0    0     0    0     0      0      0 --:--:-- --:--:-- --:--:--     0
100 29.2M  100 29.2M    0     0  4637k      0  0:00:06  0:00:06 --:--:-- 5563k
[user@machine data]$ 
[user@machine data]$ head chr22_with_ERCC92.gtf
22	ensembl	gene	10736171	10736283	.	-	.	gene_id "ENSG00000277248"; gene_version "1"; gene_name "U2"; gene_source "ensembl"; gene_biotype "snRNA";
22	ensembl	transcript	10736171	10736283	.	-	.	gene_id "ENSG00000277248"; gene_version "1"; transcript_id "ENST00000615943"; transcript_version "1"; gene_name "U2"; gene_source "ensembl"; gene_biotype "snRNA"; transcript_name "U2.14-201"; transcript_source "ensembl"; transcript_biotype "snRNA"; tag "basic"; transcript_support_level "NA";
22	ensembl	exon	10736171	10736283	.	-	.	gene_id "ENSG00000277248"; gene_version "1"; transcript_id "ENST00000615943"; transcript_version "1"; exon_number "1"; gene_name "U2"; gene_source "ensembl"; gene_biotype "snRNA"; transcript_name "U2.14-201"; transcript_source "ensembl"; transcript_biotype "snRNA"; exon_id "ENSE00003736336"; exon_version "1"; tag "basic"; transcript_support_level "NA";
22	havana	gene	10939388	10961338	.	-	.	gene_id "ENSG00000283047"; gene_version "1"; gene_name "FRG1FP"; gene_source "havana"; gene_biotype "unprocessed_pseudogene"; havana_gene "OTTHUMG00000191577"; havana_gene_version "1";
22	havana	transcript	10939388	10961338	.	-	.	gene_id "ENSG00000283047"; gene_version "1"; transcript_id "ENST00000635667"; transcript_version "1"; gene_name "FRG1FP"; gene_source "havana"; gene_biotype "unprocessed_pseudogene"; havana_gene "OTTHUMG00000191577"; havana_gene_version "1"; transcript_name "FRG1FP-001"; transcript_source "havana"; transcript_biotype "unprocessed_pseudogene"; havana_transcript "OTTHUMT00000488611"; havana_transcript_version "1"; tag "basic"; transcript_support_level "NA";
22	havana	exon	10961283	10961338	.	-	.	gene_id "ENSG00000283047"; gene_version "1"; transcript_id "ENST00000635667"; transcript_version "1"; exon_number "1"; gene_name "FRG1FP"; gene_source "havana"; gene_biotype "unprocessed_pseudogene"; havana_gene "OTTHUMG00000191577"; havana_gene_version "1"; transcript_name "FRG1FP-001"; transcript_source "havana"; transcript_biotype "unprocessed_pseudogene"; havana_transcript "OTTHUMT00000488611"; havana_transcript_version "1"; exon_id "ENSE00003786612"; exon_version "1"; tag "basic"; transcript_support_level "NA";
22	havana	exon	10959067	10959136	.	-	.	gene_id "ENSG00000283047"; gene_version "1"; transcript_id "ENST00000635667"; transcript_version "1"; exon_number "2"; gene_name "FRG1FP"; gene_source "havana"; gene_biotype "unprocessed_pseudogene"; havana_gene "OTTHUMG00000191577"; havana_gene_version "1"; transcript_name "FRG1FP-001"; transcript_source "havana"; transcript_biotype "unprocessed_pseudogene"; havana_transcript "OTTHUMT00000488611"; havana_transcript_version "1"; exon_id "ENSE00003789146"; exon_version "1"; tag "basic"; transcript_support_level "NA";
22	havana	exon	10950049	10950174	.	-	.	gene_id "ENSG00000283047"; gene_version "1"; transcript_id "ENST00000635667"; transcript_version "1"; exon_number "3"; gene_name "FRG1FP"; gene_source "havana"; gene_biotype "unprocessed_pseudogene"; havana_gene "OTTHUMG00000191577"; havana_gene_version "1"; transcript_name "FRG1FP-001"; transcript_source "havana"; transcript_biotype "unprocessed_pseudogene"; havana_transcript "OTTHUMT00000488611"; havana_transcript_version "1"; exon_id "ENSE00003786193"; exon_version "1"; tag "basic"; transcript_support_level "NA";
22	havana	exon	10949212	10949269	.	-	.	gene_id "ENSG00000283047"; gene_version "1"; transcript_id "ENST00000635667"; transcript_version "1"; exon_number "4"; gene_name "FRG1FP"; gene_source "havana"; gene_biotype "unprocessed_pseudogene"; havana_gene "OTTHUMG00000191577"; havana_gene_version "1"; transcript_name "FRG1FP-001"; transcript_source "havana"; transcript_biotype "unprocessed_pseudogene"; havana_transcript "OTTHUMT00000488611"; havana_transcript_version "1"; exon_id "ENSE00003784997"; exon_version "1"; tag "basic"; transcript_support_level "NA";
22	havana	exon	10947304	10947418	.	-	.	gene_id "ENSG00000283047"; gene_version "1"; transcript_id "ENST00000635667"; transcript_version "1"; exon_number "5"; gene_name "FRG1FP"; gene_source "havana"; gene_biotype "unprocessed_pseudogene"; havana_gene "OTTHUMG00000191577"; havana_gene_version "1"; transcript_name "FRG1FP-001"; transcript_source "havana"; transcript_biotype "unprocessed_pseudogene"; havana_transcript "OTTHUMT00000488611"; havana_transcript_version "1"; exon_id "ENSE00003787541"; exon_version "1"; tag "basic"; transcript_support_level "NA";
[user@machine data]$ 
[user@machine data]$ wc -l chr22_with_ERCC92.gtf
56295 chr22_with_ERCC92.gtf

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


<details><summary>
Output
</summary>

<p>

```
[user@machine data]$ grep ENST00000342247 chr22_with_ERCC92.gtf | grep "exon\s"
22	ensembl	exon	17369366	17369909	.	+	.	gene_id "ENSG00000099954"; gene_version "18"; transcript_id "ENST00000342247"; transcript_version "9"; exon_number "1"; gene_name "CECR2"; gene_source "ensembl_havana"; gene_biotype "protein_coding"; havana_gene "OTTHUMG00000150072"; havana_gene_version "9"; transcript_name "CECR2-202"; transcript_source "ensembl"; transcript_biotype "protein_coding"; exon_id "ENSE00003719738"; exon_version "1"; tag "basic"; transcript_support_level "5";
22	ensembl	exon	17477588	17477682	.	+	.	gene_id "ENSG00000099954"; gene_version "18"; transcript_id "ENST00000342247"; transcript_version "9"; exon_number "2"; gene_name "CECR2"; gene_source "ensembl_havana"; gene_biotype "protein_coding"; havana_gene "OTTHUMG00000150072"; havana_gene_version "9"; transcript_name "CECR2-202"; transcript_source "ensembl"; transcript_biotype "protein_coding"; exon_id "ENSE00003674122"; exon_version "1"; tag "basic"; transcript_support_level "5";
22	ensembl	exon	17497403	17497586	.	+	.	gene_id "ENSG00000099954"; gene_version "18"; transcript_id "ENST00000342247"; transcript_version "9"; exon_number "3"; gene_name "CECR2"; gene_source "ensembl_havana"; gene_biotype "protein_coding"; havana_gene "OTTHUMG00000150072"; havana_gene_version "9"; transcript_name "CECR2-202"; transcript_source "ensembl"; transcript_biotype "protein_coding"; exon_id "ENSE00003616125"; exon_version "1"; tag "basic"; transcript_support_level "5";
22	ensembl	exon	17499410	17499549	.	+	.	gene_id "ENSG00000099954"; gene_version "18"; transcript_id "ENST00000342247"; transcript_version "9"; exon_number "4"; gene_name "CECR2"; gene_source "ensembl_havana"; gene_biotype "protein_coding"; havana_gene "OTTHUMG00000150072"; havana_gene_version "9"; transcript_name "CECR2-202"; transcript_source "ensembl"; transcript_biotype "protein_coding"; exon_id "ENSE00003505471"; exon_version "1"; tag "basic"; transcript_support_level "5";
22	ensembl	exon	17500631	17500735	.	+	.	gene_id "ENSG00000099954"; gene_version "18"; transcript_id "ENST00000342247"; transcript_version "9"; exon_number "5"; gene_name "CECR2"; gene_source "ensembl_havana"; gene_biotype "protein_coding"; havana_gene "OTTHUMG00000150072"; havana_gene_version "9"; transcript_name "CECR2-202"; transcript_source "ensembl"; transcript_biotype "protein_coding"; exon_id "ENSE00001775438"; exon_version "1"; tag "basic"; transcript_support_level "5";
22	ensembl	exon	17503082	17503131	.	+	.	gene_id "ENSG00000099954"; gene_version "18"; transcript_id "ENST00000342247"; transcript_version "9"; exon_number "6"; gene_name "CECR2"; gene_source "ensembl_havana"; gene_biotype "protein_coding"; havana_gene "OTTHUMG00000150072"; havana_gene_version "9"; transcript_name "CECR2-202"; transcript_source "ensembl"; transcript_biotype "protein_coding"; exon_id "ENSE00001756874"; exon_version "1"; tag "basic"; transcript_support_level "5";
22	ensembl	exon	17504847	17505016	.	+	.	gene_id "ENSG00000099954"; gene_version "18"; transcript_id "ENST00000342247"; transcript_version "9"; exon_number "7"; gene_name "CECR2"; gene_source "ensembl_havana"; gene_biotype "protein_coding"; havana_gene "OTTHUMG00000150072"; havana_gene_version "9"; transcript_name "CECR2-202"; transcript_source "ensembl"; transcript_biotype "protein_coding"; exon_id "ENSE00001684496"; exon_version "1"; tag "basic"; transcript_support_level "5";
22	ensembl	exon	17511813	17511896	.	+	.	gene_id "ENSG00000099954"; gene_version "18"; transcript_id "ENST00000342247"; transcript_version "9"; exon_number "8"; gene_name "CECR2"; gene_source "ensembl_havana"; gene_biotype "protein_coding"; havana_gene "OTTHUMG00000150072"; havana_gene_version "9"; transcript_name "CECR2-202"; transcript_source "ensembl"; transcript_biotype "protein_coding"; exon_id "ENSE00001598036"; exon_version "1"; tag "basic"; transcript_support_level "5";
22	ensembl	exon	17524118	17524327	.	+	.	gene_id "ENSG00000099954"; gene_version "18"; transcript_id "ENST00000342247"; transcript_version "9"; exon_number "9"; gene_name "CECR2"; gene_source "ensembl_havana"; gene_biotype "protein_coding"; havana_gene "OTTHUMG00000150072"; havana_gene_version "9"; transcript_name "CECR2-202"; transcript_source "ensembl"; transcript_biotype "protein_coding"; exon_id "ENSE00003723500"; exon_version "1"; tag "basic"; transcript_support_level "5";
22	ensembl	exon	17534744	17534747	.	+	.	gene_id "ENSG00000099954"; gene_version "18"; transcript_id "ENST00000342247"; transcript_version "9"; exon_number "10"; gene_name "CECR2"; gene_source "ensembl_havana"; gene_biotype "protein_coding"; havana_gene "OTTHUMG00000150072"; havana_gene_version "9"; transcript_name "CECR2-202"; transcript_source "ensembl"; transcript_biotype "protein_coding"; exon_id "ENSE00003711940"; exon_version "1"; tag "basic"; transcript_support_level "5";
22	ensembl	exon	17537103	17537232	.	+	.	gene_id "ENSG00000099954"; gene_version "18"; transcript_id "ENST00000342247"; transcript_version "9"; exon_number "11"; gene_name "CECR2"; gene_source "ensembl_havana"; gene_biotype "protein_coding"; havana_gene "OTTHUMG00000150072"; havana_gene_version "9"; transcript_name "CECR2-202"; transcript_source "ensembl"; transcript_biotype "protein_coding"; exon_id "ENSE00001704267"; exon_version "1"; tag "basic"; transcript_support_level "5";
22	ensembl	exon	17538520	17538557	.	+	.	gene_id "ENSG00000099954"; gene_version "18"; transcript_id "ENST00000342247"; transcript_version "9"; exon_number "12"; gene_name "CECR2"; gene_source "ensembl_havana"; gene_biotype "protein_coding"; havana_gene "OTTHUMG00000150072"; havana_gene_version "9"; transcript_name "CECR2-202"; transcript_source "ensembl"; transcript_biotype "protein_coding"; exon_id "ENSE00001677027"; exon_version "1"; tag "basic"; transcript_support_level "5";
22	ensembl	exon	17538640	17538731	.	+	.	gene_id "ENSG00000099954"; gene_version "18"; transcript_id "ENST00000342247"; transcript_version "9"; exon_number "13"; gene_name "CECR2"; gene_source "ensembl_havana"; gene_biotype "protein_coding"; havana_gene "OTTHUMG00000150072"; havana_gene_version "9"; transcript_name "CECR2-202"; transcript_source "ensembl"; transcript_biotype "protein_coding"; exon_id "ENSE00001720235"; exon_version "1"; tag "basic"; transcript_support_level "5";
22	ensembl	exon	17538993	17539119	.	+	.	gene_id "ENSG00000099954"; gene_version "18"; transcript_id "ENST00000342247"; transcript_version "9"; exon_number "14"; gene_name "CECR2"; gene_source "ensembl_havana"; gene_biotype "protein_coding"; havana_gene "OTTHUMG00000150072"; havana_gene_version "9"; transcript_name "CECR2-202"; transcript_source "ensembl"; transcript_biotype "protein_coding"; exon_id "ENSE00001592054"; exon_version "1"; tag "basic"; transcript_support_level "5";
22	ensembl	exon	17540412	17540800	.	+	.	gene_id "ENSG00000099954"; gene_version "18"; transcript_id "ENST00000342247"; transcript_version "9"; exon_number "15"; gene_name "CECR2"; gene_source "ensembl_havana"; gene_biotype "protein_coding"; havana_gene "OTTHUMG00000150072"; havana_gene_version "9"; transcript_name "CECR2-202"; transcript_source "ensembl"; transcript_biotype "protein_coding"; exon_id "ENSE00001805660"; exon_version "1"; tag "basic"; transcript_support_level "5";
22	ensembl	exon	17541839	17541967	.	+	.	gene_id "ENSG00000099954"; gene_version "18"; transcript_id "ENST00000342247"; transcript_version "9"; exon_number "16"; gene_name "CECR2"; gene_source "ensembl_havana"; gene_biotype "protein_coding"; havana_gene "OTTHUMG00000150072"; havana_gene_version "9"; transcript_name "CECR2-202"; transcript_source "ensembl"; transcript_biotype "protein_coding"; exon_id "ENSE00001653782"; exon_version "1"; tag "basic"; transcript_support_level "5";
22	ensembl	exon	17542157	17543003	.	+	.	gene_id "ENSG00000099954"; gene_version "18"; transcript_id "ENST00000342247"; transcript_version "9"; exon_number "17"; gene_name "CECR2"; gene_source "ensembl_havana"; gene_biotype "protein_coding"; havana_gene "OTTHUMG00000150072"; havana_gene_version "9"; transcript_name "CECR2-202"; transcript_source "ensembl"; transcript_biotype "protein_coding"; exon_id "ENSE00001713996"; exon_version "1"; tag "basic"; transcript_support_level "5";
22	ensembl	exon	17548148	17549564	.	+	.	gene_id "ENSG00000099954"; gene_version "18"; transcript_id "ENST00000342247"; transcript_version "9"; exon_number "18"; gene_name "CECR2"; gene_source "ensembl_havana"; gene_biotype "protein_coding"; havana_gene "OTTHUMG00000150072"; havana_gene_version "9"; transcript_name "CECR2-202"; transcript_source "ensembl"; transcript_biotype "protein_coding"; exon_id "ENSE00001606307"; exon_version "1"; tag "basic"; transcript_support_level "5";
22	ensembl	exon	17552031	17552142	.	+	.	gene_id "ENSG00000099954"; gene_version "18"; transcript_id "ENST00000342247"; transcript_version "9"; exon_number "19"; gene_name "CECR2"; gene_source "ensembl_havana"; gene_biotype "protein_coding"; havana_gene "OTTHUMG00000150072"; havana_gene_version "9"; transcript_name "CECR2-202"; transcript_source "ensembl"; transcript_biotype "protein_coding"; exon_id "ENSE00003678912"; exon_version "1"; tag "basic"; transcript_support_level "5";
22	ensembl	exon	17552835	17554145	.	+	.	gene_id "ENSG00000099954"; gene_version "18"; transcript_id "ENST00000342247"; transcript_version "9"; exon_number "20"; gene_name "CECR2"; gene_source "ensembl_havana"; gene_biotype "protein_coding"; havana_gene "OTTHUMG00000150072"; havana_gene_version "9"; transcript_name "CECR2-202"; transcript_source "ensembl"; transcript_biotype "protein_coding"; exon_id "ENSE00001426606"; exon_version "3"; tag "basic"; transcript_support_level "5";
[user@machine data]$ 
[user@machine data]$ grep ENST00000342247 chr22_with_ERCC92.gtf | grep "exon\s" | wc -l
20

```

So there are 20 exons.

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


<details><summary>
Output
</summary>

<p>

```
[user@machine data]$ cd ~/course/data
[user@machine data]$ 
[user@machine data]$ grep start_codon chr22_with_ERCC92.gtf | wc -l
1856
[user@machine data]$ 
[user@machine data]$ grep stop_codon chr22_with_ERCC92.gtf | wc -l
1613

```

So there are 1856 and 1613, respectively.
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

file example.vcf
```

</p>
</details>


<details><summary>
Output
</summary>

<p>

```
[user@machine data]$ cd ~/course/data
[user@machine data]$ 
[user@machine data]$ curl -L  https://raw.githubusercontent.com/compbiozurich/UZH-BIO392/imallona/course-material/2020/imallona/examples/example.vcf > example.vcf
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100 42605  100 42605    0     0   133k      0 --:--:-- --:--:-- --:--:--  133k
[user@machine data]$ file example.vcf
example.vcf: Variant Call Format (VCF) version 4.1, ASCII text

```
</p>
</details>



## Exercise 29

Inspect the first line of the VCF file `example.vcf`. Which VCF version is it? can we trust the `file` command result above?


<details><summary>Answer</summary>
<p>

VCFv4.1 indeed

```bash
head -1 ~/course/data/example.vcf

## and notice the first line reads
##fileformat=VCFv4.1

```

</p>
</details>
<details><summary>
Output
</summary>

<p>

```
[user@machine data]$ head -1 ~/course/data/example.vcf 
##fileformat=VCFv4.1

```

So VCF v4.1.

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


## Sum up

Read an overview of all the file formats available at UCSC. You can upload some of the files you used during the course to the UCSC genome browser to see how do they look like. Anyway you can download, read, edit them using UNIX (i.e. `awk`, `grep` etc). And ask biological questions using bedtools/vcftools.

* [All](https://genome.ucsc.edu/FAQ/FAQformat.html)
* [BED](https://genome.ucsc.edu/FAQ/FAQformat.html#format1)
* [Wiggle](https://genome.ucsc.edu/goldenPath/help/wiggle.html)
* [BedGraph](https://genome.ucsc.edu/goldenpath/help/bedgraph.html)
* [GFF](https://genome.ucsc.edu/FAQ/FAQformat.html#format3)
* [GTF](https://genome.ucsc.edu/FAQ/FAQformat.html#format4)
* [VCF](https://genome.ucsc.edu/FAQ/FAQformat.html#format10.1)

In this course we used plain text data standards. But faster, indexed versions of such formats exist: i.e. bigWig (for wiggle), BCF (for VCF), BAM (for SAM). For instance, you can read how indexing is carried out in [bigWigs](https://genome.ucsc.edu/goldenpath/help/bigWig.html). 
