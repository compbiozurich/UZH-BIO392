# File Format - Task 1
### BAM 
The BAM Format is a binary format for storing sequence data. The BAM format provides binary versions of most of the same data, and is designed to compress reasonably well compared to SAM.
WGS: 62 TB for 7.4x
WES: 5.4 TB for 65.7x

### CRAM
CRAM as the four following major objectives:
1. Significantly better lossless compression than BAM
2. Full compatibility with BAM
3. Effortless transition to CRAM from using BAM files
4. Support for controlled loss of BAM

Data in CRAM is stored either as bits or bytes. CRAM files are alignment files like BAM files. They represent a compressed version of the alignment. It optionally uses a genomic reference to describe differences between the aligned sequence fragments and the reference sequence, reducing storage costs. This format fits well the archival purpose.
CRAM is a format able to reduce the size of BAM files until approximatively 50% of the original size.
WGS: 31 TB for 7.4x
WES: 2.7 TB for 65.7x

### FASTA
The FASTA format correspond to a text file containing only the desired sequence DNA, RNA or protein. Since the format only has a plain text sequence it facilitates the assessment of the data. The FASTA format is a convenient format for queries in browsers for its simplicity. This format fits well in browser visualization.
Since FASTA uses 8 bits instead of 2 bits (because of ASCII format) per base we have the following calculation for WGS:
4 * 7.4 * 2504 * 715 MB = 53 TB for 7.4x
For WES:
715 * 4 * 0.01 *65.7 * 2504 = 4.7 TB for 65.7x

### Variance Call Format
The variant call format (VCF) is a generic format for storing DNA variations data together with rich annotations. VCF is usually stored in a compressed manner and can be indexed for fast data retrieval of variants from a range of positions on the reference genome. This format fits the goal to store called variants.
Since a line in VCF format looks like this:
chr20 14370 rs6054257 G A 29 PASS 0|0
It corresponds to roughly 45 bytes and since we have 88 million variant per genomes we can determine the size of a VCF file containing the 1000 genome project:
WEG: 10 TB
The WES has a mean of 12’500 variants which correspond to a size of
WES: 1.4 GB

Links:
https://medium.com/precision-medicine/how-big-is-the-human-genome-e90caa3409b0
https://www.ncbi.nlm.nih.gov/pmc/articles/PMC2493042/





