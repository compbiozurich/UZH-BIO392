# STR Exercise


### Q1
**Does the sequence quality graph of your data look different from the examples shown in the slides? Are there any adapter sequences in the data? Why do you think this is?** 

Since it is just simulated data, we did not recieva a sequence quality graph and therefore can't answer this question. 

---

### Q2
**Given the FastQC reports, does it make sense to perform adapter and/or quality-trimming on your data?**

Same as Q1, we cannot really answer this question with our simulated data. However, theoretically, if our qualtiy scores go below orange, so in the red coloured area, we shoudl trim them. This ensures reasonable quality. 

---

### Q3
**Why are so many files in the bioinformatics pipeline compressed and indexed?**  
- Compression: to save storage space -> when we compress, we need less disk space
- Indexing: to faster retrive information without having to read the entire file. 

---

### Q4
**In the bash script that processes alignment files, you will see calls to samtools sort, samtools view, and samtools index (among others). Explain what these three programs do. Why do you think each program is needed?** 

- samtools sort: it sorts the alginments in a BAM/CAM/CRAM files. By default, it is sorting by the leftmost coordinate, but it can also srot be a specific tag, read name or minimiser. It is needed for indexing and more efficient access to specific regions is possible when the BAM files are sorted. Additionally, it is imporving compression ,which of course saves disk space and it is the standard Format, that most tools use.
- samtools view: it views and converts SAM/BAM/CRAM files. By default, it outputs alignments in the SAM format. Additionaly, one can add filters for specific alignments to be shown, change the output format and specify the output name. ONe can also look at specific regions, for example only at chromosome 1 or a specific range at chromosome 5. It requires an indexed and coordinate-sorted CRAM/BAM file. It is obviously needed for viewing, but also for filtering reads and to convert SAM files to BAM files (which are much smaller and therefore faster to process). 
- samtools index: indexes SAM/BAM/CRAM files. It enables fast danrom acces, for example to a specific genomic region (with samtools view). It workes with compressed (BAM/CRAM/SAM.GZ) and sorted files and creates .bam.bai, .bam.csi or .cram.crai files. In short, this commands allows you to quickly jump to genomic regions of your interest.
  
*source: [Samtools manual](http://www.htslib.org/doc/samtools.html)*.

---

### Q5 
**Explain what files are needed for GangSTR to run. Specifically: explain what information is provided to GangSTR via the --ref, --region, and --bam command line arguments.** 

The parameters in GangSTR are: 
- bam <file.bam,[file2.bam]> Comma separated list of input BAM files
- ref Refererence genome (.fa)
- regions Target TR loci (regions) (.bed)
- out Output prefix

*source: [GangSTR manual](https://github.com/gymreklab/gangstr).*

---

## Literature

During the practical so far, you have generated variant calls from short read sequencing data using bioinformatics approaches. Now it's time to take a step back and do some background reading in order to prepare for the analysis and interpretation of the results next week. 

First, read the following sections of [this review](https://www.sciencedirect.com/science/article/pii/S0959437X16301538):
* Abstract
* Introduction``
* Genotyping STRs from high-throughput sequencing data
Then, answer Q4 and Q5.

---

### Q6
**Why is STR variation relevant to health and disease?** 

STR expansion has been implicated with dozens of disorders. This is not only because STRs exhibit very high mutation rates, but also induce a variety of pathogenic effects, like hypermethylation, polyglutamine aggregation and repeat associated non-ATG (RAN)
translation. Additionally, smaller athogenic repeats are affecting RNA splicing and to regulate gene expression. These mechanisms seem to be a genome-wide phenomena.

---

### Q7
**What are some of the challenges in analysing STRs from NGS data?** 

 - the short reads are often not spanning entire repeats, which effectively reduces the number of informative reads.
 - The STR vraiations that are present as lage deletions or insertions may be difficult to align to a reference genome. This can introduce a mapping bias toward the shorter alleles.
 - When the sample is amplificated with PCR during library preperation, "stutter" noise is often introduced in the number of repeats at STRs. 

---

Second, read the following sections of the [paper describing GangSTR](https://academic.oup.com/nar/article/47/15/e90/5518310):
* Abstract
* Introduction
* Overview of the GangSTR model
Then, answer Q6 and Q7.

---

### Q8
**What sets GangSTR apart from other STR genotyping tools?** 
NGS is the gold standard for diagnostic sequencing, since it is chep and achieves a high throughput. However, the NGS pipelines struggled eiwth highly repetitive reions in the genome, and they therefore are often filtered as a result. In detail, repeats longer than ~70bp are difficult or even impossible to genotype, because there is an insuffivient number of enclodes reads. Also, pother used platforms are facing difficulties: in a recent genome-wide analysis conducted with HipSTR, more than 150,000 STRs were filtered, although they included known pathogenic TR expansions. SRTetch, on the other hand, can perform genome-wide exoansion identification, but is not able to analyze short TRs. Tredparse can not estimate repeat lenghts longer than the seqeuncing fragment lenght, and ExpansionHunter stops producing accurate genotypes when both alleles are close to or longer than the seqeuncing read lenthy. Additionally, those two platforms - Tredparse and ExpansionHunter - have not been designed fro genome wide scales. GansgSTR on the other hand, has proven to be faster and to provide more accurate results compared to the existing solutions. This was tested on real and simulated datasets, with different kinds of allele lengths. Most existing tools have mainly focused on repeat-enclosing reads. GangSTR on the other hand, incorperates other pieces of information, like fragment length, coverage and the existence partially enclosing reads. All those features are functions of repeat number. GangSTR incorperates those other informative aspects into a single joint likelihood framework.  

---

### Q9
**What types of information does GangSTR use for STR genotyping?** 
I answered this already in Question 8, in Detail: Most existing tools have mainly focused on repeat-enclosing reads. GangSTR on the other hand, incorperates other pieces of information, like fragment length, coverage and the existence partially enclosing reads. All those features are functions of repeat number. GangSTR incorperates those other informative aspects into a single joint likelihood framework.  

---
