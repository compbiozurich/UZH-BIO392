
## GATK

1. Raw Sequence and Reference Sequence are aligned --> Aligned BAM
2. Mark duplicates in the BAM file
3. Realign
4. Alanysis ready BAM sequence is obtained


## App.Terra.Bio

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


## Introduction to Genome Versions / Liftovers

### The Reference Genome

* First reference genome was obtained from multiple individuals using sanger sequencing
* New reference genomes become available due to more data (e.g. additional locations) being discovered that needs to be integrated into the reference genome

#### Questions

1. Name & Time of the lastest version for Human, Mouse and E. Coli
	* *Human: Dec 2013 - GRCh38/hg38*
	* *Mouse: Jun 2020 - GRCm39/mm39*
	* *E. Coli: 1997 - K-12 MG1655 (recently updated and annotated, but no "new" assembly)*
2. Name & Time of the first version for Human, Mouse and E Coli 
	* *Human: July 2003 - NCBI34/hg16*
	* *Mouse: Aug 2005 - NCBI35/mm7*
	* *E. Coli: 1997 - K-12 MG1655*
4. How many reference genomes were released in total for Human, Mouse, and E Coli
	* *Human 5 + Mouse 5 + E. Coli 1 = 11*

* Using old assemblies or migrating to new assemblies can cause significant problems

### USCS Genome Browser

* Graphic visualization tool for genomic data for many different species & annotations
* Liftover tool is offered on the website to transfer between different releases

#### Questions

1. Show gene TP53 in the genome broser
2. Where is this gene?
	* *chr17:7,668,421-7,687,490*
3. How many isoforms does it have?
	* *9*
4. How many exons does it have?
	* *11*
5. What's the size of its longest exon?
	* 
6. Find the three closest genes in upstream and downstream, respectively
	* *ATP1B2, WRAP53 & EFNB3*
7. Switch to hg19 and find TP53
8. What are the start and end positions
	* *chr17:7,571,720-7,590,868*
9. Switch to zebrafish, can you find TP53
	* *yes*
10. Switch to Fruitfly, can you find TP53? 
	* *no*


### Liftovers

* Used to convert data between different genome versions
* The best strategy is to re-align the original data to the target genome version.
	* Disadvantages: Availability of the data & Computational Workload
* More practical solution uses a map table
	* Disadvantages: Some information may be lost

#### Exercises

1. Down-lift: TP53 from hg38 to hg19
2. Up-lift: TP53 from hg19 to hg38
3. Cross-species-lift: TP53 from human to mouse
4. Multi-step-lift: TP53 from hg28 to hg18
5. Liftover multiple positions with a BED file
6. Lift a larger range and interpret the result
7. Limitations of the liftover
	* Often, not all records can be lifted over




