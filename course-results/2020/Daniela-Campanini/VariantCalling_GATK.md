### Questions Exercise
#### We see a C --> T variant light up in red for the tumor but not the normal. What do you think is happening in 2_tumor_normal_m2.bam?
#### What does the coverage tell you?
The 2_tumor_normal_m2.bam file contains all the tumor and normal reads for the genomic region chr17: 7'674'169-7'674'254. 
We can see that of all reads at the SNP position chr17: 7'674'220, 60% is a T and 40% a C. From the listing of tumor and normal reads, we can observe that all tumor reades for that nucleotide position shows a thymine and in all the normal sample a cytosine. 
It seems be, that a C --> T subtitution in this region is tipical of this tumor.

#### What are the three grouped tracks for the bamout? What do the colors indicate? What differentiates the pastel versus gray reads?
There is the HC (haplotype caller) with four reads. Each of this reads is artificial and contains a group identifier (so it correspond to four different haplotypes). Each of the four used HC is evidentied by a different color.
This reads group is followed by a group with all tumor reads and a therd group with all normal reads. The pastell colors stands for different haplotypes. The sample reads containing the specific group identifier like one of the HC, are colored with the corresponding color. The gray reads are those with non of the four haplotype markers.

---

### Abbreviations or other important/interesting things:
INDEL = INsertions or DELations genome modifications.<br>
SNV = Single Nucleotide Variant

### What is a normal sample? Why is it important?
A normal sample is a (a.g) DNA sample from normal, healthy cells of a (cancer) patient.<br>
They are important to compare the cancer genome to healthy genome of the same person. It is used to exclude rare germline variations which are not present in the germline reference. <br>
In this way also patients-specific artefacts (erronious detected variants correlated to cancer) can be reduced, because not meaningfull-variants can be selected out. This helps to find with more affidability the mutations, which really are involved in cancer development.

### What are the other control samples? Why are this important?
GERMLINE: It is a germline-allel reference sequence. It is used to select out the germline-specific allels so that somatic variants onl can be analysed.<br>
PON: Panel of normals. This is a population resource of normal variants. It can be that some variants in our cancer sample are 'normal', so not cancer causing mutations (or just often appearing sequencing-errors (?)), but not present in the patiant normal genome. So selecting out this variants, reduces miss-interpretation and relevance given to a specific mutation for a disease (=noise in sequencing data). 

### Which is a variant analysis workflow?
- Sequencing (a.g. DNA, RNA, protein) and prepare BAM files for disease, and healthy=normal samples from same patient (a.g. for cancer cells vs healthy cells)
- [Mutect2](https://gatk.broadinstitute.org/hc/en-us/articles/360037593851-Mutect2): prepare a somatic callset for disease and normal of the desiered intervall by comparing with reference genome, reference germline genome and panel of normal.
- [GetPileupSummaries](https://gatk.broadinstitute.org/hc/en-us/articles/360037591631-Pileup): prepare a SAMtool format file (Chromosome, coordinate, reference count --> how many alignments have the same nucleotide as in the reference, count from reads--alternative count --> how many alignments have the common alternative nucleotide, other alternative counts --> how many alignment have another/rare alternative nucleotide, allele frequency -- if large, more contamination in alt_count expected. If smale, we aspect much more REF_count) for each variant in the cancer and normal callset compared to a common variant germline reference.
- [CalculateContamination](https://gatk.broadinstitute.org/hc/en-us/articles/360037225192-CalculateContamination): It uses the SAMtool file to estimate on a probabilistic base the cross-contamination. For this it uses the REF_count, ALT_count, other_ALT_count and allele_frequency. It is calculated which fraction of reads is coming from cross-sample contamination. A paired analysis (cancer, normal) reduces the contamination estimate and the error. It is much more accurate. --> The contamination intervall gives the confidancy threshold for the alternate allele fraction od the step before.
- [FilterMutectCalls](https://gatk.broadinstitute.org/hc/en-us/articles/360037225412-FilterMutectCalls): This filter for variant calls which are probably truelly meaningfull for disease. (True positives) This calls are saved in a VCF file.

### For what is variant analysis important? 
Variant analysis are important to study and better understand disease development. The gained informations can help in disposition estimation of a patient to develope a certain disease.<br>
It also permits to study cancer evolution, which cells derives from where and from which. It permits to understand if different cancer masses are developed independently from each other or if they have the same progenitor cell.<br>
Hopefully it can in future help to find better and personalized treatments.

### What are problems/difficulties with variant analysis?
The precicion and affidability of sequencing techniques and alignments influence the credability and correctness of the sequences. It is so important to always consider the quality score of a nucleotide position to understand how relevant a variant at that position is in the variant analysis.

### IGV = Integrative Genomic Viewer
This is an Application on the computer containing the reference genome of several species. It can be selected which chromosome to see or which region. <br>
It is used to visualize genome ranges saved in BED format.
