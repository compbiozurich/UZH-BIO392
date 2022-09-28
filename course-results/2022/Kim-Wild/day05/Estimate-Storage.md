# Task: Estimate Storage Requirements

### WES: whole exome sequence 
### WGS: whole genome sequence 

1000 whole genomes are 1/1400 petabyte which is 714.3 Gigabyte

costs to store 1 GB -> 0.5 CHF \
               1 PB -> 500,000 CHF 

perfect genome ~ 715 MB \
50CHF/genome (BAM format)

### SAM: sequence alignment map

consists of a header and an alignment section \
header alwaxs starts with @ 

![grafik](https://user-images.githubusercontent.com/113769587/192596568-dfe3a125-7241-439e-9cbc-3f5f1b203e13.png)


### BAM: binary version of SAM 

stores the same data as a SAM in a compressed binary representation

SAM files and BAM files contain the same information, but in a different format

### VCF: variant call format 

Databank to store genome information 

Only has variations in it: \
Prints the position of the base of interest, what base can be found in a comparison genome and the diffrence in the genome of intrest 
good to see transversions \
If there‘s a deletion in comparison genome two bases are seen and in the one of intrest the base that is left from these two \
For many samples not good, too much data, could be confusing 

![grafik](https://user-images.githubusercontent.com/113769587/192594357-974e6f45-6bf2-44e0-be0b-84b763a43e6b.png)


### FASTA: 

starts with a header and has some information about the sample in it \
followed by the sequence, could be nucleotides are amino acids 

![grafik](https://user-images.githubusercontent.com/113769587/192594113-7f76fbfb-5cda-4224-a5c0-5623889d2254.png)
