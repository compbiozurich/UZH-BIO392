_daniel walther_

# day 10, GATK, liftover

__Task:__
> at the end of the day, please upload your notes in an .md file to the course repo.
> btw: no need to memorise the commands, just understand the __process__. write a summary of why you did what steps in your analysis.

> ~ Don't lose yourself in the details. Focus on the bigger picture of the workflow and why you do what (not commands, but e.g. why do filtering of samples).

## GATK (genome analysis toolKit) workflow

![GATK workflow schematic from the .ipynb workspace](https://storage.googleapis.com/gatk-tutorials/images/3-somatic/GATK_Mutect2_V4.1_042319_lg.png), taken from [app.terra.bio](https://app.terra.bio/#workspaces/bio392-2021/GATKTutorials-Somatic%20new/notebooks/launch/1-somatic-mutect2-tutorial.ipynb?mode=playground).

![GATK workflow chart from lecture](./"GATK workflow whiteboard.jpg") insert photograph taken with phone here.

__short summary:__
get data - control, interest
tidy data
analyse data
investigate unexpected findings
infer meaning in reality and implications for clinical therapies of cancer patients.

__TODOs:__
terminology
maybe bit more in summary.

### terminology

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

unordered information item: HCC1143, HC stands for Haplotype Colouring

##### filter this section _until_ tonight for relevant additional information for the workflow chart(s) above

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
So:
  - ...
- variant __calling__, SNV & Indels
- (*1)<= raw variants

> also have general pop. (G pop) => ident. germ l. var. in g. pop.
  > (PON) => Panel of Normals, vital, for bridging the gap between the matched normals and the germline population.
- - -
  - T
  - N
  - G pop
- (*1)<= contamination
- (*1)=> __filtering__
- Funcotator
- functionally annotated Variants	
- - -

### personal notes on the topic

This workspace focuses on the use of _jupyter_ notebooks (.ipynb files).

[GATKTutorials-Somatic new (newest workspace created by Rahel Paloots](https://app.terra.bio/#workspaces/bio392-2021/GATKTutorials-Somatic%20new) - this tutorial is what we needed the gmail address for, log in on `app.terra.bio` (url) is done via google account. On that page, just go through the tutorial and document the workflow in this file.

Today, I will learn about 2 forms of somatic analysis:
- use mutect2 for variant differences to compare tumour and normal samples.
- use the CNA (Copy Number Alterations) workflow for copy number alterations.

Running the actual analysis is (here) done in a jupyter notebook (aka 'notebooks'). For these workflows, some computing power (4 CPUs, 16GB memory, 100GB disk space) is required, which can not be assumed of students' devices, so a cloud computing solution is provided by the course staff. This cloud computing service is run by app.terra.bio, if I'm not mistaken. On this page, the notebooks contain information about the workflow(s) we are learning about, file/data handling, commands for running analyses and commentary to guide us through these __bioinformatics workflows__. The (unedited) file is also downloaded to the directory of this .md file (as notebook and markdown file).

#### mutect2 enabled somatic analysis

> We will be using IGV (Interacive~ Genomic Viewer) in this tutorial to view BAM and VCF files. In order to do so without downloading each individual file, we will connect IGV with our google account.
>
> - Download [IGV](https://software.broadinstitute.org/software/igv/download) to your local machine if you haven't already done so.
> - Follow [these instructions](https://googlegenomics.readthedocs.io/en/latest/use_cases/browse_genomic_data/igv.html) to connect your Google account to IGV.

##### data

Data associated with this workflow is in this [google bucket](https://console.cloud.google.com/storage/browser/gatk-tutorials/workshop_2002/3-somatic/?project=broad-dsde-outreach&organizationId=548622027621) containing input resource files for mutect2 and CNA workflows and precomputed outputs.
