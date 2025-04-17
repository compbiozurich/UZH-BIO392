# Day VII – STR 
#### Sandrin Hunkeler  (MSc. in Informatics)



## Q1  
Does the sequence quality graph of your data look different from the examples shown in the slides? Are there any adapter sequences in the data? Why do you think this is?

#### Answer

My plot differes a lot from the reference on the slides. My data was created artificially and has an uniform quality. This results in a very thin and barely visible bloxplot. This indicates no variation in quality across positions. I assume no adapter sequences in the generated dataset. This, since adapters are used for aligning sequences and are introduced for practical reasons. The sequences of the adapters are known in advance and therefore removed for improved quality.



## Q2  
Given the FastQC reports, does it make sense to perform adapter and/or quality trimming on your data?

### Answer

Based on my plots, the trimming is not necessary. No adapter contaminations are visible, which would be present in a real-world dataset. Furthermore, the uniform quality does not indicate to be in the red or yellow area. If a real-world dataset would indicate low quality in the red or yellow area, I would perform trimming to improve the quality for downstream processes. This is especially important for adapters since they are not part of the real genome but added for practical purposes.





## Q3  
Why are so many files in the bioinformatics pipeline compressed and indexed?

### Answer

Files in this workflow are very large. Indexes are additional data structures which improve access speed and file sizes. Compression further helps to remove redundant information and reduce the file sizes drastically. This improves long time storage costs, transmission speed but also the performance of downstream applications. This allows to access the files without fully loading into memory and increases random access of any genome position. Compressions using binary formats have the disadvantage of decreased human readability.





## Q4  
In the bash script that processes alignment files, you will see calls to `samtools sort`, `samtools view`, and `samtools index`. Explain what these three programs do. Why do you think each program is needed?

### Answer

### `samtools sort`  
https://www.htslib.org/doc/samtools-sort.html

The sort command sorts the alignments by the leftmost coordinates. This makes downstream searches and processes much faster, especially accesses for genomic regions. 

### `samtools view`  
https://www.htslib.org/doc/samtools-view.html

This binary views and converts SAM/BAM/CRAM files. Here is it used to convert SAM files, which are plain text, into the binary BAM format. This reduces the file size and simplifies the transformation.


### `samtools index`  
https://www.htslib.org/doc/samtools-index.html

Index tools can be used to create indexes for various file types such as SAM, BAM or CRAM. The indexes work on coordinate sorted files and creates lookups for fast access of regions and the genome data in general.



### Why are all three needed?

Each command contributes to making the alignment data usable and efficient:

1. `samtools sort`: sorts the alignments by coordinates.
2. `samtools view`: converts text-based files to a compressed format making access and transformation faster.
3. `samtools index`: creates index to access regions and specific parts very performant.




## Q5  
Explain what files are needed for GangSTR to run. Specifically: explain what information is provided to GangSTR via the `--ref`, `--region`, and `--bam` command line arguments.

### Answer

GangSTR allows to perform genome profiling for tandem repeats from short reads. It has the advantage of allowing repeats larger than the initial read length. For the binaries to work correctly, it needs the following resources:

- `--ref`: Passes the path of the reference genome in FASTA format. GangSTR uses this to align repeat regions.
- `--regions`: References a file specifying the regions of the genome. This is used to reference sequences in the genome.
- `--bam`: Supplies the aligned reads in BAM format. GangSTR uses those reads to detect and type the repeat lengths for each STR region.

GangSTR then produces various output files:
- `$patient_1.vcf.gz`: Genotyped STR profil of sample in compressed VCF format.
- `$patient_1.samplestats.tab`: Statistical information about the process and the results.
- `$patient_1.vcf.gz`: Detailed STR profil of patient.


Together, these inputs enable GangSTR to locate, analyze, and quantify STRs of the patients.






## Q6  
Why is STR variation relevant to health and disease?

### Answer


STRs mutate much more than any other type of variation and are therefore majorly contributing to genetic variation. Expanding STRs can cause various disorders, such as Fragile X syndrom and muscular atrophy. The repeats can disrupt RNA splicing or gene expression. It affects fundamental processes of the genome and are likely to be present genome-wide. Understanding STRs and their implications would be highly beneficial for developing treatments and preventive therapies for affected people.



## Q7  
What are some of the challenges in analysing STRs from NGS data?

### Answer

STRs are complex variations of the genome and challenging to link to diseases. Traditional pedigree analysis often fails to follow the multi-allelic patterns of STRs. Furthermore, medical sequencing studies often leave out STRs due to technical capabilities of sequencing pipelines, which reach their limits with highly repetitive sequences. Filtering techniques often reduce them explicitly from studies. Anomalies in reconstruction of genomes and poor sequence alignment can easily degrade STR results.



## Q8  
What sets GangSTR apart from other STR genotyping tools?

### Answer

According to the [GangSTR GitHub repository](https://github.com/gymreklab/GangSTR), GangSTR stands out from other STR genotyping tools due to the following key differences:

- Support for Long Repeats
  GangSTR can genotype STR regions that are longer than the sequencing read length of the applies sequencing technique. This especially allows to analyze highly expanded sequences which would otherwise not be detected.
- Genome-Wide STR Profiling  GangSTR is capable of analyzing the whole genome at once while other tools are limited in their scope.
- Standardized Inputs and Outputs: GangSTR makes heavily use of existing standards. It accepts BAM files and STR catalogues as input, while outputing VCF files. It was built with existing file types in mind and integrates well into existing pipelines and workflows.



## Q9  
**What types of information does GangSTR use for STR genotyping?**

### Answer

GanSTR uses mainly four types of indicators to estimate the the number of repeats.

- Enclosing Reads: STRs which are flanked by different regions cover the whole STR. They are the simplest form of STRs and allow to directly count the number of STRs.
- Spanning Reads: Spanning reads estimate the number of repeats by estimating the shift in periodical reads. If each read is roughly the same size, a shift in the read compared to the reference genome indicates a shifted read due to STRs. GangSTR estimates the number of repeats by the size of the shift.
- Flanking Reads: Flanking reads are the start or the end of an STR. The number of repeats could be much longer. Therefore, multiple flanking reads are used to estimate the real length.
- Fully Repetitive Reads: Those are reads which only span the repetitive sequences. The total number of read sequences is used to estimate the real length of the STR. If there are many independent reads of the same sequence, the total size of the STR is assumed to be large as well.
