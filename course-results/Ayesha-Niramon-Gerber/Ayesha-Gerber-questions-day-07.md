
# BIO392-day-07 Questions 
These questions are designed to test your understanding of the sequence analysis practical and the accompanying literature. Please change the name of this file to \<First letter\>-\<Last name\>-questions-day-07.md, and upload it to your folder in the course GitHub.
These questions will be graded. The most important thing is not that you get everything right, but that you show that you thought about the questions; so no copy/pasting!

## Practical

### Q1 **Does the sequence quality graph of your data look different from the examples shown in the slides? Are there any adapter sequences in the data? Why do you think this is?**
Yes. In the example slides boxplots are shwon on top of the sequences quality graph. in our sequence quality graph there are no box plots, because we have a overall quality score of 62 for all 6 sequencinf reads. There are no addapter sequences in the data (except a minimal amount of PolyA). The reason why our quality score is that high, could be because our datas are simulated. There are no uncertainties in sequencing and because of this no lowering in the quality score.

### Q2 **Given the FastQC reports, does it make sense to perform adapter and/or quality-trimming on your data?**
No. There is almost no adapter content and our quality score is overall perfect. There is no data that has to be trimmed.

### Q3 **Why are so many files in the bioinformatics pipeline compressed and indexed?**
Because the data size is really big.

### Q4 **In the bash script that processes alignment files, you will see calls to samtools sort, samtools view, and samtools index (among others). Explain what these three programs do. Why do you think each program is needed?**
*Hint: look at the [Samtools manual](http://www.htslib.org/doc/samtools.html)*.
- **samtools sort:** sorts alignments by the leftmost coordinate (is needed for later indexing)
- **samtools view:** converts SAM into BAM format & can extract specific reads
- **samtools index:** generates a index data for faster navigation

### Q5 **Explain what files are needed for GangSTR to run. Specifically: explain what information is provided to GangSTR via the --ref, --region, and --bam command line arguments.**
*Hint: look at the [GangSTR manual](https://github.com/gymreklab/gangstr).*
- --ref is the reference genome (.fa)
- --regions the target TR loci (.bed) 
- --bam the comma separated list of input BAM files.

## Literature
During the practical so far, you have generated variant calls from short read sequencing data using bioinformatics approaches. Now it's time to take a step back and do some background reading in order to prepare for the analysis and interpretation of the results next week. 

First, read the following sections of [this review](https://www.sciencedirect.com/science/article/pii/S0959437X16301538):
* Abstract
* Introduction``
* Genotyping STRs from high-throughput sequencing data
Then, answer Q6 and Q7.

### Q6 **Why is STR variation relevant to health and disease?**
STRs are some of the fastest mutating loci in the genome and contribute more *de novo* mutations than any other variant class. They play an important role in regulating gene expression, are often multi-allelic (generate complex inheritance patterns) and are therefore significant contributors to Medelian diseases, complex traits and cancer.

### Q7 **What are some of the challenges in analysing STRs from NGS data?**
STRs are often filtered from sequencing piplines due to their low quality calls.
Reasons for their low quality are:
1. Short reads often do not span entire repeats, effectively reducing the number of informative reads.
2. STR variations present as large insertions or deletions that may be difficult to align to a reference genome and thus indroduce significant mapping bias towards shorter alleles.
3. PCR amplification during library preparation often introduces "stutter" noise in the number of repeats at STRs.


Second, read the following sections of the [paper describing GangSTR](https://academic.oup.com/nar/article/47/15/e90/5518310):
* Abstract
* Introduction
* Overview of the GangSTR model
Then, answer Q8 and Q8.

### Q8 **What sets GangSTR apart from other STR genotyping tools?**
GangSTR is an end-to end method that takes sequence alignments and a reference set of TRs as input and outputs estimated diploid repeats length. Its core component is a maximum likelihood framework incorporating various sources of information from short paired-end reads (such as fragment lenth, coverage and existence of partially enclosing reads) into a single model that is applied separately to each TR in the genome. 
This difference sets GangSTR apart from previous existing tools, which have primarily focused on reapeat-enclosing reads. 


### Q9 **What types of information does GangSTR use for STR genotyping?**
GangSTR incorporates each of these informative aspects of *paired-end read* alignemnts (see Q8) into a single joint likelihood framework.

In the paper they defined 4 classes of paired-end reads:
- **enclosing read pairs (E):** consists of at least one read that contains the entire TR + non-repetitive flanking regions on either end.
- **spanning read pairs (S):** originate from a fragment that completely spans the TR, such that each read in the pair maps on either end of the repeat.
- **flanking read pairs (F):** contain a read that parially extends into the repetitive sequence of a read.
- **fully repetitive read pairs (FRR):** contain at least one read consisting entirely of the TR motif.

