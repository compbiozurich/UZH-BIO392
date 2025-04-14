### Task 2025-04-11
# Storage of Genomes

### What are WES and WGS?
#### WES
WES = Whole Exome Sequencing
- *Definition*: It sequences only the **exons** of the genome, which are the protein-coding regions. They only make up a fraction (~1.5%) of the whole genome. 
- This allows the detection of mutation in coding genes associated with many diseases. 
- *Advantages*: cheap and fast, smaller data files needed, reduced complexity. 
- *Disadvantages*: it misses non-coding regions, which can also have an influence on diseases.
#### WGS
WGS = Whole Genome Sequencing
- *Definition*: It sequences the **whole entire genome**.
- This allows detection of most genetic variation.
- *Advantages*: Unbiased and thorough, more useful for SV and rare variants
- *Disadvantages*: higher cost and data volume, difficult analysis and storage.

### What are the different file formats?
What are they and why are they important? \
Which formats to use for what purpose?
#### SAM
SAM = Sequence Alignment/Map \
It is a text-based format for storing sequence alignment data. It contains info like alignment position, read quality and flags.
- *Advantages*: detailed and extensive, human-readable
- *Disadvantages*: large file size (due to verbose formatting: includes read name, alignment info, flags, quality scores, etc.)
- *Storage*: 
    - WGS: 900 mio reads * 300 bytes = 270 GB
    - WES: 0.015 * 270 GB = 4.05 GB
    - 1000 Genomes: 270 TB for WGS, 4 TB for WES respectively

#### BAM
BAM = Binary Alignment Map (compressed version of SAM) \
It too provides information about how sequenced reads align to a reference genome. \
It aims to make storage and access to the alignments more efficient. 
- *Advantages*: smaller/more compact than SAM, more computationally efficient
- *Disadvantages*: still large file size
- *Storage*: Compression ratio of ~5 times SAM
    - WGS: 270 GB * 0.2 = 54 GB
    - WES: 4 GB * 0.2 = 0.8 GB
    - 1000 Genomes: 54 TB for WGS, 0.8 TB for WES respectively

I would probably use this for **full archival purposes**, because it is good for long-term storage, is smaller than SAM and more complete than VCF.\
I would also use this for **browser visualisation**. 
#### VCF
VCF = Variant Call Format \
It stores genetic variants, like SNPs, insertions, deletions. It only describes the differences between sample genome and reference genome for around 2500 samples. 
- *Advantages*: Compact and tab-delimited, stores many samples, each variant is only represented once
- *Disadvantages*: complex, doesn't store actual sequence reads, there are many empty columns
- *Storage*: the human genome has ~4.5 mio variants
    - 4.5 mio variants * 300 bytes = 1.35 GB
    - 1000 Genomes: 1.35 TB

It is best for genotyping results and clinical analysis. Therefore best for **storing called variants**. 
#### FASTA
= linear annotation of single-letter nucleotides or amino acid codes
It is a text-based sequence storage, that stores the raw nucleotide sequences of DNA/RNA or proteins. \
It can act as a reference genome or be used just as assembled sequences. 
- *Advantages*: Simple and human-readable, used as reference for alignments.
- *Disadvantages*: No quality (can be extended to FASTQ though), large (not optimised for size or compression) and inefficient.
- *Storage*: 
    - 3 bio bases * 1 byte = 3 GB
    - 1000 Genomes: 3 TB

I would use this for **browser visualisation** and **full archival purposes** as the reference genome. 

#### Table with storage needs
Taken from [ChatGPT](https://chatgpt.com/), not with my calculations. 
| Format     | WGS (~30x)      | WES (~100x)     | Notes                             |
|------------|------------------|------------------|------------------------------------|
| SAM        | 300–500 GB         | 30–50 GB          | Uncompressed alignments |
| BAM        | 75–100 GB        | 10–20 GB         | Aligned reads to reference |
| VCF        | 1–5 GB           | ~0.5–1 GB        | Variants only                      |
| FASTA      | ~3 GB            | Shared           | Reference genome (not sample-specific) |
| FASTQ      | 100–150 GB       | 10–15 GB         | Raw reads; WES targets ~1–2% of genome |

### What are the associated costs?
Costs are determined by their storage. In this case the cost of one whole genome is most expensive in SAM and the cheapest in VCF. 
#### Cost Assumptions (1000 Genomes)
- $0.15 per GB on [Azure](https://azure.microsoft.com/en-us/pricing/details/storage/blobs/)

| Format | Storage Cost per Month (WGS) |
|--------|------------------------------|
| SAM    | $40'000                      | 
| BAM    | $8'100                       | 
| VCF    | $202                         | 
| FASTA  | $450                         |

#### Cost factors / how are costs influenced?
- **Sequencing type**: WES is much cheaper than WGS. 
- **Depth of analysis**: Higher coverage => more reliable data, but also costs more, since it requires more reads. 
- **Data processing**: Analyses like alignment, variant calling or annotation need computing time and expertise.
- **Storage**: Storing the (raw) data is also costly. 
