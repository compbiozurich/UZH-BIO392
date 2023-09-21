# BIO392 - Sequence analysis: practical

contact: Max Verbiest, max.verbiest@zhaw.ch

Practical for the course "Bioinformatics of Sequence Variation". This project aims to introduce a standard bioinformatics pipeline, which includes short-read sequence alignment, variant calling, and variant interpretation. Specifically, the aim will be to identify short tandem repeat (STR) variants from sequencing data, and to interpret their effects. 

You will be provided with (simulated) sequencing data from three tumours. Given these samples, your task is to align them to a reference genome, process the alignment, and look for genetic variants. Finally, you will need to investigate the possible functional effects of any detected variant to see if they could be relevant in the context of cancer.

*Note: to keep this process managable, we will focus on only a single gene: the APC gene. The reference sequence can be found in `data/reference/`. The sequencing reads that you'll be using from this project were simulated from the APC reference sequence using [wgsim](https://github.com/lh3/wgsim).*


## Background  

Short tandem repeats (STRs) are consecutive repetitions of 1-6 basepair (bp) motifs. They are estimated to make up around 3% of the human genome. Below is an example STR locus:  

![](images/str_example.png)  

STRs are a rich source of genomic variation, with some loci having mutation rates up to a 10'000 times higher than point mutations. STR mutations are typically the result of DNA polymerase slippage during replication, where strand misalignment after polymerase detachment results in the insertion or deletion of one or more repeat units at an STR locus:  

![](images/str_slippage_example.png)

The role that STR mutations play in cancer is an area of active investigation. For more background on STRs, the way they mutate, and why they are relevant, you can have a look at this [review](https://onlinelibrary.wiley.com/doi/full/10.1111/jeb.14106). Reading the Abstract & Introduction sections provide an overview of our current knowledge of STRs. The later sections are more of a deep-dive into specific STR characteristics.

# Part 1: analysis

## Setting up  

To get started, download the `project-day-08.tar.gz` archive from the course GitHub. Save it to a directory of your choice, and unzip it (either by double clicking it in the Finder, or by running `tar -xvzf project-day-08.tar.gz` from the command line). Navigate to the `project-day-08` folder in a terminal and set up the conda environment as follows:  

```sh
conda env create -f environment.yaml
```

Once all the dependencies are installed, activate the environment like this:  

```sh
conda activate BIO392-practical
```

As long as you keep working in this environment, you will have all the tools available to complete this practical!

## Short read alignment and processing

Navigate to the folder `project-day-08/scripts/` in your terminal. Here, you will find several numbered bash scripts to run the bioinformatics workflow for this project. The first script `00_index_reference.sh` will generate several indices of the reference genome, which we will need to efficiently perform downstream analyses such as alignment and variant calling. Run the script from your terminal: `./00_index_reference.sh`, confirm that index files appear next to the reference sequence in `data/reference`, and **answer Q1**.

**Important: make sure you are in the `scripts/` directory when running the scripts, otherwise they will not work properly**

The first script (`01_alignment.sh`) maps the sequencing reads to the *APC* reference sequence. Run this script and confirm that three `.sam` files are generated under `data/alignments`. Next, run the script `02_process_alignments.sh`. Confirm that for each `.sam` file, there is now also a `.bam` and a `.bam.bai` file. Open the scripts themselves as well in a text editor: look at the different steps it performs and read the comments. **Answer Q2.**

## STR genotyping using GangSTR

Inspect the file `03_run_gangstr.sh`. This script will launch GangSTR - and STR genotyping tool - and deposit the output files in the `results` folder. GangSTR needs to know about several files in order to call STR genotypes, which is what the different command line arguments that you see in the script are for. Make sure you understand what each of these files are and **answer Q3**. 

You can get more information on GangSTR by checking the documentation in [the GangSTR Github repo](https://github.com/gymreklab/gangstr). Additionally, you can get usage information by running the following in your terminal: 

```sh
GangSTR --help
```

Once you understand the information GangSTR needs and why, run the script `03_run_gangstr.sh`. This should generate three output files per sample: one with extension `.vcf.gz`, one with `samplestats.tab`, and one with `insdata.tab`.

## Combining VCF files
The final script for today is `04_process_vcfs.sh`. Open it up to see what it does, then run it. This should generate the results that we will analyse in the "BIO392 - Sequence analysis: interpretation" session. If you have time to spare, browse the `merged_results.vcf` file in a text editor and try to figure out what it contains (don't worry if you don't manage, you will have more time for this in a later session). 
*Hint: look at the [VCF format specification](https://samtools.github.io/hts-specs/VCFv4.4.pdf)*

**--END OF PART 1--**

# Part 2: interpretation

In the last session we went through a general bioinformatics pipeline that generated variant call files (VCF) describing our sequencing data. Today, we will learn more about VCF files and how to work with them programatically to detect STR variants. Subsequently, we will try to interpret the possible effects of any mutations we find using the integrative genomics viewer (IGV) web app and Ensembl's variant effect predictor (VEP) tool. There is also a new markdown file with questions: `questions-day-10.md`.

## Understanding VCF
The bioinformatics pipeline generated two output files in the `results` folder: `merged_results.vcf` and `merged_results_summary.tsv`. The summary file was generated from the VCF file by bcftools and contains a subset of information. Open both files in a text editor and browse their contents. Also take some time to look at the [VCF format specification](https://samtools.github.io/hts-specs/VCFv4.4.pdf). Please don't read the whole thing! It should suffice to read the the first few paragraphs and section "1.6.1 Fixed fields". Once you know what the columns CHROM, POS, REF, and ALT mean, you are ready to proceed and **answer Q1 and Q2##.

## Identifying STR variants
Now that you have some understanding of the VCF format, you will parse the results files and identify STR loci for which one or more patient(s) have a variant in their genome. You will this using a jupyter notebook. To start the notebook, run the following from the `project-day-08` directory:

```sh
jupyter notebook notebooks/identifying-variants-day-10.ipynb
```

This should open the notebook in your browser. Work through it and return here once you've identified the STR variant(s).

## Inspecting STR variants in the IGV web app
Open the [IGV web app](https://igv.org/app/) in your browser of choice. For now, it just look like this:

![](images/IGV_empty_example.png)

By default, the human reference genome 'GRCh38' is loaded in the viewer. However, we want to use our custom APC reference sequence. Click on the `Genome` button in the top left, and select `Local File...`. You will then be prompted to select a file to upload. Navigate to the `data/alignments/` folder, select `APC.fa` AND `APC.fa.fai` at the same time, and press `Open`, like so: 

![](images/IGV_upload_reference.png)

The IGV web app should now display the reference sequence. You can even inspect the sequence at the nucleotide level if you zoom in a bit, although this is not very interesting by itself:

![](images/IGV_just_APC.png)

Let's add some of the other information we have available! Press the `Tracks` button at the top, choose `Local File...` again, and upload the `merged_results.vcf` VCF file generated by bcftools (this file does not need an index). Next, upload the two files in `data/genome_annotation` at the same time (the files ending in `.gtf.gz` and `.gtf.gz.tbi`). This pair of files is are a GTF file and it's index. GTF is a file format for annotation genomic sequences. This particular GTF file tells us where the transcript, exons, and coding sequences of the APC gene are located. Finally, we can add our alignment files to the genome viewer. Add them via `Tracks`, `Local File...` and just select all three alignments (`.bam`) and their associated indexes (`.bam.bai`) at the same time (so six files in total). After uploading all information, the final result should look something like what is shown below (once you zoom in a bit). Take a moment to look at the different tracks, **answer Q3**.

![](images/IGV_complete.png)

## Interpreting an STR variant's impact

So we've identified STR variants in our sequencing samples, how do we interpret these? Luckily for us, Ensembl has a tool called the [Variant Effect Predictor](https://www.ensembl.org/Tools/VEP). It allows us to upload our identified variants, and the tool will compare it to other resources to predict whether there is a functional impact for our variant.

You can now paste the first 5 columns of the STR variants from your VCF file into the `Input data` field of the VEP tool. However, we first need to modify the VCF entries a bit: First, because we used only the APC gene sequence in our analysis, the genomic coordinates in our VCF file do not reflect the true coordinates in the humsn reference genome (which is what VEP uses). The APC sequence I extracted for this project starts at chromosome 5, position 112702498. Therefore, to convert from our coordinate system to GRCh38 coordinates, we just need to add 112702498. Additionally, VEP expects chromosome identifiers just as a number, not prefixed with `chr`, as we currently have them.

So, if this is a VCF entry for an STR variant you identified:

```
chr5	89325	.	ctgctgctgctgctg	ctgctgctg
```

You should modify it to look like this:

```
5	112791823	.	ctgctgctgctgctg	ctgctgctg
```

Once your variant is in the correct format, paste it into the `Input data` field, and press `Run >` at the bottom of the page. After a moment, you will be taken to this page:

![](images/VEP_queued_job.png)

Once your job status changes from `Queued` to `Done`, click `[View results]` to explore what information VEP found for the STR variants. Take some time to explore the output, and follow the links VEP provides to get additional information on STR variants. **Answer Q4 and Q5.**

**--END OF PART 2--**