# Task: Estimate Storage Requirements for 1000 Genomes
 How much computer storage is required for 1000 Genomes? What are the associated costs?
 Please provide 1 page size estimates and reasoning for the use of the different file types (i.e. which would you use for storing called variants, which for full archival purposes, browser visualisation), for 3-5 formats. \
 • WES & WGS: Whole Exome Sequencing/Whole Genome Sequencing \
**Different file formats** \
   • SAM: Sequence Alignment/Map \
   • BAM: Binary Version of SAM \
   • VCF: Variant Call Format \
   • FASTA: Fast-All or originally Fast Alignment Search Tool – A \

## Storage Estimates

### WGS vs WES (Per Genome)
| Type | BAM      | VCF      | FASTQ      | Total (approx.) | Multiply by 1000 genomes: |
|------|----------|----------|------------|-----------------|---------------------------|
| WGS  | 100  GB  |   1 GB   |  80  GB    |     ~180 GB     |           ~180 TB         |
| WES  |   8  GB  | 0.1 GB   |  5   GB    |      ~13 GB     |           ~13 TB          |

## Cost factors
- Raw Storage Costs:
  -  I found a NAS(Network attached storage) with 200TB for 7300 euros. See link: <https://anynas.de/nas-systeme/asustor/10-bay/asustor-as7110t/230084/asustor-as7110t-10-bay-200tb-bundle-mit-10x-20tb-ironwolf-pro-st20000nt001>
  -  Google cloud (not recommended): 0.025 $ per GB per month in Zurich * 200'000 GB = **5000 $ for ~ 200 TB**  See link: <https://cloud.google.com/storage/pricing?utm_source=chatgpt.com&hl=de#europe>\
- Associated costs:
  - Backups, storing multiple copies, "redundant" formats
  - Access speed (cold vs. hot storage): hot = frequently accessed data, higher storage cost than cold/archival storage
  - Retrieval (egress), if on cloud: cost to download files from cloud, higher for cold storage, lower for hot storage
  - Indexing (Generating .bai (BAM index) or .tbi (VCF index) file)
  - Compute resources for analysis: align sequences, call variants, annotate data
  - Security, Access control: encryption and private access
    
## File format purposes
- VCF: storage of genome variants &rarr store variant results, as well as good archival use and display of annotated variants \
- SAM: text-based alignment &rarr store mapping information for sequences only temporarily, not used as a storage format as it is much more bigger than BAM, not - ideal for browser visualization \
- BAM:  Binary version of SAM, compressed &rarr for storage, archival purposes and browser visualization \
- FASTA:  storing and exchanging sequence data &rarr reference data storage, archival use and browser visualization of references \
- FASTQ:contains raw sequencing reads + quality stores of the nucleotides &rarr archival use, too raw for browsers \
 
## Sources:  
File sizes: <https://3billion.io/blog/big-data-among-big-data-genome-data> \
Costs: Niklas Krumm, Noah Hoffman, Practical Cost Analysis of Genomic Data in the Cloud, American Journal of Clinical Pathology, Volume 152, Issue Supplement_1, October 2019, Pages S2–S3, <https://doi.org/10.1093/ajcp/aqz112.004> \
Access tiers: Access tiers for blob data, <https://learn.microsoft.com/en-us/azure/storage/blobs/access-tiers-overview> \
Genomic Data Storage in Azure: Basic Compression for Mapped Sequencing Data <https://techcommunity.microsoft.com/blog/healthcareandlifesciencesblog/genomic-data-storage-in-azure-basic-compression-for-mapped-sequencing-data/3721670>
File Format purposes: BIO 390 Introduction to Bioinformatics: <https://compbiozurich.org/UZH-BIO390/>
SAM, BAM, CRAM, FASTA, and FASTQ Data Formats Explained: <https://www.nutrahacker.com/nutrahacker_university/en/whole-genome-sequencing-data-formats.php> \
Your Essential Guide to Different File Formats in Bioinformatics: <https://www.formbio.com/blog/your-essential-guide-different-file-formats-bioinformatics?>
