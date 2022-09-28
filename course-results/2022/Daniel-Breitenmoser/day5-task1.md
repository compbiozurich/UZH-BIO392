### WES and WGS

Whole Exome Sequencing (WES), 1-2% of genome \
Whole Genome Sequencing (WGS) \ 

### Different file formats
FASTQ ca 1GB per WGS \
BAM ca 200MB per WGS \
FASTA ca 1MB \
Genome VCF are ca 5-10GB \
SAM files are human-readable text files, and BAM files are simply their binary equivalent \

### Cost of sequencing

When the Human Genome Project was finished, the costs summed up to about 3 billion USD\
Today we are in the "1000$ genome" era. \
The costs range from 300$ to 1000$ depending on where it is sequenced and on the quality of sequencing.\

###  Storage cost
The storage costs differ much from each other \
Storing 1000 Exomes per year (6TB generated per year), stored for 10 years costs between 0.5$ and 12$ depending mostly on retrieval time. \
It is estimated that the cost to store a single genome to be approximately 14$ to 300$ over ten years again depending on how and where it is stored \

### The vcf format

example:

<img width="756" alt="Screen Shot 2022-09-28 at 11 37 47" src="https://user-images.githubusercontent.com/113686985/192745515-a487bf68-3a7a-406c-8ce5-cbcaa9360b1c.png">

vcf = variant call format \
It contains meta-information lines, a header
line, and then data lines each containing information about a position in the genome.
