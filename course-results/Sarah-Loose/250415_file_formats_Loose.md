# File formats

In Human Genome Sequencing, two main approaches are **Whole Exome Sequencing** and **Whole Genome Sequencing**. The names can be understood intuitively. So it is clear, that whilst the first method is gene-focused, faster and cheaper, the latter method contains more extensive information and thus requires more sophisticated storage options.

### FASTA
When Sequencing data is retrieved, on each position there is a likelihood estimated to which base is located there. **FASTA** files contain the text-based result showing the assembled sequence based on maximum base likelihood in each position, but don´t include any metadata like about quality of reads. The **FASTQ** file, an extension of FASTA, contains these Quality Scores (Phred Scores) which can be later used for variant calling or other analyses. This is useful in the analysis pipeline to ensure quality at this step. They are usually encoded in 8-bit ASCII, therefore one character (base) needs 1 byte storage.

### SAM and BAM
These Sequences can then be aligned and mapped to a reference. The mapping can be stored in mainly two different format types. 
A more outdated format is the [**SAM**](https://samtools.github.io/hts-specs/SAMv1.pdf) (Sequence alignment and map) file, a human-accessible text file (ASCII encoded) that uses massive amount of storage.
SAM files have been mainly replaced by **BAM** (Binary alignment/ map) files, that uses compressed data with Indices. Here, in binary-encoded files, a single base can be described by only 2 bits per base. However, these file types contain elements with variable lengths (CIGAR, Header, flags). A BAM file can be reduced in size compared to a SAM file up to ~50%. [The file can represent aligned sequences up to 128 Mb](https://support.illumina.com/help/BS_App_RNASeq_Alignment_OLH_1000000006112/Content/Source/Informatics/BAM-Format.htm) so file size can differ here.

### CRAM
An even more efficient form of the BAM file is the **CRAM** file, uses reference-based compression compared to BAM data, so it only stores differences from the reference. Furthermore, it seperates additional data from the Sequencing file and compresses each data type most effficiently. Therefore BAM and CRAM file formats are often used for archival purposes and storing this alignment data. [A CRAM is about half the size of a BAM file.](https://academic.oup.com/bioinformatics/article/38/6/1497/6499262)

### VCF
As a next step, variants between the sequence data and the referenca can be identified by variant calling. The **Variant Call Format** (VCF) is a popular option. It is a plain text file (ASCII), containing meta data, variant attributes like location or type of variants (SNPs, Indels, etc.). ['There are about 5 million mutations per person in the WGS VCF file, which is about 0.16% of the total 3 billion bp'](https://3billion.io/blog/big-data-among-big-data-genome-data), according to this resource.

This can be used for a single sequence or many different samples. A shortcoming of this format would occur in the latter case. For any variant will have an entry for every sample,  therefore, if  rare variants occur, for every sample a line would be added stating no change, thus including redundant information. VCF files are often compressed as .gzip.
If we assume so 150 bytes x 5.000.000 = 0.75 GB per genome and 750 GB per 1000 genomes.

Another useful file format are **Browser Extensible Data (BED)** Files, that can be uploaded to genome browsers like IGV to visualize read mapping, thus aiding in mapping quality control or variant annotation further down the analysis pipeline.

### Application
Since I am a Microbiologist, if I wanted to sequence for example the E. coli genome, I would obtain FASTQ files for my raw reads, use BAM file format to store my read mapping, store variants in VCF format and annotate my findings in BED file format. SAM file formats could be useful for momentary interaction with the data, but not for long-term storage.

Generally, one needs to find a balance between data compression and retaining information. For small, bacterial genomes like *E. coli´s* this would pose not so much of a challenge (~4.6 Mbp). However, if we look at human genomes (WGS ~3,200 Mbp, WES ~50 Mbp) CRAM format should definitly be preferred.
This concerns WGS more than WES, since in WES a minor fraction of the genome is actually used when only the coding regions are considered.

### Summary
|File type|	use| 	
|---------|-------|
|FASTA| Alignment|
|FASTQ| ALignment + QC|
|SAM|mapped reads, intermediate workflow, no permamnent storage|
|BAM|mapped reads, archival purpose|
|CRAM| archival purpose|
|VCF|annotation, visualization|


### Price estimate
[According to this](https://3billion.io/blog/big-data-among-big-data-genome-data)
|Type (Mean depth)|FASTQ	| BAM	| VCF |	SUM|
|-----------------|-------|-----|-----|----|
WES (100x)	      |5GB	  | 8GB	|0.1GB|13GB|
WGS (30x)	        |80GB	  |100GB|1GB  |180GB|

-> so 1000 WES genomes with 100x coverage need 13 TB, 1000 WGS with 30x coverage need 180 TB.

|Provider	|Service name	|Price	|Price per one WGS sample|
|--------|-------------|---------|----------------------|
|AWS	    |S3 Standard	|$0.025/GB	|$4.5               |  
|Google cloud	|Cloud storage|$0.023/GB|	$4.14           |      
|Microsoft Azure	|Premium	|$0.15/GB	|$27.0            |

-> so storing 1000 WGS genomes on AWS would cost around $4.5K per month.

### Furhter associated costs with storage
[source](https://www.secoda.co/glossary/data-storage-cost-factors)
- Level of Data Security
- Used Storage Space (SSD, HDD)
- Tiers of data (eg. hot: easily accessible on high-performance SSDs, cold: archival, cheaper)
- back-ups

### Further raw storage prices
- [Proton](https://proton.me/de/drive/pricing) 1 TB = ~15 CHF/month so 180 TB would be 2.7K
  
- [AWS, Azure, Google, B2, Wasabi](https://www.starwindsoftware.com/blog/aws-vs-azure-vs-google-cloud-vs-backblaze-b2-vs-wasabi/) </br>
  Pricing for storage varies with following parameters, example hot tier storages:</br>
  <img width="400" alt="grafik" src="https://github.com/user-attachments/assets/0f648ffc-8d4c-4e30-85ff-c80f479b7be0" />


### More Sources
[File Types](https://www.ga4gh.org/our-products/#{%22product%22:{%22related_work_streams%22:%22Large-Scale%20Genomics%20(LSG)%20Work%20Stream%22}}) </br>
BIO694 Slides, FGCZ, May 2023  </br>
[CRAM 1](https://ena-docs.readthedocs.io/en/latest/retrieval/programmatic-access.html#cram-format#)  </br>
[CRAM 2](https://www.ga4gh.org/news_item/cram-compression-for-genomics/)  </br>
[BED](http://genome.cse.ucsc.edu/FAQ/FAQformat.html#format1)


