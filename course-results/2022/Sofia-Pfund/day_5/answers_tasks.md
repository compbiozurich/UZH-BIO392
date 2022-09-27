Deadline: Tue 2022-09-04

### General Notes

Human genome: 3 billion nts

Idea: store genome information using file formats based in coordinates (chr, start, end), and _not_ sequences.

Required: a reference genome.

Wanted: automation of genomic sequence retrieval ▶️ need of standardizing data analysis ▶️ increase reproducibility ▶️ UNIX: efficient, scalable, portable, open

#### File Formats
* FASTA and FASTQ: unaligned sequences
  * text file
  * ID + sequence
  
```
>NC_009902.1 Babesia bovis T2Bo mitochondrion, complete genome
TTTAAAAAAGTGTTAAAAACTTTATACATTAAAAAATTTAAACAAGTGATCATGTATAAAGTACACTTGT
TACTGTGTAAATATCAAAAACAATTTAATTTCAAAATTTTTGAAATATGTTTTTTGTGTTGTGTTATAAA
GTTTTTTTTCAAAATTATATATGTTTGCATTTGCTGGATATAGTTCGGTCTCTGCAAACCATAAAGTCAT
CGGTATATCCTACATATGGCTTTCATATTGGTTTGGAGTTATTGGATTTTATATGAGTATTTTGATAAGA
ACAGAATTGAGTATGAGTGGTTTAAAGATTATGACAATGGATACTCTTGAGATATACAATATGATGTTTT
```
  
* SAM and BAM: alignments
* BED and BEDgraphs: genomic ranges
* GFF and GTF: gene annotation
* VCF: variants
* Wiggle files and BEDgraphs: genomic scores

WES & WGS 

Associated costs
* Cost factors
* Raw Storage costs 

Familiarize with VCF format: specification in article collection

### 1st task: Estimate Storage Requirements for 1000 Genomes
* human genome: 3 billion nt

### 2nd task: Reading up on Genome Technologies

* General NGS technologies
* count based vs. intensity based as principle
* molecular-cytogenetic techniques:
  * banding analysis
  * SNP, aCGH arrays
  * SKY, M-FISH
  * chromosomal CGH
▶️ notes about usage (research, clinical, historical vs. current)
