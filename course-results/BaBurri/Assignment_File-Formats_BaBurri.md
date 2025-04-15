# **Assignment by Basil Burri**

### Tasks addressed in this assignment
-	Suitability evaluation of four different genomic file formats for storing called variants, archiving genomic data, 
and visualizing results in genome browsers.
- One page size estimates for four different genomic file formats.
- Cost estimates for storing common scales of four different genomic file formats.

### Chosen file formats
- VCF, BED, BAM, FASTA
- **SAM was not included as I already have chosen its binary version BAM!**

### Assumption for the estimates
- One A4 Word page holds 3'000 bytes plain text.
- Storage costs: $0.15 per GB per month on [Microsoft Azure](https://azure.microsoft.com/en-us/pricing/details/storage/blobs/)
- 1 GB = 1'000'000'000 bytes

### WES vs. WGS

**WES (Whole Exome Sequencing)**
- **Definition:** Whole Exome Sequencing (WES) focuses on sequencing the protein-coding regions (exome) of the genome. Although the exome makes up less than 2% of the genome, it contains about 85% of known disease-related variants. [(Reference)](https://emea.illumina.com/techniques/sequencing/dna-sequencing/targeted-resequencing/exome-sequencing.html)
-  ~30 million bases per genome
-  ~20'000 variants per genome [(Reference)](https://genomebiology.biomedcentral.com/articles/10.1186/gb-2011-12-9-227)

**WGS (Whole Genome Sequencing)**
- **Definition:** Whole Genome Sequencing (WGS) sequences the entire genome, including both coding and non-coding regions. [(Reference)](https://emea.illumina.com/techniques/sequencing/dna-sequencing/whole-genome-sequencing.html)
- ~3.2 billion bases per genome
- ~5 million variants per genome [(Reference)](https://pmc.ncbi.nlm.nih.gov/articles/PMC10823711/)

---

## **Evaluation of suitability** 

### **VCF (Variant Call Format)**

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


### **BED (Browser Extensible Data)**

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


### **BAM (Binary Alignment Map)**

**Overview**
|                   |                                                                                                           |
|-------------------|-----------------------------------------------------------------------------------------------------------|
| **Description**   | Binary format for storing aligned sequencing reads, including base calls, quality, and mapping details.   |
| **Best Use**      | Archival purposes                                                                                         |
| **Size**          | 0.5 bytes per base for compressed formats like CRAM. Size estimate was obtained by reading forums on [biostars.org](https://www.biostars.org/p/8901/#8903).                                                                          |

**Evaluation**

A page contains approximately 6'000 bases, with an estimated storage size of 0.5 bytes per base for compressed formats like CRAM. As a whole human exome contains about 30 million bp, a BAM file for the human exome would contain 5'000 pages. 
BAM is unsuitable for storing called variants directly, as it holds raw or aligned reads used to generate VCFs. 
It is best used in archiving for preserving full alignment data for re-analysis, such as new variant calling. 
For visualization, BAM is suitable for visualization of reads in browsers like IGV, but its size makes it less efficient 
for variant visualization compared to BED.


### **FASTA**

**Overview**
|                   |                                                                                                           |
|-------------------|-----------------------------------------------------------------------------------------------------------|
| **Description**   | Text format for storing nucleotide or protein sequences with metadata.                                    |
| **Best Use**      | Storing and archiving of sequences                                                                        |
| **Size**          | 1 byte per base. Size estimate was obtained by reading forums on [biostars.org](https://www.biostars.org/p/415475/).                                                                                                                     |

**Evaluation**

In a FASTA file, approximately 3'000 bases can fit per page, with an estimated storage size of 1 byte per base. 
FASTA is not suitable for storing variant data, as it only holds raw sequences without annotations. It is used as a format for reference genomes and raw or assembled sequences. While FASTA is most commonly used to store reference genomes like [GRCh38](https://ftp.ensembl.org/pub/release-113/fasta/homo_sapiens/dna/), it is also used to archive assembled contigs from sequencing experiments. In visualization, FASTA provides the reference sequence used in genome browsers, but it cannot display variant positions or annotations directly.

---

## **Summary of size estimates for 1'000 genomes**

**Total size estimates for 1'000 Genomes (WGS and WES) in different genomic file formats**

| **Format** | **Type** | **Variants/Reads/Bases per Genome** | **Size per Variant/Read/Base** | **Size per Genome** | **Total for 1'000 Genomes** |
|------------|----------|-------------------------------------|--------------------------------|---------------------|-----------------------------|
| **VCF**    | WGS      | 5M variants                         | 136 bytes                      | 680 MB              | 680 GB                      |
|            | WES      | 20k variants                        | 136 bytes                      | 2.72 MB             | 2.72 GB                     |
| **BED**    | WGS      | 5M regions                          | 69 bytes                       | 345 MB              | 345 GB                      |
|            | WES      | 20k regions                         | 69 bytes                       | 1.38 MB             | 1.38 GB                     |
| **BAM**    | WGS      | 3.2B bases                          | 0.5 bytes                      | 1.6 GB              | 1'600 GB                    |
|            | WES      | 30M bases                           | 0.5 bytes                      | 15 MB               | 15 GB                       |
| **FASTA**  | WGS      | 3.2B bases                          | 1 byte                         | 3.2 GB              | 3'200 GB                    |
|            | WES      | 30M bases                           | 1 byte                         | 30 MB               | 30 GB                       |

_Note:_ Size per Genome = Variants/Reads/Bases per Genome × Size per Variant/Read/Base  

_Note:_ Total for 1'000 Genomes = Size per Genome × 1'000

_Note:_ CRAM is a more compressed binary alternative to BAM. 0.5 bytes/base were used as a general estimate for both.

---

## **Summary of size estimates for one page**

**Page estimates for 1'000 Genomes (WGS and WES) in different genomic file formats**

| **Format** | **Size Estimate per Variant/Read/Base** | **Variants/Reads/Bases per Page** | **Pages per Genome** |
|------------|-----------------------------------------|-----------------------------------|----------------------|
| **VCF**    | 136 bytes per variant                   | ~22 variants per page             | WGS: 227'273         |
|            |                                         |                                   | WES: 909             |
| **BED**    | 69 bytes per region                     | ~43 regions per page              | WGS: 116'279         |
|            |                                         |                                   | WES: 465             |
| **BAM**    | 0.5 bytes per base                      | ~6'000 bases per page             | WGS: 533'333         |
|            |                                         |                                   | WES: 5'000           |
| **FASTA**  | 1 byte per base                         | ~3'000 bases per page             | WGS: 1'066'667       |
|            |                                         |                                   | WES: 10'000          |

_Note:_ Variants/Reads/Bases per Page = 3'000 bytes / Size Estimate per Variant/Read/Base  

_Note:_ Pages per Genome = Variants/Reads/Bases per Genome / Variants/Reads/Bases per Page

---

## **Summary of monthly storage costs**

**Monthly storage costs for 1'000 Genomes (WGS and WES) in different genomic file formats**

| **Format** | **Type** | **Total Size** | **Monthly Cost ($0.15/GB)** |
|------------|----------|----------------|-----------------------------|
| **VCF**    | WGS      | 680 GB         | $102.00                     |
|            | WES      | 2.72 GB        | $0.41                       |
| **BED**    | WGS      | 345 GB         | $51.75                      |
|            | WES      | 1.38 GB        | $0.21                       |
| **BAM**    | WGS      | 1'600 GB       | $240.00                     |
|            | WES      | 15 GB          | $2.25                       |
| **FASTA**  | WGS      | 3'200 GB       | $480.00                     |
|            | WES      | 30 GB          | $4.50                       |

_Note:_ Monthly Cost = Total Size in GB × $0.15
