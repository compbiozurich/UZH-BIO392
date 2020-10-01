# Genomic Variation Types 
Literature 


## **The landscape of somatic copy-number alteration across human cancers** (Beroukhim R. et al, 2010): 
This study investigated the copy number profile in several cancer types and identifies features of chromosomal deletion and amplification, i.e. location. Main results: higher prevalence of arm-level somatic copy-number alterations (SCNAs) < focal SCNAs. But identification of > 300 relevant sites of focal SCNAs. < 1/4 of the identified regions are associated with known targets in cancers. 

> _Methods_: Affymetrix 250K Sty I array, CN profile by [GLAD](https://www.bioconductor.org/packages/release/bioc/vignettes/GLAD/inst/doc/GLAD.pdf), changes of .0.1 copies were considered as SCNA. 

> _Limitations_: They used a pool of cancer types, i.e. that some were slightly represented (few samples). The analysis was only focused on the genomic level (except for MYC, MCL1 and BCL2L1). Altough this allows a good comprehension of the pathway invovled in the variants, the expression data are relevant since epigenetic processes might interfer in the observed variants -> functional studies. 


## **Copy number variations and cancer** (Adam Shlien and David Malkin, 2009), review:
Clinical impact of the CNVs. CNVS can alter the gene transcription (dosage, alteration of the regulatory regions). Three highlights: 
* Pathogenic CNVs often contain multiple gene.
* The effect of a pathogenic CNV is not limited to the gene(s) it contains.
* Pathogenic CNVs can have reciprocal deletions/duplications.
Cancer CNVs: 40% of the cancer-related genes are encountered or interrupter by a CNV. Single cancer CNV (as well as SNP) might lead to a minor increase in cancer risk (type-dependent) but combined together may definitely increase the risk. 200 cancer syndromes, mostly explained by mutations in the tumor suppressor genes, e.g. 

| Gene       | Cancer Syndrome |
:------------|:----------------
CDKN2A- p14ARF | Familial malignant melanoma 
CHEK2 | Familial breast cancer 
NF1 | Neurofibromatosis type 1
PTCH | Nevoid basal cell carcinoma syndrome 

Beside CNVs predisposing to cancer, there are the acquired copy number alterations (CNAs) in tumors. 

## **Copy Number and SNP Arrays in Clinical Diagnostics** (Schaaf C.P. et al, 2011), review:
Focus on diagnosis (e.g. prenatal diagnosis). Cytogenetic methods: 
* **Fluorescence _in situ_ hybridization (FISH)**: Use of fluorescently labeled DNA probes designed to bind to the complementary chromosomal region of interest. Not widely used. 
* **Comparative genomic hybridization (CGH)**: isolation and fragmentation of genomic DNA from a control and investigated samples -> different fluorescent probes for each -> both are pooled together -> competition to hybdridize chromosomes. So a region containing a variant will present more of the fluorescent probes og the sample of interest as well as amplified, more fluorescence in thie region.
* **Exon by exon copy number**: 4–6 oligonucleotides within or adjacent to each exon for one or more genes. It can be combined with CGH. 

Copy number and SNP arrays have been investigated to support diagnosis of miscellaneous diseases, namely Autism Spectrum Disorder (ASD), Schizophrenia, and other neuropsychiatric disorders. \
**Concept of causality**: When do we consider a CNV as cause of a disease ? Defined as probably pathogenic must invovled the following criteria: 
* Identical CNV inherited from an affected parent.
* Expanded or altered CNV inherited from a parent.
* Similar CNV in an affected relative.
* CNV overlapping a genomic imbalance defined by a high-resolution technology in a CNV database for patients with ID/DD, ASDs, or MCA. 
* The CNV overlapping genomic coordinates for a known genomic imbalance syndrome (i.e., previously published or well-recognized deletion or duplication syndrome). 
* CNV containing morbid MIM genes or the CNV being gene rich. 
But generally, a CNV is more probably pathogenic if it's one of the following variant: 
* A deletion.
* A homozygous deletion.
* An amplification. 
Think the whole as combination too! Interesting is also, that they mention the social implications behind the diagnosis (possible stigmatisation).




