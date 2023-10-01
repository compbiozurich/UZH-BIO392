#Genome Resources[^1] 
# Primary deposition databases
1) Cancer Genome Interpreter Cancer Biomarkers Database (CGI)
2) Clinical Interpretation of Variants in Cancer (CIViC)
3) Jackson Laboratory Clinical Knowledgebase (JAX-CKB)
4) MolecularMatch (MMatch)
5) OncoKB
6) Precision Medicine Knowledgebase (PMKB)

Interoperability and automated aggregation are required to make a comprehensive approach to cancer precision medicine tractable and to establish consensus across knowledgebases.
The Global Alliance for Genomics and Health (GA4GH) is as an international cooperative project to accelerate the development of approaches for responsible, voluntary and secure sharing of genomic and clinical data. 
The Variant Interpretation for Cancer Consortium (VICC) is a consortium of clinical variant interpretation experts addressing the challenges of representing and sharing curated interpretations across the cancer research community.

# Interpreted databases (e.g. variant annotations...)

A review of the constituent somatic knowledgebases of the VICC showed dramatic differences in the components of variant interpretations.
Variant interpretations from each of the knowledgebases were harmonized by mapping all data elements in each knowledgebase to established standards and ontologies describing genes, variants, diseases and drugs.
1) Genes were harmonized using the HGNC (Human Gene Nomenclature Committee) gene symbols.
2) Variants were harmonized through a combination of knowledgebase-specific rules, matching to the Catalog of Somatic Mutations in Cancer (COSMIC), and use of the ClinGen Allele Registry.
3) Diseases were harmonized using the European Bioinformatics Institute (EBI) Ontology Lookup Service (OLS) to retrieve Disease Ontology (DO) terms and identifiers.
4) Drugs were harmonized through queries to the Mychem.info API, PubChem and ChEMBL.

The meta-knowledgebase v.0.10 release contained 12,856 harmonized interpretations supported by 4,354 unique publications for an average of 2.95 interpretations per publication.
   
# Different genome resources and their primary use
1. **UCSC genome browser**: an online and downloadable genome browser hosted by the University of California, Santa Cruz (UCSC). It is an interactive website offering access to genome sequence data from a variety of vertebrate and invertebrate species and major model organisms, integrated with a large collection of aligned annotations. The UCSC site hosts a set of genome analysis tools like GUI interface for mining the information in the browser database, a FASTA format sequence alignment tool BLAT that is also useful for simply finding sequences in the massive sequence.

2. **ENSEMBL**[^5]: a genome browser for vertebrate genomes that supports research in comparative genomics, evolution, sequence variation and transcriptional regulation. Ensembl annotate genes, computes multiple alignments, predicts regulatory function and collects disease data. Ensembl tools include BLAST, BLAT, BioMart and the Variant Effect Predictor (VEP) for all supported species. It contains information on vertebrate genomes, including human, mouse, rat, zebrafish, panda, and takifugu.
3. **CLINGEN**: ClinGen collects phenotypic and clinical information on variants across the genome, develops consensus approaches to identifying their clinical relevance, and disseminates this information to researchers and clinicians. (It defines the clinical relevance of genes and variants for use in precision medicine and research.)
   
4. **NCBI**[^3]:
   - dbSNP (Includes single nucleotide variations, microsatellites, and small-scale insertions and deletions. dbSNP contains population-specific frequency and genotype data, experimental conditions, molecular context, and mapping information for both neutral variations and clinical mutations.)
   - dbVar (The dbVar database has been developed to archive information associated with large scale genomic variation, including large insertions, deletions, translocations and inversions. In addition to archiving variation discovery, dbVar also stores associations of defined variants with phenotype information.)
   - ClinVar (A resource to provide a public, tracked record of reported relationships between human variation and observed health status with supporting evidence.)
   - EMBL:
     >The European Molecular Biology Laboratory (EMBL) Nucleotide Sequence Database (http://www.ebi.ac.uk/embl/index.html ) is a comprehensive collection of primary nucleotide sequences maintained at the European Bioinformatics Institute (EBI). Data are received from genome sequencing centres, individual scientists and patent offices.[^4]
     
     <br> The EMBL-EBI is a hub for bioinformatics research and services, developing and maintaining a large number of scientific databases that are free of charge.
5. **COSMIC**(Catalog of Somatic Mutations in Cancer)[^2]: the world's largest and most comprehensive resource for exploring the impact of somatic mutations in human cancer. Data can be accessed via selection of a gene or cancer tissue type (phenotype), either using browse by features or the search box. The COSMIC database contains thousands of somatic mutations that are implicated in the development of cancer. The database collects information from two major sources: mutations in known cancer genes are collected from the literature and data for inclusion in the database is collected from whole genome resequencing studies of cancer samples undertaken by the Cancer Genome Project.

[^1]: https://www.ncbi.nlm.nih.gov/pmc/articles/PMC7127986/#Sec9
[^2]: https://cancer.sanger.ac.uk/cosmic
[^3]: https://www.ncbi.nlm.nih.gov/guide/all/
[^4]: https://www.ncbi.nlm.nih.gov/pmc/articles/PMC102461/
[^5]: https://www.ensembl.org/index.html
