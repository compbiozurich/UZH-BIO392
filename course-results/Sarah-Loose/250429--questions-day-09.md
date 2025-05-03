# Questions BIO392 day 9

These questions are designed to test your understanding of the sequence analysis practical and the accompanying literature. 
Please change the name of this file to --questions-day-09.md, and upload it to your folder in the course GitHub. 
Please submit before 13:00 on 6th May.These questions will be graded. The most important thing is not that you get everything right, 
but that you show that you thought about the questions; so no copy/pasting!

## I had no access/ troubles with the files since I was ill that day, but I tried out with different resources and understood the workflow. I hope this is okay.

## Q1

What information do the CHROM, POS, REF, and ALT columns contain in a VCF file?

    CHROM: Which chromosome are we on? It is identified via the reference genome.
    POS: Which position contains a variant?
    REF: What is the nucleotide in the reference genome? A ‘.’ means there is no variant.
    ALT: What is the alternate allele of our sequence at this position?
[Example:](https://www.internationalgenome.org/wiki/Analysis/Variant%20Call%20Format/vcf-variant-call-format-version-40/)
<img width="1386" alt="grafik" src="https://github.com/user-attachments/assets/ad4bc3ee-499e-4c32-90ce-4eadc51618cb" />

In this case, the first entry is about a SNP on Chromosome 29, at position 14370 where an A occurs instead of a G (CHROM: 20, POS: 14370, REF: G, ALT: A), found in the reference, which passes the quality test and has an okay PHRED score of 29. The SNP listed below, was recognized with less certainty and therefore does not pass the quality test. We see that the first SNP was detected in 3 smaples (NS=3), with an average read depth of 14 and an allel frequency of 0.5. It can be found in the dbSNP [NCBI single nucleotide polymorphism database](https://www.ncbi.nlm.nih.gov/snp/) and the hapmap [Haplotype Map](https://www.genome.gov/10001688/international-hapmap-project).
Furthermore, one can see in the genotype info (GT), on which allels which variation can be found among the samples. 0 stands for the reference sequence, 1 for the first allele in ALT, 2 for the second allele in alt. In the first entry we see for the first sample no variant (0|0), the second is heterozygote for the A in this position (0|1) and the third is homozygote for this SNP, but it is unphased, so we don´t know wich parent provided which allele (1/1). This is indicated bythe seperator / but in this case not so important, since it is the same.


## Q2

Using these four columns, how could you determine whether a sequencing sample contains a variant?

    Check the ALT column and see which nucleotide is noted there.
    To double-check you compare it with the base in the REF column.
This is called a monomorphic reference, meaning it has no alternate allels.

Example: In the image I provided above from the IGV manual, you can see in the 4th entry where there is no variant recorded.

## Q3

After loading all the files into IGV, there should be four different kind of tracks. Briefly explain what type of information each track contains

### Alignment
 We have the tracks with the alignments of each patient. We see the different reads and their associated information when we click on them 
(read name, alignment start and map quality). At the top of each alignment we see a profile which could be the coverage of each base.
These are the patient1-3.bam files. Additionally we can see indicated with color if we have a mismatch or a variant, as shown in the [figure](https://doi.org/10.1038/nbt.1754) below.[^1]
A histogram on top of the alignment shows the coverage.
<img width="997" alt="grafik" src="https://github.com/user-attachments/assets/043f40d4-6817-4225-aa0d-847de076653a" />

### Annotation
We also have one track that represents the gene, with information on the source and the location on the chromosome that we are at. This would be the .gtf.gz file in our case.

### Transcript
Another one representing the transcript. This stems from the same .gtf.gz file. It shows us where for example exons, introns and coding regions are in our sequence.

### Variant
And the last one “merged_results.vcf” contains the variant information for each patient. Here we could compare patients, but as we learned in th last exercise, we have simulated data that is the same for all 3 patients.


[In this resource one can explore the IGV browser a bit](https://igv.org/doc/igvjs/)[^2].

## Q4

Based on the VEP output, which of the STR variants you identified do you expect to have the most impact? Why? 

I now used the [example from today´s reading for a run in VEP](https://www.ensembl.org/Homo_sapiens/Tools/VEP/Results?tl=iiVDQL32icpTlJsX-11008385) 
Chromosome: 5   GR3CH8 coordinates: 112791823   Ref: ctgctgctgctgctg	 STR variant: ctgctgctg

5	112791823	.	ctgctgctgctgctg	ctgctgctg

<img width="1224" alt="grafik" src="https://github.com/user-attachments/assets/94c77401-d505-4732-8917-c69645fa9dd9" />

This is an intronic variant in a [protein coding transcript](http://www.ensembl.org/info/genome/genebuild/biotypes.html), so we wouldn´t necessarily expect a big impact since it is non-coding, unless it contains some form of regulatory region. A frameshift mutation or missense mutation in a protein coding, exonic region would be way more severe.
The predicted gene impacted here is ENSG00000134982 in the VEP ontology, which stands for the APC regulator of WNT signaling pathway, APC being a [tumor supressor](https://medlineplus.gov/download/genetics/gene/apc.pdf). Here, we have a deletion of some repeats.

## Q5
What phenotype or disease do you expect this variant to be involved with? 
Lets assume we had a mutation that renders the tumor supressing APC protein unfunctional and therefore causing problems in the Wnt-signalling pathway. This increases the risk of developing colorectal cancer by increasing inflammation and facilitating epithelial neoplasm inititation in the colon. This is mainly thought to be a hereditary trait. [^3]



[^1]: Robinson, J., Thorvaldsdóttir, H., Winckler, W. et al. Integrative genomics viewer. Nat Biotechnol 29, 24–26 (2011). https://doi.org/10.1038/nbt.1754
[^2]: James T Robinson, Helga Thorvaldsdottir, Douglass Turner, Jill P Mesirov, igv.js: an embeddable JavaScript implementation of the Integrative Genomics Viewer (IGV), Bioinformatics, Volume 39, Issue 1, January 2023, btac830, https://doi.org/10.1093/bioinformatics/btac830 
[^3]: Agüera-González S, Burton OT, Vázquez-Chávez E, Cuche C, Herit F, Bouchet J, Lasserre R, Del Río-Iñiguez I, Di Bartolo V, Alcover A. Adenomatous Polyposis Coli Defines Treg Differentiation and Anti-inflammatory Function through Microtubule-Mediated NFAT Localization. Cell Rep. 2017 Oct 3;21(1):181-194. doi: 10.1016/j.celrep.2017.09.020. PMID: 28978472.
