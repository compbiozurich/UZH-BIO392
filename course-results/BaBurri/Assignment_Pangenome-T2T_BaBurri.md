# **Asssignment by Basil Burri**

### Questions addressed in this assignment
1. How does the Telomere-to-Telomere (T2T) genome assembly differ from previous genome constructions?
2. What are the benefits of the T2T genome when analyzing genomic data?
3. Why is the T2T genome not a classical reference genome?
4. How does the pangenome address the limitations of the T2T genome to build a true reference genome?


### References
Unless otherwise specified, all information is derived from the paper of the [Human Pangenome Reference Consortium, 2023](https://doi.org/10.1038/s41586-023-05896-x) and the [Telomere-to-Telomere Consortium, 2022](https://pmc.ncbi.nlm.nih.gov/articles/PMC9186530/).


## Pangenome and T2T 

### T2T Revolution

In 2022, the Telomere-to-Telomere (T2T) Consortium published the first complete human genome, including heterochromatic regions that account for approximately 8% of the genome. This assembly is called T2T-CHM13 and includes nearly 200 million additional base pairs (3.055 Gbp in total) compared to the GRCh38 reference genome, released by the Genome Reference Consortium (GRC) in 2013. GRCh38 relied on bacterial artificial chromosome (BAC) cloning, which is not well-suited for sequencing heterochromatin, centromeres, telomeres, and repetitive regions, resulting in missing regions and a genome-wide deletion bias typical of partial assemblies. To overcome these challenges, the T2T Consortium used long-read sequencing technologies, such as Oxford Nanopore and PacBio HiFi, to assemble the genome from a homozygous [CHM13hTERT female human cell line](https://www.cellosaurus.org/CVCL_VU12) which represents a functionally haploid genome. Reanalysis of the 1000 Genomes Project (1KG) sequences using T2T-CHM13 revealed more copy number variants (CNVs) than GRCh38 and identified approximately 3.7 million additional single-nucleotide polymorphisms (SNPs).

### T2T is not a reference genome

In contrast to GRCh38, T2T-CHM13 is not a classical reference genome because it originates from a single individual's cell line.
Reference genomes like GRCh38 are mosaics of sequences from multiple individuals to better represent intraspecific diversity.
While T2T-CHM13 enables more accurate read alignments and improved variant detection in repetitive regions it lacks the diversity representation of a true reference. To address this issue, the Human Pangenome Reference Consortium (HPRC) aimed to assemble genomes of multiple individuals with diverse population backgrounds in order to create a mosaic pangenome.

### The Pangenome is a graph of many T2T assemblies

In 2023, the Human Pangenome Reference Consortium (HPRC) published the first draft of the human pangenome reference, containing sequences from 47 individuals representing [diverse population backgrounds](https://humanpangenome.org/samples/). Just like the T2T project, the HPRC also used long-read sequencing, such as Oxford Nanopore and PacBio HiFi, to capture repetitive regions. The assemblies achieved a quality comparable to those of the T2T project, covering 99% of the individuals' genomes with 99% base calling accuracy. By aligning these assemblies, the HPRC created a pangenome reference that reflects known variants and haplotypes. Compared to GRCh38, the pangenome adds 119 million base pairs of euchromatic polymorphic sequences and 1'115 gene duplications, with approximately 90 million of these bases derived from structural variations (SVs). This improves short-read (derived from Illumina sequencing) analysis, reducing small variant discovery errors by 34% and improving structural variant detection by 104% relative to GRCh38. Previous studies have identified tens of megabases of polymorphic SVs within populations,
noting that reference genomes from a single population miss over two-thirds of these SVs. Such bias is detrimental, as SVs are more likely to impact gene function than SNPs or short indels and their detection could be of high significance for diagnostics. The pangenome reference graph circumvents this limitation by representing multiple populations. A near-term application of the pangenome could be the improvement of reference-based sequence mapping workflows. Despite its complexity, pangenome mapping remains computationally efficient and provides the benefit of reducing variant calling errors and improving transcript mapping accuracy compared to GRCh38. While genotyping SVs from short-read samples is challenging with standard references, the pangenome enables more accurate and sensitive genotyping which could allow the reanalysis of existing short-read datasets. Combining long-read sequencing with the pangenome reference will further improve SV genotyping and could become a preferred approach for read mapping in SV and CNV detection.
