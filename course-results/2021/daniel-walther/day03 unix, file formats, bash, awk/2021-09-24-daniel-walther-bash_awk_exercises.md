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

QU: Something is doing weird. I think bash is drunk and has to go to sleep.

## GTF (?)

### 25.

```bash
```

### 26.

```bash
```

### 27.

```bash
```

## VCF (Variant Call Format)

### 28.

```bash
```

### 29.

```bash
```

### 30.

```bash
```

### 31.

```bash
```

### 32.

```bash
```

### 33.

```bash
```

### 34.

QU: What are mobile element insertions, exactly?

> Also, which genomic assembly does this file belong to? How much does this matter? (e.g. put in context with human genome reference liftovers).

Disclaimer: I am unsure about the meaning of mobile element insertions. I can't help but think of retrovirally inserted sequences which are in general non-coding and just get dragged along, so to speak. Then, exons shouldn't be affected that much. And then, the genome assembly also doesn't matter since the overlap described above is 

This potentially matters a lot (and generally, I would make sure to compare same assemblies, if possible). If comparing sequences directly, this should not matter, since sequences are rarely flat-out removed between genomic assemblies. However, if comparing locus information and the referenced assembly versions are not the same, and you don't have tools for 'translating' between versions (liftover chain files and what not), then which assembly which file belongs to matters a lot.

```bash
```

### 35.

_(mobile element insertions: really ask about what they are if you haven't so far!)_

```bash
```

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
