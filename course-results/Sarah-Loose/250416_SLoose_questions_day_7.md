# Questions Varant Calling Analysis Pipeline

### Q1

Does the sequence quality graph of your data look different from the examples shown in the slides? Are there any adapter sequences in the data? Why do you think this is? 
For all patients we have a forward and reverese sequenced fastq file. For all 3 patients the data is the same here.
We are dealing with simulated sequence data so the quality scores per base are uniformly ideal and we can´t see a boxplots with a quality estimation. 

<img width="695" alt="grafik" src="https://github.com/user-attachments/assets/e8546183-8b23-498f-b4b8-05821ba78346" />

<img width="400" height = "400" alt="grafik" src="https://github.com/user-attachments/assets/bc5b85a1-d7d7-4d2a-9ec5-f2bba157dbdc" />



### Q2

Given the FastQC reports, does it make sense to perform adapter and/or quality-trimming on your data? 

No, since our read quality does not decrease towards any end in our simulated data. Additionaly, If we navigate to the "Adapter Content" tab, we see no adapter sequences occuring, only minimal poly-A content towards the end of the sequences, which should be fine.

<img width="700" alt="grafik" src="https://github.com/user-attachments/assets/128c4857-6ea2-4709-937a-bbef03055df3" />

### Q3

Why are so many files in the bioinformatics pipeline compressed and indexed? 

We are dealing with immense amounts of data here. Indexed and compressed or binary files can be more easily and quickly navigated, transferred or accessed. 
Indexing allows for easier and faster workflows, since it provides a focus on a target region of interest, which can directly be queried.
Compressed formats are helpful for long-term data storage, reducing cost and environmental impact greatly.


### Q4

In the bash script that processes alignment files, you will see calls to samtools sort, samtools view, and samtools index (among others). 
Explain what these three programs do.
Why do you think each program is needed? 
Hint: look at the Samtools manual. Your answer here



### Q5

Explain what files are needed for GangSTR to run. Specifically: explain what information is provided to GangSTR via the --ref, --region, and --bam command line arguments. Hint: look at the GangSTR manual. Your answer here

### Literature

During the practical so far, you have generated variant calls from short read sequencing data using bioinformatics approaches. Now it's time to take a step back and do some background reading in order to prepare for the analysis and interpretation of the results next week.

First, read the following sections of this review:

    Abstract
    Introduction``
    Genotyping STRs from high-throughput sequencing data Then, answer Q4 and Q5.

### Q6

Why is STR variation relevant to health and disease? Your answer here

### Q7

What are some of the challenges in analysing STRs from NGS data? Your answer here

Second, read the following sections of the paper describing GangSTR:

    Abstract
    Introduction
    Overview of the GangSTR model Then, answer Q6 and Q7.

Q8

What sets GangSTR apart from other STR genotyping tools? Your answer here
Q9
What types of information does GangSTR use for STR genotyping? Your answer here
