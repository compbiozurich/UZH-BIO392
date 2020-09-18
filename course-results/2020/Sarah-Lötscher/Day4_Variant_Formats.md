## Task: Exploration and Reading up on Variant Formats


### SAM  (Sequence Alignment Map)

Type of alignement file. Starts with a header containing information about the reference genome such as name length or information about the sequencing and alignement.
After the header the alined sequences are listed along with ther information like their names and position and what the differences are to the reference and where to find them on the sequenze. 
The SAM format also gives a quality score for each alignment to .
 
 ------
 
 ### BAM  (Binary Alignment Map)

The SAM format can be compressed into a BAM which is binary file. Bam files cant be read by eye but there are algoroithms that can deal with this format. 

BAM files also consist of a header section containing information such as sample name, sample length, and alignment method and the Alingement sequence.
Bam files can apparently be visualised in genome browsers such as UCSC.
 
 ------

### VFC  (Variant Call Format)

The VFC format is used to store information about variant and genetic alterations compared to a specified reference genome.
It also contains a header with informationa about the reference genome.
A VFC file specifies exactly at what position which type of variant is present of sample sequences compared to the reference sequence.



------
### FASTA

FASTA is a format for listing DNA sequences.
In the Fasta file sequences are listed starting with '>' follwed by the sequence name and information. On the next line the whole nucleotide or aminoacid sequence is displayed. 
FASTA files with sequence information of specific genomes can be downloaded from Genome browsers such as NCBL.



 
 
  
