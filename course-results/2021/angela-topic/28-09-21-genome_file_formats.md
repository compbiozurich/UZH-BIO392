# Genome file formats
2 bits per base required, therefore a *perfect* genome requires 715 MB (1 MB = 8000000 Bit) 
1 PB costs 500000CHF
## File formats and storage capacities
* Considering WEG (Whole Genome Sequencing) and WES (Whole Exome Sequencing) *
WGE: 3 billion bp
WES: 1.5% of whole genome: 45 million bp

* ### [SAM](https://samtools.github.io/hts-specs/SAMv1.pdf)
It is a TAB-delimited text-based format it has a header section and an alignment section. The header starts with @. The alignment has 11 fields for information as mapping position.
 * For one WGE 500GB therefore for  WES 7.5GB. For 1000 genomes 500TB resp. 7.5TB the cost are 250000CHF resp. 3750CHF *

* ### BAM
Compressed binary version of a SAM file,it has to be converted first before it canbe read for us humans :)
* One BAM file stores one whole genome with 100GB and a WEG for 1.5 GB, resp for 1000 genomes 100TB and 1.4 TB.This costs 50000CHF and 750CHF. *

* ### [VCF](file:///Users/angelatopic/Downloads/VCFv4.2.pdf)
It is a text file format where variants can be stored. It consists of a header and data lines. Each data line stores information about a position in the genome. It shows which chromnosome, position, what the reference base is, the variation for both alleles, quality, filter, additional information and than all samples tested.
 ![VCF file](VCF.png)

* For one WGS 125 MB need to be used. For a WEG: 1.875 MB, For the 1000 Genome 125 GB resp. 1.875 GB. The cost tehrefore is is 62.50 CHF and 0.95 CHF. *


* ### [FASTA]
A FASTA file is a text-based format for representing nucleotide or peptide sequences. The format begins with a single line description, this line starts with a >.
* ~200MB for one WGS tehrefore,3MB, therefore for 1000 genome 200GB and 3GB. The costs are 100CHF, 1.5CHF. *
 
## Getting familiarized with VCF format
Already done above

## Notes about lift-overs


https://warwick.ac.uk/fac/sci/statistics/staff/academic-research/nichols/presentations/ohbm2014/imggen/Nho-ImgGen-WGSeqPractical.pdf
https://medium.com/precision-medicine/how-big-is-the-human-genome-e90caa3409b0

 
