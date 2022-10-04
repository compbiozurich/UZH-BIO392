# Task: Estimate Storage Requirements for 1000 Genomes
## How much computer storage is required for 1000 Genomes?

## WES & WGS
The size of a perfect genome is about 715 MB according to the slides of the course.<br>
WGS Estimation: 1'000 whole genomes are 1'000 * 715 MB = 715 GB<br>
Cost to store 1 GB -> 0.5 CHF<br>

## Different file formats

### SAM (**S**equence **A**lignment **M**ap)
> SAM is a generic format for storing large nucelotide sequence alignments. It is flexible, simple and compact. Many NGS and analysis tools work with SAM.
### BAM (**B**inary **A**lignment **M**ap)
> BAM files are binary representation of the SAM format i.e. a compact and indexable representation of nucleotide sequence alignments. Many NGS and analysis tools work with BAM. For custom track display, it's advantegous that only the portions of the files needed to display a particular region are transferred to UCSC. 

### VCF (**V**ariant **C**all **F**ormat)
> VCF is a flexible and extendable file format and the standard for human genomic variant storage/representation. The format has a tab delimiter.  It can store the results of a single or multiple interpretations of genome sequencing datasets. The variations are always in comparison to a reference genome. 

### FASTA
> FASTA is a text format for linear annotation of single-letter nucleotides or amino acid codes. The format is readable and not optimized for size. FASTA starts always with a definition line. After '>' follows the identifier of the sequence (mostly with a unique SeqID) and a (optimal) description. There should be no space between '>' and the forst letter of identifier. All lines of text should be shorter than 80 chararacters in lentgh. Blank lines are not allowed in the middle of FASTA input.


## Associated costs
### Cost factors
### Raw Storage costs

## Familiarize with VCF format
specification in article collection
