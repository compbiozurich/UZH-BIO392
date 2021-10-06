# Genome analysis tool kit (GATK)

## Somatic Mutect2 tutorial

### Overview

<img width="307" alt="Image1" src="https://user-images.githubusercontent.com/91133520/136158801-f3a505ab-49fe-4f3a-80fb-bdd47c0b5d7c.PNG">
*Source: https://app.terra.bio/#workspaces/bio392-2021/GATKTutorials-Somatic%20new/notebooks/launch/1-somatic-mutect2-tutorial.ipynb?mode=playground*

### Call somatic SNV & indels with Mutect2
* What are we doing: calling somatic short mutations on the tumor sample and matched normal using Mutect2, which creates
  * A raw unfiltered somatic callset restricted to the specified intervals list
  * A BAM containing reassembled alignments
  * Mutect stats file
* Why use a matched normal?
  * To exclude rare germline variation in the individal which is not captured by the germline resource and individual-specific artifacts
  * Germline population resource for identifying germline alleles
  * Panel of normals (PoN): fills the gap between matched normal and population resource, catches additional sites of noise in sequencing data, like mapping artifacts or other somewhat random but systematic artifacts of sequencing and data processing
* Panel of normals (PoN)
  * E.g. samples from the 1'000 Genomes Project
  * Should include technically similar samples that were sequenced on the same platform (but an unmatched PoN is better than no PoN at all)

### Filter for confident somatic calls
* Filter to identify which mutation candidates are likely to be real somatic mutations

#### Estimate cross-sample contamination 
* E.g. with *GetPileupSummaries*
* To summarize read support for a set number of known variant sites (e.g. with human population germline resource *gnomAD*)
* Command produces a six-column table with contig (chromosome), position (position on the chromosome), ref_count (count of reads in the reference), alt_count (count of reads that support the ALT allele in the germline resource), allele_frequency (given in germline resource), other_alt_count (count of reads that support all other alleles)
* Tool considers *homozygous-variant* sites in the sample where alternate allele frequency (AF) in the population resource ranges between 0.01 and 0.2
* *CalculateContamination* to get the fraction contamination, which is necessary downstream for filtering => be wary of calls with less than that number for the alternate allele fraction

#### Apply filters with *FilterMutectCalls*
* Purpose: uses the annotations within the callset and (if provided) the contamination table in filterung
* Produces a VCF callset and index; calls that are likely true positives get the PASS label in the FILTER field, and calls that are likely false positives are labeled with the reason(s= for filtering in the FILTER field of the VCF

### Review calls with IGV
* Purpose: to get a good somatic callset
* Necessary to compare callsets from different callers, manually reviewing passing and filtered calls and (if necessary) additional filtering
* Examine the BAMOUT since clean alignments will not necessarily reflect the calls
