_daniel walther_

TODOs:
terminology
maybe bit more in summary.

# day 10: GATK (Genome Analysis Toolkit)

__Task:__ short summary of the workflow (what & why) in an .md file. No need to memorise the commands, just understand the process.

## GATK (genome analysis toolKit) workflow & terminology

![GATK workflow schematic from the .ipynb workspace](https://storage.googleapis.com/gatk-tutorials/images/3-somatic/GATK_Mutect2_V4.1_042319_lg.png), taken from [app.terra.bio](https://app.terra.bio/#workspaces/bio392-2021/GATKTutorials-Somatic%20new/notebooks/launch/1-somatic-mutect2-tutorial.ipynb?mode=playground)

terminology & purpose:

* T: tumor samples (from the tumor cells of interest)
* N: match normal samples (genetic data from blood samples).
  * Mutect2 uses the matched normal to additionally exclude rare germline variation not captured by the germline resource and individual-specific artifacts.
* G pop: Germline population, for capturing rare germline variants not associated with tumour cells.
  * Mutect2 uses a germline population resource towards evidence of alleles being germline.
* PoN: Panel of Normals.
  * A panel of normals (PoN) has a vital role that fills a gap between the matched normal and the population resource. Mutect2 uses the PoN to catch additional sites of noise in sequencing data, like mapping artifacts or other somewhat random but systematic artifacts of sequencing and data processing.
* HCC1143: HC stands for Haplotype Colouring
* callset: (genomics) A collection of variant calls, typically for one sample. (wikipedia)
* somatic callset: a collection of somatic mutation variant calls.
* SNV: A single-nucleotide variant (SNV) is a variation in a single nucleotide. SNVs differ from SNPs (single-nucleotide polymorphisms) in that a SNV can be somatic[9] and can be caused by cancer,[10] but a SNP has to segregate in a species' population of organisms. (wikipedia)
* __SNV calling__: SNV calling from NGS data is any of a range of __methods for identifying the existence of single nucleotide variants__ (SNVs) from the results of next generation sequencing (NGS) experiments. These are computational techniques, and are in contrast to special experimental methods based on known population-wide single nucleotide polymorphisms (see SNP genotyping). (wikipedia). The same principle applies to indels, of course.
* indels: Indel is a molecular biology term for an insertion or deletion of bases in the genome of an organism. It is classified among small genetic variations, measuring from 1 to 10 000 base pairs in length,[1][2][3][4][5][6][7] including insertion and deletion events that may be separated by many years, and may not be related to each other in any way. (wikipedia)
* What it means to 'call somatic SNV &/ indels' with mutect2 or otherwise:

> 1-somatic-mutect2-tutorial:
> 2-somatic-cna-tutorial: The workflow is suitable for detecting _somatic copy ratio alterations_, more familiarly copy number alterations (_CNAs_), or copy number variants (_CNVs_) for whole genomes and targeted exomes.

> "today: somatic variant calling. based on tumour (T) & match normal (N)"
  > "match normal: is usuallby a blood sample with the normal genome of this person (compared to the tumour sample)."

- N: 
- G Pop: Germline Population. For identifying germline variants not yet captured with reference variants
- PoN: Panel of Normals, vital, for bridging the gap between the matched normals and the germline population.

## personal notes on the topic

This workspace focuses on the use of _jupyter_ notebooks (.ipynb files).

[GATKTutorials-Somatic new (newest workspace created by Rahel Paloots](https://app.terra.bio/#workspaces/bio392-2021/GATKTutorials-Somatic%20new) - this tutorial is what we needed the gmail address for, log in on `app.terra.bio` (url) is done via google account. On that page, just go through the tutorial and document the workflow in this file.

Today, I will learn about 2 forms of somatic analysis:
- use mutect2 for variant differences to compare tumour and normal samples.
- use the CNA (Copy Number Alterations) workflow for copy number alterations.

Running the actual analysis is (here) done in a jupyter notebook (aka 'notebooks'). For these workflows, some computing power (4 CPUs, 16GB memory, 100GB disk space) is required, which can not be assumed of students' devices, so a cloud computing solution is provided by the course staff. This cloud computing service is run by app.terra.bio, if I'm not mistaken. On this page, the notebooks contain information about the workflow(s) we are learning about, file/data handling, commands for running analyses and commentary to guide us through these __bioinformatics workflows__. The (unedited) file is also downloaded to the directory of this .md file (as notebook and markdown file).

## less excellence

__short summary:__ (off the cuff)
- get data - control, treatment
- tidy data
- analyse data
- investigate (un)expected / interesting findings
- infer meaning in reality and implications for clinical therapies of cancer patients.
