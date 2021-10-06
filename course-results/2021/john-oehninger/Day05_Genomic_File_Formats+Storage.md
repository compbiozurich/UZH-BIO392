
# Genomic File Formats and storing them digitaly
To encode a single base, 2 bits are sufficient. (00, 01, 10, 11) -> (A, T, G, C)
To store one genome with no overhead (metadata), approximately 715 MB of storage are needed.
This boils down to an average of approximately 50CHF/Genome storage cost for just raw sequence data.
Since everything works better when organised and structured, there are various file formats that optimize handling genomic sequence data.

## WES vs. WGS
The human genome contains ~3 billion base pairs. When sequencing, one needs to consider if a sequence of the whole genome is needed or if only the exome is needed. Exons are the sequences that remain within the processed RNA after introns have been removed by splicing. They contribute to the final protein product encoded by that gene. In WES only the exome is sequenced where as in WGS the entire genome is sequenced. Depending on what the goal of the sequencing is, one should consider sequencing and data storage costs.

## Types of formats

### SAM
Stands for **Sequence Alignment Map**. Was developed by Hang Li and Bob Handsaker et al. It was developed when the 1000 Genomes Project wanted to move away from the MAQ mapper format and decided to design a new format. The format consists of:
* Header
* Alignment section

Here is an example of a SAM file with descriptions of all the variables.
<p align="center">
<img src="https://github.com/compbiozurich/UZH-BIO392/blob/master/course-results/2021/john-oehninger/Images/sam_format_annotated_example.5108a0cd.jpg" width="700">
</p>

### BAM:
Is the compressed binary version of a SAM file that is used to represent aligned sequences up to 128 Mb. They consist of a:
* Header
* Alignment section

### VCF:
Stands for **Variant Call Factor**. It is a widely used file format developed by the genomics scientific community that contains information about variants found at specific postisions in a reference genome. It consists of a:
* Header
* File Data Lines


### FASTA:
FASTA format is a text-based format for representing either nucleotide sequences or peptide sequences, in which base pairs or amino acids are represented using single-letter codes. A sequence in FASTA format begins with a single-line description, followed by lines of sequence data. The description line is distinguished from the sequence data by a greater-than (">") symbol in the first column. It is recommended that all lines of text be shorter than 80 characters in length.

An example sequence in FASTA format is:

      >gi|186681228|ref|YP_001864424.1| phycoerythrobilin:ferredoxin oxidoreductase
      MNSERSDVTLYQPFLDYAIAYMRSRLDLEPYPIPTGFESNSAVVGKGKNQEEVVTTSYAFQTAKLRQIRA
      AHVQGGNSLQVLNFVIFPHLNYDLPFFGADLVTLPGGHLIALDMQPLFRDDSAYQAKYTEPILPIFHAHQ
      QHLSWGGDFPEEAQPFFSPAFLWTRPQETAVVETQVFAAFKDYLKAYLDFVEQAEAVTDSQNLVAIKQAQ
      LRYLRYRAEKDPARGMFKRFYGAEWTEEYIHGFLFDLERKLTVVK







