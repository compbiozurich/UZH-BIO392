### GATK

1. Raw Sequence and Reference Sequence are aligned --> Aligned BAM
2. Mark duplicates in the BAM file
3. Realign
4. Alanysis ready BAM sequence is obtained


### App.Terra.Bio

**Setup** - Setup of the Virtual Environment + Installation & Google login of Integrative Genomics Viewer (IGV)

1.  Somatic Short Mutations on the HCC1143 Tumor Sample and matched normal are called using Mutect2 

This yields A raw unfiltered somatic calmest & a BAM containing reassembled alignments

2. The second step is to create a panel of normals (PoN) - A top of resource used in somatic variant analysis. They are made from "normal" (healthy) samples and their purpose is to capture recurrent technical artefacts in order to improve the results of the variant calling analysis. It should include technically similar samples that were sequenced on the same sequencing platform. 

The PoN is achieved by running mutect2 in tutor only mode n each normal BAM individually, creating a genomicsDB from these normal Mutect2 calls & combining the normal calls sing the function to create a somatic PoN.

3. The unfiltered calmest from step 1 now has to be filtered to determine which mutation candidates are most likely real somatic mutations

To achieve this, cross-sample mutation is estimated using two tools: `GetPileupSummaries` and `CalculateContamination`. `GetPileupSummaries`  tabulates read counts that support REF, AT and OTHER alleles for the specified sites in the resource. This produces a table with 6 columns: 
Contig (the Chromosome) **//** Position **//** Ref_Count **//** Alt_Count **//** Other_Alt_Count **//** Allele_Frequency
The Alt_Count column is the count of reads that support the ALT allele in the germline resource.
`CalculateContamination` can calculate contamination more accurately at sites where variant alleles are rare in the population. Sites where alternate allele frequency is high contain a lot of contamination, so these don't give much information. The results are given in a table with 3 columns:
Sample **//** Contamination **//** Error
In the end, the contamination + error values inform us of which allele fractions should be treated with scepticism. If the error is 0.02 and the allele fraction of a specific call is 0.015, it is likely that it is simply contamination

3. In this step the tool `FilterMutectCalls` is used to filter a small data vcd file. In the output VCF Call file, calls that are likely true positives get the **PASS** label, while others are labeled with the reason for filtering.

4. IGV

In IGV, the mapped reads can be seen in the 2_tumor_normal_m2.bam track. A single SNV (C>T) is highlighted in red.





