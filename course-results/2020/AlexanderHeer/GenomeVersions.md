## Intorduction to Genome Versions

### The Reference Genome
* First human genome: 2003 (originally planed for 2000)
* Resulted from the Human Genome Project
* Led to many new studie, specially inn medicine
* Sanger sequencing, multiple individuals
* Maintained by the Genome Reference Consortium
* Humans: around 20'000 genes, way less than expected
  * More simple species with more genes than us
* First assembly most difficult, affterwards eser due to prior knowledge
* Latest genome versions:
  * Human: GRCh38.p13
  * Mouse: GRCm39
  * E Coli: ME8067
  * All in the NCBI Database
  
* Before 2013: human genomic data based on older versions
  * cannot only talk about gene or region but also need to adress the context
  * Often not very obvious in many papers. 
  
## Introduction to the UCSC Genome Browser
* Most commonly used genome browser wen we have a gene that we want to know more about
* Hosted by the University of California, Santa Cruz
* graphical visualization tool for genomic data 
  * many tools with overlaping functions
* broad collection of species and annotations
* large suite of tools

When sequencing, knowing the expected size of a region we are looking for is a very common preliminary. If we know this, we don't have to look at anything that is larger than that

## Introduction to Genome Liftover

* Convert data between different genome versions
* From USCS
* similar tools: NCBI Remap, CrossMap
* Best strategy: re-align original data to the target genome vesion
  * problem: availability of the data and computational workload
 * Practical solution: convert using a map table
  * Problem: Lost information
* When converting a genomic segment:tools will break segment into smaller parts if segment is not continuous in the new assembly
  * But: when qunatitative reperesentation of a genomic range takes precedence over base-specific representation (e.g. copy number analyses), the integrity of a single segment needs to be kept 
* tools designed for single file processing 
  * offer nothing to facilitate batch processing &#8594; often needed to deal with hundreds of files at a time

### *segment_liftover**

* Python program 
* Convert segments between genome assemblies without breaking them apart
* Partially based on re-conversion by locus approximation
  * in instances where a precise conversion of genomic positions fails
* Key features
  * converts continuous segments
  * performs approximate conversion when direct conversion fails
  * batch processing of any number of files
  * automatic folder traversal and fie discovery
  * detailed logs
  * resuming from interruption
  * accept both segment (start &#8594; end) and probe (single position) data 
* Depends on UCSC Liftover program
* free for non-commerical use 
 * stand-alone command line tool 
 * can convert assemblies of any species, even between species
 * runs locally and does not require network access

More on how to run it [here](https://github.com/baudisgroup/segment-liftover)




