# CNV

## Theodor Boveri
* researched sea urchin eggs
* cell-cycle checkpoints
* tumor-suppressor genes 
  * may be overcome by external signals
  * can be eliminated durign tumor progressin
  * Oncogenes that become amplified
  * Progression w/ sequential changes of chromosomes 
  * clonal origin & genetic mosaicism
  * cancer predisposition through inheritance (of "chromosomes")
  * Inheritance of same "weak chromosome" from both parents leads to homozygosity
    * consequently, high-penetrance cancer sydroms
  * wounding and inflamation in tumor promotion
    * loss of cell adhesion in metastasis
    * sensitivity of malignant cells to radiation therapy
    
## Janet Rowley
* chromosomal translocations in cancer  
* Recurrent chromosomal translocation inleukemias and lymphomas
* ...
* Clinical implications: Tyrosine Kinease inhibitors as standard first-line therapy in CML

## Types of genomc alterations in Cancer 
* Point mutations 
  * insertions
  * deletions
  * substitutions
* chromosomal rearrangements
* Regional Copy Number Alterations (CNV)
  * Imbalanced Chromosomal Changes
  * losses & gains
    * Polyploidy
    * Aneuploidy
    * Uniparental disomy
    * Non-reciprocal translocation
    * Partial deletion
    * Partial duplication
    * Amplificaion 
      * Double minutes
      * HSR
* Epigenetic changes
  * DNA methylation abnormalities
  * etc.

* Cancer shows thousands of single nucleotide variants per sample
  * most in non-coding regions
* genomic compynumber imbalances provide widespread somatic  variants in cancer
   * on avergare 19& of cancer genome ae in an imbalanced state (more/less than 2 alleles)
   
## Rare CNV Events & Hidden Therapeutic Options?
#### Example: PTCH1 deletions in malignant melanomas
* PTCH1: actionable tumor suppressor gene 
  * demonstrated in basaliomas and medulloblastomas
* Analysis of 1127 smaples from 26 pubications identified focal deletions in 4 samples
  * Focal somatic imbalance events are considered an indicator for oncogenic involvement of the affected target genes
* Does not represent a deletion hotspot but te locus is part of larger deletions in 25% of melanom samples

## Progenetix
* Reference Resource for Oncogenomic Profiling Data
* launched in 2001
* currated CNV data from chromosomal CHG studies
* aCGH, cCGH, WES, WGS (?)
* additionally tracking and annotating of publications reporting compatible original data
* based on the single-sample CNV tracks of cancer samples from 402/469 (ICD-O/NCIt) diagnostic categories
* typical appliactions:
  * reference CNV patterns in given diagnoses 
    * does my anaylsis match the diagnosis/prediction?
  * target gene entity mapping
    * in which tumour type is this gene frequently gained/lost?
* API provid access to a growing number of datatable fetures
  * biosample data lsitings
  * code translations 
  * publication data
* Group histogram and heatmap representation of
CNV profiles by external labels (disease codes, publications ...)

 
 ## arrayMAP
 * accessing probe-level genomi array data in cancer
 
 ## Progenix & arrayMap: Available formats:
* DB dumps (variants, biosamples, callsets)
* status values fore all CNV variants
  * 4'606'156 | 3'264'504 DEL
  * 3'916'360 | 2'602'169 DUP
* pre-computed 1MB binned status levels for all callsets
* (so far) uncalibrated log2 intensity values for all intervals hit by a CNV
* pre-calculated 1MB CNV frequencies for all mapped entities (NCIT, ICDOM, ICDOT, PMID, GSE, CVCL ...)
 
 
 ## Standardized data
 Data re-use depends on standardized, machine-readable metadata
* multiple international initatives and resource providers work on generation and implementation of data annotaton standards
* emerging / established principles are the use of hierarchical coding systems where individual codes are represented as CURIEs
* other formats for non-categorical annotations based on international standards
  * ISO (ISO 8601 time & period, ISO 3166 country codes ...)
  * IETF (GeoJSON ...)
  * W3C (CURIE ...)
* these standards become pervasive throughout GA4GH's ecosystem (e.g. Phenopackets ...)


## Inference of integer copy number states
* Cancer samples are made of heterogeneous cells
  * Normal tissue contamination
  * Cancer evolves as it acquires extra mutations
  * The majority of current copy number segmentations methods do not distinguish between heterogenous cell components
* It is of interest to know the exact copy number
  * e.g. full deletion (0), single copy deletion (1), normal copy number (2), single copy duplication (3), double copy duplication (4), amplification (5+), etc.
  *  Full deletion - tumour suppressor genes
  * amplification - oncogenes
