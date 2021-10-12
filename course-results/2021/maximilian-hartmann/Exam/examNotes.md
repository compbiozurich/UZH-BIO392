# Overall Notes and Facts that might be important for the Exam

### Online Resources

|Online Resource or tool|Usage|
|---------------|-----|
|UCSC Genome Browser| General Genome Browser, many species, many default tracks, BED files. A graphical visualisation tool for genomic data. There are other similar tools|
|Human Genome Resources at NCBI| Genome reference data, Human variant collection (ClinVar, dbSNP, dbVAR, ...)|
|Ensamble|Many genome data services and collection, BioMart, REST API|
|Cosmic| Catalogue of somatic mutations in cancer|
|ClinVar (NCBI database)| Basis for genomic variants and interpretation of their relevance to disease. Search for gene, variants, disease or phenotypes|
|ClinGen|disease association of genes and variants for use in precision medicine and research (can variation in this gene cause disease, does a CNV result in disease, which changes cause disease ... ClinVar is reasource for ClinGen|
|arrayMap|reference resource for copy number variation data in cancer|
|ProGenetix|Cancer CNV information resource. It is based on _individual sample_ data |
|BLAST (Basic local alignment search tool)| algorithm used for comparing biological sequences (AA/DNA/RNA), find similar sequences (in words|
|INSDC (international nucleotide sequence database collaboration|BLAST for nucleic acid (DDBJ, ENA, NCIB)|
|Uniprot| BLAST for proteins (TrEMBL, Swiss-prot)|
 
 ### Facts
 ##### How big is the genome?

* 3 Billion Nucleotides (haplo)
* 0.8 GB
* longest chromosome: chr1
 * 247 million bp, (8% of the whole genome)
 * 3141 genes 
 * 991 pseudogenes

#### Data science tip:

* Avoid manual steps of data analysis
* Keep track of all steps (using scripts)
* Use data standards
* use control version system
* save the file somewhere as a back up
* keep track of the software installed
* Don't use black boxes! ==> Open sources only
* AWK is the choice for bioinformatics

#### Why UNIX

* We interpret DNA/proteins as text, UNIX is for text streams
* Data is big, Spreadsheet cannot handle them
* We need to keep track of our analysis for the sake of reproducibility ==> bash scipts
* ! Unix commands are case sensitive
* Solves the reproducible, scalability and opennes for data (text) streams, but extra software might be needed

#### fileformats

|from|to|
|----|--|
|FASTQ|FASTA|
|SAM|BED|

* fully closed: from A to B, Both included
* fully open: from A to B, both excluded
* half-open: from A to B, only A inlcuded, B exculded
* e.g. BED are format are 0 based half-open

* wiggle: continuos-value data. GC%, probability scores, transcriptom data

#### Files

* Files are defined by its bytes, not the filename extension
* GRCh = genome reference consortium

#### general:

* similarity: likeness or percentage of identity between 2 sequences. ==> quantifiable by calculating shared statistical significance of bases/AA
* Homology: evolutionary relationship (derived from common ancestor). So either they are or are not homologous. It implies similiarity and can be quantified.

* exhaustive search: enumerating all possible candidates for the solution and checking whether each provides a possible match
 * problematic: number of comparisons grow exponantially with database size
* heuristic solves problem in a faster more efficient way, but not necesserily optimal
 * BLAST!! 🙂
 
* local: find region(s) of highest similarity between two sequences regardless of the other lengths of sequences. (BLAST 🙂)
* global: considers the entire sequence, adding gaps where necessary

* scoring system: value itself is meaningless, but allows comparisment
 * unlike nucleotides, protein mutations do not all have the same weight in term of funcitonality (Ala --> Val ok, Ala --> Pro PROBLEM)
 * BLOSUM (**BLO**cks **SU**bstitution **M**atrix): used to score alignments between evolutionary divergent protein sequences. Blosusm 62 is standard

#### different BLAST

|BLAST type|function|
|----------|--------|
|BLASTn| nucleotide sequences against nucleotide sequence|
|BLASTp| Protein sequence against protein data|
|BLASTx|nucleotide sequence ato protein data|
|tBLASTn| search protein sequence to nucleotide data|
|tBLASTx|search translated nucleotides to translated nucleotide data|

#### Cancer classifications
| Classification system |usage|
|-----------------------|-|
|ICD-O3 _(international classification of disease for oncology 3rd edition)_|Coding for site (topography) and histology (morphology) of neoplasms. ➡️2 codes per cancer. No true hierarchy, difficult to remap but accepted by pathologists|
|NCIt _(neoplasm classification in the NCI thesaurus)_| individual code for site-specific occurances of "biological" diagnosis ➡️1 code per cancer. True hierarchy with allows logical queries. Term can have multiple occurances in diagnostic tree. Asignemnt of code to different trees allows soft aggregation)
|TNM _(Tumor Size, Lymph Node, Metastasis)_|most widely used in cancer staging system (not for lymphoma or leukemia). T1 - T4, N0 - N3, M0 - M1.|


##### Liftover
Converts data between different genome version. best strategy: realign the original data to the target genome version but computational workload + data availability might be problematic. ==> convert using a map table. Information will be lost

##### Genome analysis tool kit (GATK)
|Sequence| usage|
|--------|------|
|T | our Tumor sequence that we are interested in|
| N (match normal)| Normal cell from the same person that we get the tumor from. We see which variants are germline mutations and which are somatic, so, which are aquired by the tumor and which have been present all along|
| G general population| See all germline mutation|
|PON| Mix of a lot of normal data to reduce noise and ensure that there was no contamination|
 
 ... ?
