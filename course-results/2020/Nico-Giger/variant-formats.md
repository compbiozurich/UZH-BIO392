#Variant formats

## Variant Call Format (VCF)

 ### Three main sections
   1. Meta Information Lines - Multiple lines prefixed by double pound symbols (##).
    Describes the format and content of that specific VCF file.
   2. Header Line - Single line prefixed with a one pound symbol (#).
CHROM | POS | ID | REF | ALT | QUAL | FILTER | INFO
----- | --- | -- | --- | --- | ---- | ------ | ----

Content cell 1 | Content cell 2
Content column 1 | Content column 2

   3. Data Lines - Remainder of the file with 1 position per line.
    Each data line represents a position in the genome.
    
Therefore VCF files couple Variants with calls thereby compressing the data.
When you have a lot of calls with a lot of unique/rare variants, the format gets data heavy though.

