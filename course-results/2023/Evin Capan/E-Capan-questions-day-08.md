
# Questions BIO392 day 08
These questions are designed to test your understanding of the sequence analysis practical and the accompanying literature. Please change the name of this file to \<First letter\>-\<Last name\>-questions-day-08.md, (e.g., M-Mustermann-questions-day-08.md), and upload it to your folder in the course GitHub.

These questions will not be graded separately, but may be considered when determining your participation grade. The most important thing is not that you get everything right, but that you show that you thought about the questions; so no copy/pasting!

## Practical

### Q1
**Does the sequence quality graph of your data look different from the examples shown in the slides? Are there any adapter sequences in the data? Why do you think this is?**

Yes, the sequence quality graphs do look different. The quality scores are a lot higher than in the examples shown in the slides and none of the patients' reads contain low quality sequences. This means that there are no (or very little) adapter sequences in the data, because adapter sequences decrease quality. These patient reads are simulations and not real data, which is probably the reason for the high quality sequences.

### Q2
**Given the FastQC reports, does it make sense to perform adapter and/or quality-trimming on your data?**

No, because none of the sequences in any of the patients were flagges as low quality and therefore do not need any trimming.

### Q3
**Why are so many files in the bioinformatics pipeline compressed and indexed?**

**Compressing**: Because otherwise, the data would take up too much storage space, which is unwanted when dealing with a lot of reads/sequences. And managing the files becomes easier this way.

**Indexing**: The data becmes more structured and can be accessed and retrieved faster. Indexing also makes searching for files easier for algorithms and applications.

### Q4
**In the bash script that processes alignment files, you will see calls to samtools sort, samtools view, and samtools index (among others). Explain what these three programs do. Why do you think each program is needed?**
*Hint: look at the [Samtools manual](http://www.htslib.org/doc/samtools.html)*.

* **samtools sort**: coordinate sorts SAM/BAM/CRAM files.
* **samtools view**: views and converts (compresses) SAM/BAM/CRAM files.
* **samtools index**: indexes SAM/BAM/CRAM files (for fast random access).

### Q5
**Explain what files are needed for GangSTR to run. Specifically: explain what information is provided to GangSTR via the --ref, --region, and --bam command line arguments.**
*Hint: look at the [GangSTR manual](https://github.com/gymreklab/gangstr).*

Files needed for GangSTR to run:
* Comma separated list of input BAM files, (via the "**--bam**" command line argument)
* FASTA file for refererence genome (.fa), (via the "**--ref**" command line argument)
* BED file containing TR coordinates (.bed), (via the "**--regions**" command line argument)
* Prefix to name output files, (via the "**--out**" command line argument)

## Literature
During the practical so far, you have generated variant calls from short read sequencing data using bioinformatics approaches. Now it's time to take a step back and do some background reading in order to prepare for the analysis and interpretation of the results next week. 

First, read the following sections of [this review](https://www.sciencedirect.com/science/article/pii/S0959437X16301538):
* Abstract
* Introduction``
* Genotyping STRs from high-throughput sequencing data
Then, answer Q6 and Q7.

### Q6
**Why is STR variation relevant to health and disease?**

Because of their repetitive nature inducing slippage events during DNA replication, short tandem repeats (STRs) are one of the fastest mutating loci in the genome. STR-profiling from high-throughput sequencing data have revealed that STRs are highly multiallelic and may contribute more de novo mutations than any other variant class. These can play a significant role in regulating gene expression and other molecular phenotypes, contributing to Mendelian diseases, complex traits, and cancer.

### Q7
**What are some of the challenges in analysing STRs from NGS data?**

* STRs are often filtered from sequencing pipelines due to their low quality calls.
* Short reads often do not span entire repeats, effectively reducing the number of informative reads.
* Tandem repeats variations present as large insertions or deletions that may be difficult to align to a reference genome, and thus introduce significant mapping bias toward shorter alleles.
* PCR amplification during library preparation often introduces “stutter” noise in the number of repeats at STRs.

Second, read the following sections of the [paper describing GangSTR](https://academic.oup.com/nar/article/47/15/e90/5518310):
* Abstract
* Introduction
* Overview of the GangSTR model
Then, answer Q8 and Q9.

### Q8
**What sets GangSTR apart from other STR genotyping tools?**

GangSTR is capable of genotyping both normal length and expanded repeats and relies on a general statistical model incorporating multiple properties of paired-end reads into a single maximum likelihood framework. GangSTR also works faster and more accurate than other STR genotyping tools (e.g., exSTRa, STRetch and ExpansionHunter) on simulated and real datasets. exSTRA needs a control cohort and does not estimate repeat length, STRetch does not analyze short TRs and is limited to motifs up to 6bp and ExpansionHunter cannot produce accurate genotypes across a range of repeat lengths when both alleles are close to or longer than the sequencing fragment length. GangSTR can genotype a range of TR classes, does not need a control cohort, can analyze short TRs and produe accurate genotypes when both alleles are close to/longer than the sequencing fragment length.

### Q9
**What types of information does GangSTR use for STR genotyping?**

* Enclosing class: Models *n* (number of repeat copies enclosed in the read) for different repeat lengths accounting for errors introduced during PCR.
* Spanning class: Models Δ (observed fragment length for a read pair) or different repeat lengths: Longer repeats = shorter observed fragment lengths. Also calculates the mean actual fragment length.
* Fully Repetitive Read (FRR) class: Models Ω (distance of the non-repetitive read from the repeat region) for different repeat lengths: Longer repeats = shorter observed Ω values.
* Flanking class: Models *k* (number of copies extracted from the flanking read) for different repeat lengths.
