# Reference Genome Resources 

---------

## General Genome Resources 

### UCSC Genome browser [link](https://genome.ucsc.edu)
> _Short description_: UCSC ((University of California Santa Cruz), useful bioinformatics tool enabling the visualisation of the genome (of different species) at any scale, completed by a aligned annotations "tracks". The annotions consist for example of gene predictions, mRNA, SNPs.

> _Let's give it a try:_ I could find datasets specifically for **SARS-CoV-2** (i.e. lung expression). Really interesting was to find the **immunophetopying** related to COVID-19 using _t-distributed stochastic neighbor embedding_ (t-SNE) algorithm. Give useful information about the frequency of each cell type. <http://genome.ucsc.edu/covid19.html>

### Human Genome Resources at NCBI [link](https://www.ncbi.nlm.nih.gov/genome/guide/human/)
#### ClinVar 
> _Short description:_ Link between genome variants and phenotype (namely disease) including the clinical relevance and supported by evidences (publications). 

> _Let's give it a try_: I searched for **non-hodgkin lymphoma** variants [link](https://www.ncbi.nlm.nih.gov/clinvar?term=hodgkin%20lymphoma&cmd=correctspelling). What I've found: 
* Location of the variation(s)
* Gene(s) involved as well as the protein changes 
* Clinical significance such as likely begign, pathogenic, uncertain significance and drug response 

> One example of one of the variation: **NRAS** (NM_002524.5(NRAS):c.38G>T (p.Gly13Val)). It's a SNV, leading to a missense. Here is the publication for non-hodgkin lymphoma, [Chang M, 2016](https://pubmed.ncbi.nlm.nih.gov/26619011/). 


### Ensembl [link](https://www.ensembl.org/index.html)
> _Short description:_ Contain vertebrate genomes, with gene identifications (annotation) and relationship to diseases. It offers varial bioinformatic tools such as BLAST/BLAT, Variant Effect Predictor (VEP), data slicer. 

> _Let's give it a try_: Basic local alignment search tool (BLAST) allows the analysis of local alignment. Different BLAST are available:
>
|                  | Analysed sequence | Compared sequence | Use(s)                      
| -----------------|:------------------|:------------------|:-----------------------------|
| BLASTp           |AA                 |AA                 |Protein function, identify common regions and related proteins|
| BLASTn           |Nucleotides        |nucleotides        |Map DNA, oligonucleotides or PCR product in a genome, identify repetitive elements|
| BLASTx           |Nucleotides -> AA. |AA                 |Find a coding gene in a genome, determine the corresponding DNA to a protein|

> Others: tBLASTn, tBLASTx 

### DECIPHER [link](https://decipher.sanger.ac.uk)
> _Short description:_ DECIPHER (DatabasE of genomiC varIation and Phenotype in Humans using Ensembl Resources) supports the interpretation of genomic variants and to relate them to a phenotype. Specifically used for clinical diagnosis. 

----------------------

## Cancer Related Genome Resources

### COSMIC [link](https://cancer.sanger.ac.uk/cosmic) 
> _Short description:_ COSMIC (Catalogue Of Somatic Mutations In Cancer) is the largest resources for genomic variants related to human cancer. It includes two types of data: 
* High precision data 
* Genome-wide screen data

> _Tools:_ Genome browser, Gene pages, Cancer Browser, Fusion genes, Drug resistance data, Hallmarks of cancer, COSMIC-3D, Cancer Gene Census, Cancer mutation census, Mutation Census, CONAN. CONAN (the copy number analysis tool) looks for loss of heterozygosity, homozygous deletions and amplifications accross the COSMIC dataset for example. 

### cBioPortal [link](https://www.cbioportal.org) 
> _Short description:_ Provides visualization, analysis and download of large-scale cancer genomics data sets. Datasets are organised by cancer type. 

> _Tools:_ OncoPrinter, MutationMapper

### GDC [link](https://gdc.cancer.gov)
> _Short description:_ The GDC T(Genomic Data Commons) unifies data repository for several NCI-sponsored cancer genome programs, including the cancer genome atlas (TCGA).

**And more:** Oncomine, UALCAN, KM Plotter, GEO. 



