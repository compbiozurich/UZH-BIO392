---
output:
  pdf_document: default
  html_document: default
---
# Task: Estimate Storage Requirements for 1000 Genome

# General estimate

if we store the 3.2 billion bases in binary (A=00;T=01;G=10;C=11), each basepair needs 2 bits, therefore 6.4 billion bits, which equals 800 MB.

## FASTA (.fasta, .fa):

-   Purpose: FASTA files are used to store raw nucleotide or protein sequences. Each sequence is represented by a header line starting with "\>", followed by the sequence data. It is a simple and widely used format for storing individual sequences.
-   Use Case: Archiving and sharing genomic sequences, sequence alignment input, and basic sequence analysis.
-   Storage size: The human genome is 3.2e9 bases long, 1000 genomes are therefore 3.2e12 bases long. FASTA headers are neglible in this estimate, so this corresponds to the number of characters in our files. 1 Character of ASCII corresponds to 1 byte, therefore 1000 genomes are 3.2e12 bytes = 3.2 TB

## FASTQ (.fastq, .fq):

-   Purpose: FASTQ files store sequencing data, including the sequence reads and associated quality scores. They are essential for storing raw output from sequencing machines.
-   Use Case: Storing raw sequencing data, preprocessing, and downstream analysis like variant calling and alignment.
-   Storage size: each sequence in FASTQ also contains a ASCII quality score of the same lenght as the sequence, a header and a line with "+". This means it has more than twice the size of a FASTA file.

## SAM/BAM (.sam, .bam):

-   Purpose: Sequence Alignment/Map (SAM) and Binary Alignment/Map (BAM) files store aligned sequence reads and their metadata, such as mapping qualities and flags. BAM is a binary, compressed version of SAM.
-   Use Case: Storing aligned reads, visualization in genome browsers, and variant calling from aligned data.
-   Storage size: The entire genome would take roughly 150 million reads. And a read equals between 100bytes to 500 bytes, depending on the amount of metadata. 150 million reads/genome \* 300 bytes/read \* 1000 genomes = 4.5e13 bytes = 45 TB

## VCF (Variant Call Format, .vcf):

-   Purpose: VCF files are used to store called genetic variants (e.g., SNPs, INDELs, structural variants) along with associated information like quality scores, genotype calls, and allele frequencies.
-   Use Case: Storing genetic variants, population genetics, variant annotation, and downstream analysis like association studies.
- Storage size: You need to store at least one genome as a reference genome in FASTA format, but other 999 will be much more efficiently stored since we only store the difference. A rought estimate of one variant record is about 200 bytes. According to NCBI, every 1000 basis is a SNP, indels and other variations occur much less frequently. this leads to about 3.2 million SNP's, maybe 4 million total variations per genome. 200 bytes * 4 million variations * 100 genomes = 800 GB
