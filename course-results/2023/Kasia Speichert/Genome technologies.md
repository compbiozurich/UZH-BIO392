# General NGS technologies 

Next generation sequencing is a much more powerful technique to sequence DNA in a massive and parallel manner. Can be performed on a much greater scale than Sanger sequencing. 

# Count based vs intensity based as principle
## Count-Based Sequencing Technologies:
Methods are based on the count occurences of the molecules with the specific tag.
- Sanger sequencing:
<br>Chain-terminating dideoxynucleotides are incorporated into growing DNA strands, and the resulting fragments are separated and counted to determine the sequence.


## Intensity-based sequencing Technologies:
Methods are based on the signal intensity generated during the sequencing process.

- Solexa/Illumina sequencing [^1]:
  <br> This method is based on sequencing-by-synthesis (SBS), and reversible dye-terminators that enable the identification of single bases as they are introduced into DNA strands.
  DUring library preparation the genomic DNA is fragmented into 200-500bp pieces and the adapters are added to both ends. Adapter-ligated fragemnts are amplicfied by PCCR. In the cluster generation step DNA fragments randomly attach to the flow cell containing the adapters matching to the fragments' adapters. Each DNA fragments is clustered in bundles at the resepctive location containing many copies of a single DNA template. All templates are the sequenced by sequencing-by-synthesis method. (DNA polymerase, connector prmers and 4 dNTP with base-specific fluorescent markers are added to the reaction ssystem. Buffer solution needed for fluorescent excitation is added =, the fluorescent signal is excited by lase and signal recorded by optical equipment. The optical signal is converted into sequencing base by computer analysis.)
  
- Pyrosequencing [^2]:
<br> A method of DNA sequencing that detects light emitted during the sequential addition of nucleotides during the synthesis of a complementary strand of DNA.



# Long and short read technologies
Short-read sequencing methods involve the sequencing of relatively short fragments of DNA 50 to few hundred base pairs in length. These techniques are high-throughput, low error, and cost-effective. Illumina sequencing is an example of this technique.

Long-read sequencing methids read much longer fragments of DNA ranging from thousands to tens of thousands of base pairs. THey are able to resolve complex genomic regions and detect structural variations. THese techniques include PacBio sequencing and Oxford Nanopore sequencing. THey generate reads which can span the entire genes or repetitive elements. However, they are characterized by higher error rate. 

>Nanopore sequencing is a unique, scalable technology that enables direct, real-time analysis of long DNA or RNA fragments. It works by monitoring changes to an electrical current as nucleic acids are passed through a protein nanopore. The resulting signal is decoded to provide the specific DNA or RNA sequence. [^4]

# Cytogenetic techniques

Cytogenetics is the study of the relationship between chromosomal aberrations and genetic diseases in human beings.

## Banding analysis[^5]

Chromosome banding refers to alternating light and dark regions along the length of a chromosome, produced after staining with a dye. A band is defined as the part of a chromosome that is clearly distinguishable from its adjacent segments by appearing darker or lighter with the use of one or more banding techniques.
THe first banding patterns were reported in 1968 and called Q-bands. They were alternating bands of bright and dull fluorescence. These quinacrine-bright bands were composed primarily of DNA rich in the bases adenine and thymine. The were applied to human in 1970 to produce the first-banded human karyogram. Before that 24 human chromosomes were seperated into seven different groups a to G based on the size and position of the centromere. Q-banded chromosomes were analysed and specific regions and bands were detected in each of them. Later several other staining methodologies were introduced which produced different patterns and bands including C-banding, G-banding, R-banding. 
G-banding has become the most commonly used stain in human cytogenetics because of its permanence and clarity. It is introduced by treatment with a proteolytic enzyme such as trypsin followed by staining with Giemnsa, which binds DNA.
In the mid-1980s, specific sequences within the chromosomes cwere stained by the fluorescence in situ hybridization (FISH), which uses fluorescently labeled DNA probes. It has largely replaced specialized stianing of chromosome regions. 
WHen the first completed draft of the human genome, the sequence has beed fully integrated with the chromosome bands by placement of cloned pieces of DNA, whose position was established by FISH, onto the draft sequence thus allowingintegration of cytogenetic landmarks with the sequence of the human genome. G-ligh bands were detectced as gene-rich and G-dark bands s gene-poor and likely to contain heterochromatin. 

The most important application of banding in humans is the identification of chromosome abnormalities in genetic diseases and cancer. Chromosome banding allows the identification of chromosome deletions, duplications, translocations, inversions, and other less common chromosome abnormalities. 

> In patients with cancer, studies of banded chromosomes in affected cells have revealed specific translocations that result in the fusion of two genes, resulting in a novel fusion protein that provides a growth advantage to cells with this rearrangement. A well-studied, recurrent example of a reciprocal translocation associated with cancer is the translocation between the ABL1 gene on chromosome 9 (band q34) and the BCR (or breakpoint cluster region) gene on chromosome 22 (band q11). This translocation results in the formation of a novel BCR–ABL fusion protein, which is most commonly detected in patients with chronic myelogenous leukemia, and targeting this novel protein has proven to be a successful approach to treatment of this disorder.


## SNP, aCGH arrays[^6]

Comparative genomic hybridization and genome-wide single-nucleotide polymorphism (SNP)-based arrays are arra-based techniques are used to detect any chromosome abnormality that produce an alteration of dosage. THey provide much greater precision than standard analysis of G-banded chromosomes and have become the most common method for analysis of chromosomes in children with a wide vriety of developmental and congenital disorders. 

 The assay works by enzymatically cutting the patient and control DNA samples into fragments and then labeling each one in a different fluorescent color (usually green and red). The differentially labeled DNAs are mixed together in equal proportions
and placed onto an array (glass slide) containing multiple probes from representative sequences across the human genome. The
patient and control DNA competitively bind (hybridize) with the complimentary sequences that are located within the probe DNA
on the array. The intensity of the fluorescence signal of every probe is measured using digital imaging software and then normalized so that the patient and control samples can be directly compared.

Single nucleotide polymorphism (SNP) arrays use DNA probes that derive from regions in the genome that show differences between individuals at a single base pair site. These sites are referred to as SNPs. SNP arrays measure the absolute fluorescence probe intensities of the patient sample compared with the intensities of numerous normal control samples that were each individually run, normalized, and combined to create a reference set.
In addition to obtaining copy number information from the signal intensity, supplementary clinically useful information can be extracted from the genotype plots generated from the SNPs. This includes mosaicism, twin‐twin or maternal cell contamination (MCC), zygosity, consanguinity, limited outbreeding, triploidy, uniparental disomy (UPD), partial and complete hydatidiform moles, and parent of origin.

## Chromosomal CGH[^7]

Comparative genomic hybridisation (CGH) is a technique that permits the detection of chromosomal copy number changes without the need for cell culturing. It gives a global overview of chromosomal gains and losses throughout the whole genome of a tumour.
Th technique was first introduced in 1992. This technique was developed dues to the limitation in the resolution by the micsoscopes of the banding and FISH methods. Tumour DNA is labelled with a green fluorochrome, mixed (1:1) with red labelled normal DNA, and hybridised to normal human metaphase preparations. The green and red labelled DNA fragments compete for hybridisation to their locus of origin on the chromosomes. The green to red fluorescence ratio measured along the chromosomal axis represents loss (ratio < 1) or gain (ratio > 1) of genetic material in the tumour at that specific locus.

The array CGH was developed and overcame the limitation of low-resolution conventional CGH. In array CGH, the metaphase chromosomes are replaced by cloned DNA fragments of which the exact chromosomal location is known. It is specific, sensitive, fast and high-thuoghput technique. 

Conventional CGH has been used mainly for the identification of chromosomal regions that are recurrently lost or gained in tumors, as well as for the diagnosis and prognosis of cancer. This approach can also be used to study chromosomal aberrations in fetal and neonatal genomes.
Array CGH is mainly used to detect genomic abnormalities in cancer but also for the analysis of DNA copy number aberrations that cause human genetic disorders. 
A main disadvantage of conventional CGH is its inability to detect structural chromosomal aberrations without copy number changes, such as mosaicism, balanced chromosomal translocations, and inversions. CGH can also only detect gains and losses relative to the ploidy level.

# "T2T" genome [^3]

THe first human genome sequence included millions of unknown bases. These were presents due to highly repetitive sequences spanning up to several megabases that are dispersed thgouhout the genome and cannot be resolved with short-read sequencing technology. These regions include telomeres, centromeres, tandem repeat arrays, segmental duplicatins and account for over 8% of the latest human refrence genome (GRCh38). 

## What technologies enable this?

Long-read sequencing technologies such as PacBio and ONT (Oxford Nanopore Technologies) together with computational algorithms enabled the Telomere-to-Telomere (T2T) COnsortium to succeed in filling ll the gaps and produce the first coplete human genome assembly (T2T-CHM13). 

[^1]: https://www.cd-genomics.com/blog/principle-and-workflow-of-illumina-next-generation-sequencing/
[^2]: https://www.news-medical.net/life-sciences/What-is-Pyrosequencing.aspx#:~:text=Pyrosequencing%20is%20a%20method%20of,a%20complementary%20strand%20of%20DNA.
[^3]: https://www.nature.com/articles/s41592-022-01512-4
[^4]: https://nanoporetech.com/applications/dna-nanopore-sequencing
[^5]: https://www.sciencedirect.com/science/article/pii/B9780123749840002382
[^6]:https://obgyn.onlinelibrary.wiley.com/doi/pdf/10.1002/pd.5422#:~:text=A%20typical%20clinical%20CGH%20array,a%20single%20base%20pair%20site.
[^7]: https://www.ncbi.nlm.nih.gov/pmc/articles/PMC395705/pdf/520243.pdf

