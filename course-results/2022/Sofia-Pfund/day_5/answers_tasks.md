Deadline: Tue 2022-09-04

### General Notes

Human genome: 3 billion nts

Idea: store genome information using file formats based in coordinates (chr, start, end), and _not_ sequences.

Required: a reference genome.

Wanted: automation of genomic sequence retrieval ▶️ need of standardizing data analysis ▶️ increase reproducibility ▶️ UNIX: efficient, scalable, portable, open

#### File Formats
* FASTA: unaligned sequences
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

* FASTQ: unaligned sequences (:bangbang: short reads sequencing)
  * ID + sequence + separator + quality score
  * sequence quality is represented using Phred scores, which are logarithmically linked to error probabilities (of incorrect base call) 
```
@SRR001666.1 071112_SLXA-EAS1_s_7:5:1:817:345 length=36
GGGTGATGGCCGCTGCCGATGGCGTCAAATCCCACC
+
IIIIIIIIIIIIIIIIIIIIIIIIIIIIII9IG9IC
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
