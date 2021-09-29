# Task: Estimate Storage Requirements for 1000 Genomes
## How much computer storage is require for 1000 Genomes?

The costs to store 1PB are ~35'000CHF.
If duplication, facilities, service etc. are also considered, the costs to store 1PB are ~500'000CHF.



### Whole-genome Sequencing costs & required storage
* SAM:1 genome requires ~125GB -> **125TB** for 1'000 genomes which costs **~62'500CHF**.
* BAM: ~50CHF/genome (as seen on the slides) = ~**50'000CHF** & ~**100TB** for 1'0000 genomes.
* VCF: ~**315GB** for 1'000 genomes which costs ~ **157.5CHF**
* FASTA: 1 genome requires ~3.31GB (GRCh38 from NCBI) -> 1'000 genomes require ~**3.31TB** which will cost ~**1'655CHF**

### Whole-exome sequencing costs & required storage (the exome is about 2% of the whole genome)
* SAM: 125TB * 0.02 = ~**2.5TB** & 62'500CHF * 0.02 = ~**1'250CHF**
* BAM: 50'000CHF * 0.02 = ~**250CHF** & 100TB * 0.02 = ~**2TB**
* VCF: 315GB * 0.02 = **6.3GB** & 157.5CHF * 0.02 = **3.15CHF**
* FASTA: 1'655CHF * 0.02 = ~**33.1CHF** & 3.31TB * 0.02 = ~**66.2GB**
