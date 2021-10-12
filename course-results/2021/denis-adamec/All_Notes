# Day 1

## Notes about the Initial Reading Material

* ### Finding the Rare Pathogenic Variants in a Human Genome
  *

* ### The Sequence of Sequencers
  *

* ### 1000 Genomes Paper
  *

* ### Genome Structural Variation Discovery and Genotyping
  *
  
  
# Day 2

## Resources for Genome Analysis and Genomic Research

Over the course of the last century, the analysis & understanding of the human genome has become an essential part of many fields of medicine and biology. Most notably with cancer, the discovery and annotation of specific genomic alterations has lead to enormous progress towards various treatments. Since specific cancer types tend to respond very differently to the same treatments, an accurate understanding of all possible alterations and their respective treatments is necessary. The identification of these mutations is aided by various online tools, which are often available for free. Other tools not specific to cancer are also readily available free of charge and can be used to investigate the conservation of specific genome regions, genetic diseases and more.

The success of these tools and personalized medicine depends on a few key elements:

* High throughput, cost effective genome sequencing facilities and technologies
* Standardized data/genome and annotation formats
* Sharing of data & annotations between institutions and online tools

### Miscellaneous Resources for Genomic Analysis & Research

* #### [USCS Genome Browser](https://genome.ucsc.edu)

The USCS Genome Browser is an open source genome browser that originated from the Human Genome Project. It is the most widely used genome browser and can be used for the display, annotation, comparison and matching of genomes of many species. Using its graphic interface a multitude of things can be displayed - Regulatory elements, genes, genetic variations, conservation data, etc.

<p align="center">
<img src="https://github.com/compbiozurich/UZH-BIO392/blob/master/course-results/2021/denis-adamec/images/USCS_Browser.png" width="600">
</p>


* #### [Human Genome Resources at NCBI](www.ncbi.nlm.nih.gov/projects/)

This browser is focused solely on the *human* genome. It is the main entry point for genome reference data and contains human genome assemblies as well as variant collections.


* #### [MolecularMatch](https://www.molecularmatch.com)

MolecularMarch is a tool that allows for the matching of different genetic alterations. Like other tools, it also suggests diagnosis and prescription options pertaining to the specific alterations.


### Cancer Specific Resources:

Cancer cells contain more genetic variation than healthy cells (usually ~15% of the genome is in an imbalanced state), but only a very small fraction of these additional mutations directly influence the cancerous behaviour of these cells. These mutations are referred to as "driver mutations" and are at the center of cancer therapy research.

These driver mutations range from very small mutations (e.g. di-pyrimidine exchange at p53, can lead to Xeroderma Pigmentosum) to entire chromosomal losses (for example in CRC) or large copy number imbalances, such as MYCN gene amplification. The presence and intensity of such a copy number imbalance can be measured using the online tool ["Array Map"](https://arraymap.progenetix.org/progenetix-cohorts/arraymap/), which yields a graph that represents the relative gene dosis of a chosen genome

<p align="center">
<img src="https://github.com/compbiozurich/UZH-BIO392/blob/master/course-results/2021/denis-adamec/images/Screenshot_MYCN.png" width="600">
</p>

* #### [Cancer Genome Interpreter](https://www.cancergenomeinterpreter.org/home)

The Cancer Genome interpreter is a tool used primarily for the identification of oncogenic alterations in a known cancer genome.
In order to identify an alteration (point mutation, block substitution, indel, complex indel, etc.) specific input formats have to be used.
Additionally, the match can be attempted to a specific cancer type or a generic cancer type should the specific type be unknown.
Two reference genomes (hg37 and hg19) can be used.

Upon succesful identification of an oncogenic alteration, potentially effective prescriptions are directly displayed:

<p align="center">
<img src="https://github.com/compbiozurich/UZH-BIO392/blob/master/course-results/2021/denis-adamec/images/CGI_Result.png" width="600">
</p>


* #### [Clinical Interpretation of Variants in Cancer](https://civicdb.org/home)

Another resource which can be used to interpret identified alterations in cancer genomes. Approximately 455 genes and a total of 2854 variants are catalogued in this database.


* #### [Cancer Driver Log](https://candl.osu.edu/)

Cancer driver log is similar in functionality to the first two resources, with the added functionality of classifying entries into four levels of evidence:


1. Alteration has matching FDA approved or NCCN recommended therapy.
2. Alteration has matching therapy based on evidence from clinical trials, case reports, or exceptional responders.
3. Alteration predicts for response or resistance to therapy based on evidence from pre-clinical data (in vitro or in vivo models).
4. Alteration is a putative oncogenic driver based on functional activation of a pathway.


This allows for easy decisions on the potential of different suggested prescriptions.

### General Overiew for Cancer Specific Resources


<p align="center">
<img src="https://github.com/compbiozurich/UZH-BIO392/blob/master/course-results/2021/denis-adamec/images/Cancer_Overview.png" width="800">
</p>


Day 3

# Day 03 - File Formats & UNIX

## Variant Calling Flow

*
*
*
*
*
*
*

## Standard File Formats

### General Information

#### Genome Assemblies

* Primary Assembly: Best known assembly of a haploid genome
* Alternate Loci: Altermate representation of a locus e.g. with high genetic variability
* Patches: Sequence that is released outisde of the full assembly, such as fixes or novel sequences
* New genome assemblies are not assembled from scratch, but mapped to reference genomes

#### Data Storage Efficiency

* Storing the Genome Sequence as a Master Sequence and referring to this Master Sequence (e.g. through chromosome number, start and end) allows for much more efficient compression and handling
* All file formats use **coordinates**, not sequences
* Human genome ~0.8 GB in size (could include: Telomeres, Haplotypes, etc.)

#### Reference Genomes

* Multiple assemblies exist (e.g. hg18, hg19, hg38)

#### Reproducibility

* Commands like UNIX have to be used, since manual spreadsheet editing (such as excel) is not reproducible
* Use scripts
* Use data standards
* Using control-version systems

#### Phred Scores

* Originated from Sanger Sequencing
* Represent the quality of a sequence
* Example: Probality of error 1/10 -> Phred Score 10
* Example: Probability of error 1/1'000'000 -> Phred Score 60
* Phred Scores are encoded into single characters differently for each Sequencing Technology -> Need to be aware with which technology the sequence was obtained

#### Counting in File Formats

> ---a-----b---

* Fully Closed: **Both** a and b are included
* Fully Open: **Neither** a or b are included
* Half Open: **Only a** is included

> 0-1-2-3-4-5

* 0-based: The first index is zero
* 1-based: The first index is 1

1. 0-based, half open: [0, 2] = *0 1*
2. 0-based, fully closed [1, 3] = *1 2 3*
3. 1-based, fully open [1, 3] = *1 2*

Transforming

* From 1-based to 0-based: Subtract 1 from every index (UNIX: `2$ -1` subtract 1 from second column)
* From 0-based to 1-based: Add 1 to every index (UNIX: `3$ +1` subtract 1 from third column)

<p align="center">
<img src="https://github.com/compbiozurich/UZH-BIO392/blob/master/course-results/2021/denis-adamec/images/Format_Counting.png" width="600">
</p>


### Formats

#### Fasta

1. First Line contains **General Information**
2. Second Line (and all lines thereafter) contain the **Nucleotide Sequence
* Contains no information about data quality

#### FastQ (.fq)

1. Identifier: First line is **General Information**
2. Sequence: Second Line is the **Nucleotide Sequence**
3. Seperator: Third line is a **Seperator** (e.g. "+" or "&")
4. Quality: Fourth line contains **Phred Scores** for each individual nucleotide (Scores from 1-60 are encoded in a single character)

* How to get only sequences? Use Modulo (%% in R) `Select all lines where "line %% 4 == 2"`
* In UNIX: `awk 'NR % 4 == 2' file.txt` will print all the lines that we want
* Transforming FastQ into Fasta: `awk 'NR % 4 == 1 {print ">"$1}; NR % 2 {print}' file.fasta`

#### SAM (Sequence Alignment Map) - Depreceated, everybody uses BAM

1. Chromosome Number, Starting Coordinate, etc.
2. Locus
3. CIGAR String i.e. 20M1D2M - 40 bases continuously match, 1 deletion from reference, 2 base match
4. Some Flags (which strand the mapping is on, whether mapping is global or local, what kind of error & how many, etc.)

<p align="center">
<img src="https://github.com/compbiozurich/UZH-BIO392/blob/master/course-results/2021/denis-adamec/images/SAM_Structure.png" width="800">
</p>

#### BAM (Binary Alignment Map)

Analogue to SAM file, but binary & compressed.

#### BED (Browser Extensible Data)

BED files are for storing the *features* of reads by coordinates, not their actual sequence, for example:
* RNA-seq: Expression level per gene
* Chiq-seq: Binding per bin
* Variant calling: Varian detection

!!! There is no standardisation on whether coordinates start at 0 or 1. Pay Attention.

BED3: 3 tab seperated columns: Chromosome | Start | End
> Chr22 1000 5000

BED: 6 tab seperated columns: Chromosome | Start | End | Name | Score | Strand
 > Chr22 1000 5000 cloneA 960 +

#### GFF3

* Used for storing genomic annotations (genes, exons, start codons, etc.)
* Start and Stop Codons have to be associated to their respective genes. This is done via the attribute column
* Phase indicates in which reading frame (e.g. if you're starting from the first, second or third base) the  translation occurrs most likely (reading frames with lots of stop codons are very unlikely to code for genes)

<p align="center">
<img src="https://github.com/compbiozurich/UZH-BIO392/blob/master/course-results/2021/denis-adamec/images/GFF3_Overview.png" width="800">
</p>

#### Wiggle Files (Wig)

* Displays continuous-value data (GC percent, probability scores, etc.)
* Specifies the chromosome (once per file), the nucleotide and the score pertaining to that specific nucleotide
* If a score applies to multiple nucleotides, a "span" can be added in the first line (e.g. `span=5`)
* If the score should change after a certain amount of nucleotides, a "step" can be added in the first line (e.g. `step=100`)
* Example: `step=100 span=5` 100-104 will be the same, 200-204 will be the same, etc.
* Scores that are saved in Wig files are usually representet as very continuous graphs in the UCSC (e.g. conservation values)

#### VCF

* Standard file format for storing variation data
* Unambiguos, scalable and flexble
* contains 8 columns

<p align="center">
<img src="https://github.com/compbiozurich/UZH-BIO392/blob/master/course-results/2021/denis-adamec/images/VCF_Overview.png" width="800">
</p>



## Manipulation Using UNIX Tools

### Miscellaneous

* `ctrl + c` sends kill signal to stop running command (doesn't always work)

### Directory Navigation

* `command a | command b` = send the result from command a to command b with buffering (i.e. b waits until a is finished)
* `pwd` prints the working directory
* `cd ..` goes to parent
* `cd ~/folder` goes to folder
* `ls` list directories inside current directory
* `ls -l` list with more information
* `ls -lh` list with more information, human accessible
* `mkdir folder` create a new directory named "folder"
* `rmdir folder` deletes folder

### File Observation & Manipulation

* `cp`  copy file
* `mv` move file
* `cat file.txt` shows content of file
* `less file.txt` shows browser to browse content of file
* `head file.txt` shows first 10 lines of file
* `tail file.txt` shows last 10 lines of file
* `grep` search for strings in files
* `wc` count words
* `print $2` only prints the second column
* `sed 's/X/Y/g'` modify all X to Y (g at the end means "for all instances") e.g. echo 'Hello World' | sed 's/Hello/Hi/g' -> Hi all
* `awk 'NR % 4 == 2' file.txt`  Gives every fourth line starting with the second line
* `awk 'NR % 4 == 1 {print ">"$1}; NR % 2 {print}' file.fasta` Transforms FastQ into Fasta


# Day 4

# Day 4 Notes

## Genomic File Formats

### General

* A single Base (TCGA) can be encoded using 2 bits (00, 01, 10, 11)
* Single genome without metadata or anything else (just Nucleotide Sequence) ~715MB
* On average (with backups & more) ~50CHF/Genome

### VCF (Variable Call File)

* Header of VCF File might have to be inspected manually to determine if the parser will be able to read the file.
* Stores results of a single or multiple interpretations of genome sequencing datasets in comparison to a reference genome
* Can store data from single or multiple experiments
* Since the same mutations are stored in a single line, VCF becomes very efficient when dealing with recurring alleles (instead of 10'000 lines, only one has to be written)


## Genome Editions

* Genome Liftover: Mapping data from one genome edition to another one

## Genome Size

* Storage of an entire Exome with 40x Coverage: Corresponds to 110'000'000 reads @ 75bp/read results in a 5.7GB BAM file. Since this file should be backed up at least once, that comes to a minimum of 11.4GB for a single Exome
* Storage of an entire genome with 38.4x Coverage: Correspons to 3'200'000'000 reads @ 36bp/read results in a 138GB BAM File --> 276GB with a single Backup
* With Amazon, the most expensive data storage rate is 0.023USD/Month. For a single whole genome + backup that comes to ~6USD/Month per genome. There are certainly much cheaper options available.

## Segment_Liftover

* Tool for the conversion of genome coordinates between different genome assemblies
* Since lots of data may be available on one genome editions but not a newer one, the so called "lift-over" of this data (alterations, Gene functions etc.) from one genome edition to another is a very essential process
* Can be used for both probe files and segment files
* Depends on the UCSC liftOver program and a chain file between the two genome assemblies (can be obtained from the USCS Genome Browser)
* There are certain genetic elements that can cause slight problems with the conversion. These include Telemores, Centromeres & other gene-sparse locations.


# Day 5



### Bioinformatic tools & Programs

* Versions always need to be tracked
* Use Package and download managers to make sure everything is correct & reproducible

* Makefile: Translates source code to executables
* Increases performance and optimises software execution for the host OS

### Transposable Elements

* Lots of repeated DNA Sequences can be found in our DNA (Tandem Repeats, Transposons, etc.)
* Can be classified into: By Nature (DNA Transpsons or Retrotransposons)


# Day 6

## Variants and diseases

### [Relational list using ClinVar](https://www.ncbi.nlm.nih.gov/clinvar/)

|Disease|Gene|Variants|
|-------|----|--------|
|Hemochromatosis|HJV|NM_213653.3:c.959G>T|
|Thalassemia|HBB|NC_000011.10|
|Haemophilia|F8|NC_000023.11|
|Cystic Fibrosis|CFTR|NC_000007.14|
|Tay sachs disease|HEXA|NC_000015.10|
|Fragile X syndrome|FMR1|NC_000023.11|
|Huntington's disease|HTT|NC_000004.12|



### [Relational list using ClinGen](https://clinicalgenome.org/)
|Gene|Gene name|Chromosomal location|Gene product|Disease|
|----|---------|--------------------|------------|-------|
|CFTR|CF transmembrane conductance regulator|7q31.2|Ion channel located in the Epithelium which transports chloride ions across the cell membrane.|Cystic fibrosis|
|CYBB|cytochrome b-245 beta chain|Xp21.1-p11.4|Essential component of membrane bound oxidase of various phagocytes that generates superoxide.|Granulomatous disease, chrinic, X-linked|
|HJV|hemojuvelin BMP co-receptor|1q21.1|Coreceptor of bone morphogenetic protein (BMP) .|Hemochromatosis type 2A|
|CDKN2A|cyclin dependent kinase inhibitor 2A|9p21.3|Interacts strongly with CDK4 and CDK6 and therefore acts as a negative regulator of the proliferation of normal cells. The ability to interact with cyclins D and to phosphorylate the retinoblastoma protein is inhibited.|Melanoma-pancreatic cancer syndrome|
|KRAS|KRAS proto-oncogene, GTPase|12p12.1|Ras proteins bind GDP/GTP and possess intrinsic GTPase activity.|Noonan syndrome|
|TP53|tumor protein p53|17p13.1|Widespread tumor suppressor.|Li-Fraumeni syndrome 1 & familial ovarian cancer|
|FMR1|FMRP translational regulator 1|Xq27.3|Multifunctional polyribosome-associated RNA-binding protein. Plays a central role in neural development and synaptic plasticity through the regulation of alternative mRNA splicing, mRNA stability, mRNA dendritic transport and postsynaptic local protein synthesis of a subset of mRNAs.|Fragile X syndrome|


# Day 8

#### Why is it imprtant to construct a CNV map on health individuals of various ethnicities
* If one were to construct a CNV map using only individuals from a single race, it wouldn't be possible to apply this model t o everyone, since people of the same race tend to share similar gene pools - this can lead to biases during the processing of the data.

#### What is the CNV size that the authors defined?
* The authors determined that 4.8 - 9.7% of the human genome contributes to CNVs

#### What are the primary approaches used for CNV detection? And what are the advantages and limitations for these technologies?
* microarrays & NGS Advantages: Fast, precise | Disadvantages: Expensive 

#### The authors used clustering method to combine data from different studies into merged CNVRs (Copy number variable regions). What are the two criteria for cluster filtering? And why did they do this filtering?
* A CNVR-clustering algorithm was used to identify sets of variants in which every possible variant pair had at least 50% reciprocal overlap. The clusters were then filtered on the basis of the number of distinct subjects that carry the variant and the number of distinct studies with at least one variant ain the cluster.
This filter excluded singletons 

#### What are thresholds in stringency level 1, inclusive map (stringency level 2), and stringent map (stringency level 12) respectively?
* Stringency level 1: At least one subject & one study for each variant
* Stringency level 2: At least two subjects & one study for each variant
* Stringency level 12: At least two subjects and two studiess

#### Which percentage of the genome contributes to CNV in inclusive map and stringency map respectively?
* Inclusive Map: 9.5%
* Stringency Map: 4.8%

#### By your intuition, which kind of genes are more variable between protein-coding genes and non-coding genes? How about their findings in this paper?
* By Intuition, the non protein-coding genes should be more variable
* The findings: Promoters contained a lot more CNVs than the rest of the entire genome

#### The authors generated a null CNV map and found genes for which at least 85% of the exons were homozygous deleted. What are the functions of these genes? And why did the authors say that they seem to be non-essential?
* They may be related to late-onset phenotypic consequences that do not substantially reduce fitness. I.e. Age-Related Phenotypes

#### If you are a medical doctor, how do you use this map as a tool to assess the clinical importance of a CNV
* Multiple criteria have to be considered: Is the CNV found among the CNVRs of the CNV map & whether it overlaps with medically relevant genes. A list of medically relevant genes which involve CNVs has already been created.

# Day 9

## Day 9 - Survival | Classifications

### The Kaplan-Meier Method

* Most commen method to estimate survival fraction
* Time is divided into intervals, at each interval the number of "observed" individuals in the group is measured --> Probabilistic Model to predict the future
* The probability for each time interval is calculated. If an event occurs, all the probabilities are calculated again
* Censoring markers indicate when an event occured that changed the probabilistic calculations
* 


### Cancer Classifications & Parameters

#### ICD-O 3

* Diseases have to be classified in specific formats
* Mix of biology - tumor morphology - and clinical - tumor site
* 2 codes per cancer: 8140/3   C18.7
* first code describes tumor morphology (8140/3), second code describes sigmiod colon (C18.7)
* Unfortunately no ontology & not truly hierarchical
* 


#### NCIt

* One code per cancer
* Nice hierarchical ontology
* Group queries with logical "OR" conditions are possible


#### TNM

* Most widespread cancer staging system
* T = Size & Extent of main Tumor
* N = Number/Location of nearby lymph nodes that have cancer infiltration
* M = Metastized Yes/No
* X = we don't know
* T2NXMX = only T is known
* Not used for leukemias & lymphomas


# Day 10


## GATK

1. Raw Sequence and Reference Sequence are aligned --> Aligned BAM
2. Mark duplicates in the BAM file
3. Realign
4. Alanysis ready BAM sequence is obtained


## App.Terra.Bio

**Setup** - Setup of the Virtual Environment + Installation & Google login of Integrative Genomics Viewer (IGV)

1.  Somatic Short Mutations on the HCC1143 Tumor Sample and matched normal are called using Mutect2 

This yields A raw unfiltered somatic calmest & a BAM containing reassembled alignments

2. The second step is to create a panel of normals (PoN) - A top of resource used in somatic variant analysis. They are made from "normal" (healthy) samples and their purpose is to capture recurrent technical artefacts in order to improve the results of the variant calling analysis. It should include technically similar samples that were sequenced on the same sequencing platform. 

The PoN is achieved by running mutect2 in tutor only mode n each normal BAM individually, creating a genomicsDB from these normal Mutect2 calls & combining the normal calls sing the function to create a somatic PoN.

3. The unfiltered calmest from step 1 now has to be filtered to determine which mutation candidates are most likely real somatic mutations

To achieve this, cross-sample mutation is estimated using two tools: `GetPileupSummaries` and `CalculateContamination`. `GetPileupSummaries`  tabulates read counts that support REF, AT and OTHER alleles for the specified sites in the resource. This produces a table with 6 columns: 
Contig (the Chromosome) **//** Position **//** Ref_Count **//** Alt_Count **//** Other_Alt_Count **//** Allele_Frequency
The Alt_Count column is the count of reads that support the ALT allele in the germline resource.
`CalculateContamination` can calculate contamination more accurately at sites where variant alleles are rare in the population. Sites where alternate allele frequency is high contain a lot of contamination, so these don't give much information. The results are given in a table with 3 columns:
Sample **//** Contamination **//** Error
In the end, the contamination + error values inform us of which allele fractions should be treated with scepticism. If the error is 0.02 and the allele fraction of a specific call is 0.015, it is likely that it is simply contamination

3. In this step the tool `FilterMutectCalls` is used to filter a small data vcd file. In the output VCF Call file, calls that are likely true positives get the **PASS** label, while others are labeled with the reason for filtering.

4. IGV

In IGV, the mapped reads can be seen in the 2_tumor_normal_m2.bam track. A single SNV (C>T) is highlighted in red.


## Introduction to Genome Versions / Liftovers

### The Reference Genome

* First reference genome was obtained from multiple individuals using sanger sequencing
* New reference genomes become available due to more data (e.g. additional locations) being discovered that needs to be integrated into the reference genome

#### Questions

1. Name & Time of the lastest version for Human, Mouse and E. Coli
	* *Human: Dec 2013 - GRCh38/hg38*
	* *Mouse: Jun 2020 - GRCm39/mm39*
	* *E. Coli: 1997 - K-12 MG1655 (recently updated and annotated, but no "new" assembly)*
2. Name & Time of the first version for Human, Mouse and E Coli 
	* *Human: July 2003 - NCBI34/hg16*
	* *Mouse: Aug 2005 - NCBI35/mm7*
	* *E. Coli: 1997 - K-12 MG1655*
4. How many reference genomes were released in total for Human, Mouse, and E Coli
	* *Human 5 + Mouse 5 + E. Coli 1 = 11*

* Using old assemblies or migrating to new assemblies can cause significant problems

### USCS Genome Browser

* Graphic visualization tool for genomic data for many different species & annotations
* Liftover tool is offered on the website to transfer between different releases

#### Questions

1. Show gene TP53 in the genome broser
2. Where is this gene?
	* *chr17:7,668,421-7,687,490*
3. How many isoforms does it have?
	* *9*
4. How many exons does it have?
	* *11*
5. What's the size of its longest exon?
	* 
6. Find the three closest genes in upstream and downstream, respectively
	* *ATP1B2, WRAP53 & EFNB3*
7. Switch to hg19 and find TP53
8. What are the start and end positions
	* *chr17:7,571,720-7,590,868*
9. Switch to zebrafish, can you find TP53
	* *yes*
10. Switch to Fruitfly, can you find TP53? 
	* *no*


### Liftovers

* Used to convert data between different genome versions
* The best strategy is to re-align the original data to the target genome version.
	* Disadvantages: Availability of the data & Computational Workload
* More practical solution uses a map table
	* Disadvantages: Some information may be lost

#### Exercises

1. Down-lift: TP53 from hg38 to hg19
2. Up-lift: TP53 from hg19 to hg38
3. Cross-species-lift: TP53 from human to mouse
4. Multi-step-lift: TP53 from hg28 to hg18
5. Liftover multiple positions with a BED file
6. Lift a larger range and interpret the result
7. Limitations of the liftover
	* Often, not all records can be lifted over



# Day 13

## Progenetix & GA4GH

Cancer genomics resource built around and driving GA4GH standards

* Genomic Imbalances in Cancers (CNV)
	* Point Mutations
	* Chromosomal Rearrangements
	* Epigenetic changer (e.g. DNA Methylation abnormalities
	* Regional Copy Number Alterations
	* ~20% of the entire Genome is out of balance in Cancer (on avg. across cancer types)

### Progenetix

* largest open resource for curated cancer genome profiling data (focus on CNVs)
* >116'000 cancer CNV profiles, mapped to 800 NCIT Codes


## Genomic Data & Privacy

* ~5 Million variants per human genome, most are "rare", even fewer are actual driver mutations
* Limited Population Diversity in Cancer studies 
* Data from Genomics trial in Germany cannot be "transported" to US - Leal Barriers etc.
* A federated data ecosystem seeks to share genomic data globally without requiring compatible data sets or compromising patient identity
* Beacons were implemented as a measure to anonymize genomic disease data, but still pose certain security risks, such as the ability to identifiy if individuals are present in disease databases if their genome is known


## Exam

10:00
