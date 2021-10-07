_daniel walther_

TODOs:
terminology
maybe bit more in summary.

# day 10: GATK (Genome Analysis Toolkit)

__Task:__ short summary of the workflow (what & why) in an .md file. No need to memorise the commands, just understand the process.

## GATK (genome analysis toolKit) workflow

| ![GATK workflow schematic from the .ipynb workspace](https://storage.googleapis.com/gatk-tutorials/images/3-somatic/GATK_Mutect2_V4.1_042319_lg.png), taken from [app.terra.bio](https://app.terra.bio/#workspaces/bio392-2021/GATKTutorials-Somatic%20new/notebooks/launch/1-somatic-mutect2-tutorial.ipynb?mode=playground). | ![GATK workflow chart from lecture](/GATK_workflow_whiteboard.jpg) |

## terminology

What does it mean to 'call somatic SNV &/ indels' with mutect2 or otherwise?
- 
What is a 'somatic callset'?
- 
What is 'G pop'?
- Germline population, for capturing rare germline variants not associated with tumour cells.

__shorten & extract useful info. from below__
* Mutect2 uses the matched normal to additionally exclude rare germline variation not captured by the germline resource and individual-specific artifacts.
* Mutect2 uses a germline population resource towards evidence of alleles being germline. The simplified sites-only gnomAD resource retaining allele-specific frequencies is available at ftp://gsapubftp-anonymous@ftp.broadinstitute.org/bundle/Mutect2.
* A panel of normals (PoN) has a vital role that fills a gap between the matched normal and the population resource. Mutect2 uses the PoN to catch additional sites of noise in sequencing data, like mapping artifacts or other somewhat random but systematic artifacts of sequencing and data processing.

> 1-somatic-mutect2-tutorial:
> 2-somatic-cna-tutorial: The workflow is suitable for detecting _somatic copy ratio alterations_, more familiarly copy number alterations (_CNAs_), or copy number variants (_CNVs_) for whole genomes and targeted exomes.

- HCC1143: HC stands for Haplotype Colouring

- - - prep. for workflow
  - have raw seq
  - have ref seq
- =>align
- align BAM
- mark dup.seq
- realign
- analyse ready(?) bam seq
- - -
> "today: somatic variant calling. based on tumour (T) & match normal (N)"
  > "match normal: is usuallby a blood sample with the normal genome of this person (compared to the tumour sample)."

- N: 
- G Pop: Germline Population. For identifying germline variants not yet captured with reference variants
- PoN: Panel of Normals, vital, for bridging the gap between the matched normals and the germline population.

# personal notes on the topic

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
