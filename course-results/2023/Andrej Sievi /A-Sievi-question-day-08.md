

# Questions BIO392 day 08
These questions are designed to test your understanding of the sequence analysis practical and the accompanying literature. Please change the name of this file to \<First letter\>-\<Last name\>-questions-day-08.md, (e.g., M-Mustermann-questions-day-08.md), and upload it to your folder in the course GitHub.

These questions will not be graded separately, but may be considered when determining your participation grade. The most important thing is not that you get everything right, but that you show that you thought about the questions; so no copy/pasting!

## Practical

### Q1
**Does the sequence quality graph of your data look different from the examples shown in the slides? Are there any adapter sequences in the data? Why do you think this is?**
Our result from the plot is much more precise than the plot from the slide. Therefore the line sticks to the top which indicates a hgih accuracy. 
Adapter Sequence are worse readable as the DNA nucelotide sequence, for this reason i assume that no adapter sequence are contained.


### Q2
**Given the FastQC reports, does it make sense to perform adapter and/or quality-trimming on your data?**
Because our Data as already a very high quality, it is no necessary to trimm to improve the accuracy.

### Q3
**Why are so many files in the bioinformatics pipeline compressed and indexed?**
Compressed Data is much easier for the programm to handle. For a hugh amount of Data it is a great improved in processing.
Also Indexing makes the process more efficient.



### Q4
**In the bash script that processes alignment files, you will see calls to samtools sort, samtools view, and samtools index (among others). Explain what these three programs do. Why do you think each program is needed?**
*Hint: look at the [Samtools manual](http://www.htslib.org/doc/samtools.html)*.

samtools sort:
sorts SAM/BAM/CRAM files
This tool sorts alignment by leftmost coordinates. It shows you the sequences which correlates which the comparison strand. 

samtools index:
– indexes SAM/BAM/CRAM files
This tools is used to refer to desired regions on the Nucleotide sequence. It allows a better structre and a faster access.
For this tool to execute it is required that the file has been BGZF compressed.

samtools view: 
views and converts SAM/BAM/CRAM files
This tool generates output of overlapping sequences. It is possible to specifiy the region of out with allowing spaces, however
then the accuracy decreases. 


### Q5
**Explain what files are needed for GangSTR to run. Specifically: explain what information is provided to GangSTR via the --ref, --region, and --bam command line arguments.**
*Hint: look at the [GangSTR manual](https://github.com/gymreklab/gangstr).*

GangSTR(tools)

--ref:
It is required to put in a FASTA format firstly. It has to be the same referrence genom used to align the sequences in the BAM file.

--region:
GangSTR requires a reference set of regions to genotype. This is a BED-like file with the following columns:

1. The name of the chromosome on which the STR is located
2. The start position of the STR on its chromosome
3. The end position of the STR on its chromosome
4. The motif length
5. The repeat motif

--bam:
GangSTR requires a BAM file designed by a sensitive Indel-Aligner. The BAM file has to be sorted and index with samtools to function properly.
Is not possible to process more than one sample at the same time. 


## Literature
During the practical so far, you have generated variant calls from short read sequencing data using bioinformatics approaches. Now it's time to take a step back and do some background reading in order to prepare for the analysis and interpretation of the results next week. 

First, read the following sections of [this review](https://www.sciencedirect.com/science/article/pii/S0959437X16301538):
* Abstract
* Introduction``
* Genotyping STRs from high-throughput sequencing data
Then, answer Q4 and Q5.

### Q6
**Why is STR variation relevant to health and disease?**
STR are involved in the genregulation and is related to several pathogenic effects. Short Tandem Repeats has a high mutation probability and has to be 
closly observed to understand the behaviour. up to 3% of the Genom is reported to be STR's. Small SNP's is said to have influence on the RNA splicing 
which is included in plenty of disorders.



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
