# Day 4 Notes

## Genomic File Formats

### General

* A single Base (TCGA) can be encoded using 2 bits (00, 01, 10, 11)
* Single genome without metadata or anything else (just Nucleotide Sequence) ~715MB
* On average (with backups & more) ~50CHF/Genome

### VCF (Variable Call File)

* Header of VCF File might have to be inspected manually to determine if the parser will be able to read the file.
* Stores results of a single or multiple interpretations of genome sequencing datasets in comparison to a reference genome
* Can store data from single or multiple experiments
* Since the same mutations are stored in a single line, VCF becomes very efficient when dealing with recurring alleles (instead of 10'000 lines, only one has to be written)


## Genome Editions

* Genome Liftover: Mapping data from one genome edition to another one

## Genome Size

* Storage of an entire Exome with 40x Coverage: Corresponds to 110'000'000 reads @ 75bp/read results in a 5.7GB BAM file. Since this file should be backed up at least once, that comes to a minimum of 11.4GB for a single Exome
* Storage of an entire genome with 38.4x Coverage: Correspons to 3'200'000'000 reads @ 36bp/read results in a 138GB BAM File --> 276GB with a single Backup
* With Amazon, the most expensive data storage rate is 0.023USD/Month. For a single whole genome + backup that comes to ~6USD/Month per genome. There are certainly much cheaper options available.

## Segment_Liftover

* Tool for the conversion of genome coordinates between different genome assemblies
* Since lots of data may be available on one genome editions but not a newer one, the so called "lift-over" of this data (alterations, Gene functions etc.) from one genome edition to another is a very essential process
* Can be used for both probe files and segment files
* Depends on the UCSC liftOver program and a chain file between the two genome assemblies (can be obtained from the USCS Genome Browser)
* There are certain genetic elements that can cause slight problems with the conversion. These include Telemores, Centromeres & other gene-sparse locations.
* 
