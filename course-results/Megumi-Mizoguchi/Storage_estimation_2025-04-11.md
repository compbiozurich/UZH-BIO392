# Task: Estimate Storage Requirements for 1000 Genomes
**Author**: Megumi Mizoguchi  
**Date**: April 13, 2025  

## How much computer storage is required for 1000 Genomes?

This report explains how much storage is needed for sequencing data from 1000 human genomes and the role of different file formats used in genomics. I focus on five common formats: SAM, BAM, CRAM, VCF, and FASTA. These differ in size and purpose. For example, some are better for long-term storage, others are used to store only the differences between individuals.


## File Formats and Their Uses

### SAM (Sequence Alignment/Map)
- **Purpose**: Text-based format for storing aligned sequencing reads.
- **Usage**: Mainly used during analysis or debugging. It’s not practical for storage because the files are very large.
- **Size per genome**: ~150 GB

### BAM (Binary Alignment/Map)
- **Purpose**: A compressed, binary version of SAM that’s easier to store and access.
- **Usage**: Commonly used for archiving sequencing data because it’s smaller and can be indexed for quick searching.
- **Size per genome**: ~100 GB (for 30× whole-genome sequencing)

### CRAM (Compressed Reference-Aligned Map)
- **Purpose**: Like BAM, but even more compressed using a reference genome to save space.
- **Usage**: Useful when saving storage space is important, especially for long-term storage. A reference genome is needed to open the files.
- **Size per genome**: ~30–50 GB

### VCF (Variant Call Format)
- **Purpose**: Stores only the genetic differences (variants) compared to a reference genome.
- **Usage**: Used to summarize results after sequencing, especially for analysis and visualization. Much smaller than BAM or CRAM files.
- **Size per genome**: ~0.5–2 GB

### FASTA
- **Purpose**: Text format for the actual DNA (or protein) sequence.
- **Usage**: Stores the reference genome. This is the "standard" genome that other samples are compared to. The same reference file is shared across all individuals in a study.
- **Size**: ~3 GB (shared for all genomes)


## Storage and Cost Estimates
The human genome can be encoded with 2 bits per base, so the theoretical minimum size is ~715 MB per genome. However, real files are larger due to extra information and formatting.

In 2021, 1 petabyte (PB) of raw storage cost around 35,000 CHF. Storing 1000 genomes in BAM format (about 100 TB total) would cost roughly 50,000 CHF in hardware alone. Full infrastructure (backups, data centers, staff, etc.) can increase costs by 5–14 times, depending on setup.

| Format    | Size per Genome | 1000 Genomes  | Est. Hardware Cost     | Est. Full Infra Cost       |
|-----------|------------------|----------------|--------------------------|------------------------------|
| **SAM**   | ~150 GB           | ~150 TB        | CHF 50,000–70,000        | CHF 300,000–700,000          |
| **BAM**   | ~100 GB           | ~100 TB        | CHF 35,000–50,000        | CHF 200,000–500,000          |
| **CRAM**  | ~30–50 GB         | ~30–50 TB      | CHF 10,000–20,000        | CHF 100,000–250,000          |
| **VCF**   | ~0.5–2 GB         | ~0.5–2 TB      | CHF 500–2,000            | CHF 5,000–20,000             |
| **FASTA** | Shared (~3 GB)    | ~3–5 GB total  | CHF <500                 | CHF 2,000–5,000              |

Full infrastructure costs include redundant storage, cooling, power, IT support, and secure backup systems. The ranges are rounded to account for market fluctuations and setup differences (e.g., cloud vs. local storage).


## Summary
- **For archiving full sequencing data**: BAM or CRAM are commonly used.
- **For storing only genetic differences (variants)**: VCF is preferred.
- **For genome browser visualization**: VCF is often used together with other formats like BED (Browser Extensible Data).
- **For reference comparison**: FASTA is used as a shared resource.
