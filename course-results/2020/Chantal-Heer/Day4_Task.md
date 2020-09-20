# Exploration of variant annotation formats

## Which "genomic" variant formats exist & what are their use chases?
* ISCN (**I**nternational **S**ystem for Human **C**ytogenetic **N**omenclature)
> ISCN is a book about the standard nomenclature thaat describes any chromosomal abberations. The genomic rearrangement are identified by techniques liek karyotyping, FISH, SKY, genomic microarray, various region specific assay and DNA sequencing. The nomeclature is used for molecular cytogenetics.
* HGVS (**H**uman **G**enome **V**ariation **S**ociety)
> This society provides an overview about several [databases](https://www.hgvs.org/content/databases-tools) for various variations/mutations. The website is a good starting point for gene variation research.
> HGVS offers also a [Sequence Variant Nomenclature](https://varnomen.hgvs.org/). The nomenclature gives an overview over the sequence variant description for human DNA, RNA, protein, etc. Be aware of the reference that the variant relates to. Such a standardized description of variants makes the international cooperation easier.
* VCF (**V**ariant **C**all **F**ormat)
> VCF is a file format and the standard for human genomic variant storage/representation. Variants such as insertions/deletions, single nucleotide, copy number and structural variants. It can store the results of a single or multiple interpretations of genome sequencing datasets. The variations are always in comparison to a reference genome. The VCF is good for short or common and not rare or structure variants.
* GA4GH Variation Representation Specification
> 

## Genomic coordinate systems
* 0 or 1-based
* "interbase"

-------------------------------------------------------------------------------------------------

# Exploration of different file formats

## Which genomic file formats exist & what are their use cases?
* SAM
* BAM
* CRAM
* VCF (**V**ariant **C**all **F**ormat)
> VCF is a flexible and extendable file format and the standard for human genomic variant storage/representation.  It can store the results of a single or multiple interpretations of genome sequencing datasets. The variations are always in comparison to a reference genome.  
* FASTA
> 
* MPEG-G

--------------------------------------------------------------------------------------------------

# Estimate Storage Requirements for 1000 Genomes

## How much computer storage is required for 1000 Genomes?
* WES & WGS
* Different file formats
  * SAM
  * BAM
  * CRAM
  * VCF
  * FASTA
* Associated costs
  * Cost factors
  * Raw Storage costs
