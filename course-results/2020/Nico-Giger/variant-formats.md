#Variant formats

## Variant Call Format (VCF)

   1. Meta Information Lines - Multiple lines prefixed by double pound symbols (##). Describes the format and content of that specific VCF file.
    
   2. Header Line - Single line prefixed with a one pound symbol (#).
  
CHROM | POS | ID | REF | ALT | QUAL | FILTER | INFO
----- | --- | -- | --- | --- | ---- | ------ | ----

   3. Data Lines - Remainder of the file with 1 position per line.
    Each data line represents a position in the genome.
    
Therefore VCF files couple Variants with calls thereby compressing the data.
When you have a lot of calls with a lot of unique/rare variants, the format gets data heavy though.
Structural variants (Chormosomal abberations) are generally diffucult to handle. In VCF files you can use symbolic chromosomes

## Human Genome Variation Society (HGVS) format
Allows the annotation of sequence variants (DNA, RNA, protein) with relation to a reference


## cytogenetic annotation basics
Estimated resolution of cytogenetic banding?

Task: Estimate Storage Requirements for 1000 Genomes Project
• How much computer storage is required for the 1000 Genomes project
• WES & WGS
• Different file formats
• SAM
• BAM
• CRAM
• VCF
• FASTA
• BED
• Associated costs
• Cost factors
• Raw Storage costs
