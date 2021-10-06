# GATK Mutect2 Tutorial

Tutorial on calling somatic short mutations for both single nucleotide and indels, using GATK4 Mutect2 and FilterMutectCalls. Data is based on a breast cancer cell line and its matched normal cell line derived from blood. Both cell lines are consented and known as HCC1143 and HCC1143_BL (blood normal), respectively and are 2x76 paired end whole exome sequences aligned to GRCh38.

## Workspace Environment
I am running this tutorial on a cloud computer on app.terra.bio.
First I needed to set all parameters accordingly for later computational work.
I then set up a directory to store files I will be working with.

## CALL SOMATIC SNV & INDELS WITH Mutect2
I started by calling somatic short mutations on the HCC1143 tumor sample and matched normal using Mutect2. This gave me the following output:
* A raw unfiltered somatic callset restricted to the specified intervals list
* A BAM containing reassembled alignments
* Mutect stats file named /home/jupyter/notebooks/sandbox/1_somatic_m2.vcf.gz.stats

I then proceeded to make a panel of normals (PoN), which plays a vital role that fills the gap between the matched normal and the population resource. Mutect2 uses the PoN to catch additional sites of nouse in sequencing data, like mapping artifacts or other somewhat random but systematic artifacts of sequencing and data processing.
(I didn't create one, since one was provided in the workspace already)

## Filtering for confident somatic calls
Now I proceeded to identify which mutation candidates are likely to be real somatic mutations, using filtering tools.
I ran the Tumor sample and Normal sample through the GetPileupSummaries tool.
I then estimated the contamination using the tool CalculateContamination.
After, I applied filters with FilterMutectCalls.

## Moving files around
I then copied the results of the analysis into the workspace bucket to then be able to load it into IGV.

## IGV
After loading the analysis results into IGV, I navigated to the TP53 locus at chr17:7,666,402-7,689,550. After zooming in farther, a C→T variant became clearly visible.

## Questions

* We see a C→T variant light up in red for the tumor but not the normal. What do you think is happening in 2_tumor_normal_m2.bam?
> Compared to the reference, the tumor cells present the C→T variant (location_ chr17:7.674.220), while the tumor does not. This is rather clear since all the tumor samples aligned reads show this variant, while the normal sample reads do not.

* What does the coverage tell you ?
> IGV displays the matching coverage tracks and informs about the number of reads that cover each base.

*  What are the three grouped tracks for the bamout?
> The new "reference", i.e. haplotype caller (HC), the normal and the tumor samples.

* What do the colors indicate?
> The four different haplotypes (HC = 151462549/ 1294269273/ 783029670/ 2025865096) from the new reference, from which two present the variant C>T. Each read is then aligned to the HC and the color shows which one specifically. Here, the red reads (from the HC = 151462549) mey mainly represent the normal tissue, while the green reads (from HC = 783029670) the tumor tissue. Two others are also displayed (blue and violet) but rarely present in our samples.

* What differentiates the pastel versus gray reads?
> Gray reads do not present any haplotype and are therefore aligned with the reference genome (in our case, hg38), while the pastel reads do.

* How do you feel about this somatic call?
> I find it very interesting. IGV is a great GUI for browsing such data. Regarding the variant C→T mentioned above, the clear difference between our data (normal vs tumor) gives me good confidence in the validity of the assumption.
