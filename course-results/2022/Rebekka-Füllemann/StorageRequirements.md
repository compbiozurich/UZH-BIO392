# Task: Estimate Storage Requirements for 1000 Genomes
## WGS: Whole Genome Sequencing
The genome is encoded by 4 bases: A, T, C, G. To encode the letters 2 bits per base are sufficient (00, 01, 10 ,11). Since the human genome consists of approximately 3 billion base pairs, the storage of 1000 genomes requires about **700GB**.

``` 3 billion base pairs * 2 bits per base * 1000 genomes / 8 bits per byte = 700 GB ```

## WES: Whole Exome Sequencing
In the human genome only about 1% are exons. Therefore the storage of 1000 Exomes requires about 1% of the storage for a whole genome (**7GB**).

```700 GB * 1% = 7 GB```

## File Formats

### SAM
SAM (Sequence Alignment Map) 􏰁les are human-readable text files


### BAM
BAM (Binary Alignment Map) 􏰁les are their binary (and compressed) equivalent

### VCF
Variant Call Format


### FASTA
(Unaligned sequences)
