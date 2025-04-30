## Practical STR

### Q1
**Does the sequence quality graph of your data look different from the examples shown in the slides? Are there any adapter sequences in the data? Why do you think this is?**

They look very different from the ones we saw in the slides. The 'per base sequence quality' boxplot looks uniform. We don't have real quality scores. This is the case because we have simulated data. Simulated data is sometimes used in tutorials and teaching. Or to test pipelines etc. and see how your code works.
Normally quality scores give us information about how confident the sequencer was about calling a specific base. When we have simulated data we don't have actual base calling, therefore phred quality scores are just fixed or pre-defined.

We don't see any adapter sequences being present. This makes sense when we consider that it is simulated data we look at. Adapters are important for real sequencing, but are not real biologic sequences. So ideally they shouldn't end up in the final data. Sometimes this can happen when we have real sequencing data, then we would see adapter sequences in the FastQC data. When we have simulated data, we don't see adapters as we have simulators that model an "idealized sequencing process".


### Q2
**Given the FastQC reports, does it make sense to perform adapter and/or quality-trimming on your data?**

No because we don't have bad quality scores. Trimming is done to remove adapters or low-quality bases, which does not make sense in our case, as we have simulated data. Normally in the 'per base sequence quality' boxplot when we would see the quality score dropping into the red area, we would trim.

### Q3
**Why are so many files in the bioinformatics pipeline compressed and indexed?**

Compressed: Many files are compressed as it is much more efficient. Compressed files are smaller, leading to lower storage costs. Sequencing data coming directly from the sequencer (FASTA files...) or alignment files (SAM...) for example are very large, plus they are time and cost effcient, considering storage for example. Therefore it makes sense to compress them, as many programs are able to directly use the compressed files and do not need to decompress them first.

Indexed: It makes sense to index files, as sequence or alignment files are rather large. When we index these large files it helps us to access a specific region of interest in the genome much faster. When we want to look at a certain position on a chromosome, to see whether we have some kind of copy number variation for example, indices help us to find these positions we want to analyse. 

### Q4
**In the bash script that processes alignment files, you will see calls to samtools sort, samtools view, and samtools index (among others). Explain what these three programs do. Why do you think each program is needed?**
*Hint: look at the [Samtools manual](http://www.htslib.org/doc/samtools.html)*.

**samtools sort**: When samtools sort is used (without further options), all our alignments are sorted by their leftmost coordinate, which could be for example the position on the chromosome. Different sorting options can be applied, the alignments are then for example sorted by read names or by minimiser (when reads are unmapped). A sort order header is added and the sorted output can be stored in a BAM file or CRAM file for example.

This tool is important, because it enables further downstream analysis. If we want to index it later and then call variants or visalize data for example, it is important that the alignments are sorted first.

**samtools view**: When no further options are applied, this tool prints all alignments in the file that you specify as input file. If you only want to have a specific region printed you add the region after the filename input; chr12 or chr12:200 for example. Then we only get alignments of chromosome 12 printed or in the second example the region on chromosome 12 beginning at base position 200. More than one region can be specified. To access these specific regions the input file needs to be sorted (by default) and indexed. 

This tool is important, because it allows us to see specific regions, that can be directly printed on the screen. Often we only want to analyze one part of the genome, therefore this tool is great to specify these regions and further analyze them. The tool is also very important because it can be used for file format conversion. It converts SAM/BAM/CRAM files. This is important because certain tools for example specifically require BAM files.

**samtools index**: This tool indexes SAM, BAM or CRAM files. SAM files first need to be BGZF compressed for the indexing to work. 

This tool is important because it allows fast access. It's also important when later a tool is used that requires indices. For example when we use samtools view (as explained above) and we want to specify a region. This only works if we have an indexed file.

### Q5
**Explain what files are needed for GangSTR to run. Specifically: explain what information is provided to GangSTR via the --ref, --region, and --bam command line arguments.**
*Hint: look at the [GangSTR manual](https://github.com/gymreklab/gangstr).*

**What files are needed?**

--bam <file.bam,[file2.bam]>
  * These are the input files. They are BAM files and comma separated. They also need to be indexed and sorted.
    In these input files the sequences are stored which we want to analyze and compare to a reference genome.
    
--ref Refererence genome (.fa) 
  * To compare our sequence(s) to a reference genome, we have to give GangSTR a FASTA file which contains the
    reference genome, which was already used to align the reads in the BAM file.
  
--regions Target TR loci (regions) (.bed) 
  * GangSTR needs a reference set of known Tandem Repeat regions to perform the genoptyping. It is a BED-like file,
    containing 5 columns: Name of the chromosome on which the STR is located, start position of STR, end position
    of STR, motif length and repeat motif.

**Output of GangSTR**

--out Output prefix
  * The output that GangSTR produces are VCF file. In this variant call format we can call the STRs and see
    them listed per locus. With that we can then see for each patient (in our example) on which chromosomes
    there are STRs, what the repeat motif is and how often the repeat is present on each of the two homologous chromosomes.


## Literature
During the practical so far, you have generated variant calls from short read sequencing data using bioinformatics approaches. Now it's time to take a step back and do some background reading in order to prepare for the analysis and interpretation of the results next week. 

First, read the following sections of [this review](https://www.sciencedirect.com/science/article/pii/S0959437X16301538):
* Abstract
* Introduction``
* Genotyping STRs from high-throughput sequencing data
Then, answer Q6 and Q7.

### Q6
**Why is STR variation relevant to health and disease?**

STRs play an important role in the cause of genetic disorders (Fragile X Syndrome for example) and Mendelian diseases. Furthermore they can directly modify gene function and expression and they can affect RNA splicing (cystic fibrosis), which can also be relevant in disease development. But how? STRs can for example function as transcrition factor binding site or they can modulate DNA methylation and heterochromatinzation. These are just some mechanisms of action that are known or proposed.

STRs also play a role in cancer biology. STRs can lead to Microsatellite Instability, when DNA mismatch repair (MMR) system fails. Microsatellites are per se error-prone during replication because they are so repetitive and slippage of the polymerase can occurr. When errors happen and the Mismatch Repair system is deficient, errors can't be corrected and mutations accumulate, which can lead to cancer development.

It is also important to say that healthy individuals have thousands of STRs present in their genome as well. STRs are not necessarily disease-related.


### Q7
**What are some of the challenges in analysing STRs from NGS data?**

One of the key difficulties is that short reads from NGS are sometimes unable to span the whole repeat region of STRs. Expanded STRs can be longer than 100 or 150 basepairs, which makes it difficult when only having short reads. Another problem is that often they are filtered out from sequencing pipelines due to
their low quality calls, because we have a reduced number of informative reads. 
All in all we can say the challenge are mapping biases, which  make genotyping difficult.


Second, read the following sections of the [paper describing GangSTR](https://academic.oup.com/nar/article/47/15/e90/5518310):
* Abstract
* Introduction
* Overview of the GangSTR model
Then, answer Q8 and Q9.

### Q8
**What sets GangSTR apart from other STR genotyping tools?**

GangSTR is a novel tool for genome-wide genotyping of STRs, but it is also able to genotype expanded TRs, which is new. It is more accurate and it is faster than previous tools. What is different is, that they include paired-end reads, but also information about fragment length, coverage and existence of partially enclosing reads and combine them into a single joint likelihood framework. 

### Q9
**What types of information does GangSTR use for STR genotyping?**

GangSTR takes sequence alignments and a reference set of TRs as input. For genotyping GangSTR uses information of enclosing reads, flanking reads, fully repetitive reads and spanning reads. Then GangSTR combines all this information with probability models and chooses the most likely repeat lengths for both alleles.
