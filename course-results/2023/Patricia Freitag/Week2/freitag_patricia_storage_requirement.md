
# Whole Genome Sequencing (WGS): 
6’000’000’000 bases => 715 MB 
1000 Genomes -> about *700 GB* of storage 

# Whole Exome Sequencing (WES):
The Exome consists of 30 million nucleotides (https://www.ncbi.nlm.nih.gov/pmc/articles/PMC4051326/)
Exons are protein coding regions of the genome 
2 x 30’000’000 bases => 7.15 MB
1000 Genomes => about *7 GB* of storage 

# FASTA
FASTA is a text based format for storing raw sequences like DNA sequences, RNA sequences, and protein sequences. FASTA files are relatively easy to read, consisting of only a single line header (sequence identifier) and the sequence, they are both human and computer readable. 
In order to store a whole human genome

# SAM/BAM
Sequence Alignment Map (SAM)/Binary Alignment Map (BAM)
Both are used for storing DNA sequencing data and alignment of reads to a reference genome. 
One major difference between these two formats is that SAM files are human-readabele while BAM files are not. BAM is the binary version of SAM, they are more space efficient and are easier to process. 

# VCF
Variant Call Format
Is used to store gene sequence variants, like SNPs, insertions, deletions and other types of variations. They are often used in population genetics studies to identify genetic variation or in Genome Wide Association Studies (GWAs) 

FASTA -> SAM/BAM -> VCF


