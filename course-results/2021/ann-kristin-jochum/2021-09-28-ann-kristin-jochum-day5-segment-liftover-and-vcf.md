# Segment_liftover and VCF

## Segment liftover: A Python tool to convert segments between genome assemblies (Gao et al.)

### Background
* Reference genomes change frequently due to error corrections and other updates
* This can result in changes of the previously defined coordinates of base pairs of interest, making comparative studies tricky
* There are bioinformatics tools to deal with this, but they mostly concern themselves with the conversion of single genome coordinates
* In this paper, a method called *segment_liftover* is presented which emphasizes the preservation of copy number variation (CNV) information which would otherwise be lost

### Introduction
* Two general methodologies for conversion between coordinates from different genome assemblies:
  * Re-align original sequence data to the target assembly (time-consuming)
  * Convert coordinates of genome data between assemblies by using a mapping file (side effect is minor information loss)
* **Tools for conversion**:
  * *liftOver* from the University of California, Santa Cruz (UCSC)
  * *CrossMap* from Zhao
  * *Remap* from NCBI
* **CNV data**: quantitative representation of a genomic range takes precedence over base-specific representation
* *segment_liftover*:
  * Performs integrity-preserving conversion of genomic segments data between genome assemblies
  * Functional addition No.1: Re-conversion by locus approximation when precise conversion doesn't work
  * Functional addition No.2: Can handle any number of files and can be integrated into data processing pipelines

### Methods
* *segment_liftover* can convert both probe files and segment files at the same time or in separate runs
* First, UCSC liftOver is used to convert the file, and if it fails then an approximate conversion ist done
* *segment_liftover* tool is implemented in Python and available for both Linux and OSX; it also requires the UCSC liftOver program and chain files

### Examples
* More than 99% of files could be converted with the tool, with the uncovenvertible regions mostly being telomeres, centromeres or similar locations
* When comparing different conversion stategies, it could be shown that the *segment_liftover* tool had a result that was very close to the one of the standard pipeline, meaning that less data is lost than in other converting strategies

### My thoughts
* Though I have no experience with working with sequence files, it seems to me that  *segment-liftover*  is an efficient and helpful tool to "update" large amounts of data when a new reference genome is published, with a minimal loss of information

## The Variant Call Format (VCF)

### General notes
* VCF is a text file format that contains meta-information lines (##), a header line (#) and data lines about a position in the genome and genotype information on samples for each position

### Meta-information
* Optional
* Information such as source, version, reference, file format, meanings of the keys...

### Columns
* 8 fixed, mandatory columns + 1 optional if genotype data is present
* CHROM = chromosome; identifier from the reference genome or an angle-bracketed ID string 
* POS = position; reference position, with the 1st base = position 1
* ID = identifier; varient identifiers if available, rs numbers for dbSNP variants
* REF = reference base(s); A, C, G, T, N from the reference genome
* ALT = alternate base(s); A, C, G, T, N, * (missing due to deletion) or . (no variant)
* QUAL = quality; Phred-scaled quality score for assertion made in ALT
* FILTER = filter status; PASS if position has passed all filters, otherwise reason for fail is given
* INFO = additional information; short key representing additional information (such as AA1 = ancestral allele or ADR = total read depth for each allele)
* (END = end reference position; normally not necessary, except when symbolic alleles are used)
* (FORMAT = genotype information; short key representing additional information (such as DP1 = read depth or ECA = expected alternate allele counts)
* DATA SETs

### Important points for understanding VCF
* **Allele**: representing single genetic haplotypes (A, T, ATC)
* **Genotype**: an assignment of alleles for each chromosome of a single named sample at a particular locus
* **VCF record**: a record holding all segregating alleles at a locus (as well as genotypes, if appropriate, for multiple individuals containing alleles at that locus
* **Tag naming conventions**:
  * "L" suffix = *likelihood* as log-likelihood in the sampling distribution (log10)
  * "P" suffix = *probability* as linear-scale probability in the posterior distribution
  * "Q" suffix = *quality* as log-complementary-phred-scale posterior probability
