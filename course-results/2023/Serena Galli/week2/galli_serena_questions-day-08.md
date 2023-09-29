# Questions BIO392 day 08

These questions are designed to test your understanding of the sequence
analysis practical and the accompanying literature. Please change the
name of this file to \<First letter\>-\<Last name\>-questions-day-08.md,
(e.g., M-Mustermann-questions-day-08.md), and upload it to your folder
in the course GitHub.

These questions will not be graded separately, but may be considered
when determining your participation grade. The most important thing is
not that you get everything right, but that you show that you thought
about the questions; so no copy/pasting!

## Practical

### Q1

**Does the sequence quality graph of your data look different from the
examples shown in the slides? Are there any adapter sequences in the
data? Why do you think this is?**\
In the FASTQ file of the data, the quality for all nucleotides is
assigned to be 126 (\~), which is perfect quality. According to the
FastQC report, there are no adpator sequences present. This is explained
by the fact that the data was simulated.

### Q2

**Given the FastQC reports, does it make sense to perform adapter and/or
quality-trimming on your data?**\
No.

### Q3

**Why are so many files in the bioinformatics pipeline compressed and
indexed?**\
Bioinformatic files can be extremely large. *Compressing* these files
reduces their size, facilitating data storage, data processing and data
transfer.

Severe analysis tools need an *index* in addition to a given data file.
This index is stored in a separate file (e.g. the index of the reference
APC.fa is stored in APC.fai, the index of the patient_1.bam isstored in
the patient_1.bam.bai) and can be searched faster than the original
file. Each record in the index file contains a pointer to the record in
the original file.

### Q4

**In the bash script that processes alignment files, you will see calls
to samtools sort, samtools view, and samtools index (among others).
Explain what these three programs do. Why do you think each program is
needed?** *Hint: look at the [Samtools
manual](http://www.htslib.org/doc/samtools.html)*.\

*samtools sort*: sorts alignments by leftmost coordinates (default),
preparation-step for generating the index\
*samtools view --bam*: prints all alignments in the specified input
alignment file to a BAM file (with no header), this is used to create
the index\
*samtools index*: creates an index for coordinate-sorted
BGZIP-compressed SAM, BAM or CRAM files for fast random access, in our
case stored in a bam.bai file

### Q5

**Explain what files are needed for GangSTR to run. Specifically:
explain what information is provided to GangSTR via the --ref, --region,
and --bam command line arguments.** *Hint: look at the [GangSTR
manual](https://github.com/gymreklab/gangstr).* Your answer here:

GangSTR takes aligned reads (BAM/SAM file) and a set of repeats in the
reference genome (BED file) as input and outputs a VCF file containing
genotypes for each locus.

*GangSTR --ref*: FASTA file for the reference genome\
*GangSTR --regions*:BED file containing tandem repeat coordinates\
*GangSTR --bam*: comma separated list of input BAM files\

## Literature

During the practical so far, you have generated variant calls from short
read sequencing data using bioinformatics approaches. Now it's time to
take a step back and do some background reading in order to prepare for
the analysis and interpretation of the results next week.

First, read the following sections of [this
review](https://www.sciencedirect.com/science/article/pii/S0959437X16301538):
\* Abstract \* Introduction\`\` \* Genotyping STRs from high-throughput
sequencing data Then, answer Q6 and Q7.

### Q6

**Why is STR variation relevant to health and disease?**\
The presence of repetitive element induces slippage events during DNA
replication. Therefore, STR exhibit a very high frequency of mutation,
thus considerably contributing to human genetic variation.

STR expansions have been implicated in dozens of disorders, such as the
Fragile X Syndrome, spinal and bulbar muscular atrophy as well as cystic
fibrosis. Following mechanism by which STRs (might) regulate gene
expression and mediate their pathogenic effect when altered, have been
proposed:\
- STR form transcription factor binding sites)\
- STR induce unusual DNA secondary structures (e.g. Z-DNA)\
- STR affect RNA splicing\
- STR form toxic RNA and protein aggregates\
- STR modulate epigenetic properties (e.g. DNA methylation)\
- etc.\

### Q7

**What are some of the challenges in analysing STRs from NGS data?**\
- Short reads often do not span entire repeats (thus are not
informative, when reyling on standard tools)\
- STR variations in the form of large insertions or deletions may cause
problems in the alignment process and introduce a mapping bias toward
shorter alleles.\
- When performing PCR amplification during library preparation, the
physical slippage of DNA polymerase on the template strand can alter the
number of repeats in a STR (so-called *PCR stutter*).\

Second, read the following sections of the [paper describing
GangSTR](https://academic.oup.com/nar/article/47/15/e90/5518310): \*
Abstract \* Introduction \* Overview of the GangSTR model Then, answer
Q8 and Q9.

### Q8

**What sets GangSTR apart from other STR genotyping tools?**\
Multiple aspects of paired-end short reads can be informative of the
length of a repetitive region. Evidently, the number of repeats can be
easily determined from reads that completely enclose a STR region.
Besides these so-called enclosing read pairs, three other classes of
paired-end reads can be defined for the context of STR, namely spanning
read pairs, flanking read pairs and fully repetitive read pairs (compare
[Figure
1](https://academic.oup.com/view-large/figure/140580719/gkz501fig1.jpg)).\
All these four classes of read pairs as well as fragment length and
coverage can be used to determine the repeat length. Recently developed
tools for STR analysis rely on different combinations of these
information sources. However, only GangSTR uses all these informative
aspects of paired-end read alignments as input for a single joint
likelihood model (compare [Table
1](https://academic.oup.com/view-large/140580717)).\
Extensive benchmarking against existing methods showed that GangSTR is
both faster and more accurate than existing solutions. Furthermore, it's
neither limited by fragment nor read length.

### Q9

**What types of information does GangSTR use for STR genotyping?**\
GangSTR uses all four classes of pair-end reads, providing information
about copy number (enclosing/flanking read pairs), fragment length
(spanning read pairs) and distance to TR (fully repetitive read pairs).
