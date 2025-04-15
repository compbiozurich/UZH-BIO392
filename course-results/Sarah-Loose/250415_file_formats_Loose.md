# File formats

### Sources
[File Types](https://www.ga4gh.org/our-products/#{%22product%22:{%22related_work_streams%22:%22Large-Scale%20Genomics%20(LSG)%20Work%20Stream%22}}) </br>
[2] BIO694 Slides, FGCZ, May 2023  </br>
[CRAM 1](https://ena-docs.readthedocs.io/en/latest/retrieval/programmatic-access.html#cram-format#)  </br>
[CRAM 2](https://www.ga4gh.org/news_item/cram-compression-for-genomics/)  </br>
[BED](http://genome.cse.ucsc.edu/FAQ/FAQformat.html#format1)

In Human Genome Sequencing, two main approaches are **Whole Exome Sequencing** and **Whole Genome Sequencing**. The names can be understood intuitively. So it is clear, that whilst the first method is gene-focused, faster and cheaper, the latter method contains more extensive information and thus requires more sophisticated storage options.

When Sequencing data is retrieved, on each position there is a likelihood estimated to which base is located there. **FASTA** files contain the text-based result showing the assembled sequence based on maximum base likelihood in each position, but don´t include any metadata like about quality of reads. The **FASTQ** file, an extension of FASTA, contains these Quality Scores (Phred Scores) which can be later used for variant calling or other analyses. This is useful in the analysis pipeline to ensure quality at this step.

These Sequences can then be aligned and mapped to a reference. The mapping can be stored in mainly two different format types. 
A more outdated format is the **SAM** (Sequence alignment and map) file, a human-accessible text file that uses massive amount of storage.
SAM files have been mainly replaced by **BAM** (Binary alignment/ map) files, that uses compressed data with Indices. Here, in binary-encoded files, a single base can be described by only 2 bits per base. 
An even more efficient form of the BAM file is the **CRAM** file, uses reference-based compression compared to BAM data, so it only stores differences from the reference. Furthermore, it seperates additional data from the Sequencing file and compresses each data type most effficiently. Therefore BAM and CRAM file formats are often used for archival purposes and storing this alignment data.

As a next step, variants between the sequence data and the referenca can be identified by variant calling. The **Variant Call Format** (VCF) is a popular option. It is a plain text file, containing meta data, variant attributes like location or type of variants (SNPs, Indels, etc.). 
This can be used for a single sequence or many different samples. A shortcoming of this format would occur in the latter case. For any variant will have an entry for every sample,  therefore, if  rare variants occur, for every sample a line would be added stating no change, thus including redundant information.

Another useful file format are **Browser Extensible Data (BED)** Files, that can be uploaded to genome browsers like IGV to visualize read mapping, thus aiding in mapping quality control or variant annotation further down the analysis pipeline.

Since I am a Microbiologist, if I wanted to sequence for example the E. coli genome, I would obtain FASTQ files for my raw reads, use BAM file format to store my read mapping, store variants in VCF format and annotate my findings in BED file format. SAM file formats could be useful for momentary interaction with the data, but not for long-term storage.

Generally, one needs to find a balance between data compression and retaining information. For small, bacterial genomes like *E. coli´s* this would pose not so much of a challenge (~4.6 Mbp). However, if we look at human genomes (WGS ~3,200 Mbp, WES ~50 Mbp) CRAM format should definitly be preferred.
This concerns WGS more than WES, since in WES a minor fraction of the genome is actually used when only the coding regions are considered.


### Approximate Storage for 1 genome
|                                       | WGS    | WES   | *E. coli* | notes           |
| ------------------------------------- | ------ | ----- | --------- | --------------- |
| Fasta<br>(for 8-bit ASCII)            | 3,2 GB | 50 MB | 4.6 MB    | for 1 byte / bp |
| BAM<br>(30x read depth)               | x~100 GB| x~20 GB|           | same, with header etc.|
| SAM<br>(30x read depth)               |        |       |           |                 |
| VCF<br>depends on no. <br>of variants |        |       |           | varies with no. of variants and compression type (gizp)|
| BED                                   |        |       |           |                 |
|                                       |        |       |           |                 |


### Raw storage prices
- [Proton](https://proton.me/de/drive/pricing) 1 TB = ~15 CHF/month
- [AWS, Azure, Google, B2, Wasabi](https://www.starwindsoftware.com/blog/aws-vs-azure-vs-google-cloud-vs-backblaze-b2-vs-wasabi/) </br>
  Pricing for storage varies with following parameters, example hot tier storage:
  <img width="767" alt="grafik" src="https://github.com/user-attachments/assets/0f648ffc-8d4c-4e30-85ff-c80f479b7be0" />


### Associated costs with storage
[source](https://www.secoda.co/glossary/data-storage-cost-factors)
- Level of Data Security
- Used Storage Space (SSD, HDD)
- Tiers of data (eg. hot: easily accessible on high-performance SSDs, cold: archival, cheaper)
- back-ups


