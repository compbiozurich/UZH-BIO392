# Paper notes and questions

## *Finding the Rare Pathogenic Variants in a Human Genome* by Evans et al.

### Notes
* Decreases in cost of DNA sequencing lead to calls for routine genome-scale sequencing for healthy individuals to discover clinically important information
* An individual's genome contains millions of sites where his or her DNA differs from reference sequence (defined by international Genome Reference Consortium)
* Clinical interpretation relies on control and population data sets, review of medical literature and patient's phenotype
* Limitation when interpreting genomic findings in healthy individuals, since risk estimates where derived from studying patients presenting clinically, thus selecting for the most extreme cases
* Biggest problem of genome sequencing of healthy individuals is unnecessary medical intervention due to false-positive findings or overdiagnoses
* To prevent this, gene-specific thresholds and a broad knowledge base from sequencing many healthy individuals is necessary
* 1 to 2% of US population harbors genetic variants in well-studied genes with the potential to benefit from established preventive modalities if the elevated risk were known
* Costs for WGS are falling, but substantial medical costs are generated also from the interpretation and the downstream actions
* At the moment, evidence doesn't support WGS in healthy individuals

## *The sequence of sequencers: The history of sequencing DNA* by Heather and Chain

### Notes
* *First-generation DNA sequencing*: 
  * Initial efforts: microbial rRNA or tRNA, or genomes of single-stranded RNA bacteriophages => only composition
  * Combining techniques that measure composition with selective ribonuclease treatments to produce fully and partially degraded RNA fragments => first whole nucleic acid sequence of alanine tRNA from *Saccharomyces cerevisiae*
  * Sanger and colleagues developed technique based on detection of radiolabelled partial-digestion fragments after two-dimensional fractionation
  * Coulson and Sanger developed "plus and minus" system (DNA polymerase synthesizes from a primer with radiolabelled nucleotides, either with only a single type of nucleotide or with the other three)
  * Maxam and Walter developed a chemical cleavage technique (chemicals break chain at specific bases)
  * **Breakthrough in 1977**: Sanger's "chain-termination" or dideoxy technique => ddNTPs terminate synthesis at all possible lengths => electrophoresis
  * Length of reads from first-generation DNA sequencing machines: slightly less than one kilobase => instead "shotgun sequencing" and assembly into one sequence
* *Second-generation DNA sequencing*:
  * Use of luminescent method for measuring pyrophosphate synthesis: two-enzyme process in which ATP sulfurylase is used to convert pyrophosphate into ATP, which is then used as the substrate for luciferase, thus producing light proportional to the amount of pyrophosphate => inference of sequence by measuring pyrophosphate production as each nucleotide is washed through the system in turn over the template DNA affixed to a solid phase => "sequence-by-synthesis", as Sanger
  * **Advantages**: uses natural nucleotides and observes in real time
  * Method was used to develop "next-generation sequencing" (NGS) technology
  * Production of reads around 400-500 base pairs long, for a million of wells
  * **Other method**: Solexa method (Illumina) => instead of parallelising by performing bead-based emPCR, adapter-bracketed DNA molecules are passed over a lawn of complementary oligonucleotides bound to a flowcell; a subsequent solid phase PCR produces neighbouring clusters of clonal population from each of the individual original flow-cell binding DNA strands ("bridge amplification"); sequencing by SBS with fluorescent reversible-terminator dNTPs; advantage: could produce paired-end (PE) data, in which sequence at both ends of each DNA cluster is recorded
  * **Other method**: sequencing by oligonucleotide ligation and detection (SOLiD) system by Applied Biosystems
  * **Other method**: Ion Torrent; first "post-light sequencing" technology, nucleotide incorporation is measured not by pyrophosphate release, but the difference in pH caused by the release of protons during polymerisation
* *Third-generation DNA sequencing*:
  * **Traits**: single molecule sequencing (SMS), real-time sequencing, and simple divergence from previous technologies
  * **Stephen Quake (Helicos BioSciences)**: same as Illumina without the bridge amplification; DNA templates become attached to planar surface, and the propriety fluorescent reversible terminator dNTPs (so-called "virutal terminators") are washed over one base a time and imageg, before cleavage and cycling the next base over; slow and expensive, short reads, but no amplification necessary (avoiding associated biases)
  * **Single molecule real time (SMRT) platform (Pacific Biosciences)**: DNA polymerisation in arrays of microfabricated nanostructures called zero-mode waveguides (ZMWs), which are tiny holes in a metallic fiilm covering a chip; several advantages, no amplification, kinetic data (detection of modified bases), long reads up to 10 kb in length
  * **Outlook**: nanopore sequencing

### Questions
* For second-generation sequencing, how was the sequence of the oligonucleotides for the bridge amplification decided?

## *A global reference for human genetic variation* by The 1000 Genomes Project Consortium

### Notes
* Goal of 1'000 Genomes Project: comprehensive description of common human genetic variants by applying WGS to a diverse set of individuals from multiple populations
* 2'504 individuals from 26 populations (AFR, EAS, EUR, SAS, AMR), over 88 mio variants (84.7 mio SNPs, 3.6 mio short indels, 60'000 SV)
* To control false discovery rate: variant quality score threshold was defined using high depth (>30x) PCR-free sequence data generated for one individual per population; for SVs, additional orthogonal methods were used for confirmation
  * SNP and indels: FDR < 5%
  * deletions, duplications and multi-allelic copy-number variants, Alu and L1 insertions: FDR < 5%
  * inversions, SVA composite retrotransposon insertions and NUMTs: FDR < 20%
* **Typical genome**:
  * differs from reference human genome at 4.1 million to 5.0 million sites
  * over 99.9% of variants consist of SNPs and short indels, 2'100 - 2'500 SV that affect more bases (20 mio bases of sequence)
* Individuals from African ancestry populations show greates numbers of variant sites
* Majority of variants in the data set are rare, but majority of variants observed in a single genome are common
* 2'000 variants per genome associated with complex traits through genome-wide association studies and 24 - 30 variants per genome implicated in rare disease through ClinVar
* 86% of variants were restricted to a single continental group
* Results show a shared demographic history for all humans beyond 150'000 to 200'000 years ago; European, Asian and American populations shared strong and sustained bottlenecks, all with N < 1'500, between 15'000 and 20'000 years ago; in African populations N > 4'250
* 762'000 variants are rare (frequency < 0.5%) within global sample but much more common (frequency > 5%) in at least one population
* Analysis of the small set of variants with large frequency differences between closely related populations can identify targets of recent localized adaption
* **Advantages of 1'000 Genomes Project**: broad representation of human genetic variation; project incorporates multiple analysis strategies, callsets and variant types; project samples and data can be shared broadly
