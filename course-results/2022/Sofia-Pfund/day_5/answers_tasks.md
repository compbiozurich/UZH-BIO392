Deadline: Tue 2022-09-04

## General Notes

Human genome: 3 billion nts

Idea: store genome information using file formats based in coordinates (chr, start, end), and _not_ sequences.

Required: a reference genome.

Wanted: 
* automation of genomic sequence retrieval ▶️ need of standardizing data analysis
* increase reproducibility ▶️ UNIX: efficient, scalable, portable, open

Terminology:
* variant calling = variant detection

### File Formats
* **FASTA**: unaligned sequences
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

* **FASTQ**: unaligned sequences (:bangbang: short reads sequencing)
  * ID + sequence + separator + quality score
  * sequence quality is represented using Phred scores, which are logarithmically linked to error probabilities (of incorrect base call) (different encodings exist)
```
@SRR001666.1 071112_SLXA-EAS1_s_7:5:1:817:345 length=36
GGGTGATGGCCGCTGCCGATGGCGTCAAATCCCACC
+
IIIIIIIIIIIIIIIIIIIIIIIIIIIIII9IG9IC
```

* **SAM (Sequence Alignment Map)**: alignments
  * Idea: store where the reads (saved as FASTQ) map on the reference genome
  * Goal of sequence alignment: identify regions of similarity or the identity of a sequence
  * Local vs. Global aligment
  * human-readable text files
  
* **BAM (Binary Alignment Map)**: alignments
  * binary and compressed equivalent of SAM
  
* **BED (Browser Extensible Data)**: genomic ranges
  * BED3, BED6, BED12
  * tab-separated colummns: chromosome - start - end

```
chr22 1000 5000
chr22 2000 6000
```
  * coordinate specification: 
    * 0-start vs. 1-start 
    * fully-open (4001-4999), fully-closed (4000-5000), half-open (4000-4999)
    
* **BEDgraph**: genomic scores
  * BED3 + probability score (like a "BED4")
  
* **Wiggle files**: genomic scores

* **GFF (Genetic Feature Format) and GTF**: gene annotation

* **VCF (Variant Call Format)**: variants
  * Generic format for storing DNA polymorphism data such as SNPs, insertions, deletions and structural variants, together with rich annotations. 
  * Usually stored in a compressed manner and can be indexed for fast data retrieval of variants from a range of positions on the reference genome.  (Danecek et al 2011)
  * Tailored for storing information *across many samples*
  * VCF file consists of **two** main sections: (1) header section + (2) data section
  * VCF file has 8 (mandatory) columns: ```CHROM, POS, REF, ALT, QUAL, FILTER, INFO```
  * 

WES & WGS 

Associated costs
* Cost factors
* Raw Storage costs 

Familiarize with VCF format: specification in article collection

## 1st task: Estimate Storage Requirements for 1000 Genomes
* human genome: 3 billion nt

## 2nd task: Reading up on Genome Technologies

Relevance for this course: one of the main uses of next-generation sequencing is to discover variation among large populations of related samples. 

* General NGS technologies
* count based vs. intensity based as principle
* molecular-cytogenetic techniques:
  * banding analysis
  * SNP, aCGH arrays
  * SKY, M-FISH
  * chromosomal CGH
▶️ notes about usage (research, clinical, historical vs. current)
