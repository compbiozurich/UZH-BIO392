## Practical

### Q1
**Does the sequence quality graph of your data look different from the examples shown in the slides?**\
Yes, they look different. \
Simulated reads tend to have more uniform and cleaner quality scores compared to real sequencing data. There you have a lot more variability between reads and more messiness. In our slides you observe that the per base quality drops towards the 3' end of reads, more variability and a non-straight curve. In simulated data, quality values are often fixed, and the per base quality graph looks very clean, flat and straight at the top. 

**Are there any adapter sequences in the data? Why do you think this is?**
- *Real Sequencing*: Adapters are important for library preparation and remain in the reads if the insert size is shorter than the read length. 

In simulated reads, especially from a single gene and a clean reference, the inserts are defined and there is no randomness. It idealises reads that don't capture the variation of real NGS. 

Looking at the "Adapter Content" module it shows a plot of % of reads with adapter contamination. The "PolyA" graph shows a small increase towards the end. "PolyG" and all other adapters remain at the 0% line. 

### Q2
**Given the FastQC reports, does it make sense to perform adapter and/or quality-trimming on your data?**
- *Real data*: if adapter content is present or there is a drop in quality, you should perform trimmint, to reduce mismatches and increase aligner performance. Without trimming it would interfere with the alignment, lead to false variants and messes up downstream analyses. 
- *Simulated data*: There are hardly any adapters present (line close to 0%), so there is almost no need to trim there. The per base quality graph is also clean, high and flat, therefore no need to quality trimming either. 


### Q3
**Why are so many files in the bioinformatics pipeline compressed and indexed?**
- *Storage reasons*: there are huge datasets for genome sequences, alignments, variant calls etc. Therefore compression like for example CRAM saves storage space, reduces file transfer times and makes large-scale projects possible. 
- *Random access*: Often you don't need the whole genome in a study but only one chromosome, or region etc. Using indexed formats like BAM, VCF and FASTA it is easier to access these specific regions of interest. This increases speed. 
- *Standards*: It makes it easier, if file formats are standardised, and can be used synonimously together. So standardised compression and indexing improves reproducibility and portability and access. 

=> all this increases efficiency: in speed, storage and scalability.


### Q4
**In the bash script that processes alignment files, you will see calls to samtools sort, samtools view, and samtools index (among others). Explain what these three programs do. Why do you think each program is needed?**

**00_index_reference.sh**
- we generate an index by SAMtools such that *GangSTR can be accessed*.
- and a second index as an aligner to map sequencing reads

**01_alignment.sh**
- for each sample (patient) it aligns the sequenced reads to the reference genome
    - it searches for the file using the patient in the reference APC 
- it creates out of this a *SAM file*

**02_process_alignment.sh**
- it loops again through the patients
- it compresses the SAM files for each patient which creates a *BAM file*
- it is also indexed for random access

More detail on [samtools](http://www.htslib.org/doc/samtools.html): 
- *addreplacerg*: adds or replaces read group tags in a file. It also allowes updeating RG in the header. Used here are "-r" which specifies a read group line to append to the header.
- *sort*: it sorts alignment by leftmost coordinates. An appropriate header is added or the existing one updated. 
- *view*: using "--bam" it outputs BAM format from the input alignment file in SAM. 
- *index*: this indexes the coordinate-sorted compressed BAM files we just created for fast random access. This is needed when "region" arguments are used to limit the view to regions of interest. Since we specify .bam as the output filename, a BAM file is created. 

### Q5
**Explain what files are needed for GangSTR to run. Specifically: explain what information is provided to GangSTR via the --ref, --region, and --bam command line arguments.**

**GangSTR**
- *--ref*: GangSTR needs a FASTA file for the reference genome and it needs to know where to access this
- *--bam*: it needs the alignment files for each patient through which we iterate. This file needs to be BAM and a comma separated list. Target TR loci (regions) (.bed)
- *--region*: it needs BED files containing TR coordinates (the APC repeats, Target TR loci (regions) (.bed))

This then compresses this information into VCF files for every patient.

Using the "GangSTR --help" function I also obtained this:

> This program takes in aligned reads in BAM format and outputs estimated genotypes at each TR in VCF format.

## Literature
### [A genomuc view of short tandem repeats](https://www.sciencedirect.com/science/article/pii/S0959437X16301538)
Required reading:
* Abstract
* Introduction``
* Genotyping STRs from high-throughput sequencing data

### Q6
**Why is STR variation relevant to health and disease?**
- Short tandem repeats (STRs) have one of the highest mutation rates and contribute to many *de novo* mutations. 
    - This means, that it plays an important role in spontaneous conditions like autism and neurodevelopmental disorders. 
- They play an important role in gene expression and molecular phenotypes. E.g. Mendelian diseases, complex traits and cancer.
- Especially STR expansions were studied to be associated with many disorders and induce pathogenic effects.
- **Effects**: form TF binding sites, affect spacing between regulatory elements, induce unusual DNA secondary structures, modulate epigenetic properties, modulate alternative splicing, affect RNA protein binding sites or form RNA/protein aggregates. 

### Q7
**What are some of the challenges in analysing STRs from NGS data?**
- Genotyping STRs from NGS is challenging. They have low quality calls and are because of that filtered out. 
- *Short reads*: Reads often do not span entire repeats -> reducing the number of informative reads. Expanded repeats are beyond the read length of most NGS datasets.
- *Mapping*: Large insertions or deletions may be difficult to align to the reference genome. 
- *PCR "stutter"*: PCR amplification introduces "stutter" errors in the number of repeats. 

### [Profiling the genome-wide landscape of tandem repeat expansions](https://academic.oup.com/nar/article/47/15/e90/5518310)
Required reading:
* Abstract
* Introduction
* Overview of the GangSTR model

### Q8
**What sets GangSTR apart from other STR genotyping tools?**
- It is an algorithm for genotyping both short and long TRs. It **estimates the maximum likelihood TR lengths** for both normal and expanded.
- Analyses with GangSTR have revealed, that healthy individuals have dozens of long TR alleles that were previously not captured. 
- NGS struggles with highly repetitive regions of the genome, which are still routinely filtered out in most studies. 
- GangSTR is not limited by fragment or read length. 

### Q9
**What types of information does GangSTR use for STR genotyping?**

Inputs:
- Sequence alignments
- Reference set of TRs

Output: 
- estimated diploid repeat lengths

More detail: 
- *Enclosing Reads*: These are reads that fully span the STR region, allowing for direct observation of the repeat sequence within a single read.​
- *Spanning Read Pairs*: Paired-end reads where each read maps to the flanking regions on either side of the STR. The insert size between these reads provides information about the length of the repeat region.
- *Flanking Reads*: Reads that partially overlap the STR region and extend into the flanking sequence. These reads help in determining the boundaries of the repeat.​
- *Fully Repetitive Reads (FRRs)*: Reads composed entirely of the repeat motif. While they lack unique flanking sequences, their presence supports the existence of the repeat.
