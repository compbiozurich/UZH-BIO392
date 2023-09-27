# Estimate Storage Requirements for 1000 Genomes
assuming: 16TB á CHF550 -> 1TB à CHF35
### SAM
The SAM file type is a text base type which requires 8 bit bytes to express a character. This file type includes a lot of information about the sequence at hand which is stored in at least 11 columns. 
#### Size Estimate:
1000 genomes x 3'000'000'000 bp x 8 bit = 24TB 
(This calculation does not include headers and additional information stored in the 11 mandatory columns with information on chromosomes, positions, quality, etc. Also, the genomes would be stored in sequences of up to 127Mbp, adding to the data to be stored)
#### Pros: 
* readable by humans
* additional information on sequences, quality, methods, ...
#### Cons:
* very large file which leads to high storage costs
#### Cost Factors: 
* storage of genomes
* additional data to be stored
* sequencing (machinery, lab materials, etc.)
* allignment
* multiple copies of each genome
* ...
#### Raw Storage Costs: 
24TB x CHF35 per TB = 840CHF for 1000 genomes
(This number ignores the fact that one would need at least 30x of each genome)
#### Preferable Use:
* Store variations and it's additional information
* Can be used for display 


### BAM
This file type profits of being a binary version of a SAM file, which means it will be more compact and need less bits to express a base. 
#### Size Estimate:
1000 genomes x 3'000'000'000 bp x 2 bit = 6TB
#### Pros: 
* compact
* saves storage
#### Cons: 
* not readable by humans
* has to be compressed and decompressed (additional tools are necessary)
#### Cost Factors:
* storage
* sequencing (machinery, lab materials, etc.)
* allignment
* multiple copies of each genome
* ...
#### Raw Storage Costs: 
6TB x CHF35 per TB = 210 CHF for 1000 genomes
(This number ignores the fact that one would need at least 30x of each genome)
#### Preferable Use:
Storage, even of longer sequences

### FASTA
FASTA files are like SAM files and require 8 bits per byte. They have a header which includes some basic information to identify the sequence at hand.
#### Size Estimate:
1000 genomes x 3'000'000'000 bp x 8 bit = 24TB
(This ignores the number of characters of the header of each sequence)
#### Pros: 
* practically only genome sequence -> less data to be stored
#### Cons:
* no additional information
* has to be analyzed further first
* multiple sequences with a header each -> more data
#### Cost Factors:
* storage
* sequencing (machinery, lab materials, etc.)
* allignment
* multiple copies of each genome
* ...
#### Raw Storage Costs:
24TB x CHF35 per TB = 840CHF for 1000 genomes
(This number ignores the fact that one would need at least 30x of each genome)
#### Preferable Use:
* Further analysis
* Display longer sequences

## WGS - Whole Genome Sequencing
* Takes more time and is more expensive to sequence
* Can make use of a reference genome but is not strictly necessary
* Requires more storage space
* Doesn't require knowledge of sequences
* Allows analysis of regulatory areas
#### Raw Storage Costs:
If we were to store the whole genome in a BAM file it would cost CHF210.


## WES - Whole Exome Sequencing
* Cheaper and quicker to sequence
* Requires a reference genome
* Less data and thus also cheaper to store
* Allows more reliable SNP and variation detection in coding regions
* The target sequence has to be known
* Coding sequences are often responsible for desease and thus need to be analyzed mre often for medical reasons
* Misses variations in regulatory areas and areas we don't know much about
#### Raw Storage Costs:
We assume that 1.1% of the human genome are exons, thus making up 33'000'000 bp. If we store the exons of 1000 genomes in a BAM file this would lead to a raw storage cost of:
1000 genomes x 33'000'000 bp x 2 bit = 66GB -> CHF23

