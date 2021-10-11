_daniel walther_

# Notes on the introduction papers to this course

At some point, a teacher said "these papers roughly outline the course content"~.

The 3rd task of today (day 2): "read up on yesterday’s general genome variation papers & make notes / think about questions for discussion rounds".

Papers 1-4 are yet to be read. Notes regarding the task will be added in this file.

Four _general genome variation papers_ introducing the topic of this course:

## 1. [Finding the Rare Pathogenic Variants in a Human Genome]https://internal.baudisgroup.org/pdf/articles/2017-05-09___Evans__Clinical_genome_sequencing__JAMA_comment.pdf
(2 pages) Copyright 2017 American Medical Association. All rights reserved.

### Vocabulary ([deepl.com](https://www.deepl.com/translator#en/de/concomitantly%0Aameliorate) ):
- concomitantly: begleitend
- ameliorate: verbessern


### Summary of paper:

Reference sequences are typically a composite of sequences from many different genomes. Sequences of special interest in unhealthy individuals' genomes variant analysis are e.g. sense mutations.
Certain limitations - "current understanding of most genetic variation in humans is inadequate", "the interpretation and implications of genomic findings fundamentally differ in healthy individuals vs those with disease" - make routine genomic sequencing of healthy individuals inadvisable (paper published 2017-05-09).
Investigating not whole genomes of (un)healthy individuals but rather specific genome regions known to be critical  might prove more effective and efficient in gaining useful, i.e. actionable, knowledge about genetically caused diseases.


### Discussion ideas, interests in topic:

- It seems to me that the problem of the certainty with which variants are associated with disease could be connected to and obscure by the lack of knowledge about disease penetrance in an individual. For instance, DNA repair of pathogenic variants before development of disease could be something reducing the penetrance of possible pathogenic variants, I think.
-- This idea was written down before reading the section "Evidence Supporting Genome Sequencing in Healthy Individual". Thus, the idea of investigating penetrance as a more limiting issue is somewhat supported by this paper.
- Although getting cheaper, gathering genomic data harbors data privacy issues and has many unpleasant implications, in my opinion. For example, if genetically caused diseases get substantially better known, and privacy issues are not properly addressed (i.e. bulk DNA sequencing of general populations), some health insurance companies might backtrack high risk genomic profiles to their individual clients and demand higher payments.


## 2. [The sequence of sequencers: The history of sequencing DNA](https://internal.baudisgroup.org/pdf/articles/2016-01-15___Heather_and_Chain__The-sequence-of-sequencers__Genomics.pdf)

This review tells the history by chronologically describing the hallmarks of the development of DNA sequencing techniques (some RNA sequencing was also involved, but the focus is clearly on DNA).

Most sequencing techniques were, and many still are, so-called 'sequence by synthesis' (SBS) approaches. There, genomic sequences are determined by using DNA polymerase enzymes and adding artificial checkpoints, usually hindering further progress of DNA synthesis in order to take measurements of the newly synthesised base(s).

For each generation of sequencing methods, the most influencial and widely used techniques are described below

__First-generation sequencing method(s):__

The 'dideoxy chain-termination method', generally known as 'Sanger sequencing', represents the first generation of DNA sequencing methods, as it was the most widely used for years after its invention. It is a SBS technique. This method used radio- or fluorescently-labelled dideoxyribonucleotides (ddNTPs) - alongside the regular deoxyribonucleotides (dNTPs) - which caused the synthesis to stop at random positions because they lack the 3' hydroxyl group required for extension with further nucleotides. Combined with amplification ensuring stops at every base, gel electrophoresis with four lanes - one for each ddNTP separately - was used to infer the sequence from differing band size in the four lanes.

The Maxam-Gilbert technique (interestingly not a SBS technique) was also quite influential and deserves mentioning.

__Second-generation sequencing method(s):__

The Illumina sequencing platform has achieved near monopolistic market shares and is thus considered the main driver of second-generation sequencing. It is also a SBS technique. The core mechanism for measuring nucleotide sequence lies in coupling intensity of emitted light (by luciferase enzymes) to the type of nucleotide and the length of homopolymers. These techniques are known as 'pyrosequencing' techniques. Characteristic improvements to the first generation methods was the ability to sequence multiple reads in parallel - most influentially done in the 'Solexa method of sequencing', later acquired by Illumina. Amplification of the original DNA samples was still required at this point. Specifically, in Solexa/Illumina, 'bridge amplification' was used to create clonal clusters of DNA reads ('flowcell bound clusters') from the original DNA sample.

__Third-generation sequencing method(s):__

In this review, it is argued that single molecule sequencing (SMS) and real-time sequencing are defining features of third-generation sequencing methods. One of the most influential ones the 'single molecule real time' (SMRT) platform from Pacific Biosciences (PacBio), negating the need for DNA amplification, thus eliminating associated biases and errors. This is still a SBS method, using a single DNA polymerase enzyme in a tiny well, where only the exact location of the newly synthesised base pair is illuminated by lasers for pyrosequencing (what a cool name!).

Another promising technology which is not as widely used at the time of writing of this review is the Oxford Nanopore technology, which uses nanopore enzymes to ratchet one strand of the given DNA through the synthetic membrane in which the pore is embedded in. Voltage is applied to this membrane, facilitating distinctive local disruptions/changes in ion flow at each channel (each pore) (what an excellent and elegant procedure!).

__Discussion:__

What aspects of most advanced sequencing methods could realistically be improved next? What demands are there on the free market to begin with? Could sequencing technology be re-purposed to facilitate long-term storage and archives of information/knowledge?


## 3. https://internal.baudisgroup.org/pdf/articles/2015-10-01___1000-Genomes-Consortium__A-global-reference-for-human-genetic-variation__Nature.pdf

Short summary. Big (global) project of a human reference genome assembly, taking into account many (25 or so) different ethnicities around the world (not Australia, though, based on the map shown in the paper).

Discussion: implications of clinical applications seldomly being translatable between ethnicities:

- Would be nice to have some genome pathogenic genome variants shared by all humans, whose disease could thus be treated the same, potentially. This would be interesting to investigate/discuss as to how specifically this could be researched (e.g. as a proof of concept project).
- Another implication is that malicious entities have increasingly many tools at their disposal to design new diseases, e.g. with differing severity depending on the ethnicity of the host individual. This is deeply unsettling to think about but demands some serious consideration as to how to avert, defend against, and prevent such biologically enabled genocidal endeavours. How would one approach this topic? What is the right balance between centralised and decentralised research (and other) entities? How much closer do research and defence have to work together to be effective against unknown potential threats? Are there diplomatic solutions to prevent escalation in global biological warfare (as it can be argued such warfare has already begun in recent decades)? Could some cultures be incompatible with effective self-defence strategies and capabilities in an advanced and scientifically and biotechnologically enabled world? There are many more interesting questions one could involve at this point (regarding e.g. ideologies, moral frameworks of human existence, etc.)


## 4. https://internal.baudisgroup.org/pdf/articles/2011-05-12___Eichler_et_al__Review_structural_variations_arrays__NatRevGen.pdf
