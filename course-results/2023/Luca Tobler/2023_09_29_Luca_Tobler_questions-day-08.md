
# Questions BIO392 day 08
These questions are designed to test your understanding of the sequence analysis practical and the accompanying literature. Please change the name of this file to \<First letter\>-\<Last name\>-questions-day-08.md, (e.g., M-Mustermann-questions-day-08.md), and upload it to your folder in the course GitHub.

These questions will not be graded separately, but may be considered when determining your participation grade. The most important thing is not that you get everything right, but that you show that you thought about the questions; so no copy/pasting!

## Practical

### Q1
**Does the sequence quality graph of your data look different from the examples shown in the slides? Are there any adapter sequences in the data? Why do you think this is?**
No, because the data is artificial all bp have a perfect quality score (blue line at the very top of the graph). No Adapters appear in "Adapter Content" graph.

### Q2
**Given the FastQC reports, does it make sense to perform adapter and/or quality-trimming on your data?**
Based on observations in Q1, these steps are not neccessairy.

### Q3
**Why are so many files in the bioinformatics pipeline compressed and indexed?**
Bioinformatics work with high data volumes, compression saves storage space. 

### Q4
**In the bash script that processes alignment files, you will see calls to samtools sort, samtools view, and samtools index (among others). Explain what these three programs do. Why do you think each program is needed?**
*Hint: look at the [Samtools manual](http://www.htslib.org/doc/samtools.html)*.
samtools sort is run after the alignment happens, and sorts the alignments by their leftmost coordinate, so that they appear in the correct order in the generated .bam file
samtools view prints prints the alignments in to the specified .bam file (/${SAMPLE}.bam)

### Q5
**Explain what files are needed for GangSTR to run. Specifically: explain what information is provided to GangSTR via the --ref, --region, and --bam command line arguments.**
*Hint: look at the [GangSTR manual](https://github.com/gymreklab/gangstr).*
--ref specifies the reference genome file. our samples will be alingned to this.
--region points to a file containing information about specific regions. these are probably the STR regions.
--bam specifies that we want to get the alignment in bam format (Binary Alignment/Map).

## Literature
During the practical so far, you have generated variant calls from short read sequencing data using bioinformatics approaches. Now it's time to take a step back and do some background reading in order to prepare for the analysis and interpretation of the results next week. 

First, read the following sections of [this review](https://www.sciencedirect.com/science/article/pii/S0959437X16301538):
* Abstract
* Introduction``
* Genotyping STRs from high-throughput sequencing data
Then, answer Q4 and Q5.

### Q6
**Why is STR variation relevant to health and disease?**
STRs are known to play a role in dozens of disorders. They have an effect on the regulation of gene expression, proposed and known mechanisms are: STRs can form binding sizes for transcription factors, they can change the spacing between regulatory elements, cause unusual secondary structures of DNA such as Z-DNA, effect epigenetic modification of DNA and heterochromatization. Furthermore, effects can also manifest on RNA or protein level, for example alternate splicing which can produce toxic RNA.

### Q7
**What are some of the challenges in analysing STRs from NGS data?**
PCR amplification itself can change the number of repeats through stutter error. The main challenge is local alignment of short sequence reads. Most short reads do not span all repeats, which means that there are fewer informative reads. Because STR variations are effectively large indels, it is difficult to map them to the existing reference genome, and many algorithms are biased to mapping towards shorter alleles. 

Second, read the following sections of the [paper describing GangSTR](https://academic.oup.com/nar/article/47/15/e90/5518310):
* Abstract
* Introduction
* Overview of the GangSTR model
Then, answer Q6 and Q7.

### Q8
**What sets GangSTR apart from other STR genotyping tools?**
GangSTR is less computationally expensive than other models, is more flexible in the lenght of motifs (more than 6bp). Other models are limited in the lenght of the TR, often they are not allowed to be longer or substantially longer than the reads by the used sequencing technique.  GangSTR utilizes a general statistical model that incorporates multiple properties of paired-end reads into a single maximum likelihood framework. This model takes into account not only repeat-enclosing reads but also other informative aspects like fragment length, coverage, and the presence of partially enclosing reads. 
GangSTR has been benchmarked against existing methods and proven to be faster and more accurate. 
### Q9
**What types of information does GangSTR use for STR genotyping?**

GangSTR uses multiple aspects of paired-end short reads to determine the length of repetitive regions.

Enclosing Read Pairs (‘E’): These pairs consist of at least one read that fully contains the entire TR along with non-repetitive flanking regions on both ends. The presence of these reads allows for straightforward determination of the repeat number by counting the observed repeats.

Spanning Read Pairs (‘S’): These pairs originate from a fragment that entirely spans the TR, with each read in the pair mapping to either end of the repeat. Spanning reads provide information about the overall length of the repeat.

Flanking Read Pairs (‘F’): These pairs contain a read that partially extends into the repetitive sequence of the TR. While not fully enclosing the repeat, they still offer partial information about the repeat length.

Fully Repetitive Read Pairs (‘FRR’): These pairs consist of at least one read entirely composed of the TR motif. Fully repetitive reads provide direct evidence of the repetitive sequence without non-repetitive flanking regions.