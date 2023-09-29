
# Questions BIO392 day 08
These questions are designed to test your understanding of the sequence analysis practical and the accompanying literature. Please change the name of this file to \<First letter\>-\<Last name\>-questions-day-08.md, (e.g., M-Mustermann-questions-day-08.md), and upload it to your folder in the course GitHub.

These questions will not be graded separately, but may be considered when determining your participation grade. The most important thing is not that you get everything right, but that you show that you thought about the questions; so no copy/pasting!

## Practical

### Q1
**Does the sequence quality graph of your data look different from the examples shown in the slides? Are there any adapter sequences in the data? Why do you think this is?**

The sequence quality graphs look different from the examples on the slides. All samples show a horizontal line at the very top of the graph at a quality score of 62. This insinuates that all samples are perfect reads. This makes sense since the reads were simulated. 
The adapter content graph indicates a slightly larger polyA content towards the end but it does not seem like an actual adapter judging by the very slight increase starting around base 30. 

### Q2
**Given the FastQC reports, does it make sense to perform adapter and/or quality-trimming on your data?**

It does not make sense to perform adapter or quality trimming since the quality of all the bases of all reads are at maximum value.

### Q3
**Why are so many files in the bioinformatics pipeline compressed and indexed?**

To save up storage space. 

### Q4
**In the bash script that processes alignment files, you will see calls to samtools sort, samtools view, and samtools index (among others). Explain what these three programs do. Why do you think each program is needed?**
*Hint: look at the [Samtools manual](http://www.htslib.org/doc/samtools.html)*.

samtools sort: sorts the aligments by their coordinates, necessary so samtools index works later 

samtools view: compresses the aligments, necessary to save storage space

samtools index: indexes the alignments, necessary for easier accessing of the data

### Q5
**Explain what files are needed for GangSTR to run. Specifically: explain what information is provided to GangSTR via the --ref, --region, and --bam command line arguments.**
*Hint: look at the [GangSTR manual](https://github.com/gymreklab/gangstr).*

GangSTR needs:
* a reference genome provided via --ref,
* a target regions provided via --regions,
* a list of input BAM files provided via --bam.

Additionally we provided the sample names.


## Literature
During the practical so far, you have generated variant calls from short read sequencing data using bioinformatics approaches. Now it's time to take a step back and do some background reading in order to prepare for the analysis and interpretation of the results next week. 

First, read the following sections of [this review](https://www.sciencedirect.com/science/article/pii/S0959437X16301538):
* Abstract
* Introduction
* Genotyping STRs from high-throughput sequencing data
Then, answer Q4 and Q5.

### Q6
**Why is STR variation relevant to health and disease?**

STRs being highly mutating regions and holding large amounts of genetic diversity makes them highly interesting and valuable at the moment of understanding genetic diseases and cancer. 

It has been shown that expansions in these regions have pathogenic effects like RNA toxicity and hypermethylation. Smaller alterations seem to have an effect on RNA splicing and regulation of gene expression. 

While its effects on spontaneous de novo conditions have not been analyzed yet, these regions might prove helpful to understand more complex inheritance patterns.

### Q7
**What are some of the challenges in analysing STRs from NGS data?**

* The shortness of reads that do not span the entire length of the repeats reduces the number of informative reads.

* There is the possibility that larger deletions or insertions of repeats lead to a bias toward shorter alleles.

* PCR amplification can introduce noise into the nmber of repeats at STRs.

* Due to the challenge of genotyping them and the resulting low quality calls, STRs are often discarded from analyses. 

Second, read the following sections of the [paper describing GangSTR](https://academic.oup.com/nar/article/47/15/e90/5518310):
* Abstract
* Introduction
* Overview of the GangSTR model
Then, answer Q6 and Q7.

### Q8
**What sets GangSTR apart from other STR genotyping tools?**

GangSTR estimates TR lengths. Other methods rely on finding informatinve reads that enclose the whole repeating region. This leads to repeats spanning more than 70 bp to be almost impossible to genotype.
Unlike other tools, GangSTR uses enclosing, spanning, FRR and flanking read pairs and not only a reduced selection of them. Additionaly it can work genome-wide and estimate the number of repeats. 

### Q9
**What types of information does GangSTR use for STR genotyping?**

* sequence alignments
* reference set of TRs
* maximum likelihood framework

Sequence alignments can be **enclosing**, containing the whole TR and non repetitive flanking region; **spanning**, originating from a fragment that spans the TR and mapping the ends of the repeat; **FRR**, consisting entirely of TR motif; or **flanking**, partially extendinginto the repetive sequence. 
