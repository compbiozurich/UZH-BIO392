
#  Task: Estimate Storage Requirements for 1000 Genomes


A perfect genome (no overhead) takes about  ~715 MB

- WGS also called "Whole genome sequencing" is the process, by which 
you try to get the DNA nucleotide sequence of the whole genome, which includes the whole chromosomal DNA and mitochondria. 
One of the first approaches was the capillary sequencing method. With this method, it was possible to nearly sequence the whole genome but 
the problem was that it was too expensive and inefficient for commercial purposes. 
Over time, the nanopore-sequencing technology became more prevalent because it is much quicker and can sequence 
overall longer sequences. The only disadvantage is that it is less accurate. 
Methods for analyzing sequencing data are leading to a better understanding of diseases and target their prevention.
The costs for a WGS range from $1,000 to $5,000 per genome. 


- Whole exome sequencing, short WES is the process for the identification of coding regions of genes responsible for protein function. 
The disadvantage here is there are no alterations seen in the introns, which could have an effect on the genome dynamic. 
Overall the advantage is that mutations are detected faster and allow to characterize the specific diseases.
The costs for a WES range from $500 to $2,000 per sample. 

#  SAM 

SAM stands for "Sequence Alignment/Map". It is a text-based file format used in bioinformatics and genomics to store information
about the alignment of a sequence to a reference genome. The SAM file is divided into a header and an alignment section. 
The header section consists of the metadata and information about the reference genome, sequencing platform and other relevant details.
The alignment section provides information about how the scans match the reference genome. SAM files are easily readable and can be opened and reviewed with a text editor. They are accessible for manual review, but less efficient for storing and transferring large amounts of sequencing data because they store alignment information in text format. 

Storage for SAM is coverage-dependent. So if you work with 30x coverage you will need for 1000 genomes about:
715MB * 30 = 21'450 MB 
--> 21'450 /1024 = 20.95 GB

If you wanted to store that amount of data in a cloud, you would pay about 0.53 $ per month. 


# BAM (Binary Alignment Map) 

BAM is the compressed binary version of a SAM file and has the specific benefit of finding overlapping locations quickly.
Its format allows a very compact saving and is faster to read and write compared to its text-based counterpart, the SAM file.
Bam files are divided into a header and alignments. 
The header contains the sample name, sample length, and the alignment method. Meanwhile, the alignments part contains the read name,
sequence, quality, alignment information and custom tags. 
Chromosome, start coordinate, alignment quality and match descriptor string can be found under the read name. 

With a BAM file, you save about 30 % - 50% of the original SAM file. So for 1000 genomes, you need about:
10.48 GB - 14.67 GB

If you wanted to store that amount of data in a cloud, you would pay about 0.3 $ per month. 

#  VCF
In genomics and bioinformatics, the file format known as VCF, or Variant Call Format, is frequently used to describe genetic variations such as single nucleotide polymorphisms (SNPs), insertions, deletions, and structural variants that are found when analyzing DNA sequencing data. Most VCF files are saved in text format. The file's header contains information about the file's body as metadata. # is used to indicate that a line is a header. In the header, special keywords are indicated by the ## symbol. The body of the VCF is tab divided into 8 obligatory columns and an indefinite number of optional columns that can be used to record additional information about the samples.

VCFs are normally rather large and are therefore usually handled in compressed form. One genome requires about 125 GB as a VCf file. So 1000 genomes require about 125'000 GB. 

If you wanted to store that amount of data in a cloud, you would pay about 3'125 $ per month. 

#  FASTA

FASTA is used to represent nucleotide or protein sequences with a focus on similarities between the sequences. 
The header line is identified by the greater-than symbol (">") at the beginning of each sequence in a FASTA file.
This line provides a brief explanation or identification of the sequence (like the name or origin). 
The header is followed by the sequence data. It may consist of letters representing amino acids 
(one- or three-letter codes) or nucleotides (A, C, G, T or U in RNA sequences). For better readability,
the sequence data are usually in a single line. The type of biological sequences stored in FASTA files can vary
greatly depending on the specific content and can greatly affect their size. For example, small sequences such as
short DNA primers or protein domains result in smaller files, 
while whole genome sequences or large protein sequences can result in larger files.

Fasta files are not really known for high compressions like BAM or FASTQ files but you can save approximately 20-30%. 
So if you have a 715 MB Genome * 1000 = 715GB and you make a FASTA file you get about 500-572 GB. 

If you wanted to store that amount of data in a cloud, you would pay about 13 $ per month. 



