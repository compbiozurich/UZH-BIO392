# Exploration of variant annotation formats

## Which "genomic" variant formats exist & what are their use cases?
* ISCN (**I**nternational **S**ystem for Human **C**ytogenetic **N**omenclature)
> ISCN is a book about the standard nomenclature thaat describes any chromosomal abberations. The genomic rearrangement are identified by techniques liek karyotyping, FISH, SKY, genomic microarray, various region specific assay and DNA sequencing. The nomeclature is used for molecular cytogenetics.
* HGVS (**H**uman **G**enome **V**ariation **S**ociety)
> This society provides an overview about several [databases](https://www.hgvs.org/content/databases-tools) for various variations/mutations. The website is a good starting point for gene variation research.  
> HGVS offers also a [Sequence Variant Nomenclature](https://varnomen.hgvs.org/). The nomenclature gives an overview over the sequence variant description for human DNA, RNA, protein, etc. Be aware of the reference that the variant relates to. Such a standardized description of variants makes the international cooperation easier.
* VCF (**V**ariant **C**all **F**ormat)
> VCF is a file format and the standard for human genomic variant storage/representation. Variants such as insertions/deletions, single nucleotide, copy number and structural variants. It can store the results of a single or multiple interpretations of genome sequencing datasets. The variations are always in comparison to a reference genome. The VCF is good for short or common and not rare or structure variants.
* GA4GH Variation Representation Specification 
> The **G**lobal **A**lliance **for** **G**enomics and **H**ealth developed a Variant Representation Specification (VRS) to faciliate sharing of genetic information and improve international collaboration. The Specification covers many classed of genetic variations. VRS uses a terminology and information model, machine readable schema (JSON Schema), conventions that promore reliable data sharing, globally unique identifiers and a Python implementation.   

## Genomic coordinate systems
* [0 or 1-based](http://genome.ucsc.edu/blog/the-ucsc-genome-browser-coordinate-counting-systems/)
> There are two possible ways to count: either you start with one (**1-based**) or with zero (**0-based**). Additional to the start, you can also choose from three interval types: **fully-closed** (start and end included), **fully-open** (start and end excluded) and **half-open** (start included and end excluded). UCSC Genome Browser web interface uses 1-based, fully-closed (= common counting convention). The calculation of the range needs an extra step (compared with "interbase"): size = end - start (+ 1). 
* "interbase"
> The interbase coordinate system is the same as 0-based, half-open. This is used in UCSC Genome Browser tables, BAM and BED files. With the interbase coordinate system, you have the ability to present features that occur between nucleotides and the math to calculate the range of basepairs (size = end - start).

-------------------------------------------------------------------------------------------------

# Exploration of different file formats

## Which genomic file formats exist & what are their use cases?
*[This page](https://genome.ucsc.edu/FAQ/FAQformat.html) give a good overview about various data file formats*

* SAM (**S**equence **A**lignment **M**ap)
> SAM is a generic format for storing large nucelotide sequence alignments. It is flexible, simple (human readable) and compact. Many NGS and analysis tools work with SAM. The sequence in a SAM file is aligned to the reference genome. This leads to the 11 mandatory fields:  
1)  QNAME | Query NAME of the read/read pair  
2)  FLAG  | Bitwise FLAG  
3)  RNAME | Reference sequence NAME  
4)  POS   | 1-Based leftmost POSition of clipped alignment  
5)  NAPQ  | MAPping Quality (Phred-scaled)  
6)  CIGAR | Extended CIGAR string  
7)  MRNM  | Mate Reference NaMe (= if same as RNAME)  
8)  MPOS  | 1-Based leftmost Mate POSition  
9)  ISIZE | Inferred Insert SIZE  
10) SEQ   | Query SEQuence on the same strand as the referenc  
11) QUAL  | Query QUALity  
* BAM (**B**inary **A**lignment **M**ap)
> BAM files are binary representation of the SAM format i.e. a compact and indexable representation of nucleotide sequence alignments but no longer human readable. BAM contains the same information as the SAM file. Many NGS and analysis tools work with BAM.   
* CRAM
> CRAM files are similar to BAM files but give a compressed repesentation of the alignment. This compression is driven by the reference the sequence data is aligned to. This file format was designed to reduce the disk foot print of alignment data. CRAM files are smaller than BAM files by taking advantage of an additional external "refernce sequence* file. This reference file is needed to compress and decompress the read information. 
* VCF (**V**ariant **C**all **F**ormat)
> VCF is a flexible and extendable file format and the standard for human genomic variant storage/representation. The format has a tab delimiter.  It can store the results of a single or multiple interpretations of genome sequencing datasets. The variations are always in comparison to a reference genome. The information is shown in eight columns:  
1) CHROM | chromosome  
2) POS  | 1-based start of variant  
3) ID | unique identifier of vaiant  
4) REF   | reference allele  
5) ALT  | , separated list of alternate non-reference alleles  
6) QUAL | phred-scaled quality score  
7) FILTER  | site filztering information  
8) INFO  | ; separated list of additional annotation  
* FASTA
> FASTA is a text format for linear annotation of single-letter nucleotides or amino acid codes. The format is readable and not optimized for size. FASTA starts always with a definition line. After '>' follows the identifier of the sequence (mostly with a unique SeqID) and a (optimal) description. There should be no space between '>' and the forst letter of identifier. The nucleotides are either on one line or in a column of 80nt. The reference genome is stored in a FASTA file.  
The FASTQ is a FASTA file inculsive quality data. A FASTQ file contains 4 lines (@ + SeqID, sequence, '+', quality score). 
* MPEG-G
> The **M**oving **P**icture **E**xperts **G**roup produced a open standard to compress, store, transmit and process sequencing data (MPEG-G). MPEG-G solves the problem of efficient and cost-effective handling of genomic data. It provides functionalities such as native support for selective access, data protection mechanisms, flexible storage and streaming capabilities. This makes possible a real-time streaming of data from a sequencing machine to remote analysis centers during the sequencing and alignment processes. The MPEG-G standard is composed by five parts: Transport and Storage of genomic information, Coding of genomic information, Metadata and APIs, Reference Software and Conformance. 

--------------------------------------------------------------------------------------------------

# Estimate Storage Requirements for 1000 Genomes

## How much computer storage is required for 1000 Genomes?
* [WES & WGS](https://www.strand-ngs.com/support/ngs-data-storage-requirements)
> **W**hole **E**xome **S**equence contains just the exonic regions which comprise 1-2% of the whole genome. Therefore, WES should take up less storage space.  A **W**hole **G**enome **S**equencing can be rounded off to about 150GB and a WES about 8GB (strand NGS size). For 1000 genomes, the storage of **150TB** (WGS) and **8TB** (WES).
* Different file formats
  * BAM
  > We learned in the lecture of Day 4 that a 30x BAM file can store a genome in 100GB. Therefore, we need for 1000 genomes **100TB** of BAM file format. BAM is the compromised format of SAM and therefore no more human readable.
  * SAM
  > SAM file format stores genome sequence aligned at the reference genome.  
  > [1.9GB BAM file == 7.4GB SAM file](https://www.uppmax.uu.se/support/user-guides/using-cram-to-compress-bam-files/) -> 100'000GB / 1.9GB x 7.4GB = 389473GB == **389.473TB** of a SAM file.
  * CRAM
  > CRAM is even more compromised compared to BAM. A 1.9GB BAM file (7.4GB SAM file) converted into a CRAM (lossless) file about [1.4GB](https://www.uppmax.uu.se/support/user-guides/using-cram-to-compress-bam-files/). You need for 1000 genomes only (100'000GB / 1.9GB x 0.8GB = 42105GB =) around **42TB**.      
  * VCF
  > A VCF file stores the variants of a genome. A genome has about [3 million variants](https://medium.com/precision-medicine/how-big-is-the-human-genome-e90caa3409b0). Each VCF file line uses 45 bytes. For 3 million variants, we need around 125MG. 1000 genomes requires **125GB** of a VCF file.
  * FASTA
  > A FASTA file stores the raw data (without 'any' information). When you download the [Reference Genome Sequence (GRCh38)](https://www.ncbi.nlm.nih.gov/projects/genome/guide/human/), you get a document about 920MB. 1000 x 920MB = **920GB** of a FASTA file is necessary to store 1000 (reference) genomes. 
* Associated costs
  * Cost factors
  > The costs to sequence a genome dropped since the start in 2001. A massive drop occured in the year 2007 when Illumnia appeared on the market. Sequencing a whole human genome costs nowadays around 1000$.
