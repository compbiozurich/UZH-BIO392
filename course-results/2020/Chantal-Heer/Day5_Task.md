# Reading up on Genome Technologies
* [General NGS technologies](https://github.com/compbiozurich/UZH-BIO392/blob/master/course-material/2020/2018-04-01___Slatko-et-al.__Next-Generation-Sequencing-Technologies__Curr-Prot-Mol-Biol__review.pdf)
    * First generation sequencing  
    **Sanger method** uses fluoresent/radioactive ddNTPs to induce a chain determination during in vitro DNA replication.
    * Second Generation sequencing
      - Sequencing by hybridization:  
      Arrayed DNA oligonucleotides of known sequence on filters get hybridize to labeled fragments of the DNA to be sequented. By repeatedly hybridizing and washing away the unwanted non-hybridized DNA, we see which labeled DNA fragments matches the DNA on the filter.
      - Sequencing by synthesis (SBS):  
      SBS methods use a solid support containing micro channels/wells in which the sequencing reactions occur. Reversible terminators are used for a normal, continous nucleotide incorporation. The DNA synthesis will be detected with incorporated labeled nucleotides or chemical reaction due to the incoporation. Compared to Sanger sequencing, SBS have shorter reads and a higher error rate.  
      **454 Pyrosequencing** detects pyrophosphat (as byproduct of nucleotide incorporation) by light production to report if a particular base was incorporated in a growing DNA chain. Each base type will be added individually (and washed aways after corporation) to know which nucleotide was used. 454 Pyrosequencing was used for genome sequencing and metagenome samples because of the long read length and realtively high throughput.   
      **Ion Torrent** sequencing reactions occur in millions of wells that cover a chip containing millions of pixels. These pixels convert the chemical information ino sequencing information (nucleotide sequence -> digital information). During the DNA synthesis, the incorporation of a nucleotide releases a hydrogen ion. The changed pH is detected by an ion sensor as voltage change. Only one nucleotide type is present at the time (adding and wash out).  
      **Illumina Technology** uses bridge amplification for DNA reproduction. The DNA molecules have adapters on each end of the strand. The glass slide contains complementary oligonucleotides matching the DNA adapters. The DNA strand makes a bridge (both adapters on the glass slide), amplifies and stands up again (no longer bridge formation). At the end, the glass slide is full of clonal DNA clusters. The incorporation nucleotides are labeled with fluorescent what can be imagined directly. Illumina sequencing supports genomic sequencing, exome and targeted sequencing, metagenomics, RNA sequencing, CHIP-seq and methylome methods. The problem of Illumina is the lacking reproduction synchrony of the cluster what can lead to a reduction of cycles.   
     * Third Generation sequencing  
     The third generation of sequencing uses large fragment single molecule (DNA and RNA).   
     **Pacific Biosiences** (PacBio sequencing, **S**ingle **M**olecule **R**eal **T**ime sequencing) enables to sequent very long fragments (30-50kb or longer). An engineered DNA polymerase bounds the to be sequenced DNA and is attached to the bottom of a well. The reaction of incorporating nucleotide can be detected by the emiting light. The nucleotides are fluorescent labeled. After incoporation, the label washed away together with the not used nucleotides. The PacBio technology is a real time sequencing imaging and detection process. It can detect nucleotides with base modification e.g. methylation. PacBio has a high error rate but this can be surmounted due to the high amount of reads.
     * Fourth Generation sequencing  
     By **Nanopore-based DNA sequencing** goes a long DNA molecule (100kb DNA) through nanopores (made by transmembrane proteins). The passaging (regulated by motor proteins i.e. DNA polymerase) can be detected in real time by a linked detector. Each nucleotide provides a characteristic electronic signal that is recorded as a current disruption event of the membrane. When the DNA left a nanopore, the pore is avaiable for use by another DNA molecule. This technology doesn't need much space and is easy to handle. Nanopore technology offers a low-cost DNA, direct RNA and PCR-free cDNA sequencing. Same as PacBio, Nanopore technology identifies base modifications. The high error rate is but can be circumvented by the large number of sequenced molecules.  
* count based vs. intensity based as principle   
*????*
* BONUS: dig deeper for some molecular-cytogenetic techniques: 
  * [SNP, aCGH arrays](https://github.com/compbiozurich/UZH-BIO392/blob/master/course-material/2020/2011-07-18___Schaaf%2C-Wiesnieszka-and-Beaudet__Copy-Number-and-SNP-Arrays-in-Clinical-Diagnostics__Ann-Rev-Genom__review.pdf)    

|     **a**rray **C**omparative **G**enomic **H**ybridisation     |                             **S**ingle **N**ucleotide **P**olymorphism                             |
|:---------------------------------------------------------------:|:--------------------------------------------------------------------------------------------------:|
| Single sequence oligonucleotides of ~ 60bp                      | Two 20-60bp oligonucleotides of different sequence                                                 |
| Two labeled DNAs (patient and control) per hybridization        | Only patient DNA labeled and hybridizied                                                           |
| Resolution down to size of oligonucleotides; exon by exon       | Resolution limited by SNP distribution and signal to background                                    |
| No detection of **U**ni**P**arental **D**isony or consanguinity | Able to detect consanguinity and most UPD                                                          |
| Limited SNP addition possible recently                          | Detection of most known clinically relevant **C**opy **N**number **V**ariants but not exon by exon |
  * SKY, M-FISH
  * chromosomal CGH
