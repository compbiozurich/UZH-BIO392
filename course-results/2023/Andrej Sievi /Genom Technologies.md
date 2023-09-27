# How much computer storage is required for 1000 Genomes
## There are diffrent File types to work with and advantages to illustrute Genomic Data.

### - Whole exome sequencing (WES):
The Exon is the region on the Chromosom which encodes for the according Protein. 
All Exon together are called Exom. WES Method is useful for identifing coding region of genes which affect protein function.
But it does not show you Alteration in the Intron regions, which also influence the Genom dynamic.
Mutations are detected faster and allow to characterise a specific disease. It is a commonly used Method
in the Diagnostic and guides precise medicine.

In 2015 the cost for a whole exom sequencing was about 1000$ - 5000$. Declining trend


### - Whole genome sequencing (WGS):
The Goal in WGS is to store the whole human genom with its about 3,2 Billion basepairs. This tooks a long time and diffrent approaches to
gather the first whole genom. Nowadays its possible to sequence the DNA Genom in several weeks. It is a sequence of the four 
bases (A, T, C, G) from every chromosom. 


### Sequence Alignment Map (SAM):
This Method is used to store nucleotides sequences gained from Next generation sequencing.
However it is a text based Format. Biological sequences are alignt to a reference.
We then compare the sequence and determine the Aberations to the reference. 
SAM Files can be up to several 10 GB in size


### Binary Alignment Map (BAM):
The Binary Alignment Map is a more condenst presentation of SAM and is used to represent aligned sequences.
BAM files contain a header section and an alignment section. The Alignment are indexed and it is its purpose to
find overlapping DNA Strands faster.


### Variant Call Format (VCF):
stores the results of a single or multiple interpretations of genome sequencing datasets, in comparison to a reference genome.
In the file it is displayed the Chromosom, the Position and the Diffrence between the reference and the Alteration. As well as 
Informations about Quality score and about the Sample content.
Because the VCF stores a lot of Information is has accordigly high storage place up to several 100GB.


### FASTA:
Is a fast way to access sequence Data.
FASTA files can contain one or more sequences, each with its own header and sequence data.
Nucleotides and amino acids are represented using single-letter codes.

### Storage and cost for 1'000 genomes by file format

A genome has a size of 715 MB. 


the uncompressed FASTA file 158 GB 





