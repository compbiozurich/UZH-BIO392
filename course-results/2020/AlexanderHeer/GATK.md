
# GATK

The GATK is the industry standard for identifying SNPs and indels in germline DNA and RNAseq data. Its scope is now expanding to include somatic short variant calling, and to tackle copy number (CNV) and structural variation (SV). In addition to the variant callers themselves, the GATK also includes many utilities to perform related tasks such as processing and quality control of high-throughput sequencing data, and bundles the popular Picard toolkit.

These tools were primarily designed to process exomes and whole genomes generated with Illumina sequencing technology, but they can be adapted to handle a variety of other technologies and experimental designs. And although it was originally developed for human genetics, the GATK has since evolved to handle genome data from any organism, with any level of ploidy.

## CALL SOMATIC SNV & INDELS WITH MUTECT2
### What is the value of using a matched normal control?
* used to additionally exclude rare germline variation not captured by the germline resource ad individual-specific artifacts
* uMUTEC2 ses germline population resource towards evidence of alles being germline.
* Uses a panel of normals to catch additional sites of noise in seq data
  * e.g. mapping artefact or other soewhat random but systemati artifaccts of sequencing and data processing
  * Panel of normals has a vital role that fills a gap between the matched normal and the population resource

### Panel of normals 
* should include technically similar samples that were sequenced on the same platform
  * This is because mapping artifacts and polymerase slippage errors occur for pretty much the same genomic loci for short read sequencing approaches
     * Thus, even an unmatched PoN is better than no PoN at all
  

### GerPileupSummaries & CalculateContamination

* GetPileupSummaries summarizes read support for a set number of known variant sites
* considers homozygous-variant sites in sample where alternate allele frequency in the population resource ranges between 0.01 and 0.2
  * adjustale range
 * expect a lot of contamination by alternate alleles at sites where the alternate AF is large, so those sites wouldn't tell us much
* at homozygous-alternate sites where variant allele is rare in the population we are more likely to observe presence of REF or other alleles if there was cross-sample contamination
  * Thus able to measure contamination more accurately
  
  
## CalculateContamination
* gives the frction contamination
  * infomrs downstream filtering by FilterMutecCalls
  
  
## FilterMutecCalls
* Apply filters
* uses the annotations within the callset, and if provided, uses the contamination table in filtering
* Calls that are likely true positives get PASS label in the FILTER field
* Calls that are likely false positives are labeled with reason(s) for filtering in the FILTER field of the VCF
* 20 filters, including contamination
  *  if an annotation a filter relies on is absent, the tool skips the particular filtering
  
## IGV
Deriving a good somatic callset involves comparing callsets from different callers, manually reviewing passing and filtered calls and, if necessary, additional filtering. Manual review extends from deciphering call record annotations to the nitty-gritty of reviewing read alignments using a visualizer

##  Funcotator
*Annotate mutations
* filtering mutation calls by the significance of their functional impact
  * must know which regions of the genome code for protein sequence and which correspond to elements important to gene expression
* produces a VCF callset with annotations
