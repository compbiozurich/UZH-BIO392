# Estimate Storage Requirements for 1000 Genomes

#### WES & WGS 
Whole genome sequencing - WGS - and whole exome sequencing - WES - are two of the most popular methods used in genetic research. WGS sequences the entire genome, so it includes protein-coding and non-protein-coding regions. Therefore, allmost all changes in the DNA can be identified. WES only sequences the protein - coding regions. It is cheaper, since the ampunt of data generated is sigcnificantly less then with WGS. The majority of diease-causing variants are in the exome, therefore  WES is quite a powerful tool to identify genetic causes for disease. However, WGS provides a more compreensive picture of other variants. Especially rare and novel variants might be missed with WES (see [source] (https://www.novogene.com/eu-en/resources/blog/wgs-vs-wes-which-genetic-sequencing-method-is-right-for-you/)). 

#### Diﬀerent file formats
- SAM/BAM: SAM stands for Sequence Alignment/Map format, and is a generic alignment format for storing read alignments against reference sequences. It supports short and long reads produced by different sequencing platforms. A SAM fil is a tab-delimited text file that contains sequence alignment data. BAM is the binary version of a SAM file. Both files contain same information and with SAMtools software, a BAM file can be easily converted to SAM file. They have import roles in analysis of next-generation sequencing data because the raw sequence reads from sequencers have no genomic position information associated and they must be mapped/aligned to known reference genome. The mapping/alignment outputs are BAM/SAM files and they are further used for downstream analysis. A SAM/BAM file consists of header section and alignment section.
  
- VCF: The VCF Variant Call Format is an example for a widely used file format with "built-in logic". It provids "logic
compression" for genomic annotations which rely on the notion of "assessed variant in a population". It is complex to interpret, but there is no replacement in sight (but new versions) (see BIO 390, lecture 1). It was initially introduced by the 1000 Genomes Project to store the most prevalent types of genomic sequence variation, such as SNPs and small INDELS, enriched by annotations. VCF file is text file and contains meta-information (header) lines and data lines.

- FASTA: FASTA format is a text based format and has been standard format for nucleotide sequence since the first generation sequencing. For next-generation sequencing, it is the standard format for reference genome sequences used by mapping/alignment software tools. A FASTA file starts with a header line followed by lines of sequence. The header line begins with a “>” sign for sequence identifier and may contain optional descriptive information. Sequence lines consist of characters representing nucleotide bases in the sequence and are usually no more than 80 characters per line, but there are  no limitation for total number of lines. Same as sequence in FASTQ files, each nucleotide base is encoded as a single character (one of A, T, G, C, and N if undetermined, with case insensitive). FASTA format can be used to display sequence of a single gene, a single chromosome, or multiple ones.
(see Zhang H.)

### How much computer storage is required for the different file formats?

|File Type|WES (100x)|WGS (30x)|for 1000 Genomes
|-------|-------------------|----|----|
|SAM|	13 GB|	180 GB| 180 TB |
|BAM|8 GB|100 GB|100 TB|
|VCF|	0.1 GB|1 GB|1 TB|


### What are the different file formats typically used for: 

FASTA: is essentially for storing  and exchanging sequence data
SAM: stores text based mapping information. It can be compressed to BAM, which is a binary version of SAM and is more compressed and therefore better suitable for storing the data
VCF: is good to store genome variant, including annotations

### Cost factors
This ofcourse differs for different institutions and countries. 
- Cost estimates for a single WES test ranged from $555 to $5,169
- Cost estimates for a single WGS test ranged from $1,906 to $24,810

At the Helath 2030 Genome Center in Switzerland the costs are: 
WES, ~ 40 mio clusters, 2 x 100bp reads (~ 70x coverage)	 460 CHF / sample
WGS, ~ 375 mio clusters, 2 x 150bp reads (~ 30x coverage)	 905 CHF / sample

So, as discussed before, WES is cheaper than WGS, since we only sequence parts and not the whole genome. 

Regarding the storage of the different file formats, it was hard to find specific information. Obviously, soting BAM fiels is cheaper than SAM files, since they are more compressed and therefore are the more suitable candidate for data storage. As far as I know, CRAM is a BAM file, but even more compressed, therefore it must be cheaper to store too. Since FASTA is only raw sequencing data, without any alignments, mapping and information like quality scores, it is way cheaper than SAM, BAM and CRAM files. Also VCF files are qay smaller than BAM, SAM and CRAM files, since they dont contain whole genomes +  additional information, but only the variant information. This makes it also cheaper to store. 

Sources: 
Zhang H. Overview of Sequence Data Formats. Methods Mol Biol. 2016;1418:3-17. doi: 10.1007/978-1-4939-3578-9_1. PMID: 27008007.
[required storage] (https://3billion.io/blog/big-data-among-big-data-genome-data)
[Helath 2030 Genome Center] (https://www.health2030genome.ch/service-fees)
Muir, P., Li, S., Lou, S. et al. The real cost of sequencing: scaling computation to keep pace with data generation. Genome Biol 17, 53 (2016). https://doi.org/10.1186/s13059-016-0917-0
https://aws.amazon.com/de/blogs/industries/store-omics-data-cost-effectively-at-any-scale-with-aws-healthomics/
