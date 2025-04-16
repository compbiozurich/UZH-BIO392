# File Formats

  * Which file formats are there?
  * When are they used?
  * What are the costs and how are they influenced?

These questions will be briefly answered below.

Before we dive into the different file formats, it is important to mention the difference between 
**Whole Exome Sequencing (WES)** and **Whole Genome Sequencing (WGS)**. When WES is performed, only the protein-coding parts 
of the genome – the exome – is sequenced. Compared to WGS, where both coding and non-coding regions are sequenced, WES is 
much cheaper and produces less data. As there is much more data generated with WGS, there is also more storage required and 
more computing power for analysis, which affects costs.

  * Size estimate of **Human Genome** ≈ 3.2 *10^9 base pairs
  * Size estimate of **Human Exome** ≈ 30–50 million base pairs

For the cost estimates below (storage of 1000 genomes) I used the size of the whole genome.


## Which file formats are there? 
**SAM:** SAM stands for Sequence Alignment/Map format. It describes the alignment of sequencing reads to a reference sequence or assembly. It is a tab-delimited file, which was developed from the 1000 genome project. It is simple and easily generated.

**BAM:** BAM stands for Binary Alignment Map and is the binary equivalent to the SAM format. A BAM file contains the same information as a SAM file, but has much smaller file size, as it is compressed. Compared to SAM files, BAM files are not readable.

**BED:** BED stands for Browser Extensible Data and is a way to describe basic features on a sequence. Each feature is represented by a single line, typically with 3 to 12 columns of data. BED files are commonly used to define user-specified sequence features and visualisation of these features.

**FASTA/FASTQ:** FASTA is a simple and widely supported format to represent biological sequences. It includes a sequence name, an optional description (for example metadata or sequencing details) and the sequence itself. The sequences are formatted in plain text and therefore readable. Raw reads from a sequencer are often in the FASTA format. FASTQ is similar to FASTA, but already with quality scores included.

**VCF:** VCF stands for Variant Call Format. It is a standard file format for storing DNA variation data, including SNPs, insertions, deletions and structural variants, together with annotations and metadata. There is a header (metadata etc.) and a body. Each line of the body describes variants present in the sampled population at one genomic position or region. 


## When to use which one?
**SAM:** For inspection of aligned reads

**BAM:** For efficient storage of aligned reads

**BED:**  When working with regions (not sequences) and to visualize these regions

**FASTA:** To store (reference-) sequences and or raw reads from sequencer

**VCF:** To store and analyze human genome variants


## Cost estimates for storing 1000 genomes:
Of the 5 mentioned file formats, in my opinion it makes most sense to store a genome in a **BAM file**, because a binary format needs less storage and the BAM format is suitable to store aligned reads.

2 bits are enough to encode A, C, G, T. Therefore I made the calculations with 2 bits per base.

Ideally, we would have 3.2 * 10^9 bases multiplied by 2 bits -->  6.4 billion bits --> **0.8 GigaBytes per genome**

But in real life we need to consider coverage, which influences BAM file size. According to this site [Guide to Storage and Computation Requirements]( https://www.strand-ngs.com/support/ngs-data-storage-requirements) we can come up to ~ **150 GigaBytes per genome**, when we take a coverage of 35x to 40x and read lengths of 75 bases or longer.


### Costs for 1000 genomes per month (storage only):

**Ideally** -->  0.8GB * 1000 * $0.15  = **120$ per month**

**Realistically** --> 150GB * 1000 * $0.15 = **up to 22’500$ per month**

  * Cost assumption: $ 0.15 per GB see [Microsoft Storage Pricing](https://azure.microsoft.com/en-us/pricing/details/storage/blobs/)



## Conclusion: What influences the storage costs?
-	Facilities and Service
-	Storage provider
-	If it is WGS or WES data
-	Which file format
-	Hot/cool/cold access or archive; how frequently does it need to be accessed?
-	Read length, number of reads and coverage
-	If there’s an overhead (Strand NGS)
-	etc.


## References:
https://azure.microsoft.com/en-us/pricing/details/storage/blobs/

https://doi.org/10.1093/bioinformatics/btp352

https://doi.org/10.1093/bioinformatics/btac010

https://learn.gencore.bio.nyu.edu/ngs-file-formats/sambam-format/

https://pmc.ncbi.nlm.nih.gov/articles/PMC3137218/

https://www.strand-ngs.com/support/ngs-data-storage-requirements



