# Day 03 - File Formats & UNIX 

## Variant Calling Flow

* 
*
*
*
*
*
*

## Standard File Formats

### General Information

#### Genome Assemblies

* Primary Assembly: Best known assembly of a haploid genome
* Alternate Loci: Altermate representation of a locus e.g. with high genetic variability
* Patches: Sequence that is released outisde of the full assembly, such as fixes or novel sequences
* New genome assemblies are not assembled from scratch, but mapped to reference genomes

#### Data Storage Efficiency

* Storing the Genome Sequence as a Master Sequence and referring to this Master Sequence (e.g. through chromosome number, start and end) allows for much more efficient compression and handling
* All file formats use **coordinates**, not sequences
* Human genome ~0.8 GB in size (could include: Telomeres, Haplotypes, etc.)

#### Reference Genomes

* Multiple assemblies exist (e.g. hg18, hg19, hg38)

#### Reproducibility

* Commands like UNIX have to be used, since manual spreadsheet editing (such as excel) is not reproducible 
* Use scripts
* Use data standards
* Using control-version systems

#### Phred Scores

* Originated from Sanger Sequencing
* Represent the quality of a sequence
* Example: Probality of error 1/10 -> Phred Score 10
* Example: Probability of error 1/1'000'000 -> Phred Score 60
* Phred Scores are encoded into single characters differently for each Sequencing Technology -> Need to be aware with which technology the sequence was obtained

#### Counting in File Formats

> ---a-----b---

* Fully Closed: **Both** a and b are included
* Fully Open: **Neither** a or b are included
* Half Open: **Only a** is included

> 0-1-2-3-4-5

* 0-based: The first index is zero
* 1-based: The first index is 1

1. 0-based, half open: [0, 2] = *0 1*
2. 0-based, fully closed [1, 3] = *1 2 3*
3. 1-based, fully open [1, 3] = *1 2*

Transforming

* From 1-based to 0-based: Subtract 1 from every index (UNIX: `2$ -1` subtract 1 from second column)
* From 0-based to 1-based: Add 1 to every index (UNIX: `3$ +1` subtract 1 from third column)

<p align="center">
<img src="https://github.com/compbiozurich/UZH-BIO392/blob/master/course-results/2021/denis-adamec/images/Format_Counting.png" width="600">
</p>


### Formats

#### Fasta

1. First Line contains **General Information**
2. Second Line (and all lines thereafter) contain the **Nucleotide Sequence
* Contains no information about data quality

#### FastQ (.fq)

1. Identifier: First line is **General Information**
2. Sequence: Second Line is the **Nucleotide Sequence**
3. Seperator: Third line is a **Seperator** (e.g. "+" or "&")
4. Quality: Fourth line contains **Phred Scores** for each individual nucleotide (Scores from 1-60 are encoded in a single character)

* How to get only sequences? Use Modulo (%% in R) `Select all lines where "line %% 4 == 2"`
* In UNIX: `awk 'NR % 4 == 2' file.txt` will print all the lines that we want
* Transforming FastQ into Fasta: `awk 'NR % 4 == 1 {print ">"$1}; NR % 2 {print}' file.fasta`

#### SAM (Sequence Alignment Map)

1. Chromosome Number, Starting Coordinate, etc.
2. Locus
3. CIGAR String i.e. 20M1D2M - 40 bases continuously match, 1 deletion from reference, 2 base match
4. Some Flags (which strand the mapping is on, whether mapping is global or local, what kind of error & how many, etc.) 

<p align="center">
<img src="https://github.com/compbiozurich/UZH-BIO392/blob/master/course-results/2021/denis-adamec/images/SAM_Structure.png" width="800">
</p>

#### BAM (Binary Alignment Map)

Analogue to SAM file, but binary & compressed.

#### BED (Browser Extensible Data)

BED files are for storing the *features* of reads by coordinates, not their actual sequence, for example: 
* RNA-seq: Expression level per gene
* Chiq-seq: Binding per bin
* Variant calling: Varian detection

!!! There is no standardisation on whether coordinates start at 0 or 1. Pay Attention.

BED3: 3 tab seperated columns: Chromosome | Start | End
> Chr22 1000 5000

BED: 6 tab seperated columns: Chromosome | Start | End | Name | Score | Strand
 > Chr22 1000 5000 cloneA 960 +

#### GFF3

* Used for storing genomic annotations (genes, exons, start codons, etc.)
* Start and Stop Codons have to be associated to their respective genes. This is done via the attribute column
* Phase indicates in which reading frame (e.g. if you're starting from the first, second or third base) the  translation occurrs most likely (reading frames with lots of stop codons are very unlikely to code for genes)

<p align="center">
<img src="https://github.com/compbiozurich/UZH-BIO392/blob/master/course-results/2021/denis-adamec/images/GFF3_Overview.png" width="800">
</p>

#### Wiggle Files (Wig)

* Displays continuous-value data (GC percent, probability scores, etc.)
* Specifies the chromosome (once per file), the nucleotide and the score pertaining to that specific nucleotide
* If a score applies to multiple nucleotides, a "span" can be added in the first line (e.g. `span=5`)
* If the score should change after a certain amount of nucleotides, a "step" can be added in the first line (e.g. `step=100`)
* Example: `step=100 span=5` 100-104 will be the same, 200-204 will be the same, etc. 
* Scores that are saved in Wig files are usually representet as very continuous graphs in the UCSC (e.g. conservation values)

#### VCF 

* Standard file format for storing variation data
* Unambiguos, scalable and flexble
* contains 8 columns

<p align="center">
<img src="https://github.com/compbiozurich/UZH-BIO392/blob/master/course-results/2021/denis-adamec/images/VCF_Overview.png" width="800">
</p>



## Manipulation Using UNIX Tools

### Miscellaneous

* `ctrl + c` sends kill signal to stop running command (doesn't always work)

### Directory Navigation

* `command a | command b` = send the result from command a to command b with buffering (i.e. b waits until a is finished)
* `pwd` prints the working directory
* `cd ..` goes to parent
* `cd ~/folder` goes to folder
* `ls` list directories inside current directory
* `ls -l` list with more information
* `ls -lh` list with more information, human accessible
* `mkdir folder` create a new directory named "folder"
* `rmdir folder` deletes folder

### File Observation & Manipulation

* `cp`  copy file
* `mv` move file
* `cat file.txt` shows content of file
* `less file.txt` shows browser to browse content of file
* `head file.txt` shows first 10 lines of file
* `tail file.txt` shows last 10 lines of file
* `grep` search for strings in files
* `wc` count words 
* `print $2` only prints the second column
* `sed 's/X/Y/g'` modify all X to Y (g at the end means "for all instances") e.g. echo 'Hello World' | sed 's/Hello/Hi/g' -> Hi all
* `awk 'NR % 4 == 2' file.txt`  Gives every fourth line starting with the second line
* `awk 'NR % 4 == 1 {print ">"$1}; NR % 2 {print}' file.fasta` Transforms FastQ into Fasta
