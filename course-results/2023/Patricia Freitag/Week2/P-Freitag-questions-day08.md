### Q1
**Does the sequence quality graph of your data look different from the examples shown in the slides? Are there any adapter sequences in the data? Why do you think this is?**

Yes it looks different, it does not have any bad quality scores. It is  likely already trimmed data and short but high quality reads. I do not think that there are adapter sequences in the data since the "Adapter Content" statistics shows low adapter content. 

### Q2
**Given the FastQC reports, does it make sense to perform adapter and/or quality-trimming on your data?**

No, the data seems to be of high quality already. 

### Q3
**Why are so many files in the bioinformatics pipeline compressed and indexed?**

The data size of DNA sequences can be very large, thus it makes sense to compress the files to take up less space. Another reason could be speed and efficacy. Working with indexed files can speed up the process. 

### Q4
**In the bash script that processes alignment files, you will see calls to samtools sort, samtools view, and samtools index (among others). Explain what these three programs do. Why do you think each program is needed?**
*Hint: look at the [Samtools manual](http://www.htslib.org/doc/samtools.html)*.

addreplacerg: adds or replaces read group tags in a file (which according to the comment is needed or otherwise GangSTR will complain?)
sort: sorts alignments by leftmost coordinates
view: SAM file is compressed to BAM
index: needed for fast random access

### Q5
**Explain what files are needed for GangSTR to run. Specifically: explain what information is provided to GangSTR via the --ref, --region, and --bam command line arguments.**
*Hint: look at the [GangSTR manual](https://github.com/gymreklab/gangstr).*
--bam: as input, GangSTR needs BAM files, which are sorted and indexed 
--ref: the reference genome input is in FASTA format 
--regions: the reference set of regions to genotype is a BED-like file 
--out: the output will be a VCF file




### Q6
**Why is STR variation relevant to health and disease?**

STRs are loci which mutate very fast and play an important role in regulation of gene expression. They have been linked to several diseases, including Fragile X Syndrome and SMA. 

### Q7
**What are some of the challenges in analysing STRs from NGS data?**

The number of informative reads is relatively small, because the repeat region can be very long and thus cannot be properly aligned to the reference genome. 



### Q8
**What sets GangSTR apart from other STR genotyping tools?**

GangSTR is faster and more accurate than similar genotyping tools (like STRetch, exSTRa or HipSTR). GangSTR can cover a broad spectrum of repetetive regions in the genome, while other tools, such as STRetch, can not analyze short tandem repeats

### Q9
**What types of information does GangSTR use for STR genotyping?**

As an input, GangSTR uses a reference set and sequence alignments and then creates an estimate of diploid repeat lengths. If the read is enclosing the repeat sequence on both ends by non-repetetive elements, then the number of repeats can simply be counted.There are four classes of paired-end reads: 
enclosing read pairs (‘E’): provide direct information about the repeat number because the repeat is entirely contained within the reads.
spanning read pairs (‘S’): valuable for estimating the length of the repeat region and originate from fragments that completely span the STR
flanking read pairs (‘F’): contain a read that
partially extends into the repetitive sequence of a read, although not fully enclosing the repeat, these reads can still provide insights into the repeat length.
fully repetitive read pairs (‘FRR’): contain at least one read
consisting entirely of the TR motif
