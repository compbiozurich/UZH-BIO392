# **Resources for Genome Analysis and Genomic Research**

&nbsp;

Over the course of the last century, the analysis & understanding of the human genome has become an essential part of many fields of medicine and biology. Most notably with cancer, the discovery and annotation of specific genomic alterations has lead to enormous progress towards various treatments. Since specific cancer types tend to respond very differently to the same treatments, an accurate understanding of all possible alterations and their respective treatments is necessary. The identification of these mutations is aided by various online tools, which are often available for free. Other tools not specific to cancer are also readily available free of charge and can be used to investigate the conservation of specific genome regions, genetic diseases and more.

The success of these tools and personalized medicine depends on a few key elements:

* High throughput, cost effective genome sequencing facilities and technologies
* Standardized data/genome and annotation formats
* Sharing of data & annotations between institutions and online tools

&nbsp;

## Miscellaneous Resources for Genomic Analysis & Research

* ### [USCS Genome Browser](https://genome.ucsc.edu)

The USCS Genome Browser is an open source genome browser that originated from the Human Genome Project. It is the most widely used genome browser and can be used for the display, annotation, comparison and matching of genomes of many species. Using its graphic interface a multitude of things can be displayed - Regulatory elements, genes, genetic variations, conservation data, etc. 

<p align="center">
<img src="https://github.com/compbiozurich/UZH-BIO392/blob/master/course-results/2021/denis-adamec/images/USCS_Browser.png" width="600">
</p>

* ### [Human Genome Resources at NCBI](www.ncbi.nlm.nih.gov/projects/)

This browser is focused solely on the *human* genome. It is the main entry point for genome reference data and contains human genome assemblies as well as variant collections.


* ### [MolecularMatch](https://www.molecularmatch.com)

MolecularMarch is a tool that allows for the matching of different genetic alterations. Like other tools, it also suggests diagnosis and prescription options pertaining to the specific alterations.

&nbsp;
&nbsp;

## Cancer Specific Resources:

Cancer cells contain more genetic variation than healthy cells (usually ~15% of the genome is in an imbalanced state), but only a very small fraction of these additional mutations directly influence the cancerous behaviour of these cells. These mutations are referred to as "driver mutations" and are at the center of cancer therapy research. 

These driver mutations range from very small mutations (e.g. di-pyrimidine exchange at p53, can lead to Xeroderma Pigmentosum) to entire chromosomal losses (for example in CRC) or large copy number imbalances, such as MYCN gene amplification. The presence and intensity of such a copy number imbalance can be measured using the online tool ["Array Map"](https://arraymap.progenetix.org/progenetix-cohorts/arraymap/), which yields a graph that represents the relative gene dosis of a chosen genome 

<p align="center">
<img src="https://github.com/compbiozurich/UZH-BIO392/blob/master/course-results/2021/denis-adamec/images/Screenshot_MYCN.png" width="600">
</p>



* ### [Cancer Genome Interpreter](https://www.cancergenomeinterpreter.org/home)

The Cancer Genome interpreter is a tool used primarily for the identification of oncogenic alterations in a known cancer genome.
In order to identify an alteration (point mutation, block substitution, indel, complex indel, etc.) specific input formats have to be used.
Additionally, the match can be attempted to a specific cancer type or a generic cancer type should the specific type be unknown. 
Two reference genomes (hg37 and hg19) can be used.

Upon succesful identification of an oncogenic alteration, potentially effective prescriptions are directly displayed: 

<p align="center">
<img src="https://github.com/compbiozurich/UZH-BIO392/blob/master/course-results/2021/denis-adamec/images/CGI_Result.png" width="600">
</p>


* ### [Clinical Interpretation of Variants in Cancer](https://civicdb.org/home)

Another resource which can be used to interpret identified alterations in cancer genomes. Approximately 455 genes and a total of 2854 variants are catalogued in this database.


* ### [Cancer Driver Log](https://candl.osu.edu/)

Cancer driver log is similar in functionality to the first two resources, with the added functionality of classifying entries into four levels of evidence:


1. Alteration has matching FDA approved or NCCN recommended therapy.
2. Alteration has matching therapy based on evidence from clinical trials, case reports, or exceptional responders.
3. Alteration predicts for response or resistance to therapy based on evidence from pre-clinical data (in vitro or in vivo models).
4. Alteration is a putative oncogenic driver based on functional activation of a pathway.


This allows for easy decisions on the potential of different suggested prescriptions.

## General Overiew for Cancer Specific Resources


<p align="center">
<img src="https://github.com/compbiozurich/UZH-BIO392/blob/master/course-results/2021/denis-adamec/images/Cancer_Overview.png" width="800">
</p>
