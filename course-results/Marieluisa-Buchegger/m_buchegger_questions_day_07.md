
# BIO392-day-07 Questions 
These questions are designed to test your understanding of the sequence analysis practical and the accompanying literature. Please change the name of this file to \<First letter\>-\<Last name\>-questions-day-07.md, and upload it to your folder in the course GitHub.
These questions will be graded. The most important thing is not that you get everything right, but that you show that you thought about the questions; so no copy/pasting!

## Practical

### Q1
**Does the sequence quality graph of your data look different from the examples shown in the slides? Are there any adapter sequences in the data? Why do you think this is?** \
Given the data is simulated, the sequence quality graph does not show up for us in FASTQC. As discussed in plenum, we cannot answer Q1 or Q2.

### Q2
**Given the FastQC reports, does it make sense to perform adapter and/or quality-trimming on your data?** \
Since we cannot see the sequence quality, we cannot answer this question. \
However, if the FastQC reports show quality scores in the red area it would make snese to trim our data to remove those reads (that are usually very long).

### Q3
**Why are so many files in the bioinformatics pipeline compressed and indexed?**\
Compression reduces the size of the FASTA files, so they are easier to store, transfer and use. \
Indexing allows for easier access of the data, which is very useful for large-scale genome analysis. \ 
.fai: is FASTA index file, sequences are then easy to retrieve quickly, has the position of each sequence \
.fa.bwt: is a Burrows-Wheeler Transform (BWT) index file, transforms reference genome for faster queries \
.fa.amb/.fa.ann: are files associated with BWT that contains metadata needed for efficient mapping/alignment. \
.fa.pac: stores the prefix array, storing suffixes of the reference genome, for faster sequence retrieval \
.fa.bwt.2bit.64: is a 2-bit encoding of the genome, reduces space required ot store the reference genome \
Source: <https://www.bsiranosian.com/bioinformatics/why-are-bioinformatics-workflows-different/#:~:text=Most%20genomic%20data%20is%20stored%20in%20large%20compressed,files%20as%20inputs%20and%20produce%20files%20as%20outputs.> \
<https://genome.ucsc.edu/FAQ/FAQformat.html>

### Q4
**In the bash script that processes alignment files, you will see calls to samtools sort, samtools view, and samtools index (among others). Explain what these three programs do. Why do you think each program is needed?**
*Hint: look at the [Samtools manual](http://www.htslib.org/doc/samtools.html)*.
- sort: sorts alignments in a BAM file by genomic coordinates --> this makes an ordered BAM
- view: converts all alignments in files like (BAM or CRAM) to a standard output in SAM format, or vice versa.
- index: creates a .bai index file, which enables random access to specific genomic regions
Why all three are needed:
1. You first align reads to get a raw SAM or BAM file.
2. Then you use samtools view to convert SAM to BAM.
3. Then you use samtools sort to order the BAM by genomic coordinate.
4. Finally you use samtools index to build a .bai index, enabling fast lookups.

### Q5
**Explain what files are needed for GangSTR to run. Specifically: explain what information is provided to GangSTR via the --ref, --region, and --bam command line arguments.**
*Hint: look at the [GangSTR manual](https://github.com/gymreklab/gangstr).*
- BAM files that are comma separated lists -> to use as INPUT, .bam
- FASTA file for the reference genome -> .fa
- BED file containinng TR coordinates -> .bed
- Prefix -> to name output files

## Literature
During the practical so far, you have generated variant calls from short read sequencing data using bioinformatics approaches. Now it's time to take a step back and do some background reading in order to prepare for the analysis and interpretation of the results next week. 

First, read the following sections of [this review](https://www.sciencedirect.com/science/article/pii/S0959437X16301538):
* Abstract
* Introduction``
* Genotyping STRs from high-throughput sequencing data
Then, answer Q6 and Q7.

### Q6
**Why is STR variation relevant to health and disease?** \
STRs make up approximately 3% of the human genome and contribute significantly to human genetic variation due to their high mutation rates.
STRs are also connected to various diseases. One well-known example is Fragile X syndrome, which is caused by trinucleotide repeat expansions.
STRs can influence phenotypes through multiple mechanisms, including effects on gene function and regulation (such as DNA hypermethylation and transcription factor binding) as well as through transcribed and translated repeat elements: for instance, impacting alternative splicing, or leading to toxic RNA and protein aggregates. 


### Q7
**What are some of the challenges in analysing STRs from NGS data?** \
STRs are often longer than standard read lengths, which reduces the number of informative reads, as short reads often do not span the entire repeat region. Additionally, STR variations can involve large insertions or deletions (INDELs), which are difficult to align accurately to a reference genome, increasing mapping bias toward shorter alleles. As with any PCR amplification, stutter noise can occur, leading to incorrect estimation of repeat lengths.


Second, read the following sections of the [paper describing GangSTR](https://academic.oup.com/nar/article/47/15/e90/5518310):
* Abstract
* Introduction
* Overview of the GangSTR model
Then, answer Q6 and Q7.

### Q8
**What sets GangSTR apart from other STR genotyping tools?** \
GangSTR, a novel method for genome-wide analysis, can genotype both short and expanded tandem repeats (TRs) using next-generation sequencing (NGS) data. Unlike many existing tools, GangSTR is not limited by sequencing fragment length and is capable of accurately analyzing highly repetitive regions of the genome. It leverages information from multiple classes of paired-end reads and integrates them into a unified model to estimate maximum likelihood TR lengths. According to the paper, GangSTR achieves higher accuracy and  greater speed than other tools.

Comparison with other tools mentioned in the paper: \
exSTRa: does not estimate repeat length, which is important for assessing disease severity. \
STRetch: cannot analyze short TRs (with motifs up to 6 bp). \ 
Tredparse: cannot estimate repeat lengths longer than the sequencing fragment length and does not scale to genome-wide analysis. \
ExpansionHunter: less accurate when both alleles are close in size or longer than the fragment length; does not scale well genome-wide. \
Long-read technologies (third-generation sequencing): lower per-base accuracy, higher indel rates, and higher cost. 

### Q9
**What types of information does GangSTR use for STR genotyping?** \
GangSTR requires sequence alignments and a tandem repeat (TR) reference set to estimate diploid repeat lengths as the output. GangSTR utilizes paired-end sequencing reads to inform its genotyping model. Paired-end reads are categorized into four classes: enclosing read pairs, spanning read pairs, flanking read pairs, and fully repetitive read pairs.
- Enclosing reading pairs: contain the entire TR + flanking regions
- Spanning reading paris: each read maps to opposite flanks of the STR, which indicates distance and expansion
- Flanking reading pairs: partly overlap the repeat and give insight into its boundaries.
- Fully repetitive pairs: consist entirely of repeat sequence, which help detect larger expansions.

