# Task: Estimate storage requirements for 1'000 genomes

## Base for calculations

To just store the sequence, $2$ bits per base are sufficient.
* WGS (whole genome sequencing) will cover roughly $6'000'000'000$ b which translates to about $715$ MB storage (according to the slides). $1'000$ genomes then would need $715$ GB storage.
* WES (whole exome sequencing) will cover about $30'000'000$ b [^1] which translates to $3.75$ MB storage. $1'000$ genomes then would need $3.75$ GB storage.

According to the slides, $1$ PB of storage costs about $500'000$ CHF. That makes $0.5$ CHF per GB.

## File formats

### FASTA
FASTA is a text format that displays the DNA sequence as a string of single nucleotides or amino acid codes. As it merely contains any additional information, this format is very compact and thus also inexpensive to store.
This format is for example used to translate the coordinates (with which we mostly work in other formats) back into its original amino acid sequence. Thus, the reference genome is somewhere stored in FASTA format.

### SAM 
SAM (Sequence Alignment Map) format is used to store large nucleotide sequence alignments. These alignments of sequences are made against a reference genome. SAM files are human-readable text files (in contrary to the BAM format, see later).

### BAM
BAM (Binary Alignment Map) format is the binary form of the SAM format. This compression allows for a much smaller storage which makes BAM a very affordable format. But, it is not human-readable anymore. This means we can use it for computation, but less for visualization purposes.

### VCF
VCF (Variant Call Format) is the standard format for human genomic variant representation. It stores information about variants found in respect to a reference genome.

## Storage and cost for 1'000 genomes by file format

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

















[^1]: https://www.jax.org/news-and-insights/jax-blog/2016/september/genomes-versus-exomes-versus-genotypes#:~:text=WES%20focuses%20exclusively%20on%20the,constituting%20about%2030%2C000%2C000%20base%20pairs.
