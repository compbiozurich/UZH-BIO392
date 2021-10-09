# Overall Notes and Facts that might be important for the Exam

### Online Resources

|Online Resource|Usage|
|---------------|-----|
|UCSC Genome Browser| General Genome Browser, many species, many default tracks, BED files|
|Human Genome Resources at NCBI| Genome reference data, Human variant collection (ClinVar, dbSNP, dbVAR, ...)|
|Ensamble|Many genome data services and collection, BioMart, REST API|
|Cosmic| Catalogue of somatic mutations in cancer|
|ClinVar (NCBI database)| Basis for curated variant|
|ClinGen|disease association|
|arrayMap|reference resource for copy number variation data in cancer|
|ProGenetix|Cancer CNV information resource|
 ==> more/updates are coming
 
 ### Facts
 > How big is the genome?

* 3 Billion Nucleotides (haplo)
* 0.8 GB

> Data science tip:

* Avoid manual steps of data analysis
* Keep track of all steps (using scripts)
* Use data standards
* use control version system
* save the file somewhere as a back up
* keep track of the software installed
* Don't use black boxes! ==> Open sources only

> Why UNIX

* We interpret DNA/proteins as text, UNIX is for text streams
* Data is big, Spreadsheet cannot handle them
* We need to keep track of our analysis for the sake of reproducibility ==> bash scipts
* ! Unix commands are case sensitive
* Solves the reproducible, scalability and opennes for data (text) streams, but extra software might be needed

> Files

* Files are defined by its bytes, not the filename extension
* GRCh = genome reference consortium
