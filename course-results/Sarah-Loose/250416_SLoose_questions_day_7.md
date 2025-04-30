# Questions Day 7: Varant Calling Analysis Pipeline, STR and GangSTR

## Q1
**Does the sequence quality graph of your data look different from the examples shown in the slides? Are there any adapter sequences in the data? Why do you think this is?** 

For all patients we have a forward and reverese sequenced fastq file. For all 3 patients the data is the same here.
We are dealing with simulated sequence data so the quality scores per base are uniformly ideal and we can´t see a boxplots with a quality estimation. 


<img width="400" height= "150" alt="grafik" src="https://github.com/user-attachments/assets/e8546183-8b23-498f-b4b8-05821ba78346" />

<img width="400" height = "400" alt="grafik" src="https://github.com/user-attachments/assets/bc5b85a1-d7d7-4d2a-9ec5-f2bba157dbdc" />


## Q2
**Given the FastQC reports, does it make sense to perform adapter and/or quality-trimming on your data?**

No, since our read quality does not decrease towards any end in our simulated data. Additionaly, If we navigate to the "Adapter Content" tab, we see no adapter sequences occuring, only minimal poly-A content towards the end of the sequences, which should be fine.

<img width="500" height = "400" alt="grafik" src="https://github.com/user-attachments/assets/128c4857-6ea2-4709-937a-bbef03055df3" />


## Q3
**Why are so many files in the bioinformatics pipeline compressed and indexed?**

We are dealing with immense amounts of data here. Indexed and compressed or binary files can be more easily and quickly navigated, transferred or accessed. 
Indexing allows for easier and faster workflows, since it provides a focus on a target region of interest, which can directly be queried.
Compressed formats are helpful for long-term data storage, reducing cost and environmental impact greatly.


## Q4
**In the bash script that processes alignment files, you will see calls to samtools sort, samtools view, and samtools index (among others). 
Explain what these three programs do. Why do you think each program is needed? 
Hint: look at the Samtools manual.**

```python
set -euo pipefail

SAMPLES=("patient_1" "patient_2" "patient_3")
for SAMPLE in ${SAMPLES[@]}; 
do
    ALIGNMENT=$(find ../data/alignments/${SAMPLE}.sam -type f);
   
    # Read group information is added to the alignments. 
    # Not strictly correct but we need to add something or GangSTR will complain later.
    samtools addreplacerg \
        -r ID:sim20230830_${SAMPLE} -r SM:${SAMPLE} -r PL:wgsim -r PU:NA -r LB:NA  "${ALIGNMENT}" | \
    # The alignments are coordinate sorted
    samtools sort | \
    # The alignments are compressed
    samtools view \
        --bam > \
        ../data/alignments/${SAMPLE}.bam;
    
    # The alignments are indexed to allow for random data access
    samtools index \
        ../data/alignments/${SAMPLE}.bam;
done
```

### [samtools sort](http://www.htslib.org/doc/samtools-sort.html)
This sorts SAM, BAM and CRAM files. More specifically, it sorts alignments by left-most coordinates. This makes it faster to process the file downstream.

### [samtools view](http://www.htslib.org/doc/samtools-view.html)
This converts and views SAM, BAM and CRAM files. In our case we converted a humam-readable, text-based SAM file into a binary, indexed and compressed BAM file.

### [samtools index](http://www.htslib.org/doc/samtools-index.html)
This indexes SAM, BAM and CRAM files. As can be seen in the script, the created indices allow for fast random data access in specified regions of interest.


## Q5
**Explain what files are needed for GangSTR to run. Specifically: explain what information is provided to GangSTR via 
the --ref, --region, and --bam command line arguments. 
Hint: look at the [GangSTR manual](https://github.com/gymreklab/gangstr).**

GangSTR is used to identify short tandem repeats (**STR**) in a genome based on short reads (obtained by e.g. NGS). 
**Input data:** BAM files (aligned reads)
The above mentioned commands are used to run GangSTR with default parameters.

```
GangSTR --bam file.bam 
        --ref ref.fa 
        --regions regions.bed 
        --out outprefix 
```
**--ref:** this specifies the reference genome that will be used (**fasta** file) to align the repeat regions to.
**--region:** this specifies the tandem repeat target loci, e.g. our regions of interest on a certain chromosome by inputting a **.bed** file.
**--bam:** this enables us to feed the program several **.bam** files containing aligned reads to a reference genome. The files can be listed comma-seperated.

## Literature
During the practical so far, you have generated variant calls from short read sequencing data using bioinformatics approaches. 
Now it's time to take a step back and do some background reading in order to prepare for the analysis and interpretation of the results next week.

First, read the following sections of this review:
- Abstract
- Introduction
- Genotyping STRs from high-throughput sequencing data. Then, answer Q6 and Q7.

## Q6
**Why is STR variation relevant to health and disease?**

Short Tandem Repeats (**STR**) are mutation hotspots due to their repetitive nature, especially for *de-novo* mutations and especially for indels.
We can differentiate between STR expansion or deletion, where STR expansions mostly pathogenic (f.ex.: fragile x Syndrome).

These seemingly non-coding DNA pieces are anything but useless though. They can play a role in Transcriptionfactor binding, regulatory element spacing, DNA hypermethylation or heterochromatinization, may hinder regular splicing or can lead to the formation of Toxic RNA and Protein aggregates.

Examples of pathogenic effects can include polyglutamine aggregation, intronic GGGGCC repeat, which plays a role in ALS pathogenicity, and many more, as can be seen in the figure fron the paper.
  
<img width="684" alt="grafik" src="https://github.com/user-attachments/assets/da0634e4-9d0d-4e06-b530-080d41e1d666" /> [^1]

## Q7
**What are some of the challenges in analysing STRs from NGS data?**

Common challenges in STR analysis from NGS data include that short read sequencing cannot cover longer repeats. Furthermore, large indels are difficult to accurately align to a reference genome, so shorter alleles are disproportionate mapped and thus overrepresented. Additionally, in PCR-based approaches, during library preparation, the number of STRs gets misrepresented
This can be overcome by bioinformatic products like lobSTR. There, mapping bias is overcome by using an entropy-based metric to detect repetitive reads and aligns only the non-repetitive regions to the reference genome. A model of STR stutter errors, which are introduced by PCR-absed approaches, then determine the maximum likelihood genotype at each locus[^1].


Second, read the following sections of the paper describing GangSTR:
- Abstract
- Introduction
- Overview of the GangSTR model .Then, answer Q8 and Q9.

### Q8
**What sets GangSTR apart from other STR genotyping tools?**

GangSTR enables genome-wide analysis of TR from NGS data. This application overcomes previous challenges by using a general statistical model that forms a maximum-likelihood model from the properties of the short paired-end reads from the NGS data. This works for genotyping of normal length and expanded repeats. GangSTR is furthermore more accurate and faster than previous methods.
This tool is not limited to reads shorter than 70 bp or motif repeat lengths of no more than 6 bp like STRetch or HipSTR, which previously was disadvantageous for identifying expanded repeats which play a role in pathogenic trait development.

It is and end-to-end method, that doesn´t only rely on enclosing reads, but that works  by using sequence alignments and a reference set of TRs to construct an estimation of diploid repeat lengths. Ist data source are, as mentioned above, properties of short paired-end reads, from which a maximum likelihood model is constructed that then is applied to every TR genomewide.

This enables one to identify length of a repetitive region, by counting the repeats between enclosing reads. Additionally, information like coverage, frame length and presence of partially enclosing reads is used to construct two types of probability. They constucted 4 classes for their reads, **E** for enclosing, **S** for spanning reads (they cover the entire repeat length), **F** for flanking read pairs and **FRR** for fully repetitive read pairs.

Then 2 types of probability are computed: class probability, if the read pair of a certain class can be observed based on the. True genotype and read probability  for predicting read pair properties[^2].


### Q9
**What types of information does GangSTR use for STR genotyping?**
- short paired-end read data from NGS (coverage, frame length, content of enclosing reads)
- Read classification (class: E, S, F, FRR and read probability)





[^1]: [A genomic view of short tandem repeats](https://doi.org/10.1016/j.gde.2017.01.012)
[^2]: [Profiling the genome-wide landscape of tandem repeat expansions](https://doi.org/10.1093/nar/gkz501)
