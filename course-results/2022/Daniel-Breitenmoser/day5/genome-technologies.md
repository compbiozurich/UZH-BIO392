### General NGS technologies

3 types of NGS: Genome Sequencing, Exome Sequencing, Targeted Gene Panel

![image](https://user-images.githubusercontent.com/113686985/192869940-463fcc51-51ae-49c1-aac3-2ae5fb24e3a3.png) [^1]

They present various compromises between coverage, precision, speed and accuracy. 

After the founding methond of genome sequencing (Sanger) there was a need for higher throughput technologies. Out of this need the seconds generation sequencing methods were created.  

Second generation sequencing methods can be grouped into two major categories, sequencing by hybridization and sequencing by synthesis (SBS). \
SBS methods were a further development of Sanger sequencing without the dideoxy terminators, in combination with repeated cycles of synthesis, imaging and methods to incorporate additional nucleotides in the growing chain. This allowed nucleotide incorporation to proceed normally while imaging the the nucleotides and the removing synthesis blocking molecules on the labeled nucelotides to allow incorporation of the next base in sequence. \
Sequencing by hybdridization was developped using arrayed DNA oligonucleotides of knows sequence on filters that were hybridized to labeled fragments of the DNA to be sequenced. By repeatedly hybridizing and washing away the unwanted non-hybridized DNA it was possible to determine whether the hybridizing labeled fragments matched the sequence of the DNA probes on the filter.\
The most famous 2nd generation sequencing technologies are Ion Torrent and Illumina technology. [^2]

The 3rd gen sequencing methods aim to sequence long DNA molecules (30-50kb). The lead technology is Pacific Biosciences (PacBio) also referred to as Single Molecule Real Time sequencing (SMRT). In this technology there is an engineered DNA polymerase with bound DNA to be sequenced at the bottom of a small chamber. Imaging occurs at the bottom of this chamber when the DNA polymerase incorporates a nucleotide labaled with different phospho-linked fluorophores for detection.

The 4th gen technologies are nanopore systems where long DNA molecules pass through small holes and measure the difference in current of the membrane of the pore.

![image](https://user-images.githubusercontent.com/113686985/192876191-7fbb68bc-2775-4da4-8a17-bd490d76e086.png) [^3]


### SNP vs aCGH arrays

SNP arrays and aCGH arrays both enable the detection of CNV's. But in SNP arrays, each probe is located at an SNP and can determine \
the genotype of the corresponding SNP. Because of that, SNP arrays can detect long contiguous stretches of heterozygosity (LCSH) [^4]

LCSH have 2 main interests:
  1. they can detect uniparental isodisomies ( the inheritance of both homoogous copies of the same parent)
  2. they can detect genetic identity by descent
 
Thus, while aCGH is still very efficient at detection CNV's, the inclusion of SNP probes in arrays is desirable


### SKY, M-FISH

Spectral karyotype (SKY) is a karyotype in which the homologous pairs of chromosomes are manipulated in such a way that they have distinctive colors. The SKY technique makes it easier for scientists to detect chromosomal abnormalities, as compared with a conventional karyotype [^5]

Multicolor FISH (M-FISH) assays are used for a precise assessment of complex chromosomal rearrangements. This technique uses all whole-chromosome painting probes in multiplex-FISH and spectral karyotyping. Thus, marker chromosomes, complex chromosomal rearrangements, and all numerical aberrations can be visualized simultaneously in a single hybridization experiment. [^6]

### chromosomal CGH

Comparative genomic hybridization (CGH) is a molecular cytogenetic method for analysing copy number variations (CNVs) relative to ploidy level in the DNA of a test sample compared to a reference sample, without the need for culturing cells.
The aim of this technique is to quickly and efficiently compare two genomic DNA samples arising from two sources, which are most often closely related, because it is suspected that they contain differences in terms of either gains or losses of either whole chromosomes or subchromosomal regions (a portion of a whole chromosome). [^7]













[^1]: https://github.com/compbiozurich/UZH-BIO392/blob/master/course-material/2022/2022-09-27___Michael-Baudis__Genomic-Technologies-and-Genome-Editions___BIO392-HS22.pdf
[^2]: https://www.ncbi.nlm.nih.gov/pmc/articles/PMC6020069/
[^3]: https://en.wikipedia.org/wiki/Nanopore_sequencing#/media/File:202001_nanopore_sequencing.svg
[^4]: https://www.ncbi.nlm.nih.gov/pmc/articles/PMC4044733/
[^5]: https://www.genome.gov/genetics-glossary/Spectral-Karyotype
[^6|: https://www.creative-bioarray.com/services/multicolor-fish-m-fish-analysis.htm
[^7]: https://en.wikipedia.org/wiki/Comparative_genomic_hybridization
