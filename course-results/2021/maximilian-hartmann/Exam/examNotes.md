# Overall Notes and Facts that might be important for the Exam

### Online Resources

|Online Resource or tool|Usage|
|---------------|-----|
|UCSC Genome Browser| General Genome Browser, many species, many default tracks, BED files|
|Human Genome Resources at NCBI| Genome reference data, Human variant collection (ClinVar, dbSNP, dbVAR, ...)|
|Ensamble|Many genome data services and collection, BioMart, REST API|
|Cosmic| Catalogue of somatic mutations in cancer|
|ClinVar (NCBI database)| Basis for curated variant|
|ClinGen|disease association|
|arrayMap|reference resource for copy number variation data in cancer|
|ProGenetix|Cancer CNV information resource|
|BLAST| algorithm used for comparing biological sequences (AA/DNA/RNA), find similar sequences|
|INSDC (international nucleotide sequence database collaboration|BLAST for nucleic acid (DDBJ, ENA, NCIB)|
|Uniprot| BLAST for proteins (TrEMBL, Swiss-prot)|
 
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
* AWK is the choice for bioinformatics

> Why UNIX

* We interpret DNA/proteins as text, UNIX is for text streams
* Data is big, Spreadsheet cannot handle them
* We need to keep track of our analysis for the sake of reproducibility ==> bash scipts
* ! Unix commands are case sensitive
* Solves the reproducible, scalability and opennes for data (text) streams, but extra software might be needed

> fileformats

|from|to|
|----|--|
|FASTQ|FASTA|
|SAM|BED|

* fully closed: from A to B, Both included
* fully open: from A to B, both excluded
* half-open: from A to B, only A inlcuded, B exculded
* e.g. BED are format are 0 based half-open

* wiggle: continuos-value data. GC%, probability scores, transcriptom data

> Files

* Files are defined by its bytes, not the filename extension
* GRCh = genome reference consortium

> general:

* similarity: likeness or percentage of identity between 2 sequences. ==> quantifiable by calculating shared statistical significance of bases/AA
* Homology: evolutionary relationship (derived from common ancestor). So either they are or are not homologous. It implies similiarity and can be quantified.

* exhaustive search: enumerating all possible candidates for the solution and checking whether each provides a possible match
 * problematic: number of comparisons grow exponantially with database size
* heuristic solves problem in a faster more efficient way, but not necesserily optimal
 * BLAST!! 🙂
 
* local: find region(s) of highest similarity between two sequences regardless of the other lengths of sequences. (BLAST 🙂)
* global: considers the entire sequence, adding gaps where necessary

## BREAK, MORE IS TO COME
