# Genome Technologies

## 1. General NGS technologies

### 1.1 [First-generation DNA sequencing](https://internal.baudisgroup.org/pdf/2016-01-15___Heather_and_Chain__The-sequence-of-sequencers__Genomics.pdf)

|Year | Who | Description |
|-----|-----|:------------|
|1965|Robert Holley|Whole nucleic acid sequence of alanine tRNA.|
|1965|Fred Sagner|Method is used to detect radiolabeled partial-digestion fragments after two dimentional fractionation. This helped with the sequencing of ribosomal and transfer RNA.|
|1972|Walter Fiers' laboratory|They used the two dimentional fragmentation method to sequence the first complete protein coding dene.|
||Ray Wu and Dale Kaiser|They added to ends radioactive nucleotides using a DNA polymerase. The sequence was examined by giving the nucleotides one at a time and measuring their incorporation.|
|1970s|Alan Coulson and Sanger|Plus and Minus system: A two second polymerisation reaction could be done with this technique using a DNA polymerase, which incorporated radiolabelled nucleotides to a primer. During the 'plus' reaction a single type of nucleotide could be added and the sequence stopped at the present nucleotide. The 'minus' reaction is the exact opposite, because three nucleotides were added and the sequencing stopped before the missing nucleotide. The products from these reactions were run in a polyacryamide gel.|
|1975|Maxam and Gilbert|They also used the polyacrylamide gel but for their experiments radiolabelled DNA was treated with chemicals to break the sequence at specific bases. The length was determined using the gel.|
|1977|Sagner|'Chain termination' or dideoxy technique: for this technique dideoxynucleotides ddNTPs are used, which lack the 3' hydroxyl group. After one ddNTP is incorporated into the new sequence, no further nucleotides can be added. The length of the strands is measured using the polyacrylamide gel.|

The machines used for tese techniques can produce readouts less than one kilobase.

### 1.2 [Second-generation DNA sequencing](https://internal.baudisgroup.org/pdf/2016-01-15___Heather_and_Chain__The-sequence-of-sequencers__Genomics.pdf)

#### Clonally amplification usig emulsion PCR (emPCR).

Adapter sequences attach DNA libraries to beads. Afterwards, emulsion PCR (emPCR) is used and the initial DNA library is amplified. DNA-coated beads are washed over a plate that fits one beat per well. The pyrosequencing step occures when enzymes linked to smaller beads and dNTP are added. Pyrophosphate is then measured using a charged couple device (CCD).

#### Illumina

DNA molecules connected to an adapter attach to complementary oligonucleotides on a flowcell. A process known as bridge amplification occures when during the solid phase PCR clusters of clonal populations are produced. The sequencing method is called sequencing by synthesis (SBS) and uses fluorescent 'reversible-terminator' dNTPs. After the incorporation of a dNTP to the growing strand, the fluorophore is excited and then measured with a CCD. The fluorophore must be cleaved in order for the polymerisation to continue and thus the sequence of nucleotides is optained.  

#### Ion Torrent

Beads coated with clonal populations of DNA fragments are placed in a picowell plate. This method measures the change in pH that occures during polymerisation.


### 1.3 [Third-generation DNA sequencing](https://internal.baudisgroup.org/pdf/2016-01-15___Heather_and_Chain__The-sequence-of-sequencers__Genomics.pdf)

#### Single molecule sequencing (SMS)
DNA templates are attached to a surface and fluorescent reversible terminator dNTPs are added. The fluorescence of the dNTPs is measured and afterwards the fluorophore is cleaved and the polymerisation continues. This technology does not need amplification.

#### Single molecule real time (SMRT)

The DNA polymerisation takes place in zer-mode waveguides (ZMWs), which are holes in a metalic film on a chip. The diameter of ZMW causes the exponential decay of the wavelength and thus only the very bottom has light. As a result only the fluorophore of one dNTP is visualised at the bottom and than it is cleaved. The polymerase is also placed at the bottom of the ZMW. The nucleotides are read in real time, as they are added.  

#### Nanopore

A single strand of RNA or DNA is passed through ion channels. This blocks the flow of ions and decreases the current for a period of time proportional to the length of the nucleotide.


## 2. Count based vs. intensity based as principle NGS technologies

Intensity based technologies rely on the measurement of the fluorescence to determine the nucleotides that are added by the polymerase. Some of technologies include: Illumina, single molecule sequencing and single molecule real time. The count based NGS technologies are the ones that measure for example the release of pyrophosphate or the change in pH and current. Amongst these technologies are emulsion PCR, Ion Torrent and Nanopore.

## 3. Molecular-cytogenetic techniques

### 3.1 [Array comparative genomic hybridization (array CGH) and SNP microarrays](https://internal.baudisgroup.org/pdf/2011-05-12___Eichler_et_al__Review_structural_variations_arrays__NatRevGen.pdf)

These two arrays can indicate the gain or loss in the copy number when compared to a reference sample or population. 

The array CGH is based on the comparative hybridization of two labelled samples to hybridization targets. The result is a signal ratio used as a representation for the copy number. However the reference sample can have an effect on the copy number profile, because the examination of one sample with a loss in the reference, will lead to uncertainty about the gain in the target. The major suppliers of array CGH are Roche NimbleGen and Agilent. 

For the SNP microarry the hybridization is performed on single sample. The intensity measured across many samples is clustered and then log ratio is generated. The probes designed for the SNP microarrays are specific to single-nucleotide differences between DNA sequences. Another advantage is that this method uses SNP-allele specific probe to increase CNV sensitivity and it also has better SNP selection criteria for complex regions. However, a disadvantage is that, SNP microarrays have lower signal-to-noise ratio than the best array CGH.

### 3.2 Spectral karyotyping (SKY) and Multicolor Fluorescence In Situ Hybridization (M-FISH)

The SKY method is used to visualise the chromosomes and especially their abnormalities [[1]]. One key aspect of this method is that the each of the homologous chromosome pairs have a different colour, which makes it easy to differentiate between them [[1]]. Inter, and intra-chromosomal genomic rearrangements can be easily spotted [[2]]. 

M-FISH is used to detect a certain sequence on a chromosome [[3]]. For this method a probe, that has a fluorophore attached to it, can be designed to hyberdize to the chromosome [[3]]. This way a specific part of the DNA can be identified [[3]]. 

[1]: https://www.genome.gov/genetics-glossary/Spectral-Karyotype#:~:text=Spectral%20karyotype%20(SKY)%20is%20a,compared%20with%20a%20conventional%20karyotype.
[2]: https://www.sciencedirect.com/topics/biochemistry-genetics-and-molecular-biology/spectral-karyotyping
[3]: https://www.genome.gov/genetics-glossary/Fluorescence-In-Situ-Hybridization#:~:text=%E2%80%8BFluorescence%20In%20Situ%20Hybridization%20(FISH)&text=Fluorescence%20in%20situ%20hybridization%20(FISH)%20is%20a%20laboratory%20technique%20for,fluorescent%20molecule%20attached%20to%20it.

### 3.3 Chromosomal CGH

This method is used to provide information about the copy number changes in chromosomes [[4]]. When the genome of a tumour is analysed using chromosomal CGH, this indicates all the gains and losses [[4]]. Tumor and normal DNA recived different fluorophores and they were added to normal chromosomes and left to hybridize [[4]]. The fluorescence ratio was used to assess the gain or loss of genetic material in a specific locous for tumour chromosomes [[4]]. 

[4]: https://www.ncbi.nlm.nih.gov/pmc/articles/PMC395705/

