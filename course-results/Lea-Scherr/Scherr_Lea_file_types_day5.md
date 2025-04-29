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

#### BAM
BAM = Binary Alignment Map (compressed version of SAM) \
It too provides information about how sequenced reads align to a reference genome. \
It aims to make storage and access to the alignments more efficient. 
- *Advantages*: smaller/more compact than SAM, more computationally efficient
- *Disadvantages*: still large file size

I would probably use this for **full archival purposes**, because it is good for long-term storage, is smaller than SAM and more complete than VCF.\
I would also use this for **browser visualisation**. 

#### VCF
VCF = Variant Call Format \
It stores genetic variants, like SNPs, insertions, deletions. It only describes the differences between sample genome and reference genome for around 2500 samples. 
- *Advantages*: Compact and tab-delimited, stores many samples, each variant is only represented once
- *Disadvantages*: complex, doesn't store actual sequence reads, there are many empty columns
- *Storage*: the human genome has ~5 mio variants per WGS (~0.16% of the total 3 billion bp), therefore, VCF files need less storage

It is best for genotyping results and clinical analysis. Therefore best for **storing called variants** and together with BAM for **browser visualisation**. 

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

Reading a person's 3 billion base sequences at least 30 times takes about 90 billion characters. [1]

| Format     | WGS (~30x)       | WES (~100x)     | Notes                                  |
|------------|------------------|-----------------|----------------------------------------|
| SAM        | 300–500 GB       | 30–50 GB        | Uncompressed alignments                |
| BAM        | 100 GB           | 8 GB            | Aligned reads to reference             |
| VCF        | 1 GB             | 0.1 GB          | Variants only                          |
| FASTA      | ~3 GB            | Shared          | Reference genome (not sample-specific) |
| FASTQ      | 80 GB            | 5 GB            | Raw reads; WES targets ~1–2% of genome |

**References**:
- I used [1] for the calculations on FASTQ, BAM and VCF.
- For SAM and FASTA, I took the information from [2].

### What are the associated costs?
Costs are determined by their storage. In this case the cost of one whole genome is most expensive in SAM and the cheapest in VCF. 

#### Cost Assumptions (1000 Genomes)
AWS (Amazon Web Services), which is widely used, costs about $0.025/GB per month. If you calculate with one person’s genome, it will cost $4.5/month, but if you consider 1000 people, the minimum number of samples in a population to filter out common variants, even simply storing it at $4500/month is quite a bit. [1]

| Provider       | Service name   | Price   | Price per one WGS sample |
|----------------|----------------|---------|--------------------------|
|AWS             |S3 Standard     |$0.025/GB|$4.5                      |
|Google cloud    |Cloud storage   |$0.023/GB|$4.14                     |
|Microsoft Azure |Premium         |$0.15/GB |$27.0                     |


#### Cost factors / how are costs influenced?
- **Sequencing type**: WES is much cheaper than WGS. 
- **Depth of analysis**: Higher coverage => more reliable data, but also costs more, since it requires more reads. 
- **Data processing**: Analyses like alignment, variant calling or annotation need computing time and expertise.
- **Storage**: Storing the (raw) data is also costly. 

### References
[1] [3 billion](https://3billion.io/blog/big-data-among-big-data-genome-data)\
[2] [ChatGPT](https://chatgpt.org)
