# How much computer storage is required for 1000 Genomes
# There are diffrent File types to work with and advantages to illustrute Genomic Data.

1. reason
2. usage
3. Archiv/Storage
4. Costs
5. Browser Visualisation

### Whole exome sequencing (WES):
The Exon is the region on the Chromosom which encodes for the according Protein. 
All Exon together are called Exom. WES Method is useful for identifing coding region of genes which affect protein function.
But it does not show you Alteration in the Intron regions, which also influence the Genom dynamic.
Mutations are detected faster and allow to characterise a specific disease. It is a commonly used Method
in the Diagnostic and guides precise medicine.

In 2015 the cost for a whole exom sequencing was about 1000$ - 5000$. Declining trend



### Whole genome sequencing (WGS):
The Goal in WGS is to store the whole human genom with its about 3,2 Billion basepairs. This tooks a long time and diffrent approaches to
gather the first whole genom. Nowadays its possible to sequence the DNA Genom in several weeks.




### Sequence Alignment Map (SAM):
This Method is used to store nucleotides sequences gained from Next generation sequencing.
However it is a text based Format. Biological sequences are alignt to a reference.
We then compare the sequence and determine the Aberations to the reference. 
SAM Files can be up to several 10 GB in size


### Binary Alignment Map (BAM):
The Binary Alignment Map is a more condenst presentation of SAM and is used to represent aligned sequences.
BAM files contain a header section and an alignment section. The Alignment are indexed and it is its purpose to
find overlapping DNA Strands very fast. 




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

file format | storage | cost |
----------- | ----------- | ------------ 
sequence only | $715$ GB | $357.5$ CHF | 
FASTA | $20'000$ GB | $10'000$ CHF |
SAM | $400'000$ GB | $200'000$ CHF | 
BAM | $100'000$ GB | $50'000$ CHF | 
VCF | $125'000$ GB | $62'500$ CHF | 



file format | storage | cost |
----------- | ----------- | ------------ 
sequence only | $7.15$ GB | $3.57$ CHF | 
FASTA | $200$ GB | $100$ CHF |
SAM | $4'000$ GB | $2'000$ CHF |
BAM | $1'000$ GB | $500$ CHF |
VCF | $1'250$ GB | $625$ CHF |




