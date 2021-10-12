## Workflow
1. Set the notebook up, get the files,start IGV, etc.
2. Call somatic SNV & indels with Mutect2
  * Get somatic short mutations on the HCC1143 tumor sample and matched normal -> The matched normal excludes rare germline variation that is not captured by the germline resource and individual-specific artifacts.
  * Make a panel of normals (PoN)
  -> unfiltered Mutect2 callset generated
3. Filter for confident somatic calls (want to find out, which mutations are likely real somatic mutations)
  * Estimate cross-sample contamination: Summarize read support for a set number of known variant sites and then estimate contamination
  * Filter using the annotations within the callset and (if provided) the contamination table to see if the calls are likely true positives or false positives
4. Review calls with IGV: To get a good somatic callset, we need to compare callsets form different callers, manually review passing and filter calls and (if necessary) filter additionally
  * Load results into IGV
  * Set up IGV
  * Navigate to the location of the genome where variants were called
5. Annotate mutations with Funcotator: another approach to filtering mutation calls by the significance of their functional impact.
  * Find missense mutations
  * Find insertions and deletions


## Questions
1. What is the value of using a matched normal control?
  * The matched normal excludes rare germline variation that is not captured by the germline resource and individual-specific artifacts.
2. We see a C->T variant light up in red for the tumor but not the normal. What do you think is happening in 2_tumor_normal_m2.bam?
  * I guess we have a real somatic mutation at this point.
4. What does the coverage tell you?
  * How many reads per nucleotide are available
5. What are the three grouped tracks for the bamout? What do the colors indicate? What differentiates the pastel versus gray reads?
  * The first track gives us the HC that were found in the general population. The second track gives us the HC found in the healthy cells of the patient. The third track gives us the HC found in the tumor cells of the patient. The different pastel colors indicate different haplotypes. The grey reads can not be assigned to any of the haplotypes, either because the reads are too short or because they have gaps.
6. How do you feel about this somatic call?
  * Since the coverage is pretty high, I think we can assume that it is indeed a somatic mutation.


## Glossary
PoN: fills a gap between the matched normal and the population resource. It is used to catch additional sites of noise in sequencing data, like mapping artifacts or other somewhat random but systematic artifacts of sequencing and data processing. The best is if the PoN is matched, but we would still prefer having an unmatched PoN than no PoN at all. This is because mapping artifacts and polymerase slippage errors occur pretty mch the same genomic loci for short read sequencing approaches.

alt_count: count of reads that support the ALT allele in the germline resource

allele_frequency: corresponds to that given in the germline resource

other_alt_count: counts of reads that support all other alleles

FILTER ID = PASS: calls are likely true positives

FILTER ID = FAIL: calls are likely false positives
