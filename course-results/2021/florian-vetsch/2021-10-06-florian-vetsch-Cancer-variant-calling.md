
Mutect2 uses the matched normal to additionally exclude rare germline variation not captured by the germline resource and individual-specific artifacts.

Mutect2 uses a germline population resource towards evidence of alleles being germline. The simplified sites-only gnomAD resource retaining allele-specific frequencies

A panel of normals (PoN) has a vital role that fills a gap between the matched normal and the population resource. Mutect2 uses the PoN to catch additional sites of noise in sequencing data, like mapping artifacts or other somewhat random but systematic artifacts of sequencing and data processing.

Ideally, the PoN should include technically similar samples that were sequenced on the same platform, e.g. HiSeqX, using the same chemistry and analyzed using the same reference genome and tool-chain

This is because mapping artifacts and polymerase slippage errors occur for pretty much the same genomic loci for short read sequencing approaches.

Now, we will use filtering tools to identify which mutation candidates are likely to be real somatic mutations.

We estimate cross-sample contamination with two tools GetPileupSummaries and CalculateContamination

Each command produces a six-column table as shown. The alt_count is the count of reads that support the ALT allele in the germline resource.

 The allele_frequency corresponds to that given in the germline resource. Counts for other_alt_count refer to reads that support all other alleles.
 
 This produces a VCF callset 9_somatic_oncefiltered.vcf.gz and index. Calls that are likely true positives get the PASS label in the FILTER field, and calls that are likely false positives are labeled with the reason(s) for filtering in the FILTER field of the VCF
 
 This step seemingly applies 20 filters, including contamination. However, if an annotation a filter relies on is absent, the tool skips the particular filtering. The filter will still appear in the header. For example, the duplicate_evidence filter requires a nonstandard annotation that our callset omits.
 
 
 
 ➤ We see a C→T variant light up in red for the tumor but not the normal. What do you think is happening in 2_tumor_normal_m2.bam?
 In the tumor sample a C is replaced by a T, we detected a SNV
