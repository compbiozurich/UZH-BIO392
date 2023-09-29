
# Questions BIO392 day 08
These questions are designed to test your understanding of the sequence analysis practical and the accompanying literature. Please change the name of this file to \<First letter\>-\<Last name\>-questions-day-08.md, (e.g., M-Mustermann-questions-day-08.md), and upload it to your folder in the course GitHub.

These questions will not be graded separately, but may be considered when determining your participation grade. The most important thing is not that you get everything right, but that you show that you thought about the questions; so no copy/pasting!

## Practical

### Q1
**Does the sequence quality graph of your data look different from the examples shown in the slides? Are there any adapter sequences in the data? Why do you think this is?**

The examples shown in the slides show a decreasing quality score at the very start and especially with growing lengths of the reads. In our data, the quality score is perfect for every basepair (62 all across the graph).
Looking at the adapter content graph, it becomes clear that there are no adapters left in our sequences.
This all is because our data is simulated.

### Q2
**Given the FastQC reports, does it make sense to perform adapter and/or quality-trimming on your data?**

Since there are no adapters and the quality is perfect all across the sequences, no trimming will be needed.

### Q3
**Why are so many files in the bioinformatics pipeline compressed and indexed?**

Since files in bioinformatics are often quite large, compression is important to ensure a steady workflow. The indexing is needed to allow random access (tools that work with reference genome sequences require indexes!).

### Q4
**In the bash script that processes alignment files, you will see calls to samtools sort, samtools view, and samtools index (among others). Explain what these three programs do. Why do you think each program is needed?**
*Hint: look at the [Samtools manual](http://www.htslib.org/doc/samtools.html)*.

"Sort" sorts our alignments. By default, they are sorted by leftmost coordinates. "View" prints all alignments in the specified input alignment file (in SAM, BAM, or CRAM format) to standard output in SAM format. "Index" indexes coordinate-sorted SAM, BAM or CRAM files for fast random access.
The sorting and indexing is needed for further analysis steps, e.g. when using GangSTR.


### Q5
**Explain what files are needed for GangSTR to run. Specifically: explain what information is provided to GangSTR via the --ref, --region, and --bam command line arguments.**
*Hint: look at the [GangSTR manual](https://github.com/gymreklab/gangstr).*

The required parameters for GangSTR are --bam, --ref, and --regions.
With --bam <file.bam,[file.bam]>, we provide our BAM files containing the alignments. In our case, these are the files patient_1.bam, patient_2.bam and patient_3.bam.
With --ref, we provide the reference sequence (in our case "APC.fa", a file in fa format that contains a sequence on chromosome 5 which serves as our reference).
With --regions, we provide a file containing all regions that contain repeats (in our case "APC_repeats.tsv", a file in gene expression file format). In the file, we have five columns: The chromosome name, start of the STR locus, end of the STR locus, motif length, and motif.



## Literature
During the practical so far, you have generated variant calls from short read sequencing data using bioinformatics approaches. Now it's time to take a step back and do some background reading in order to prepare for the analysis and interpretation of the results next week. 

First, read the following sections of [this review](https://www.sciencedirect.com/science/article/pii/S0959437X16301538):
* Abstract
* Introduction``
* Genotyping STRs from high-throughput sequencing data
Then, answer Q4 and Q5.

### Q6
**Why is STR variation relevant to health and disease?**

It has been shown that STR expansions can have pathogenic effects on gene regulation and function. They have been implicated in dozens of genetic diseases.
On the level of gene regulation, STRs may form transcription binding sites or modulate epigenetic properties.
They also may modulate alternative splicing.


### Q7
**What are some of the challenges in analysing STRs from NGS data?**

Reads are only informative when they span entire repeats. We are working with short reads and thus, not many of them are informative. Also, large insertions or deletions are hard to detect because they are more difficult to align correctly.
PCR errors occur more often in STR regions.

Second, read the following sections of the [paper describing GangSTR](https://academic.oup.com/nar/article/47/15/e90/5518310):
* Abstract
* Introduction
* Overview of the GangSTR model
Then, answer Q6 and Q7.

### Q8
**What sets GangSTR apart from other STR genotyping tools?**

GangSTR is both faster and more accurate than existing solutions.
Most existing tools (other than GangSTR) focus on reads that enclose a whole repeat section.
GangSTR is limited by neither fragment nor read length.

### Q9
**What types of information does GangSTR use for STR genotyping?**

GangSTR takes a reference set of Tandem Repeats and sequence alignments as input.
It uses information of several types of paired-end reads (enclosing, spanning, flanking and fully repetitive ones) and incorporates them all into one maximum likelihood framework.

