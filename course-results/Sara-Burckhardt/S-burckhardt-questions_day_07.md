
# BIO392-day-07 Questions 
These questions are designed to test your understanding of the sequence analysis practical and the accompanying literature. Please change the name of this file to \<First letter\>-\<Last name\>-questions-day-07.md, and upload it to your folder in the course GitHub.
These questions will be graded. The most important thing is not that you get everything right, but that you show that you thought about the questions; so no copy/pasting!

## Practical

### Q1
**Does the sequence quality graph of your data look different from the examples shown in the slides? Are there any adapter sequences in the data? Why do you think this is?**

The sequence quality graph looks different from the one in the slides (there are no boxes). This is due to that the data is simulated, due to this the box-plots are all the same, and there are no differences between and within the reads. They all have the same quality score. 
There are no adapter sequences that are normally used for the sequencing process because this is no real data, but simulated data.

### Q2
**Given the FastQC reports, does it make sense to perform adapter and/or quality-trimming on your data?**

No, because they already have the same quality score and there are no adaptor sequences. All 6 plots look the same.  

### Q3
**Why are so many files in the bioinformatics pipeline compressed and indexed?**

This is the case because the normal files (as eg. FASTQ, BAM, VCF) are often huge. By compressing them they are reduced in size and it is easier to work with them, they need less storage space and can speed up processes. Indexing is helpful when not the hole file, but a specific part is needed. The index tells where to specifically jump in the file without having to read the hole file (kind of like a bookmark). This leads to much faster processes and targeted acces. 

### Q4
**In the bash script that processes alignment files, you will see calls to samtools sort, samtools view, and samtools index (among others). Explain what these three programs do. Why do you think each program is needed?**
*Hint: look at the [Samtools manual](http://www.htslib.org/doc/samtools.html)*.

 1. samtools sort: This is used to sort alignments according to the leftmost coordinates. Depending on the option added it is sorted in another way (eg. -n: sorted by read name, -t: sorted by tag name, ...)
 2. samtools view: This is to view and convert files. The option determins in what format it is printed. With no option the file is printed in the specified input alignment file.
 3. samtools index: This indexes the files to a fast random acces. The file needs to be BGZF compressed. The options determine the type of index.
The programs are needed for a faster and specific processing of the data. With it one can easily determin how the files should be sorted, view and indexed.
Some programs as for example GangSTR require a specific file format that are sorted and indexed. For this samtools can be used. 

### Q5
**Explain what files are needed for GangSTR to run. Specifically: explain what information is provided to GangSTR via the --ref, --region, and --bam command line arguments.**
*Hint: look at the [GangSTR manual](https://github.com/gymreklab/gangstr).*

The files in the folder needed for GangSTR to run (automatically created): 
 1. insdata.tab:  For the insertion data, in a tab-delimited text format.
 2. tats.tab:     A tab-delimited file (only plain text which makes it easy to read and parse)
 3. vcf.gz:       A Variant Call Format in a gzip-compressed Form
 
Comand line arguments/options that are required for GangSTR: 
 1. --ref:That the input is a reference genome in FASTA format. The same reference must be used to build the alignment of the sequences in the BAM file. This it to compare the region to. 
 2. --region: A reference set of regions to genotype that is in a BED-like file with specific columns (chromosome name, start and end positions of the STR, repeat motif and length)
 3. --bam: That it is a sorted and indexed BAM file produced by an indel-sensitive aligner (as required).
 4. another option that is required is the --out, a prefix to name the output file


## Literature
During the practical so far, you have generated variant calls from short read sequencing data using bioinformatics approaches. Now it's time to take a step back and do some background reading in order to prepare for the analysis and interpretation of the results next week. 

First, read the following sections of [this review](https://www.sciencedirect.com/science/article/pii/S0959437X16301538):
* Abstract
* Introduction``
* Genotyping STRs from high-throughput sequencing data
Then, answer Q4 and Q5.

### Q6
**Why is STR variation relevant to health and disease?**

* STRs play a role in regulating gene expression and molecular phenotyps this can contribute to diseases and health due to a change in the repeats 
* they contribute to cancer, complex trains and Mendelian diseases by inducing pathogenic effects. These effects can be polyglutamine aggregation, hypermethylations, RNA toxicity and repeat associated non-ATG tranlations. They can also effect RNA splicing. All these can lead to an increased risk for specific diseases.

### Q7
**What are some of the challenges in analysing STRs from NGS data?**

Challenges include: 
* the reads are often to short, not capturing the hole repeats. This leads to loss of informative reads and with that to less quality .
* the low quality calls lead to filtering of the STRs from sequencing pipelines (even of known pathogenic STRs) 
* long insertions / deletions lead to problems when aligning with the reference genome -> mapping bias
* PCR amplification can introduce "stutter" noise in the number of repeats
Either information is lost, the quality is low or there are biases that occure during the processing, all these lead to an unaquarte and information lacking data. 
Due to new bioinformatic tools and sequencing techniques there are now improvements for these challenges.


Second, read the following sections of the [paper describing GangSTR](https://academic.oup.com/nar/article/47/15/e90/5518310):
* Abstract
* Introduction
* Overview of the GangSTR model
Then, answer Q6 and Q7.

### Q8
**What sets GangSTR apart from other STR genotyping tools?**

* GangSTR is more accurate and faster than other solutions
* It can be used genome wide and not only on a small pannel
* It is able to identify novel pathogenic expansions and can be used for GWAS of TR varianton in large cohorts

### Q9
**What types of information does GangSTR use for STR genotyping?**

It extracts information from paired-end reads (enclosing, spanning and flanking read pairs) from NGS data (the gold standard) into a single model and then estimates the diploid repeat lengths.  
