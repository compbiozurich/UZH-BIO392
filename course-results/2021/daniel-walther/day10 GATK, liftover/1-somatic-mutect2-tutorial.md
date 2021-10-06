# GATK Mutect2 Tutorial <a class="tocSkip">

**February 2020**

<img src="https://storage.googleapis.com/gatk-tutorials/images/3-somatic/GATK_Mutect2_V4.1_042319_lg.png" width="50%" align="left" style="margin:0px 20px"/><font size =4>In this hands-on tutorial, we will call somatic short mutations, both single nucleotide and indels, using GATK4 Mutect2 and FilterMutectCalls. </font>

Example data are based on a breast cancer cell line and its matched normal cell line derived from blood. Both cell lines are consented and known as HCC1143 and HCC1143_BL (blood normal), respectively and  are 2x76 paired end whole exome sequences aligned to GRCh38. 

_This tutorial was last tested with the GATK v4.1.4.1 and IGV v2.8.0._ 
See [GATK Tool Documentation](https://gatk.broadinstitute.org/hc/en-us/articles/360037224712) for further information on the tools we use below. For a primer on somatic calling, [read here](https://gatk.broadinstitute.org/hc/en-us/articles/360035890491).



# Set up your Notebook
## Set runtime values
If you are opening a notebook for the first time today and you didn't adjust any runtime values, now's the time to edit them. Click on the gear icon in the upper right to edit your Notebook Runtime. Set the values as specified below:

| Option | Value |
| ------ | ------ |
| Environment | Default |
| Profile | Custom |
| CPU | 4 |
| Disk size | 100 GB |
| Memory | 15 GB |

Click the "Update" button when you are done, and Terra will begin to create a new runtime with your settings. When it is finished, it will pop up asking you to apply the new settings.

## Check kernel type
A kernel is a _computational engine_ that executes the code in the notebook. For this particular notebook, we will be using a Python 3 kernel so we can execute GATK commands using _Python Magic_ (`!`). In the upper right corner of the notebook, just under the Notebook Runtime, it should say `Python3`. If this notebook isn't running a Python 3 kernel, you can switch it by navigating to the Kernel menu and selecting `Change kernel`.

## Set up your files
Your notebook has a temporary folder that exists so long as your cluster is running. To see what files are in your notebook environment at any time, you can click on the Jupyter logo in the upper left corner. 

For this tutorial, we need to copy some files from this temporary folder to and from our workspace bucket. Run the two commands below to set up the workspace bucket variable and the file paths inside your notebook.

<font color = "green"> **Tool Tip:** To run a cell in a notebook, press `SHIFT + ENTER`</font>


```python
# Set your workspace bucket variable for this notebook.
import os
BUCKET = os.environ['WORKSPACE_BUCKET']
```


```python
# Set workshop variable to access the most recent materials
WORKSHOP = "workshop_2002"
```


```python
# Create directories for your files to live inside this notebook
!mkdir -p /home/jupyter/notebooks/sandbox
```

## Check data permissions
For this tutorial, we have hosted the starting files in a public Google bucket. We will first check that the data is available to your user account, and if it is not, we simply need to install Google Cloud Storage.


```python
# Check if data is accessible. The command should list several gs:// URLs.
! gsutil ls gs://gatk-tutorials/$WORKSHOP/3-somatic/
```


```python
# If you do not see gs:// URLs listed above, run this cell to install Google Cloud Storage. 
# Afterwards, restart the kernel with Kernel > Restart.
#! pip install google-cloud-storage
```

## Download Data to the Notebook 
Some tools are not able to read directly from a Google bucket, so we download their files to our local notebook folder.


```python
!gsutil -m cp -r gs://gatk-tutorials/$WORKSHOP/3-somatic/bams /home/jupyter/notebooks/
!gsutil -m cp -r gs://gatk-tutorials/$WORKSHOP/3-somatic/ref /home/jupyter/notebooks/
!gsutil -m cp -r gs://gatk-tutorials/$WORKSHOP/3-somatic/resources /home/jupyter/notebooks/
!gsutil -m cp -r gs://gatk-tutorials/$WORKSHOP/3-somatic/mutect2_precomputed /home/jupyter/notebooks/
```

## Set up Integrative Genomics Viewer (IGV)
We will be using IGV in this tutorial to view BAM and VCF files. In order to do so without downloading each individual file, we will connect IGV with our google account.
- [Download IGV](https://software.broadinstitute.org/software/igv/download) to your local machine if you haven't already done so.
- Follow [these instructions](https://googlegenomics.readthedocs.io/en/latest/use_cases/browse_genomic_data/igv.html) to connect your Google account to IGV.


------

# CALL SOMATIC SNV & INDELS WITH MUTECT2

## Call somatic SNVs and indels and generate a BAMOUT

We start by calling somatic short mutations on our HCC1143 tumor sample and matched normal using Mutect2. This command produces:

1. A raw unfiltered somatic callset restricted to the specified intervals list
2. A BAM containing reassembled alignments 
3. Mutect stats file named `/home/jupyter/notebooks/sandbox/1_somatic_m2.vcf.gz.stats`


```python
!gatk Mutect2 \
     -R /home/jupyter/notebooks/ref/Homo_sapiens_assembly38.fasta \
     -I /home/jupyter/notebooks/bams/tumor.bam \
     -I /home/jupyter/notebooks/bams/normal.bam \
     -normal HCC1143_normal \
     -pon /home/jupyter/notebooks/resources/chr17_m2pon.vcf.gz \
     --germline-resource /home/jupyter/notebooks/resources/chr17_af-only-gnomad_grch38.vcf.gz \
     -L /home/jupyter/notebooks/resources/chr17plus.interval_list \
     -O /home/jupyter/notebooks/sandbox/1_somatic_m2.vcf.gz \
     -bamout /home/jupyter/notebooks/sandbox/2_tumor_normal_m2.bam
```

**➤ What is the value of using a matched normal control?**

<img style="float: right; margin:0px 20px" src="https://storage.googleapis.com/gatk-tutorials/images/3-somatic/Matchednormal.png" width="20%" />**Mutect2 uses the matched normal** to additionally **exclude rare germline variation** not captured by the germline resource and individual-specific artifacts. 

**Mutect2 uses a germline population resource** towards evidence of alleles being germline. The simplified sites-only [gnomAD](http://gnomad.broadinstitute.org/) resource retaining allele-specific frequencies is available at <ftp://gsapubftp-anonymous@ftp.broadinstitute.org/bundle/Mutect2>. 

**A panel of normals (PoN)** has a vital role that fills a gap between the matched normal and the population resource. Mutect2 uses the PoN to catch additional **sites of noise in sequencing data**, like mapping artifacts or other somewhat random but systematic artifacts of sequencing and data processing. 



##  Make a panel of normals (PoN)

The PoN used here was made using GATK4.beta.6 with **40 exome samples** aligned to GRCh38 from the [1000 Genomes Project](http://www.internationalgenome.org/). Ideally, the PoN should include **technically similar samples that were sequenced on the same platform**, e.g. HiSeqX, using the same chemistry and analyzed using the same reference genome and tool-chain. However, **even an unmatched PoN is better than no PoN at all**. This is because mapping artifacts and polymerase slippage errors occur for pretty much the same genomic loci for short read sequencing approaches.

**To make your own PoN:** 

The tumor-only mode command below takes an extremely long time to run, so we are not doing it today.  To run it at a later date/time you will need 40 normals to pass into the initial step, but the command structure for all three steps is given below.

1) Run Mutect2 in tumor-only mode on each normal BAM individually,
```
!gatk Mutect2 -R reference.fasta -I normal1.bam --max-mnp-distance 0 -O normal1.vcf.gz 
!gatk Mutect2 -R reference.fasta -I normal2.bam --max-mnp-distance 0 -O normal2.vcf.gz 
...
!gatk Mutect2 -R reference.fasta -I normal40.bam --max-mnp-distance 0 -O normal40.vcf.gz 
```

2) Create a GenomicsDB from the normal Mutect2 calls,
```
!gatk GenomicsDBImport -R reference.fasta -L intervals.interval_list \
  --genomicsdb-workspace-path pon_db \
  -V normal1.vcf.gz \
  -V normal2.vcf.gz \
  ...
  -V normal40.vcf.gz
```

3) and then Combine the normal calls using CreateSomaticPanelOfNormals.

```
!gatk CreateSomaticPanelOfNormals -R reference.fasta \
  --germline-resource af-only-gnomad.vcf.gz \
  -V gendb://pon_db \
  -O pon.vcf.gz
```

---

#  FILTER FOR CONFIDENT SOMATIC CALLS

In section 2.1, we generated an unfiltered Mutect2 callset. Now, we will use filtering tools to identify which mutation candidates are likely to be real somatic mutations.





## Estimate cross-sample contamination 

We estimate cross-sample contamination with two tools `GetPileupSummaries` and `CalculateContamination`. 


### Run `GetPileupSummaries` to summarize read support for a set number of known variant sites. 


The tool tabulates read counts that support REF, ALT and OTHER alleles for the sites in the resource. This involves a known germline variant resource to **limit analysis to sites that are commonly variant**. Use a population germline resource containing only common biallelic variants

Here we use a human population germline resource, [gnomAD]( http://gnomad.broadinstitute.org/). Let's run the tool on the tumor and the normal.


```python
# Run on Tumor samples
!gatk GetPileupSummaries \
    -I /home/jupyter/notebooks/bams/tumor.bam \
    -V /home/jupyter/notebooks/resources/chr17_small_exac_common_3_grch38.vcf.gz \
    -L /home/jupyter/notebooks/resources/chr17_small_exac_common_3_grch38.vcf.gz \
    -O /home/jupyter/notebooks/sandbox/7_tumor_getpileupsummaries.table
```


```python
# Run on Normal samples
!gatk GetPileupSummaries \
    -I /home/jupyter/notebooks/bams/normal.bam \
    -V /home/jupyter/notebooks/resources/chr17_small_exac_common_3_grch38.vcf.gz \
    -L /home/jupyter/notebooks/resources/chr17_small_exac_common_3_grch38.vcf.gz \
    -O /home/jupyter/notebooks/sandbox/7_normal_getpileupsummaries.table
```


Each command produces a six-column table as shown. The `alt_count` is the count of reads that support the ALT allele in the germline resource. The `allele_frequency` corresponds to that given in the germline resource. Counts for `other_alt_count` refer to reads that support all other alleles.



```python
!head /home/jupyter/notebooks/sandbox/7_tumor_getpileupsummaries.table
```


```python
!head /home/jupyter/notebooks/sandbox/7_normal_getpileupsummaries.table
```

The tool considers *homozygous-variant* sites in the sample where the alternate allele frequency (AF) in the population resource ranges between 0.01 and 0.2. This range is adjustable. We can expect a lot of contamination by alternate alleles at sites where the alternate AF is large, so those sites wouldn't tell us much. Conversely, at homozygous-alternate sites where the variant allele is rare in the population, we are more likely to observe the presence of REF or other alleles if there was cross-sample contamination, and therefore we will be able to measure contamination more accurately.



### Estimate contamination with `CalculateContamination`.

The tool gives the fraction contamination. This estimation informs downstream filtering by FilterMutectCalls. 


```python
!gatk CalculateContamination \
    -I /home/jupyter/notebooks/sandbox/7_tumor_getpileupsummaries.table \
    -tumor-segmentation /home/jupyter/notebooks/sandbox/segments.table \
    -O /home/jupyter/notebooks/sandbox/8_tumor_calculatecontamination.table
```

Let's also try out an additional feature of the tool. We can provide both the tumor and the matched normal pileup table. The pairing can allow for a slightly more accurate estimate. 


```python
!gatk CalculateContamination \
    -I /home/jupyter/notebooks/sandbox/7_tumor_getpileupsummaries.table \
    -matched /home/jupyter/notebooks/sandbox/7_normal_getpileupsummaries.table \
    -tumor-segmentation /home/jupyter/notebooks/sandbox/segments.table \
    -O /home/jupyter/notebooks/sandbox/8_pair_calculatecontamination.table 
```

The resulting files from the two variations each give the fraction contamination. Run the two cells below to view results: 


```python
!cat /home/jupyter/notebooks/sandbox/8_tumor_calculatecontamination.table
```


```python
!cat /home/jupyter/notebooks/sandbox/8_pair_calculatecontamination.table
```

For our small tumor BAM file, you can see the contamination is ~0.0191 with an error of ~0.0022. We get a slightly lower number, ~0.0120 +/– 0.00454 for the matched estimate. For the full BAM file, we see a slightly larger contamination number. This threshold informs you to be wary of calls with less than that number for the alternate allele fraction.

---


## Apply filters with `FilterMutectCalls`

In this step, we filter the small data, 1_somatic_m2.vcf, with `FilterMutectCalls`. The tool **uses the annotations within the callset, and if provided, uses the contamination table** in filtering. Default settings are tuned for human somatic analyses.


```python
!gatk FilterMutectCalls \
    -R /home/jupyter/notebooks/ref/Homo_sapiens_assembly38.fasta \
    -V /home/jupyter/notebooks/sandbox/1_somatic_m2.vcf.gz \
    --contamination-table /home/jupyter/notebooks/sandbox/8_pair_calculatecontamination.table \
    --stats /home/jupyter/notebooks/sandbox/1_somatic_m2.vcf.gz.stats \
    --tumor-segmentation /home/jupyter/notebooks/sandbox/segments.table \
    -O /home/jupyter/notebooks/sandbox/9_somatic_oncefiltered.vcf.gz
```

This produces a VCF callset `9_somatic_oncefiltered.vcf.gz` and index. Calls that are **likely true positives get the PASS label** in the FILTER field, and calls that are likely false positives are labeled with the reason(s) for filtering in the FILTER field of the VCF. We can view the available filters in the VCF header using 


```python
!zgrep '##FILTER' /home/jupyter/notebooks/sandbox/9_somatic_oncefiltered.vcf.gz
```

This step seemingly applies **20 filters, including contamination**. However, if an annotation a filter relies on is absent, the tool skips the particular filtering. The filter will still appear in the header. For example, the `duplicate_evidence` filter requires a nonstandard annotation that our callset omits. 

---



# REVIEW CALLS WITH IGV

Deriving a good somatic callset involves comparing callsets from different callers, manually reviewing passing and filtered calls and, if necessary, additional filtering. Manual review extends from deciphering call record annotations to the nitty-gritty of reviewing read alignments using a visualizer. 

How do we account for variant calls based on the read data? Remember Mutect2 reassembles reads just like HaplotypeCaller, so the clean alignments will not necessarily reflect the calls. We must examine the BAMOUT that Mutect2's graph-assembly produces. We already generated this BAMOUT in section 1.1 (`sandbox/2_tumor_normal_m2.bam`).  We are going to copy it into our bucket for loading into the IGV.


## Copy the result of our analysis into the workspace bucket so we can load it into IGV.

We use the google cloud utilities (`gsutil`) command for copy (`cp`) to put our sandbox files into the bucket wher we can load them into the IGV.  The other files (`bams`, `resources`,`mutect2_precomputed`) were already made available  through our gatk-tutorials bucket so we don't have to copy those again.  


```python
! gsutil cp /home/jupyter/notebooks/sandbox/2_tumor_normal_m2.bam $BUCKET/sandbox/
! gsutil cp /home/jupyter/notebooks/sandbox/2_tumor_normal_m2.bai $BUCKET/sandbox/
```

## Set up your IGV window

<font color=red>**Before anything else, load Human (hg38) as your reference genome.**</font> It is important to do this first, as changing the reference genome will require you to reload all files you may have previously loaded.

Next, go to `File`-->`Load from URL` and load these files in order: 


```python
#  Run this cell to print out the URLs of files to load. Copy and paste the result into IGV. 
! echo gs://gatk-tutorials/$WORKSHOP/3-somatic/mutect2_precomputed/9_somatic_oncefiltered.vcf.gz
! echo $BUCKET/sandbox/2_tumor_normal_m2.bam
! echo gs://gatk-tutorials/$WORKSHOP/3-somatic/bams/tumor.bam
! echo gs://gatk-tutorials/$WORKSHOP/3-somatic/bams/normal.bam
```

## Navigate to the location of the genome where variants were called

Navigate IGV to the **TP53** locus at **chr17:7,666,402-7,689,550.** 

<img src="https://storage.googleapis.com/gatk-tutorials/images/3-somatic/m2-image2-IGVDesktop.png" width="70%" align="right" style="margin:20px 20px"/>

* Zoom into **chr17:7,673,333-7,675,077** to better see the somatic call

<br>

<br>

* Scroll through the data and notice the coverage for the samples. 




➤ <b>We see a C→T variant light up in red for the tumor but not the normal. What do you think is happening in 2_tumor_normal_m2.bam? </b>

➤ <b>What does the coverage tell you?</b>

<img src="https://storage.googleapis.com/gatk-tutorials/images/3-somatic/m2-image3-IGVDesktop.png" width="15%" align="right" style="margin:0px 20px"/>If these alignments seem hard to decipher, it is because we need to tweak some settings.

To make room to focus on track \[2_tumor_normal_m2.bam], we need to remove the tumor and normal bam tracks. Shift+select on the left panels for both of those tracks & their corresponding coverage. Then right-click and `Remove Tracks` to remove the tumor and normal BAMs.

Next, go to `View>Preferences>Alignments`. Uncheck `Downsample reads`.

Now, right-click on the alignments track and

-  Group by sample  
-  Color alignments by tag: HC
-  Sort by base
    
You can now scroll and click on a read in each group to determine which group belongs to which sample. The depth at this site is very high, but you can see a squished view of all the reads in the image to the right.





➤ <b>What are the three grouped tracks for the bamout? What do the colors indicate? What differentiates the pastel versus gray reads?</b>



➤ <b>How do you feel about this somatic call? </b>

---


# ANNOTATE MUTATIONS WITH FUNCOTATOR

Another approach to filtering mutation calls is by the significance of their functional impact. For example, a stop codon in the middle of a protein coding region or a missense mutation that changes how a protein functions is more significant than a silent mutation or a mutation in the middle of an intron. 

To gauge functional impact, we must know which regions of the genome code for protein sequence and which correspond to elements important to gene expression. Transcript annotation resources such as [GENCODE](https://www.gencodegenes.org/) capture such information in a standardized [General Transfer Format (GTF)](https://www.gencodegenes.org/pages/data_format.html).   

GATK4 Funcotator annotates variant alleles with information from any number of annotation resources. The annotation resources must be organized in a particular way. You can download prepared Funcotator resource bundles from `gs://broad-public-datasets/funcotator/` or use GATK4 `FuncotatorDataSourceDownloader` to download the latest data sources directly from your GATK4 install. For this tutorial, we have specially prepared a small annotation resource. 



Annotate the `9_somatic_oncefiltered.vcf.gz` mutation callset with the resource.


```python
!gatk Funcotator \
    --data-sources-path /home/jupyter/notebooks/resources/funcotator_dataSources_GATK_Workshop_20181205/ \
    --ref-version hg38 \
    -R /home/jupyter/notebooks/ref/Homo_sapiens_assembly38.fasta \
    -V /home/jupyter/notebooks/mutect2_precomputed/9_somatic_oncefiltered.vcf.gz \
    -O /home/jupyter/notebooks/sandbox/12_somatic_oncefiltered_funcotate.vcf.gz \
    --output-file-format VCF
```



This produces a VCF callset with annotations. If needed, Funcotator can instead write results in historic [Mutation Annotation Format (MAF)](http://software.broadinstitute.org/software/igv/MutationAnnotationFormat) given `–-output-file-format MAF`.




**➤ Examine the annotations for the TP53 mutation that we viewed earlier in IGV, at chr17:7674220.**




```python
!zgrep chr17 /home/jupyter/notebooks/sandbox/12_somatic_oncefiltered_funcotate.vcf.gz | grep 7674220
```

We see an arginine (R) to glutamine (Q) missense mutation at position 248. In our 124 mutation records, 21 are annotated with MISSENSE, and of these, ten PASS filters. 



```python
# Count the total mutation records
!zgrep -v "^#" /home/jupyter/notebooks/sandbox/12_somatic_oncefiltered_funcotate.vcf.gz | wc
```


```python
# Count the number of MISSENSE records
!zgrep -v "^#" /home/jupyter/notebooks/sandbox/12_somatic_oncefiltered_funcotate.vcf.gz | grep "|MISSENSE|" | wc
```


```python
# Count the number of MISSENSE records that PASS filters
!zgrep -v "^#" /home/jupyter/notebooks/sandbox/12_somatic_oncefiltered_funcotate.vcf.gz | grep "|MISSENSE|" | grep PASS | wc
```

##  Review filtered indels to study the logic behind different filters

Explore a few insertion and deletion sites in IGV and consider the evidence that supports the filtering decisions.

| CHROM | POS | REF | ALT | FILTER |
| --- | --- | --- | --- | --- |
| chr17 | 7,221,420| CACTGCCCTAGGTCAGGA | C | artifact_in_normal;contamination;panel_of_normals;str_contraction |
| chr17 | 19,748,387| G | GA | contamination;str_contraction;t_lod |
| chr17 | 50,124,771 | GCACACACACACACACA | G,GCACA,GCACACA | artifact_in_normal;clustered_events;germline_risk;multiallelic;panel_of_normals

Here are a few more filtered indel calls to explore.


| CHROM | POS | REF | ALT | FILTER |
| --- | --- | --- | --- | --- |
| chr17 | 26,982,033 | G | GC | artifact_in_normal;bad_haplotype;clustered_events |
| chr17 | 35,671,734 | CTT | C,CT,CTTT | artifact_in_normal;multiallelic;panel_of_normals |
| chr17 | 47,157,394 | CAA | C,CAAA | artifact_in_normal;germline_risk;panel_of_normals |
| chr17 | 68,907,890 | GA | G,GAA | artifact_in_normal;base_quality;germline_risk;panel_of_normals;str_contraction |
| chr17 | 69,182,632 | C | CA | artifact_in_normal;contamination;str_contraction;t_lod |





```python

```
