# **Asssignment by Basil Burri**

### Task of this assignment
-	Suitability evaluation of four different genomic file formats for storing called variants, archiving genomic data, 
and visualizing results in genome browsers.
- One page size estimates for four different genomic file formats.
- Cost estimates for storing common scales of four different genomic file formats. 

### Assumption for size estimates
- One A4 Word page holds 3'000 bytes plain text.

### Assumptions for cost estimates
- Storage costs: $0.15 per GB per month on [Microsoft Azure](https://azure.microsoft.com/en-us/pricing/details/storage/blobs/)
- 1 GB = 1'073'741'824 bytes


## **VCF (Variant Call Format)**

**Overview**
|                   |                                                                                                           |
|-------------------|-----------------------------------------------------------------------------------------------------------|
| **Description**   | Text format for storing genomic variant calls (SNPs, indels) and their corresponding chromosomal position and annotations.                                                                                                                |
| **Best Use**      | Storing called variants                                                                                   |
| **Size**          | 136 bytes per line. Size estimate was obtained by calculating the bytes of randomly chosen [VCF file lines](https://www.internationalgenome.org/wiki/Analysis/Variant%20Call%20Format/vcf-variant-call-format-version-40/) with an online text to bytes calculator.                                                                                                       |

**Evaluation**

A single page can hold roughly 22 variants, based on an estimated line size of 136 bytes. 
The VCF format is suitable for storing variants because it contains detailed information like chromosome, position, alleles, 
quality scores, and annotations. For archival purposes, VCF is effective for variant data as it only contains information 
about positions differing from the reference and therefore saves space. As it does not store raw sequences or alignments, 
all information is based on comparison to a reference, requiring a [liftover](https://pmc.ncbi.nlm.nih.gov/articles/PMC8285936/) when changing between genome reference editions. In visualization, VCF files enable variant tracks in genome browsers like [UCSC]( https://genome.ucsc.edu/) or [Ensembl](https://www.ensembl.org/index.html). 
However, being text-based, VCF files require indexing for querying, which can make them less efficient compared to binary VCF formats like [BCF]( https://evomics.org/vcf-and-bcf/) (Binary Variant Call Format).



## **BED (Browser Extensible Data)**

**Overview**
|                   |                                                                                                           |
|-------------------|-----------------------------------------------------------------------------------------------------------|
| **Description**   | Tab-delimited text format for describing genomic intervals (regions, variants) with annotations.          |
| **Best Use**      | Visualizing genomic intervals                                                                             |
| **Size**          | 69 bytes per line. Size estimate was obtained by calculating the bytes of randomly chosen [BED file lines](https://www.ensembl.org/info/website/upload/bed.html) with an online text to bytes calculator.                                 |

**Evaluation**

A page can fit approximately 43 regions, based on an estimated line size of 69 bytes. 
BED is less suited for storing called variants, as it only represents intervals (variant positions or CNVs) without metadata. 
For archiving, BED's compact structure lacks the annotations needed for comprehensive datasets. 
BED is best used for visualization in browsers like [IGV]( https://igv.org/) or [UCSC]( https://genome.ucsc.edu/) 
for rendering intervals. Genome browsers like IGV and UCSC can load BED files and use them for 
highlighting specific regions of the genome.



## **BAM (Binary Alignment Map)**

**Overview**
|                   |                                                                                                           |
|-------------------|-----------------------------------------------------------------------------------------------------------|
| **Description**   | Binary format for storing aligned sequencing reads, including base calls, quality, and mapping details.   |
| **Best Use**      | Archival purposes                                                                                         |
| **Size**          | 0.5 bytes per base. Size estimate was obtained by reading forums on [biostars.org](https:www.biostars.orgp/8901/#8903).                                                                                           |

**Evaluation**

A page contains approximately 6'000 bases, with an estimated storage size of 0.5 bytes per base for compressed formats like CRAM. As a whole human exome contains about 30 million bp, a BAM file for the human exome would contain 5'000 pages. 
BAM is unsuitable for storing called variants directly, as it holds raw or aligned reads used to generate VCFs. 
It is best used in archiving for preserving full alignment data for re-analysis, such as new variant calling. 
For visualization, BAM is suitable for visualization of reads in browsers like IGV, but its size makes it less efficient 
for variant visualization compared to BED.



## **FASTA**

**Overview**
|                   |                                                                                                           |
|-------------------|-----------------------------------------------------------------------------------------------------------|
| **Description**   | Text format for storing nucleotide or protein sequences with metadata.                                    |
| **Best Use**      | Storing and archiving of sequences                                                                        |
| **Size**          | 1 byte per base. Size estimate was obtained by reading forums on [biostars.org](https://www.biostars.org/p/415475/).                                                                                                                     |

**Evaluation**

In a FASTA file, approximately 3'000 bases can fit per page, with an estimated storage size of 1 byte per base. 
FASTA is not used for variant storage. It is used as a format for reference genomes and raw or assembled sequences. 
While FASTA is most commonly used to store reference genomes like [GRCh38](https://ftp.ensembl.org/pub/release-113/fasta/homo_sapiens/dna/), it is also used to archive assembled contigs from sequencing experiments. In visualization, 
FASTA provides a reference sequence track in genome browsers, but does not directly display variants or annotations.


## **Summary of size estimates for one page**

**One page size estimates for different genomic file formats**

| **Format** | **Size Estimate**        | **Variants/Regions/Size per Page**  |
|------------|--------------------------|-------------------------------------|
| **VCF**    | 136 bytes per variant    | ~22 variants per page               |
| **BED**    | 69 bytes per region      | ~43 regions per page                |
| **BAM**    | 0.5 bytes per base       | ~6'000 bases per page               |
| **FASTA**  | 1 byte per base          | ~3'000 bases per page               |


## **Summary of monthly storage costs**

**Monthly storage costs for common scales of different genomic file formats**

| **Format** | **Size Estimate**      | **Scale**                        | **Total Size**         | **Estimated Monthly Cost**  |
|------------|------------------------|----------------------------------|------------------------|-----------------------------|
| **VCF**    | 136 bytes per variant  | 1'000'000 variants               | 129.7 MB               | **\$0.0181**                |
| **BED**    | 69 bytes per region    | 1'000'000 regions                | 65.8 MB                | **\$0.0092**                |
| **BAM**    | 0.5 bytes per base     | 30 million bases (human exome)   | 14.3 MB                | **\$0.0020**                |
| **FASTA**  | 1 byte per base        | 3.2 billion bases (human genome) | 3.2 GB                 | **\$0.4800**                |

Note: Cost = (Total Size in GB) × $0.15 per month




