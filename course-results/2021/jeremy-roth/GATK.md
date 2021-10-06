# Calling somatic short mutations using GATK4 Mutect2 and FilterMutectCalls

We are working on a HCC1143 tumor sample and firstly generate a raw unfiltered somatic callset over given intervals, that is a list of possible somatic variants in the sample, a BAM file containing reassemlbed alignments and a mutect stats file.

What is the value of using a matched normal control? A matched normal control is a sample of healthy tissue of the same individual to distinguish between somatic and germline variants. Mutect2 uses the matched normal control to exclude rare germline variants.

Panel of normals (PON): PONs are made from normal samples (healthy tissue believed to not carry somatic mutations) and are used to capture recurrent technical artifacts in order to improve the results of the variant calling analysis.

Next we filter our raw callset for high confidence somatic calls (such variants that are likely to be purely somatic). We use GetPileupSummaries and CalculateContamination to estimate cross-sample contamination. First, we run the GetPileupSummaries tool on the cancer and normal sample. This tool summarizes counts of reads that support reference, alternate and other alleles for given sites and can be used with CalculateContamination to filter for relevant variants.

We then use CalculateContamination on the previously generated data and discover that our tumor BAM file has a contamination score of ~0.0191 +/- 0.0022 and the matched estimate has a lower score of ~0.0120 +/- 0.00454. This threshold informs us to be wary of calls with less than that number for the alternate allele fraction, as these are more likely to be caused by contamination.

Using the previously generated contamination table as well as annotations in the callset, the FilterMutectCalls tool filters for relevant calls and labels them PASS or lists reasons for filtering them.

