
# Questions BIO392 day 08
These questions are designed to test your understanding of the sequence analysis practical and the accompanying literature. Please change the name of this file to \<First letter\>-\<Last name\>-questions-day-08.md, (e.g., M-Mustermann-questions-day-08.md), and upload it to your folder in the course GitHub.

These questions will not be graded separately, but may be considered when determining your participation grade. The most important thing is not that you get everything right, but that you show that you thought about the questions; so no copy/pasting!

## Practical

### Q1
**Does the sequence quality graph of your data look different from the examples shown in the slides? Are there any adapter sequences in the data? Why do you think this is?**
In comparison to slides the graph show only a constant line at the 62 quality score. There are only some Poly A adapter sequences. The reason fro this might be the facts that all reads come from a single gene.  

### Q2
**Given the FastQC reports, does it make sense to perform adapter and/or quality-trimming on your data?**
Since all quality scores are equal and there is only a single adapter with a low percentage it is not necessary to perform trimming on our data. 

### Q3
**Why are so many files in the bioinformatics pipeline compressed and indexed?**
The files from genome sequencing take up huge storage resources and they need to be compressed in order to minimise this consuption. Indexing enables a rapid access to the required locations of the files in the large data files. 

### Q4
**In the bash script that processes alignment files, you will see calls to samtools sort, samtools view, and samtools index (among others). Explain what these three programs do. Why do you think each program is needed?**
*Hint: look at the [Samtools manual](http://www.htslib.org/doc/samtools.html)*.
Samtools sort: is used to compress the data. Important to reduce the storage requirements. 
Samtools index: is used to easily access the required file from a large data content thus saving a time.
Samtools view: is used to convert one data format to another. 


### Q5
**Explain what files are needed for GangSTR to run. Specifically: explain what information is provided to GangSTR via the --ref, --region, and --bam command line arguments.**
*Hint: look at the [GangSTR manual](https://github.com/gymreklab/gangstr).*
GangSTR requires the reference genome file (--ref), target TR loci (regions)(-- regions) and input BAM files of short read alignments (--bam).

## Literature
During the practical so far, you have generated variant calls from short read sequencing data using bioinformatics approaches. Now it's time to take a step back and do some background reading in order to prepare for the analysis and interpretation of the results next week. 

First, read the following sections of [this review](https://www.sciencedirect.com/science/article/pii/S0959437X16301538):
* Abstract
* Introduction``
* Genotyping STRs from high-throughput sequencing data
Then, answer Q4 and Q5.

### Q6
**Why is STR variation relevant to health and disease?**
Your answer here

### Q7
**What are some of the challenges in analysing STRs from NGS data?**
Your answer here

Second, read the following sections of the [paper describing GangSTR](https://academic.oup.com/nar/article/47/15/e90/5518310):
* Abstract
* Introduction
* Overview of the GangSTR model
Then, answer Q6 and Q7.

### Q8
**What sets GangSTR apart from other STR genotyping tools?**
Your answer here

### Q9
**What types of information does GangSTR use for STR genotyping?**
Your answer here
