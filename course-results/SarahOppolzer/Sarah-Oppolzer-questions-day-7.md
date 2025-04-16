# STR Exercise

### Q1
**Does the sequence quality graph of your data look different from the examples shown in the slides? Are there any adapter sequences in the data? Why do you think this is?** 

Since it is just simulated data, we did not recieva a sequence quality graph and therefore can't answer this question. 

### Q2
**Given the FastQC reports, does it make sense to perform adapter and/or quality-trimming on your data?**

Same as Q1, we cannot really answer this question with our simulated data. However, theoretically, if our qualtiy scores go below orange, so in the red coloured area, we shoudl trim them. This ensures reasonable quality. 

### Q3
**Why are so many files in the bioinformatics pipeline compressed and indexed?**  
- Compression: to save storage space -> when we compress, we need less disk space
- Indexing: to faster retrive information without having to read the entire file. 

### Q4
**In the bash script that processes alignment files, you will see calls to samtools sort, samtools view, and samtools index (among others). Explain what these three programs do. Why do you think each program is needed?** 

- samtools sort: it sorts the alginments in a BAM/CAM/CRAM files. By default, it is sorting by the leftmost coordinate, but it can also srot be a specific tag, read name or minimiser. It is needed for indexing and more efficient access to specific regions is possible when the BAM files are sorted. Additionally, it is imporving compression ,which of course saves disk space and it is the standard Format, that most tools use.
- samtools view: it views and converts SAM/BAM/CRAM files. By default, it outputs alignments in the SAM format. Additionaly, one can add filters for specific alignments to be shown, change the output format and specify the output name. ONe can also look at specific regions, for example only at chromosome 1 or a specific range at chromosome 5. It requires an indexed and coordinate-sorted CRAM/BAM file. It is obviously needed for viewing, but also for filtering reads and to convert SAM files to BAM files (which are much smaller and therefore faster to process). 
- samtools index: indexes SAM/BAM/CRAM files. It enables fast danrom acces, for example to a specific genomic region (with samtools view). It workes with compressed (BAM/CRAM/SAM.GZ) and sorted files and creates .bam.bai, .bam.csi or .cram.crai files. In short, this commands allows you to quickly jump to genomic regions of your interest.
  
*source: [Samtools manual](http://www.htslib.org/doc/samtools.html)*.

### Q5 
**Explain what files are needed for GangSTR to run. Specifically: explain what information is provided to GangSTR via the --ref, --region, and --bam command line arguments.** 

*Hint: look at the [GangSTR manual](https://github.com/gymreklab/gangstr).*

The parameters in GangSTR are: 
- bam <file.bam,[file2.bam]> Comma separated list of input BAM files
- ref Refererence genome (.fa)
- regions Target TR loci (regions) (.bed)
- out Output prefix

## Literature

During the practical so far, you have generated variant calls from short read sequencing data using bioinformatics approaches. Now it's time to take a step back and do some background reading in order to prepare for the analysis and interpretation of the results next week. 

First, read the following sections of [this review](https://www.sciencedirect.com/science/article/pii/S0959437X16301538):
* Abstract
* Introduction``
* Genotyping STRs from high-throughput sequencing data
Then, answer Q4 and Q5.

### Q6
**Why is STR variation relevant to health and disease?** 

STR expansion has been implicated with dozens of disorders. This is becasue STR

As a result, STRs exhibit mutation rates
that are orders of magnitude higher than other types of
variation [2], and thus contribute a large fraction of human
genetic variation.
A role for STRs in human disease was established over
two decades ago, with independent discoveries of trinu-
cleotide expansions resulting in Fragile X Syndrome [3,4]
and spinal and bulbar muscular atrophy [5]. Since then,
STR expansions have been implicated in dozens of dis-
orders [6]. Further work has shown that these expansions
www.sciencedirect.com induce a variety of pathogenic effects (Figure 1), includ-
ing polyglutamine aggregation [6], hypermethylation [7],
RNA toxicity [8], and repeat associated non-ATG (RAN)
translation [9]. Smaller pathogenic repeats have also been
shown to affect RNA splicing (cystic fibrosis [10]) or
regulate gene expression (progressive myoclonus epi-
lepsy [11] and Gilbert syndrome [12]). Many of these
mechanisms are present across multiple loci, indicating
that they likely represent genome-wide phenomena.
The majority of repeat disorders identified so far follow
autosomal dominant inheritance patterns that were read-
ily identified using linkage analysis in pedigrees. How-
ever, STRs may contribute to a variety of inheritance
modes not amenable to traditional linkage techniques.
For instance, STRs are predicted to contribute a higher
number of de novo mutations per generation than any
other type of variation [13], but the role of de novo STRs in
spontaneous conditions such as autism and neurodeve-
lopmental disorders has so far not been interrogated.
Furthermore, STRs are often highly multi-allelic, and
thus may generate complex inheritance patterns not well
captured by linkage or analysis of bi-allelic single nucle-
otide polymorphisms (SNPs).
Despite the clear implication of STRs in disease, they
have been notably missing from medical sequencing
studies. Next-generation sequencing (NGS) has the
potential to profile more than a million STRs, but geno-
typing STRs from NGS has proven challenging. Thus,
S


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
