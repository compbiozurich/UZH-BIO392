## Task: Exploring Genome Resources

👉 Many different places where sequences are stored.

* **UCSC Genome Browser**: 
   * most widely used general genome browser
   * costumization with BED files possible
   * lots of genome editions available
   * genomes from many species
* **NCBI**:
   * used to store reference genome data
   * lots of human variants are stored here
* **ENSEMBL**:
  * used as entry point for many genome data services and collections
  * REST API for data retrieval

* **Resources for genome variant data:**
    * NCBI:dbSNP: for human SNP data
    * NCBI:dbVAR: for human genomic structural variation data
    * NCBI:ClinVar: get info about human genomic variation related to human health
    * EMBL-EBI:EVA: get variation data for any species

* **COSMIC**: resource for cancer genomics data
* **CLINGEN**: interpreted genome variants with disease associations
* **Cancer Genome Anatomy Project**: NCI-founded resource for cancer genomic data

### Beyond a single resource: federation
* data sharing approaches: combine all the data from different resources
* ‼️ federated approach: connecting national genomic initiatives (original data stays on the local resoures): you don't get access to the data itself, but you get back information about the existance of a certain variant in a certain database
  * host data locally
  * analyze data remotely and collate results
* **Progenetix**:
    * focus on data aggregation and curation
    * most of the data is coming from genomic arrays
* **CURIES**: compact URIs 👉 used to identify resources (prefix + code, e.g. PMID:1234567)

