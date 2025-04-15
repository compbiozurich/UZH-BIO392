# Estimate Storage Requirements for 1000 Genomes

#### WES & WGS 
Whole genome sequencing - WGS - and whole exome sequencing - WES - are two of the most popular methods used in genetic research. WGS sequences the entire genome, so it includes protein-coding and non-protein-coding regions. Therefore, allmost all changes in the DNA can be identified. WES only sequences the protein - coding regions. It is cheaper, since the ampunt of data generated is sigcnificantly less then with WGS. The majority of diease-causing variants are in the exome, therefore  WES is quite a powerful tool to identify genetic causes for disease. However, WGS provides a more compreensive picture of other variants. Especially rare and novel variants might be missed with WES (see [source] (https://www.novogene.com/eu-en/resources/blog/wgs-vs-wes-which-genetic-sequencing-method-is-right-for-you/)). 

#### Diﬀerent file formats
- SAM/BAM: SAM stands for Sequence Alignment/Map format, and is a generic alignment format for storing read alignments against reference sequences. It supports short and long reads produced by different sequencing platforms. A SAM fil is a tab-delimited text file that contains sequence alignment data. BAM is the binary version of a SAM file. Both files contain same information and with SAMtools software, a BAM file can be easily converted to SAM file. They have import roles in analysis of next-generation sequencing data because the raw sequence reads from sequencers have no genomic position information associated and they must be mapped/aligned to known reference genome. The mapping/alignment outputs are BAM/SAM files and they are further used for downstream analysis. A SAM/BAM file consists of header section and alignment section.
  
- VCF: The VCF Variant Call Format is an example for a widely used file format with "built-in logic". It provids "logic
compression" for genomic annotations which rely on the notion of "assessed variant in a population". It is complex to interpret, but there is no replacement in sight (but new versions) (see BIO 390, lecture 1). It was initially introduced by the 1000 Genomes Project to store the most prevalent types of genomic sequence variation, such as SNPs and small INDELS, enriched by annotations. VCF file is text file and contains meta-information (header) lines and data lines.

- FASTA: FASTA format is a text based format and has been standard format for nucleotide sequence since the first generation sequencing. For next-generation sequencing, it is the standard format for reference genome sequences used by mapping/alignment software tools. A FASTA file starts with a header line followed by lines of sequence. The header line begins with a “>” sign for sequence identifier and may contain optional descriptive information. Sequence lines consist of characters representing nucleotide bases in the sequence and are usually no more than 80 characters per line, but there are  no limitation for total number of lines. Same as sequence in FASTQ files, each nucleotide base is encoded as a single character (one of A, T, G, C, and N if undetermined, with case insensitive). FASTA format can be used to display sequence of a single gene, a single chromosome, or multiple ones.
- 
### How much computer storage is required for 1000 Genomes

|File Type|WES|WGS|
|-------|-------------------|----|
|SAM|||
|BAM|||
|VCF|||
|FASTA|||


*
- Associated costs
- Cost factors
- Raw Storage costs
- Familiarize with VCF format

➡specification in article collection

Please provide 1-page size estimates and reasoning for the use of the different file types 
(i.e. which would you use for storing called variants, which for full archival purposes, browser
visualisation), for 3-5 formats.

summarize the file formats, how are storage costs influenced, some estimations for exampe ahuman 
genome, what to use best for what

sources: 
Zhang H. Overview of Sequence Data Formats. Methods Mol Biol. 2016;1418:3-17. doi: 10.1007/978-1-4939-3578-9_1. PMID: 27008007.
