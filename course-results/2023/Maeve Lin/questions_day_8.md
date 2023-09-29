
# Questions BIO392 day 08
These questions are designed to test your understanding of the sequence analysis practical and the accompanying literature. Please change the name of this file to \<First letter\>-\<Last name\>-questions-day-08.md, (e.g., M-Mustermann-questions-day-08.md), and upload it to your folder in the course GitHub.

These questions will not be graded separately, but may be considered when determining your participation grade. The most important thing is not that you get everything right, but that you show that you thought about the questions; so no copy/pasting!

## Practical

### Q1
**Does the sequence quality graph of your data look different from the examples shown in the slides? Are there any adapter sequences in the data? Why do you think this is?** \
We don't see the bins with the different quality scores, because they are simulated data and all perfect, or at least they don't have a quality score. We only see a line at the top at 62.

### Q2
**Given the FastQC reports, does it make sense to perform adapter and/or quality-trimming on your data?** \
No, we cannot trim any data that has all the same quality score. 

### Q3
**Why are so many files in the bioinformatics pipeline compressed and indexed?** \
Because the sequence files are very big and to be able to share them with other people, it's faster when their size is compressed. 

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