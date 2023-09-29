
# Questions BIO392 day 08

## Practical

### Q1
**Does the sequence quality graph of your data look different from the examples shown in the slides? Are there any adapter sequences in the data? Why do you think this is?**
The sequence quality graph looks different from the examples on the slides. The sequences seem to be highly consistent along the reads, what we would not expect in data retrieved from a real experiment, 
therefore we can conclude that the data is generated from a simulation. Due to the Adapter Content plot, we can conclude that there are no adaüter sequences, this could be because our data is simulated.

### Q2
**Given the FastQC reports, does it make sense to perform adapter and/or quality-trimming on your data?**
No it would not make sense to perform adapter a or qualitiy-trimming, because the quality scores of our data are already very high.

### Q3
**Why are so many files in the bioinformatics pipeline compressed and indexed?**
Files containing sequences can are very big and need a lot of storage, therefore it makes sense to compress them in order to save storage space and transfer time . 
Indexing makes sense for fast data retrival and analysis, optimizing processing speed and efficiency in computational tasks.

### Q4
**In the bash script that processes alignment files, you will see calls to samtools sort, samtools view, and samtools index (among others). Explain what these three programs do. Why do you think each program is needed?**
*Hint: look at the [Samtools manual](http://www.htslib.org/doc/samtools.html)*.
- samtools sort: sorts the records in a SAM file based on their genomic coordinates (by leftmost coordinates). The sorted output can be saced in a new BAM file usint the '-o' option.
  e.g. ```samtools sort input.bam -o sorted_output.bam```
- samtools view: used to view the content of a SAM, BAM , or CRAM files. It can also be used to convert between these different file formats.
  e.g. convering BAM to SAM: ```samtools view input.bam > output.sam```
- samtools index: creates an index file for a BAM, CRAM or SAM file. SAM files have to be BGZF compressed first. Indexing allows quick access to specific regions of the alignment data without having to read the entire file.
  e.g indexing a BAM file: ```samtools index input.bam```

### Q5
**Explain what files are needed for GangSTR to run. Specifically: explain what information is provided to GangSTR via the --ref, --region, and --bam command line arguments.**
*Hint: look at the [GangSTR manual](https://github.com/gymreklab/gangstr).*
GangSTR takes aligned reads (BAM) and a set of repeats (tandem repeats) in the reference genome as input and outputs a VCF file containing genotypes for each locus.
- `--ref`: specifies the reference genome file.

- `--regions`: specifies a file that provides information about the regions of interest.

- `--bam`: This argument specifies the input BAM file.





## Literature
During the practical so far, you have generated variant calls from short read sequencing data using bioinformatics approaches. Now it's time to take a step back and do some background reading in order to prepare for the analysis and interpretation of the results next week. 

First, read the following sections of [this review](https://www.sciencedirect.com/science/article/pii/S0959437X16301538):
* Abstract
* Introduction``
* Genotyping STRs from high-throughput sequencing data
Then, answer Q4 and Q5.

### Q6
**Why is STR variation relevant to health and disease?**
Short tandem repeates are regions in the genome that have a really high mutation rate and therefore responsible for a big amount of variation (3% of the human genome are STRs). STRs seem to be important for regulating gene expression and other molecular phenotypes, thus they have a significant contribution on Mendelian diseases, complex traits and cancer

### Q7
**What are some of the challenges in analysing STRs from NGS data?**
There are different aspects contributing the challenge of genotyping STRS from NGS:
1) The reads are not long enough to span the entire span of the repeats, the reads are too short to beinoformative reads.
2) The alignment to a reference genome is difficult because of STR variations present as large insertions or delitions.
3) Analysing STRs with PCR amplification is hard because during library preparation often stutter noise is introduced. 

Second, read the following sections of the [paper describing GangSTR](https://academic.oup.com/nar/article/47/15/e90/5518310):
* Abstract
* Introduction
* Overview of the GangSTR model
Then, answer Q6 and Q7.

### Q8
**What sets GangSTR apart from other STR genotyping tools?**
GangSTR has different advantages over older methods. The major challenge is that expanded repeats are byond the read length of most NGS and therefore not profiled by older tools. The algorithm GangSTR  not only is useful for for genome-wide shgenotyping of short STRs but also for long ones. Additionally it is faster and more accurate than other STR genotyping tools. 



### Q9
**What types of information does GangSTR use for STR genotyping?**

Gangster extracts information from paired-end reads into a  single maximum likelihood framework capable oog genotyping normal length and expanded repeats. 
