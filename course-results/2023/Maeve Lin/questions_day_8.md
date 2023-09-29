
# Questions BIO392 day 08
These questions are designed to test your understanding of the sequence analysis practical and the accompanying literature. Please change the name of this file to \<First letter\>-\<Last name\>-questions-day-08.md, (e.g., M-Mustermann-questions-day-08.md), and upload it to your folder in the course GitHub.

These questions will not be graded separately, but may be considered when determining your participation grade. The most important thing is not that you get everything right, but that you show that you thought about the questions; so no copy/pasting!

## Practical

### Q1
**Does the sequence quality graph of your data look different from the examples shown in the slides? Are there any adapter sequences in the data? Why do you think this is?** \
We don't see the bins with the different quality scores, because they are simulated data and all perfect, or at least they don't have a quality score. We only see a line at the top at 62. The graph showing the adapter content shows a line that is basically zero, hence we have no adapters. We have no adapters because we didn't need any to produce the sequences, as the data is machine-generated. 

### Q2
**Given the FastQC reports, does it make sense to perform adapter and/or quality-trimming on your data?** \
No, we cannot trim any data that has no adapters and that has all the same and perfect quality score. 

### Q3
**Why are so many files in the bioinformatics pipeline compressed and indexed?** \
Because the sequence files are very big, which makes storage expensive, and to be able to share them with other people, it's faster when their size is compressed. Indexing makes the accessing of the information in the files faster for the file-editing tools. 

### Q4
**In the bash script that processes alignment files, you will see calls to samtools sort, samtools view, and samtools index (among others). Explain what these three programs do. Why do you think each program is needed?** \
*Hint: look at the [Samtools manual](http://www.htslib.org/doc/samtools.html)*.
* samtools addreplacerg: adds or replaces read group tags; -r STRING lets you add a string to the header
* samtools sort: it sorts the alignments, in our case according to coordinates (without specifying other flags)
* samtools view --bam: we use this to compress the sam files to bam files
* samtools index: indexes our files, so we can access them separately later

### Q5
**Explain what files are needed for GangSTR to run. Specifically: explain what information is provided to GangSTR via the --ref, --region, and --bam command line arguments.** \
*Hint: look at the [GangSTR manual](https://github.com/gymreklab/gangstr).*
* --ref: which is the file containing the reference genome
* --region: which is the region of the genome we want to look at, here the region with the repeats (target loci)
* --bam: which is the file containing the alignments

## Literature
During the practical so far, you have generated variant calls from short read sequencing data using bioinformatics approaches. Now it's time to take a step back and do some background reading in order to prepare for the analysis and interpretation of the results next week. 

First, read the following sections of [this review](https://www.sciencedirect.com/science/article/pii/S0959437X16301538):
* Abstract
* Introduction``
* Genotyping STRs from high-throughput sequencing data
Then, answer Q4 and Q5.

### Q6
**Why is STR variation relevant to health and disease?**
* STRs are loci that mutate fast (because of slippages that occur at the repetitive elements) and often have multiple alleles
* hence, they are important for de novo mutations and for gene expression regulation
* this leads to a big pool of variation
* the expansions often lead to diseases or disorders
  * these are mostly inherited via an autosomal dominant pattern
  * up to now the role of STRs in neurodevelopmental disorders is unclear

### Q7
**What are some of the challenges in analysing STRs from NGS data?**
* NGS use short reads and these sometimes don’t even span one whole repeat
  * Not enough informative reads
* The variation of the STRs can be so large that it’s impossible to align the repeats to the reference genome
  * Hence, only short alleles will be mapped and we think this is a representative sample of STRs
* PCR produces stutter noise in the repeats 

Second, read the following sections of the [paper describing GangSTR](https://academic.oup.com/nar/article/47/15/e90/5518310):
* Abstract
* Introduction
* Overview of the GangSTR model
Then, answer Q6 and Q7.

### Q8
**What sets GangSTR apart from other STR genotyping tools?**
* It can analyze short and expanded tandem repeats 
* And focuses on good quantification of repeat counts 
* It is faster and more accurate
* It takes more information into account than other tools 
* It looks at the whole length of the reads that enclose one repeat (can be up to 100bp long) 
  * Others only go up to 70pb 

### Q9
**What types of information does GangSTR use for STR genotyping?**
* Input 
  * Sequence alignments 
  * Reference set of TRs 
* Output 
  * Estimated diploid repeat lengths 
* Also takes into account 
  * Fragment length 
  * Coverage 
  * Existence of partially enclosing reads 
* Generally the information is from paired-end reads 
* The tools puts it into a unified model to estimate the TR lengths using the maximum likelihood method 
