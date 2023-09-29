
# Questions BIO392 day 08
These questions are designed to test your understanding of the sequence analysis practical and the accompanying literature. Please change the name of this file to \<First letter\>-\<Last name\>-questions-day-08.md, (e.g., M-Mustermann-questions-day-08.md), and upload it to your folder in the course GitHub.

These questions will not be graded separately, but may be considered when determining your participation grade. The most important thing is not that you get everything right, but that you show that you thought about the questions; so no copy/pasting!

## Practical

### Q1
**Does the sequence quality graph of your data look different from the examples shown in the slides? Are there any adapter sequences in the data? Why do you think this is?**.

They all look the same, in particular because they are artificially generated.  
They all have perfect scores, also because of the artificial generation.  
"Sequences flagged as poor quality:	0"

### Q2
**Given the FastQC reports, does it make sense to perform adapter and/or quality-trimming on your data?**

No it does not, especially when we compare it to the examples on the slides, where there is a clear quality decrease at the beginning and the end of the read.  

### Q3
**Why are so many files in the bioinformatics pipeline compressed and indexed?**

Because the raw information is very storage intensive, compression saves disk space.
Indexing makes it faster to look up locations and find positions when comparing with a reference genome for example.

### Q4
**In the bash script that processes alignment files, you will see calls to samtools sort, samtools view, and samtools index (among others). Explain what these three programs do. Why do you think each program is needed?**
*Hint: look at the [Samtools manual](http://www.htslib.org/doc/samtools.html)*.

`01_alignment.sh` aligns sequencing reads from three patients (listed in the `SAMPLES` array) to a reference genome using the `bwa-mem2` tool. 
Inside a loop, it constructs input file paths for both forward and reverse reads for each patient, aligns the reads to the reference genome, and saves the resulting alignment data in SAM format. 
This command uses `bwa-mem2` to align sequencing reads.
The aligned SAM files are stored in the `../data/alignments` directory with filenames corresponding to each patient's name.

`02_process_alignments.sh` processes DNA sequencing data for a list of patients stored in the `SAMPLES` array. 
It adds read group information to SAM files: samtools addreplacerg ... `"${ALIGNMENT}" |`: This part of the code adds read group (RG) information to the SAM file specified by the `${ALIGNMENT}` variable. 
samtools sort is used to sort the alignments in the SAM file by their coordinates (chromosome and position).
Next, it compresses them into BAM format with samtools view, and indexes the resulting BAM files for random data access. Each patient's data is processed in a loop, and the output BAM files are saved in the `../data/alignments` directory with corresponding names.

### Q5
**Explain what files are needed for GangSTR to run. Specifically: explain what information is provided to GangSTR via the --ref, --region, and --bam command line arguments.**
*Hint: look at the [GangSTR manual](https://github.com/gymreklab/gangstr).*

1. `--ref`: specifies the reference genome file (`REF`). 

2. `--regions`: specifies a file that provides information about the regions of interest (`REGIONS`).

3. `--bam`: This argument specifies the input BAM file (`ALIGNMENT`). 


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
