# Calculation of Costs of the Storage of genomic file formats #
TASK: Estimate the Storage Requirements for 1'000 Genomes
_How much computer storage is required for 1'000 genomes_
* WES & WGS
* Different  file formates:
  * SAM
  * BAM
  * VCF
  * FASTA
* Asssociated costs
  * Cost factors
  * Raw Storage costs

Assumption:
* 3 Billion letters with an average coverage of 30x (= 90 billion letters)
* each letter = 1 byte
==> 90 GB

#### FASTQ
##### Whole Genome
It contains both short-reads and quality scores ==> size ~180 GB 
+ Variations ==> ~200 GB ([Source](https://medium.com/precision-medicine/how-big-is-the-human-genome-e90caa3409b0))

If we take 500'000 CHF/PB (= 0.50 CHF/GB) (Source: M. Baudis, Genomic File Formates, 2021)

Cost = 200 GB * 0.50 CHF/GB = 100 CHF ==> 100'000 CHF for 1'000 Genomes
that is ~3'333 CHF per coverage

#### CVF
##### Whole Genome
Only 0.1% is different among individuals genome.
A VCF file is therefore only ~125 MB ([Source](https://medium.com/precision-medicine/how-big-is-the-human-genome-e90caa3409b0))
If we take the same costs per Pentabyte we can calculate the cost of VCF:

Cost = 0.125 GB * 0.50 CHF/GB = 0.0625 CHF ==> 62.50 CHF for 1'000 Genomes



#### FASTA
Assumption may fail
##### Whole Genome
The Human Genome can be downloaded [here](https://www.ncbi.nlm.nih.gov/genome/guide/human/) in different file formats
The FASTA (unzipped) file is ~3.31 GB

Therefore:
Cost = 3.31 GB * 0.5 CHF/GB = 1.655 CHF ==> 1655 CHF for 1'000 Genomes

#### BAM
##### Whole Genome
a 30x coverage BAM file of a whole genome is ~80-90 GB in size [Source](http://massgenomics.org/2014/11/brace-yourself-for-large-scale-whole-genome-sequencing.html)
Therefore:
Cost = 85 GB * 0.50 CHF/GB = 42.5 CHF ==> 42'500 CHF for 1'000 genomes

#### SAM
According to [internet forums](https://www.biostars.org/p/260295/) SAM files may be 3 times as large as FASTQ files. 
so we will be at 3 * ~200 GB = 600 GB (with a 30 times count)
therefore:
Cost = 600 GB * 0.5 CHF/GB = 300 CHF ==> 300'000 CHF for 1'000 Genomes
that is 10'000 CHF per coverage.

### Whole Exome
The Exome constituate a totol of 1.1% of the total genome. In the next section, I will sumerise all costs, given that the costs of the whole Exon sequencing
is about 1.1% of the whole exome sequence. The numbers address the cost for 1'000 genomes.

|  File | WGS Cost (Coverage 30) | WGS Cost per coverage | WES Cost per Coverage |
|:-----:|:----------------------:|-----------------------|-----------------------|
| FASTQ | 100'000 CHF            | ~3'333 CHF            | 36.66 CHF             |
|  CVF  | 1'875 CHF              | 62.50 CHF             | 0.68 CHF              |
| FASTA | 49'640 CHF             | 1'655 CHF             | 18.21 CHF             |
|  BAM  | 42'500 CHF             | 1'416.66 CHF          | 15.58 CHF             |
|  SAM  | 300'000 CHF            | 10'000 CHF            | 110 CHF               |
