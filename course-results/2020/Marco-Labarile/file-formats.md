# File Formats and Variant Annotations

Several kinds of file formats and annotation systems are used depending on the kind of information that is recorded and other requirements such as storage, further processing, etc.

## SAM/BAM/CRAM

SAM (Sequence Alignment/Map format) is a file format commonly used for storing sequence alignments. The bases are represented in text form and multiple fields add further information on the sequence(s). One asset of this format is that it is human-readable.

BAM files are essentially SAM files encoded in binary to enable more efficient use of storage space and quick access.

CRAM is a further development on the compression efficiency of BAM files. As such, it is also a binary encoded file format that stores read alignments relative to a reference.

1. https://www.internationalgenome.org/formats
2. https://academic.oup.com/bioinformatics/article/25/16/2078/204688
3. http://samtools.github.io/hts-specs/SAMv1.pdf
4. http://samtools.github.io/hts-specs/CRAMv3.pdf

## FASTA/FASTQ

FASTA is a relatively simple, clear-text format used to store sequences. It is easily human-readable, but contains less information than its extended form FASTQ or other formats like SAM. In particular, FASTA-sequences are not aligned to a reference. Entries contain a header line (starting with a ">") and corresponding sequence lines.

FASTQ is an extension on FASTA and includes read quality scores on top of the sequence data.

Compared to aligned sequence formats (SAM/BAM/CRAM), there seems to be little advantage to using FASTA or FASTQ besides maybe the simplicity and readability. For storing large amounts of basepairs with metadata, SAM/BAM/CRAM seem to be the best option.

5. https://en.wikipedia.org/wiki/FASTA_format
6. https://academic.oup.com/nar/article/38/6/1767/3112533

## VCF

VCF (Variant Call Format) is a file format used to store sequence variants with respect to a reference. VCF is a clear-text format that supports large amounts of metadata in addition to the variant data itself. The types of variants called can include basically any type of possible sequence transformation, such as insertions, duplications, deletions, etc. When the goal is the study and/or storage of genetic variants, VCF is the go-to file format.

6. https://www.internationalgenome.org/wiki/Analysis/variant-call-format

## Cost considerations

In addition to the raw storage costs, which is roughly just the price of the storage devices used to save the data on, some other factors contribute to the total cost:

* Backups and hardware redundancies to prevent data loss due to hardware malfunction
* Maintenance and upkeep of facilities that house the hardware, such as rent and energy costs.

Based on [2], which claims a ratio of 1 byte per basepair stored, storing 1000 human genomes in BAM format would take about 1000 * 3 * 10^9bp = 3 * 10^12 bytes or 3TBs of raw storage.
