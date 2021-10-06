# Getting started with terra
### adjust the settings
|options|value|
--------|-----|
Enviornment|default
|profile|costum|
|CPU|4|
|Disksize| 100GB|
|Memory|15GB|

The Kernel should be Python 3

### File exchange
We need to get and give some files from a workspace bucket and make a direction. Then I checked the data permission.
Finally, we downloaded some data.
Further, we need to set up "integrative genomics viewer" (IGV) and connect it to the google account

## 2 Call somatic SNV & INDELS with MUTECT2
We start by calling somatic short mutations on our HCC1143 tumour samples and matched normal using Mutect2. We'll end up having:
1. A raw unfiltered somatic callsetrestricted to the specific interval list
2. A BAM containing reassembled alignments
3. Mutatic stats file

What is the value of using matched normal control?
Mutact2: additionally removes rare germline variation not captured by the germline resource and individual specific artifacts
It uses a germline population resource towards evidence of alleles being germline.
A panel of normals with fills the gap betweem the matched normal and the population resource. This is used to catch additional sites of noise in sequencing data,
like mapping artifacts.
#### make a panol of normal (PoN)
We don't do that today, because it takes a long time. 
The PoN comes from 40 exom samples from the 1'000 genomes project. Ideally, the PoN should include technically similar samples that were sequenced on the same platform.

## 3 Filtering for confident somatic calls
Now we see, which mutation candidates are likely to be real somatic mutations
First, we estimated the cross-sample contamination.
We limit the analysis to sites that are commonly variant.
The commands produce six-coloumn tables. 
* ```alt_count ```: count of reads that support ALT allele in the germline resource
* ```allele_frequency```: corresponds to that given in the germline resource
* ```other_alt_count```: refer to reads that support all other alleles

> The tools consideres _homozygoues_variant_ sites in the sample where the alterantive allele frequency (AF) in the population ranges between
> 0.01 and 0.2. This range is adjustable. We can expect a lot of contamination by alternate allels at sites where the alterantive AF is large, so those sites wouldn't
> tell us much. Conversly, at homozygous-alternate sites where the variant allele is rare in the population, we are more likely to observe the presence of REF or
> other allels if there was cross-sample contamination, and therefore we will be able to measure contamination more accurately.

Using another tool gives the fractions contamination.
So, for our samall Tumour BAM file, the contamination is around 0.0191 with an error of 0.0022. We get a slightly lower number (0.0120 +/- 0.00454) for the matched estimate. 
For the full BAM file, we see a slightly larger contamination number ==> be careful with calls with less than that number for the alternate allele fraction

Now we apply filters with ```FilterMutectCalls```
This tool uses the annotations within the callset and, if provided, uses the contamination tabe in filtering.
This filter produces a VCF callset. Calls that are likely true positives get labeled as **PASS** in the FILTER field

## 4 review calls with IGV
Fist, we copy the result of our analysis into the workspace bucket so we can load it into IGV.
Then, we load hg38 as our reference genomeas well as loading files from our workspace.

Next, we navigat to the Tp53 locus at Chr17:7 and look ath the coverage.
> We see a C -> T light up in red for the tumor but not the normal.   

I guess this is a real tumor-specific mutation?

> What does the coverage tell you?

How many reads there are for a DNA segment or a nucleotide

>What are the three grouped tracks for the barmout? What do the colors indicate? What differentiates the pastel versus grey reads?

The colours might be haplotyped that are present in the population. Scroling down, we would find the haplotpye inside the patient. Grey reads would then
probably mean that the information is not complete to say which haplotype this is.

> How do you fell about this somatic call

There probably is the somatic mutation

## 5 Annotate mutations with funcotator
Now filter the mutations calls by the significance of their funcitonal impact (e.g. a stop codon in the middle of aprotein coding region is more significant
than a silent mutation.
For taht, we need to know about the protein coding regions.
There are transcript annotation resources such as GENCODE that capture such inforamtion in a standardised General Transfer Format (GTF).

> Examine the annotation for the TP53 mutations that we viewd earlier in IGV. at chr17:7674220

We se an arginine to glutamine missense mutation at position 248. In our mutation records, 12 are annotated with missense and of these, ten PASS filters
