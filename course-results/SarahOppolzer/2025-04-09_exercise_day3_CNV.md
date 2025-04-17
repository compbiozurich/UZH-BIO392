# Day 3 - exercise

- #### What is CNV/CNA?
  Copy number variations (CNVs) are variations in the number of copies of a DNA segment between different individuals genomes. They can be very short (at least 50 bp) or affect long stretches or DNA. However, there are different definitions and opinions for the lower limit in the literature. CNVs  come from structural chromosomal aberrations, in detail duplicatons or deletions. The regions may or may not contain gene(s). Healthy individuals also have very small CNVs, but in Cancer patients they are larger and of higher amplitude. THe phenotypic effects of CNV are very divers and can be adaptive traits, embryonic lethality or can lead to different diseases like autism, schizophrenia and Crohn's disease(see lecture 1 BIO 390, [NIH] (https://www.genome.gov/genetics-glossary/Copy-Number-Variation-CNV) and Zarrei *et. al.*).

- #### How will you describe or introduce progenetix (scale, data source, cancer types...)?
  Progenetix is an open resource database for ongogenomic profiles. It provides an overview of cancer mutation data and focuses on CNV/CNA for all types of human malignancies. It includes over 116'000 individual sample data cancer CNV profiles from 906 different cancer types. It includes reference datasats and standardized encodings. For some series, SNV data was added recently. Additionaly, progenetics offers ata mapping services, core clinical data and differeht identifier mappings.The majority of data comes from genomic arrays with ~50% overall (see lecture 1 BIO 390 and [progenetix] (https://progenetix.org).

- #### Describe NCIt, ICD-O, UBERON codes, and their relationships.
  * NCIt - National Cancer Institute Thesaurus: Is a widely recognized standard for biomedical coding and reference. It provides a clinical science-based ontology used in NCI semantic infrastructure and information systems. It includes terminology for clinical care, basic and translational research, administrative activities and public infromation (see [NIH] (https://www.cancer.gov/research/resources/resource/197).
  * ICD-O -  International Classification of Diseases for Oncology: Is a coding system, primarily used in tumor or cancer registries. It is used for coding the site (topography) and the histology of neoplasms (see [WHO] (https://www.who.int/standards/classifications/other-classifications/international-classification-of-diseases-for-oncology).
  * UBERON:  is an anatomy ontology for cross-species and classifies according to traditional anatomical criteria, closely aligned with developmental processes. It includes other taxon-specific anatomical ontologies and therefore allows the integration of phenotype, functional and expression data. The Terminology contains anatomical terms in NCIt, that are mapped to equvalent terms in meaning in UBERON. Therefore UBERON and NCIt are closely related. Lately, all existing ICD-O T codes have ben mapped to UBEROn terms, which also relates them closely. (see [UBERON terminology files] (https://evs.nci.nih.gov/ftp1/UBERON/About.html) and Huang *et. al.*)

- #### What are CNV segmentations and CNV frequencies, and how to use them?
   * CNV frequencies are the percentages of samples in a population that have CNVs in genomic regions. With the CNV frequencies, the distribution of CNVs across different populations can be analyzed and patterns of variation and maybe associations with phenotypic traits can identified (see Ionita-Laza *et. al.*).
   * CNV segmentations: CNV segments can be defined as partial regions of a CNV and they enable   comparisons of CNVs between populations of interest. The CNV segments can be genotyped and the genotype frequency can be calculated. Application of CNV segment analysis has contributed to the identification of multiple regions and genes that may play roles in diseases, body traits, and breed differentiation (see Zhou *et. al.*).

- #### What are APIs and how to use APIs in progenetix?
  “Databases can be accessed through Application Programming Interfaces - APIs. They are a set of routines, protocols, and tools that
  specifies how software components interact, to exchange data and processing capabilities. Web APIs provide a machine readable response
  to queries over HTTP. Bioinformatic applications frequently make use of web APIs for data retrieval or genome browser APIs for data display"
  (see lecture 1 BIO 390)
  In Progenetix, some different APIs are implemented to facilitate access to the database. 

- #### How does progenetix visualize CNA profiles?
  When using Progenetix to, for example, look at one specific cancer type's CNVs, you find Histograms, showing the frequencies of Copy Number Gains and Copy Number Losses for the 22 autosomes.
  
-  #### What do you think should be improved in progenetix?
  * Maybe from include more data on rare type cancers, the research on those diseases would benefit. However, since those are rare, I assume there is not that much data accessible. 
  
full text article references:
Zarrei, M., MacDonald, J., Merico, D. et al. A copy number variation map of the human genome. Nat Rev Genet 16, 172–183 (2015). https://doi.org/10.1038/nrg3871
Qingyao Huang, Paula Carrio-Cordo, Bo Gao, Rahel Paloots, Michael Baudis, The Progenetix oncogenomic resource in 2021, Database, Volume 2021, 2021, baab043, https://doi.org/10.1093/database/baab043
Ionita-Laza I, Laird NM, Raby BA, Weiss ST, Lange C. On the frequency of copy number variants. Bioinformatics. 2008 Oct 15;24(20):2350-5. doi: 10.1093/bioinformatics/btn421. Epub 2008 Aug 8. PMID: 18689430; PMCID: PMC2562008.
Zhou, Y., Bickhart, D.M., Liu, G.E. (2018). Statistical Detection of Genome Differences Based on CNV Segments. In: Bickhart, D. (eds) Copy Number Variants. Methods in Molecular Biology, vol 1833. Humana Press, New York, NY. https://doi.org/10.1007/978-1-4939-8666-8_3
