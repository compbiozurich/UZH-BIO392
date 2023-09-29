
# Questions BIO392 day 08
These questions are designed to test your understanding of the sequence analysis practical and the accompanying literature. Please change the name of this file to \<First letter\>-\<Last name\>-questions-day-08.md, (e.g., M-Mustermann-questions-day-08.md), and upload it to your folder in the course GitHub.

These questions will not be graded separately, but may be considered when determining your participation grade. The most important thing is not that you get everything right, but that you show that you thought about the questions; so no copy/pasting!

## Practical

### Q1
**Does the sequence quality graph of your data look different from the examples shown in the slides? Are there any adapter sequences in the data? Why do you think this is?**
The sequence quality graph looks different from the examples shown in the slides: The quality of my data looks very consistent at the highest quality score along the the reads, which is not what we would expect in data retrieved from a real experiment. I could thus conclude that the data is simulated. In the "adapter content" statistics, we can see that there are no adapter sequences in the data.

### Q2
**Given the FastQC reports, does it make sense to perform adapter and/or quality-trimming on your data?**
No, it wouldn't make sense as the quality graph is already at a top quality score.

### Q3
**Why are so many files in the bioinformatics pipeline compressed and indexed?**
Because files containing sequences are very big and thus need to be compressed in order to save storage space and transfer time. They are indexed for fast data retrieval and analysis to optimize processing speed.

### Q4
**In the bash script that processes alignment files, you will see calls to samtools sort, samtools view, and samtools index (among others). Explain what these three programs do. Why do you think each program is needed?**
*Hint: look at the [Samtools manual](http://www.htslib.org/doc/samtools.html)*.
+ *samtools sort:* sorts the records in SAM or BAM file based on the genomic coordinates. Sorted output can be saved in a new BAM file using the '-o' option
  e.g. ```samtools sort input.bam -o sorted_ouput.bam```
+ *samtools view:* used to view the contents of SAM, BAM or CRAM files. It can also be used to convert between these different formats.
  e.g. cnverting BAM to SAM: ```samtools view input.bam > output.sam```
+ *samtools index:* creates an index file for SAM, BAM, CRAM files. For SAM files it only works if they are BGZF compressed first. Allows quick access to specific regions of the alignment data without having to read the entire file.
  e.g. indexing a BAM file: ```samtools index input.bam```
### Q5
**Explain what files are needed for GangSTR to run. Specifically: explain what information is provided to GangSTR via the --ref, --region, and --bam command line arguments.**
*Hint: look at the [GangSTR manual](https://github.com/gymreklab/gangstr).*
GangSTR takes aligned reads in the BAM format and a set of repeats (tandem repeats) in the reference genome as input and outputs a VCF file containing genotypes for each locus.

- `--ref`: specifies the reference genome file

- `--regions`: specifies a file that provides information about the regions of interest

- `--bam`: This argument specifies the input BAM file

## Literature
During the practical so far, you have generated variant calls from short read sequencing data using bioinformatics approaches. Now it's time to take a step back and do some background reading in order to prepare for the analysis and interpretation of the results next week. 

First, read the following sections of [this review](https://www.sciencedirect.com/science/article/pii/S0959437X16301538):
* Abstract
* Introduction``
* Genotyping STRs from high-throughput sequencing data
Then, answer Q4 and Q5.

### Q6
**Why is STR variation relevant to health and disease?**
Short tandem repeats mutate very frequently and thus contribute to a large fraction of genetic variation. Recent studies have shown that STRs play an important role in regulating gene expression and other molecular phenotypes and are thus likely to have an impact on the development of Mendelian diseases, complex traits, and cancer.

### Q7
**What are some of the challenges in analysing STRs from NGS data?**
As a first point, it is challenging to analyze STRs from NGS data, because short reads often do not span entire repeats and are thus not informative. Furthermore, it is difficult to map STRs to a reference genome as there can be great variation among STRs due to large insertions and deletions. Finally, analyzing STRs by PCR amplification often introduces “stutter” noise in the number of repeats.

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
