# **Day 5 - Genome Technologies**

## **Storage Requirements for 1000 Genomes - an Estimation**
TCGA can be sufficiently encoded with only 2 bits per base (00, 01, 10, 11).
A typical human genome consists of 3,000,000,000 base pairs.
Bits per human genome: 2 * 3,000,000,000 = 6,000,000,000b
Byte = Bits * 0.125
Megabit (MB) = Bytes / 1,048,576
6,000,000,000 bits = 750,000,000 bytes = 715.64 Megabyte (MB)

So, one genome requires ~715 MB of storage. And **1000 genomes** require 715,000 MB of storage, which is equal to **715 Gigabytes (GB)**.

**- WES:** Whole Exome Sequencing (WES) focuses on sequencing only the protein-coding regions (exons) of genes, which constitute about 1-2% of the human genome: ~30,000,000 bases = **7.15 MB per genome**. WES has a higher depth of coverage for the exonic regions since it concentrates on a smaller portion of the genome and is more cost-effective (cheaper) than WGS. It is used in clinical settings and research studies where the focus is on identifying genetic variations in protein-coding regions related to known genetic diseases and can therefore improve diagnosis and treatment.

**- WGS:** Whole Genome Sequencing (WGS) encompasses sequencing the entire genome, including exons, introns, regulatory regions, and non-coding regions: 3,000,000,000 bases = **715 MB per genome**. WGS has a lower depth of coverage for any specific region compared to WES, but it covers the entire genome, which however makes WGS less cost-effective than WES. It is used for comprehensive analysis, discovery of new variants, understanding complex genetic traits, population genetics, and research involving non-coding regions.

## **File Types**

### SAM
SAM files are a critical part of the analysis workflow in bioinformatics, especially in tasks such as variant calling, transcriptome analysis, and genome assembly, where aligning sequencing reads to a reference genome is a fundamental step. The SAM format is often converted to its binary equivalent (BAM) for more efficient storage and processing.
A SAM file is a text-based format with tab-separated fields that contain essential details about each read's alignment, including its sequence, alignment position and quality scores (and more). Because SAM files are human-readable text files, they require a lot of storage: total storage needed for a SAM file for one genome is about **150 GB** (3billion bases * (2 bytes + 50 bytes (metadata)).

**Costs:** (According to lecture slides) CHF0.5/GB = 75CHF for one genome, 75,000CHF for 1000 genomes.


### BAM
A BAM file is a binary compressed version of a SAM file, providing a more efficient and compact representation of the sequence alignment data. It is used for direct interpretation or as a starting point for further analysis. The storage requirements for a BAM file are generally significantly lower than for a corresponding SAM file due to compression (30-50% lower).
So the storage for one genome in a BAM file is ~0.4 * Storage of SAM file = **60 GB**.

**Costs:** 30CHF for one genome, 30,000CHF for 1000 genomes.


### VCF
A VCF (Variant Call Format) file (text file format) contains information about variations in a sample's genome compared to a reference genome. Each line represents a variant (e.g., a SNP) and contains information such as chromosome, position, reference and alternate allele and quality scores. VCF files can be used for studying hereditary diseases or population genetics, identifying potential disease-related mutations and for personalized medicine.
Because VCF files focus on genetic variations and store variant calls, they tend to be smaller in size compared to e.g., BAM files.
Storage for one genome in a VCF file can range from **10 GB to about 50 GB**. 

**Costs:** CHF0.5 * 30  = 15CHF for one genome, 15,000CHF for 1000 genomes.


### FASTA
FASTA format is a text-based format for representing either nucleotide sequences or peptide sequences, in which base pairs or amino acids are represented using single-letter codes. A sequence in FASTA format begins with a single-line description, followed by lines of sequence data. The description line is distinguished from the sequence data by a greater-than (">") symbol in the first column.  FASTA is utilized for sequence alignment and comparison using tools like BLAST to identify similarities and differences between sequences. FASTA can store DNA, RNA, and protein sequences.
Storage requirements for a FASTA file for one genome is approximately **3-4 GB**.

**Costs:**  CHF0.5 * 4  = 2CHF for one genome, 2,000 CHF for 1000 genomes.

### Summary
SAM and BAM files are suitable for read alignments and coverage, VCF files are used for variants, and FASTA files are used for genomic sequence representation.

**Storage requirements**: FASTA < VCF < BAM <  SAM.

**Usage**:
* FASTA: Archival purposes
* SAM, BAM: Browser visualization
* VCF: Storing called variants

Sources: [SAM](https://www.samformat.info/sam-format-flag), [BAM](https://zymoresearch.eu/blogs/blog/what-are-sam-and-bam-files), [VCF](https://www.genomoncology.com/blog/what-is-a-variant-call-format-vcf-file), [FASTA](https://zhanggroup.org/FASTA/)
