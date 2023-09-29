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
