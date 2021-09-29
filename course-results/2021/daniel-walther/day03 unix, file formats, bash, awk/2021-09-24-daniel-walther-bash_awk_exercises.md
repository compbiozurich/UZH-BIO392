_daniel walther_

# day03 [UNIX, bash & awk fundamentals](https://edu.sib.swiss/pluginfile.php/2878/mod_resource/content/4/couselab-html/content.html)

UNIX is a (family of) computer Operating Systems. MacOS and GNU/Linux are UNIX OS's, both run bash shell by default. Both OS's bundled their shells with the 'awk' programming language useful for file handling and other more abstract/complex operations.

## bash cheatsheet

```
cd [dir] # change working dir (directory) to 'dir'
cd ~ # go to home dir (directory), i.e. root/home/[username]
cd / # go to root dir

mkdir [options] [dir] # make dir, if not already existing
mkdir -p [dir] # (?) how is this different from: mkdir [dir] # I can see no difference in outcome
mkdir folder\ name\ spaced/ # make folders with spaces in the name

rmdir [options] [dir] # remove dir (?) not sure if deletes content, too
rm [options] [arg] #

ls # list contents of current directory
ls -l [dir] # list contents of [dir], -l include details, metadata
  # option -a: show all, including hidden files like . (e.g. starting with '.', system files etc.)
  # option -h: show human friendly details (e.g. size in KB instead of Bytes)

# copy-pasting: if you have copied e.g. an url and want to paste it into bash, you can use right-click.

chmod [options] [arg] # change mode = change permissios,
  # options: u (user), g (group), o (others), a (all)
  # options: a+rwx [arg] = for all give permissions to read,write,execute arg
  # arg (argument): a file, executable, folder, etc.
  # can also: chmod og-wx [arg]
  # see permissions: ls -l

[command] | [command] | [command] # so-called pipes '|' pass on the output to another command on the right of the '|'. a way of saying "do this |then do this |then this etc.

curl [options] url # get/load what the given url points to
curl -L url # follows (potential(?)) redirects of url and loads whatever page it lands on.

[command] > filename # saves the output in the file with filename, creates the file if it not already exists.

# continue this cheatsheet in due time from exercise 6 onwards.
```

## [AWK cheatsheet and more explanations surrounding AWK](https://www.grymoire.com/Unix/Awk.html#toc-uh-1)

No electronic copies allowed without explicit written approval.
Efficient, effective, elaboratory, teaching.
Anything written below is from myself, as a result of working through the course.

```bash
awk '{print $0}' file # prints the whole line (and goes through the file).
awk '{print $1}' file # prints the first field of the current line (and goes through the file).
```


# day03 [bash, awk & file handling exercises](https://github.com/compbiozurich/UZH-BIO392/blob/master/course-material/2021/imallona/exercises.md)

These exercises are about learning UNIX shell (officially running MacOS in the course, but I am running the WSL (Windows Subsystem for Linux) ubuntu interface for Windows 10 - there might be minor syntax differences) and awk, for handling genomic data files.

__Disclaimer__: Some sections might be directly copied from the [exercises.md](https://github.com/compbiozurich/UZH-BIO392/blob/master/course-material/2021/imallona/exercises.md).

## [Set up](https://github.com/compbiozurich/UZH-BIO392/blob/master/course-material/2021/imallona/exercises.md#set-up)

Exercises 1-4.

### 1.

number of lines of the file `~/course/data/example.bed`

```bash
~$ wc ~/course/data/example.bed
100  300 1862 /home/radroy392/course/data/example.bed
~$ wc -l ~/course/data/example.bed
100 /home/radroy392/course/data/example.bed
```

100 lines

### 2.

Get manual page of ```head```, what is command for?

```bash
man head
head - output the first part of files
```

### 3.

Get the first 5 lines of the file ```~/course/data/example.bed```

```bash
~$ head -5 ~/course/data/example.bed
chr1    13219   13390
chr1    14695   14837
chr1    15784   15947
chr1    16848   17058
chr1    17231   17374
```

### 4.

Using pipes ``` | ```, chain command ```head -5``` before ```wc -l``` to check that there are 5 lines returned. Been there, done that.

## [FASTQ/-A Exercises](https://github.com/compbiozurich/UZH-BIO392/blob/master/course-material/2021/imallona/exercises.md#fastqa-exercises)

Exercises 5-14.

### 5.

Retrieve a file from some link.

```bash
curl -L http://imlspenticton.uzh.ch/imallona/teaching/SP1.fq > SP1.fq
```

### 6.

Inspect the file from the previous exercise (file size, number of lines, and visualize its head)

```bash
~/course/data/
ls -lh # file size
wc -l SP1.fq # line count (words are not meaningful)
head SP1.fq
```

SP1.fq is a FASTQ file, 4 lines per entry (or "read sequence" - identifier, sequence, separator ('+'), and quality of sequence.

new entry (identifier) is a line starting with '@' (at least here).

### 7.

The FASTQ file stored at ~/course/data/SP1.fq is in FASTQ format, meaning it contains 4 lines per read sequence.

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

* So Line 1 contains a sequence identifier that begins with an @
* Line 2 contains the read sequence (A,T,C,G,N)
* Line 3 is a comment line, often unused and only contains a +
* Line 4 is the Phred quality score for each sequence encoded in ASCII format

First use ```wc``` and ```awk``` to determine the number of sequences in the fastq

```bash
wc -l SP1.fq # 40, so 10 sequences.
wc -l SP1.fq | awk '{print $1/4}' # 10, so 10 fastq records
```

### 8.

A common mistake is to use ``grep`` to pattern match the ``@`` in the sequence identifier. Why doesn't this work?

```bash
wc -l SP1.fq | awk '{print $1 / 4}'
```
renders `10`

```bash
grep -c "@" SP1.fq
```
renders `12`.

This does not work, because the Phred quality scores in this file contain some '@' and do not indicate start of new records. The pattern search would have to be refined / changed to another symbol, depending on the specific Phred encoding used (can be seen in the ID lines, if you know them well enough).

### 9.

Next, extract only the _sequences_ of the records. Remember, these are only every second out of every four lines in fastq files.

```bash
awk 'NR % 4 == 2' SP1.fq # returns all the sequences. awk 'NR' keeps track of the current line number
awk 'NR % 4 == 2' SP1.fq | wc -l # 10. so the command works as intended and all 10 sequences are returned, with the newlines.
```

Answer:

One approach to this problem is to use the `%` `modulo operator` ([Wikipedia](https://en.wikipedia.org/wiki/Modulo_operation)), which returns the remainder after division of two integers. For example using `awk`.

```bash
awk 'BEGIN { {print 4 % 2}}' # DW: unclear, why there are two brackets {{}} (?)
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

### 10. - 12.

skills result in code from 13. - skipping notes' redundancy

### 13. FASTQ ~> FASTA

convert SP1.fq into the FASTA file format and store it in the file 'example.fa'

```bash
awk 'NR % 4 == 1 {print ">"$0}; NR % 4 == 2 {print}' SP1.fq > example.fa
```

### 14.

Check that both, FASTQ and FASTA files have the same number of sequences (10).

```bash
awk 'NR % 4 == 2 {print NR}' SP1.fq | wc -l # 10
awk 'NR % 2 == 0 {print NR}' example.fa | wc -l # 10, checks out.
```

I finished the exercises 1-14 and understand everything so far. I like AWK. feels somewhat similar to C.

## SAM format

### 15.

Download the compressed SAM data from https://github.com/samtools/samtools/raw/develop/examples/ex1.sam.gz, uncompress (.gz files need to be uncompressed with gunzip) and inspect it.

```bash
cd ~/course/data
curl -L https://github.com/samtools/samtools/raw/develop/examples/ex1.sam.gz # the -L (follow redirects) is important! without -L, something else or maybe a not properly .gz formatted file is downloaded.
gunzip ex1.sam.gz # automatically renames valid .gz files into name without .gz
ls
head ex1.sam # looks okay at first glance.
```

## BED format

### 16.

> Transform the file ~/course/soft/bedtools2/test/intersect/a.bed (BED6) to BED3 (tip: use awk to extract the first three columns).
(do _not_ change the file! if you screw up, run the tar ...bedtools... line from the [Set up](https://github.com/compbiozurich/UZH-BIO392/blob/master/course-material/2021/imallona/exercises.md#set-up) again, which decompresses the a.bed file, amongst others)
> Tip: `OFS='\t'` in awk specifies the output field separator: a tab (`\t`).

```bash
cd ~/course/soft/bedtools2/test/intersect/a.bed
awk -v OFS='\t' '{print $1, $2, $3}' a.bed # the -v is needed for OSF='\t' to work. OFS stands for Output Field Separator.
# works, shows the first 3 columns only
```

### 17.

> Transform the BED3 file ~/course/soft/bedtools2/test/intersect/recordsOutOfOrder.bed to BED6 (unspecified strand, 0 score)
> Tip: check the [BED6 file specification](https://genome.ucsc.edu/FAQ/FAQformat.html#format1)

A BED3 file does not have as much information as a BED6 file. So the missing info. must have been mentioned in this exercise - which can only be to check the link out to find out more about BED6 files, and the _"unspecified strand, 0 score"_ part.

Reading up on BED6 file spec. results in knowing, that:

>  The first three required BED fields are:
> 1. chrom - The name of the chromosome (e.g. chr3, chrY, chr2_random) or scaffold (e.g. scaffold10671).
> 2. chromStart - The starting position of the feature in the chromosome or scaffold. The first base in a chromosome is numbered 0.
> 3. chromEnd - The ending position of the feature in the chromosome or scaffold. The chromEnd base is not included in the display of the feature, however, the number in position format will be represented. For example, the first 100 bases of chromosome 1 are defined as chrom=1, chromStart=0, chromEnd=100, and span the bases numbered 0-99 in our software (not 0-100), but will represent the position notation chr1:1-100. Read more here. chromStart and chromEnd can be identical, creating a feature of length 0, commonly used for insertions. For example, use chromStart=0, chromEnd=0 to represent an insertion before the first nucleotide of a chromosome.
> 
> The 9 additional optional BED fields are:
> 4. name - Defines the name of the BED line. This label is displayed to the left of the BED line in the Genome Browser window when the track is open to full display mode or directly to the left of the item in pack mode.
> 5. score - A score between 0 and 1000. If the track line useScore attribute is set to 1 for this annotation data set, the score value will determine the level of gray in which this feature is displayed (higher numbers = darker gray). This table shows the Genome Browser's translation of BED score values into shades of gray:
> _see link above for this table_
> 6. strand - Defines the strand. Either "." (=no strand) or "+" or "-".

It follows, that I need to add the info. given in the parentheses - "." in field 6, 0 in field 5, and possible also "." in field 4 (since our file was taken from the given tarball (.tar.gz), there is no name from UCSC (I could query the sequence, but no time). So, then:

```bash
awk -v OFS='\t' '{print $1, $2, $3, ".", 0, "."}' recordsOutOfOrder.bed # careful to write OFS, not OSF (duh)
# output:
chr1    20      30      .       0       .
chr1    40      50      .       0       .
chr1    15      60      .       0       .
chr1    70      80      .       0       .
```

### 18.

> Add a nucleotide to the start and subtract a nucleotide to the end to all records, regardless of the strand, to the file ~/course/soft/bedtools2/test/intersect/a.bed.
> Tip: use awk.

I guess just print the file, and subtract 1 from chromStart and subtract 1 from chromEnd.

```bash
awk -v OFS='\t' '{print $1, $2-1, $3-1, $4,$5,$6}' a.bed
# output:
chr1    9       19      a1      1       +
chr1    99      199     a2      2       -

# Answer:
awk -v OFS='\t' '{print $1,$2-1,$3+1,$4,$5,$6}' a.bed
```

QU: Subtracting a nucleotide from the end means shortening the record, so shouldn't it be `$3-1`, too?
=> pay attention to which strand you change (+ or -)!

A: ~nontrivial. however, there are (bed)tools for this: flank, slop - might be worth googling them. there can be found many errors regarding this (usually mathematicians and physicists get the strand thing wrong because they lack the biological knowledge to understand the problem).
I just want you to think about this problem. It could also be, that in some cases you get out of bounds of a chromosome [due to an error, assumably].

=> in the case of slop: if slop is used to change the start and end position of a sequence, you can not go out of bounds, it doesn't let you. This version of bedtools does not appear to give error or warning messages, though.

### 19.

```bash
cat a.bed
cat b.bed
```

Output shows 6 columns for each file, so BED6 files.

### 20.

> Use [bedtools intersect](https://bedtools.readthedocs.io/en/latest/content/tools/intersect.html#intersect) to find overlapping genomic features. The [BEDtools paper](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC2832824/) is also very helpful to understand the genomic arithmetics analysis (without sequences, using coordinates).
(Text from Exercise 19, but only now relevant to tasks)

```bash
bedtools intersect -a a.bed -b b.bed
# output:
chr1    100     101     a2      2       -
chr1    100     110     a2      2       -
```

Output shows data from a.bed that intersects with b.bed. Would be interesting whether with 3 files it shows the shared overlap of all 3 or pairwise overlaps with the -a file.

### 21.

Simple - The same chromStart and chromEnd values, but the rest of the data is taken from b.bed, the -a file.

```bash
bedtools intersect -a b.bed -b a.bed
chr1    100     101     b2      2       -
chr1    100     110     b3      3       +
```

### 22.

> Run bedtools intersect with the a.bed file as -a, the b.bed file as -b but forcing strandness, i.e. reporting hits in B that overlap A on the same strand.

Now it gets more interesting. Probably some more `[options]` to give as input. Aha, see [-s Enforcing __same__ strandedness](https://bedtools.readthedocs.io/en/latest/content/tools/intersect.html#s-enforcing-same-strandedness). Btw, `-wa` and `-wb` make it so that in the output, the original regions of chromStart and chromEnd of respective regions are returned, buth this has no effect on which _lines_ are shown.

```bash
bedtools intersect -a a.bed -b b.bed -s # only the -s at the end is needed
# output:
chr1    100     101     a2      2       -
```

### 23.

> Use the `-v` to report those intervals in a.bed that _do not overlap_ any of the intervals in b.bed.

```bash
bedtools intersect -a a.bed -b b.bed -v
#output:
chr1    10      20      a1      1       +

bedtools inter sect -v -a a.bed -b b.bed
# output:
chr1    10      20      a1      1       +
```

Both work, `-v` after <FILEx> and before.

Changing the order of `-a` and `-b` does not change the output, assuming the same files are passed to `-a` and `-b` respectively.

### 24.

> Use the `-wao` flag to report the amounts of overlap for all features when comparing a.bed and b.bed, _including those that do not overlap_. How are non overlaps encoded? Which strand are they on?

I have trouble understanding the task at hand.

On the website in [this table](https://bedtools.readthedocs.io/en/latest/content/tools/intersect.html#usage-and-option-summary) the `-wao` command is explained followingly:

> __-wao__	Write the original A and B entries plus the number of base pairs of overlap between the two features. However, A features w/o overlap are also reported with a NULL B feature and overlap = 0. Restricted by -f and -r.

```bash
 bedtools intersect -wao -a a.bed -b b.bed
```

QUA: restart OS in case of weird.

## GTF (annotated genomic data)

### 25.

> Download and visualize the GTF estructure from the chr22 GRCh38 human genome (available at http://genomedata.org/rnaseq-tutorial/annotations/GRCh38/chr22_with_ERCC92.gtf)

```bash
curl -L <url> > chr22_with_ERCC92.gtf

file chr22_with_ERCC92.gtf
# output:
chr22_with_ERCC92.gtf: ASCII text, with very long lines # cool, thanks!

wc -l chr22_with_ERCC92.gtf
# output:
56295 chr22_with_ERCC92.gtf # many lines!
```

bonus: How many exons are there?

```bash
awk grep *exon* '{print $1,$2,$3,$4,$5,$6,$7,$8$}' chr22_with_ERCC92
```

QU: Why are you using exon_number for the grep query?
guess: Did I miss something about .gtf files (like can there be cross-references to e.g. exons from lines which do not represent exons)?
A: ~guess correct. roughly.

### 26.

> Retrieve the details of transcript ENST00000342247 (tip: use grep) from the chr22_with_ERCC92.gtf file. Then, retrieve the details of the exons of transcript ENST00000342247 (tip: use grep after the grep). How many exons are they?

```
cd ~/course/data

grep ENST00000342247 chr22_with_ERCC92.gtf | grep "exon_id" # only the lines annotating exons have the "exon_id" string in them, others might contain "...exon..." as well, but have e.g. "protein_id" in them instead of "exon_id"
grep ENST00000342247 chr22_with_ERCC92.gtf | grep "exon_id" | wc -l # 20 exons 
```

QU: Why `exon\s` in the grep query?

A: `\s` is a whitespace character.

### 27.

> How many start codons and stop codons does the chr22 have? Tip: use the gtf and grep for start_codon and stop_codon.

```bash
grep ENST00000342247 chr22_with_ERCC92.gtf | grep codon # returns 2 lines. 1 start codon, 1 stop codon
```

## VCF (Variant Call Format)

### 28.

> Install an old version of VCFtools (disclaimer, this is old! this version is ok for teaching purposes, but please consider installing an up-to-date verson for handling your data in the future) you can download from https://sourceforge.net/projects/vcftools/files/vcftools_0.1.13.tar.gz/download using `make`. The path you can choose, but you can use for instance ~/course/soft/.

On the specified url there are several redirects - but the link works (for bash), the direct download link does not work (for bash, works fine in browser).

```bash
cd ~/cours/soft # for software
curl -L https://sourceforge.net/projects/vcftools/files/vcftools_0.1.13.tar.gz/download >vcftools.tar.gz

tar xzvf vcftools.tar.gz # copied from solution

cd vcftools_0.1.13/
make
```

### 29.

> Check which is the current version of VCFtools? How should installation be carried out? (tip: Git repositories release tagged versions).

```bash
~/course/soft/vcftools_0.1.13/bin/vcftools
# output:

VCFtools (v0.1.13)
© Adam Auton and Anthony Marcketta 2009

Process Variant Call Format files

For a list of options, please go to:
        https://vcftools.github.io/examples.html

Questions, comments, and suggestions should be emailed to:
        vcftools-help@lists.sourceforge.net

# somehow it doesn't work when in directory ..../bin/ to just type
vcftools # but nevermind. just unintuitive
```

### 30.

> VCFtools has some data for testing purposes; find all the VCF files (filenames similar to *vcf*) that you downloaded during installation and inspect them using head.

```bash
cd ~/course/soft/vcftools_0.1.13
find -name "*vcf" -type f # lists all files
find ~/course/soft/vcftools_0.1.13 -name "*vcf" -type f # also works
find ~/course/soft/vcftools_0.1.13/ -name *vcf # also works
find ~/course/soft/vcftools_0.1.13/ -name *.vcf # also works

# insepcting vcf files, how do they look?

head consensus.vcf
# output:
##fileformat=VCFv4.1
#CHROM  POS     ID      REF     ALT     QUAL    FILTER  INFO    FORMAT  NA001
1       5       .       C       *       .       PASS    .       GT      0/1
1       10      .       G       *       .       PASS    .       GT      0/0
1       12      .       GACT    G*      .       PASS    .       GT      0/1
1       16      .       T       T***    .       PASS    .       GT      1/1
1       61      .       C       *       .       PASS    .       GT      1/1
2       61      .       AGAG    A*      .       PASS    .       GT      0/1
2       481     .       T       *,@     .       PASS    .       GT      0/2
```

### 31.

> Alias the vcftool binary (full path) to vcftools and then run it with no parameters

```bash
alias vcftools = '~/course/soft/vcftools_0.1.13/bin/vcftools' # doesn't work (because of the spaces).
alias vcftools='~/course/soft/vcftools_0.1.13/bin/vcftools' # works.

cd ~
vcftools # works.
# output:

VCFtools (v0.1.13)
© Adam Auton and Anthony Marcketta 2009

Process Variant Call Format files

For a list of options, please go to:
        https://vcftools.github.io/examples.html

Questions, comments, and suggestions should be emailed to:
        vcftools-help@lists.sourceforge.net

```

### 32.

> How many variants are kept after filtering at ~/course/soft/vcftools_0.1.13/examples/merge-test-a.vcf? Tip: use the --vcf flag to vcftools. What does this result mean?

```bash
cd ~/course/soft/vcftools_0.1.13/examples/
vcftools --vcf merge-test-a.vcf # not sure what this does.
# output:

VCFtools - v0.1.13
(C) Adam Auton and Anthony Marcketta 2009

Parameters as interpreted:
        --vcf merge-test-a.vcf

After filtering, kept 1 out of 1 Individuals
After filtering, kept 9 out of a possible 9 Sites
Run Time = 0.00 seconds
```

So all the data has been kept and has passed the filtering by `vcftools --vcf`, and it appears that there are 9 variants (kept 9 ... Sites).

QU: What does this mean?

guess: The measurement quality is sufficient for all 9 variants (found in 1 individual, I suppose).
Maybe it is a file from some segment liftover process, then individual could mean a (temporary) consensus or merged sequence.
Although, 9 possible Sites suggests that there are 9 possibilities for some matching or binding site. I don't know.

## [Project: mobile elements insertions in 1000genomes data](https://github.com/compbiozurich/UZH-BIO392/blob/master/course-material/2021/imallona/exercises.md#project-mobile-elements-insertions-in-1000genomes-data)

### 33.

> Explore human variation data for mobile elements insertion using the [1000genomes data](http://www.internationalgenome.org/data). More precisely, download the pilot data named CEU.low_coverage.2010_10.MobileElementInsertions.sites.vcf.gz (the full path to the remote FTP server is ftp://ftp.1000genomes.ebi.ac.uk/vol1/ftp/pilot_data/paper_data_sets/a_map_of_human_variation/low_coverage/sv/CEU.low_coverage.2010_10.MobileElementInsertions.sites.vcf.gz).
>
> Then, explore the number of variants (tip: use vcftools), the file contents (head, less), etc.
>
> Tip: remember where the bedtools and vcftools binaries are and/or use an alias to them.
>
> For further details on mobile elements insertion as a source of human variation please check the paper [Stewart et al 2011](https://journals.plos.org/plosgenetics/article?id=10.1371/journal.pgen.1002236).

```bash
# ... directory, download, gunzip ...

wc -l CEU.low_coverage.2010_10.MobileElementInsertions.sites.vcf
# output:
3225 CEU.low_coverage.2010_10.MobileElementInsertions.sites.vcf # 3225 lines! nüme nüt

vcftools --vcf CEU.low_coverage.2010_10.MobileElementInsertions.sites.vcf
# output:
VCFtools - v0.1.13
(C) Adam Auton and Anthony Marcketta 2009

Parameters as interpreted:
        --vcf CEU.low_coverage.2010_10.MobileElementInsertions.sites.vcf

After filtering, kept 0 out of 0 Individuals
After filtering, kept 3201 out of a possible 3201 Sites
Run Time = 0.00 seconds
```

It appears that filtering has already been done (all sites kept).

> To evaluate the VCF structure, we can browse the 1000 Genomes' documentation: (README for low coverage mobile elements insertions](http://ftp.1000genomes.ebi.ac.uk/vol1/ftp/pilot_data/paper_data_sets/a_map_of_human_variation/low_coverage/sv/README.2010_10.low_coverage_MobileElementInsertions). Some items from the document linked above:

_see [Exercise 33](https://github.com/compbiozurich/UZH-BIO392/blob/master/course-material/2021/imallona/exercises.md#exercise-33)_

### 34.

> As a first exercise, let's evaluate how many of these mobile elements insertions overlap human exons? Do you expect it to be a low or high proportion?

I'm guessing that `bedtools intersect` can be used to check for overlaps. I expect a low proportion of these mobile elements insertions to overlap with human exons.

QU: What are mobile element insertions, exactly?
A: genetic elemens (sequences) that can jump and duplicate themselves, like retrotransposons. Some elements even have their own retrotransposase encoded in their own sequence. Reminder: transoposons use DNA, retrotransposons use RNA.

> To do so download an exons bedfile from https://s3.amazonaws.com/bedtools-tutorials/web/exons.bed and then use bedtools intersect. Tip: it won't work because of the chromosome numbering (tip: check how chromosome numbers are encoded in both exons.bed and the vcf file, i.e. whether starting with a chr or not, and harmonize them using awk).

> Also, which genomic assembly does this file belong to? How much does this matter? (e.g. put in context with human genome reference liftovers).

Disclaimer: I am unsure about the meaning of mobile element insertions. I can't help but think of retrovirally inserted sequences which are in general non-coding and just get dragged along, so to speak. Then, exons shouldn't be affected that much. And then, the genome assembly also doesn't matter since the overlap described above is 

This potentially matters a lot (and generally, I would make sure to compare same assemblies, if possible). If comparing sequences directly, this should not matter, since sequences are rarely flat-out removed between genomic assemblies. However, if comparing locus information and the referenced assembly versions are not the same, and you don't have tools for 'translating' between versions (liftover chain files and what not), then which assembly which file belongs to matters a lot.

```bash
cd ~/course/data

curl -O https://s3.amazonaws.com/bedtools-tutorials/web/exons.bed > exons.bed # why -O? quick web search (letter o, not zero)

head exons.bed
chr1    11873   12227   NR_046018_exon_0_0_chr1_11874_f 0       +
chr1    12612   12721   NR_046018_exon_1_0_chr1_12613_f 0       +
chr1    13220   14409   NR_046018_exon_2_0_chr1_13221_f 0       +
chr1    14361   14829   NR_024540_exon_0_0_chr1_14362_r 0       -
chr1    14969   15038   NR_024540_exon_1_0_chr1_14970_r 0       -
chr1    15795   15947   NR_024540_exon_2_0_chr1_15796_r 0       -
chr1    16606   16765   NR_024540_exon_3_0_chr1_16607_r 0       -
chr1    16857   17055   NR_024540_exon_4_0_chr1_16858_r 0       -
chr1    17232   17368   NR_024540_exon_5_0_chr1_17233_r 0       -
chr1    17605   17742   NR_024540_exon_6_0_chr1_17606_r 0       -

wc -l exons.bed
459752 exons.bed # now we're talking
```

Searching for the name in ucsc doesn't work (hg38), maybe I've got the wrong assembly. But searching for the region sure works, but without assembly info, this is not that meaningful. [this UCSC query](http://genome.ucsc.edu/cgi-bin/hgTracks?db=hg38&lastVirtModeType=default&lastVirtModeExtraState=&virtModeType=default&virtMode=0&nonVirtPosition=&position=chr1%3A11874%2D12227&hgsid=1174562015_RoewDhVaFdmbpps1XsXjQG0yuJVC)

```bash
bedtools intersect -a exons.bed -b CEU.low_coverage.2010_10.MobileElementInsertions.sites.vcf
# doesn't work, "bed file has unusual structure"~
```

Copied from solutions:

```bash
## this does not work as intended! or, rather, gives some warnings.
## Why does it crash? The chr strings at the coordinates are present in one bedfile but not in the other
tail CEU.low_coverage.2010_10.MobileElementInsertions.sites.vcf

tail exons.bed

## so chromosomes [in .vcf format] have/not have 'chr' strings on them depending on the file; e.g.
## for one resource, `chromosome 1` is encoded as `chr1`, and `1` for the other

## removing the chr string from the exons bedfile to harmonize both
sed 's/^chr//g' exons.bed > exons_nochr.bed # [whatever you say]

# check they're gone
head exons_nochr.bed # nice, thx
```

Now my part again:

```bash
bedtools intersect -a CEU.low_coverage.2010_10.MobileElementInsertions.sites.vcf -b exons_nochr.bed | wc -l
# output:
110 # out of 3'225 mobile elements, and 459'752 human exons.
```

Less than .5% of given mobile elements overlap with the human exons (of <...> hg assembly). I don't think this is a lot, but noteworthy nonetheless.

### 35.

Read and thought it through.

```bash
# copy start

cd ~/course/data

curl -O https://s3.amazonaws.com/bedtools-tutorials/web/hesc.chromHmm.bed

head hesc.chromHmm.bed

## the fourth column assigns a chromatin state to a coordinate (left)
# chr1	10000	10600	15_Repetitive/CNV
# chr1	10600	11137	13_Heterochrom/lo

# then use bedtools intersect
```

_Finally_ compare overall heterochromatin proportion of genome to evaluate potential overrepresentation of 
m.e.insertions into hetero-/euchromatin, __what we are actually interested in__ here, imo.

Now the state of skills has reached a rookie practical level in reality.

### Extra exercises block 36.

```bash
```

### Extra exercises block 37.

```bash
```

### 38. sum up

```bash
```

TBD:
- Write awk cheatsheet for exercises 6-14.
- Write awk cheatsheet for exercises 15-24.
- Exercises 25-32, at least (done by this evening (that was the goal, anyhow. couldn't help commenting), focus on knowledge and skills, and files - not notes, for now).
