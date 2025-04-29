# Day V - File formats and their costs
#### Sandrin Hunkeler  (MSc. in Informatics)

___

### 1) Sequencing Types

#### 1.1) WES (Whole Exome Sequencing)
- Focuses on coding regions (1.5% of genome)
- Reduced resolution and data volume

#### 1.2) WGS (Whole Genome Sequencing)
- Covers the entire genome
- Higher resolution and data volume

___

### 2) Assumptions  
- 3 billion base pairs × 30 coverage = 90 billion bases  
- Read length = 100 bp  
- 900 million reads per WGS sample  

---

### 3) File Formats and Storage Size 

#### 3.1) [SAM](https://samtools.github.io/hts-specs/SAMv1.pdf) (Sequence Alignment/Map)  

- Description:  
  - Human-readable  
  - Stores reads with alignment info and metadata  
  - Encoded in ASCII
- Use Case:  
  - Debugging and inspection  
  - Not used for long time storage
- Calculations:  
  - 200–500 ASCII characters per read (headers, sequence id, quality, tags)  
  - WGS = 900 million reads × 300 bytes = 270 GB 
  - WES = 1.5% of WGS = 4 GB  
- 1000 Genome Size:  
  - WGS = 270 TB
  - WES = 4 TB

---

#### 3.2) [BAM](https://samtools.github.io/hts-specs/SAMv1.pdf ) (Binary Alignment/Map)  
 
- Description:  
  - Binary version of SAM  
  - Compresses SAM for sequence and metadata  
- Use Case:  
  - Storing mapped reads  
  - Fast queries, indexes
- Calculations:  
  - [Compression ratio ~5× SAM](https://docs.uppmax.uu.se/software/cram/#:~:text=The%20BAM%20format%20was%20a,suitable%20for%20long%2Dterm%20storage.)  
  - BAM = 0.2 * SAM
  - WGS = 0.2 * 270 TB = 54 GB  
  - WES = 0.2 * 4GB = 0.8 GB  
- 1000 Genome Size:  
  - WGS = 54 TB
  - WES = 0.8 TB

---

#### 3.3) [VCF](https://samtools.github.io/hts-specs/VCFv4.3.pdf ) (Variant Call Format)  
 
- Description:  
  - Stores variants only  
  - No raw read sequences
  - Encoded in ASCII, tab separated
  - Human-readable
- Use Case:
  - Analysis
  - Comparison
- Calculations:
  - [Human WGS has 4–5 million variants](https://www.nature.com/articles/nature15393) 
  - assuming 300 ASCII chars per variant = 300 bytes
  - 300 bytes * 4.5 million variants = 1.35 GB (uncompressed)
- 1000 Genome Size:  
  - 1.35 TB

---

#### 3.4) [FASTA](https://www.bioinformatics.nl/tools/crab_fasta.html)  
- Description:  
  - Stores reference genome sequence  
  - Plain text (A, T, C, G)
  - Encoded in ASCII (1 byte per char)
  - Human-readable
- Use Case:  
  - Reference alignment
- Calculations:  
  - 3 billion bases (single "read") × 1 byte = 3 GB
- 1000 Genomes:  
  - 3 TB

---

#### 3.5) [CRAM](https://samtools.github.io/hts-specs/CRAMv3.pdf) (Compressed Reference-based Format)  
  
- Description:  
  - Highly compressed, reference-based
  - Drops redundant data  
- Use Case:  
  - Long-term storage  
  - Storing reference based sequence info
- Calculations:
  - [Compression ratio 8–10× SAM](https://docs.uppmax.uu.se/software/cram/#:~:text=The%20BAM%20format%20was%20a,suitable%20for%20long%2Dterm%20storage.)  
  - WGS = 0.13 * SAM = 0.13 * 270 GB = 35 GB
  - WES = 0.13 * SAM  = 0.13 * 0.8 GB = 0.1 GB
- 1000 Genome Size:  
  - WGS = 35 TB
  - WES = 0.1 TB


#### 3.4) Summary

| Format | Description                      | WGS (1000 Genomes) | WES (1000 Genomes) |
|--------|----------------------------------|--------------------|--------------------|
| SAM    | Human-readable with metadata     | 270 TB             | 4 TB               |
| BAM    | Binary compressed SAM            | 54 TB              | 0.8 TB             |
| VCF    | Variant calls only (ASCII)       | 1.35 TB            | —                  |
| FASTA  | Reference sequence (ASCII)       | 3 TB               | —                  |
| CRAM   | Compressed, reference-based      | 35 TB              | 0.1 TB             |


---

### 4) Recommendations for Use

| Format | Primary Purpose             | Applied Use                          |
|--------|-----------------------------|--------------------------------------|
| SAM    | Raw reads                   | Debugging, intermediate steps        |
| BAM    | Compressed raw reads        | Genome browsers, archival storage    |
| VCF    | Variants to reference       | Browsing, visualization and analysis |
| FASTA  | Reference genome storage    | Alignment, genome browsers           |
| CRAM   | Reference-based compression | Archival storage                     |


### 5) Cost Assumptions (1000 Genomes)
- [$0.15 per GB on Azure](https://azure.microsoft.com/en-us/pricing/details/storage/blobs/)

| Format | Storage Cost per Month (WGS) |
|--------|------------------------------|
| SAM    | $40.5k                       | 
| BAM    | $8.1k                        | 
| VCF    | $202                         | 
| FASTA  | $450                         |
| CRAM   | $5.3k                        |

---

### 6) Additional costs
- Geo redundant duplication
- Hot/cold storage requirements
- Managed platforms
