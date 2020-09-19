# Variant formats


## Human Genome Variation Society (HGVS) format
Allows the annotation of sequence variants (DNA, RNA, protein) with relation to a reference


## cytogenetic annotation basics
Estimated resolution of cytogenetic banding?

## Variant Call Format (VCF)

   1. Meta Information Lines - Multiple lines prefixed by double pound symbols (##). Describes the format and content of that specific VCF file.
    
   2. Header Line - Single line prefixed with a one pound symbol (#).
  
CHROM | POS | ID | REF | ALT | QUAL | FILTER | INFO
----- | --- | -- | --- | --- | ---- | ------ | ----

   3. Data Lines - Remainder of the file with 1 position per line.
    Each data line represents a position in the genome.
    
--> VCF files compress data by coupling variants with calls.
When you have a lot of calls with a lot of unique/rare variants, the format gets data heavy though.
Structural variants (Chormosomal abberations) are generally diffucult to handle. In VCF files you can use symbolic chromosomes

## FASTA
Stores genetic or protein sequences in full. --> not very storage efficient and no reference required.

## FASTQ
FASTA + info and quality scores

## SAM
FASTQ with tab delimiters + positional information in reference genome. --> also for variant analyses and depending on usage more efficient

## BAM
SAM in binary. --> non-human readable and easier to compressable.

## BED
store annotations with coordinates on a reference genome. It is useful for storing the type of data that
genome browsers display in parallel to the genome. 

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


