## GATK
* Align raw sequence to reference sequence -> alinged BAM -> mark duplicates -> realign -> analysing BAM sequence
* Compare tumor, match normal & germline-variants from the population & panel normals -> variant callin SNV & Index -> raw variants (to normalize, don't get germline alteration -> have to exclude all "normal" alteration
* Compare tumor, normal and germline-variants from the population -> Contamination
* Then **filter** the raw variants and the contamination -> Funcotator -> variants

Panel normals: accumulation of match normals, to make sure variants we don't want have been filtered out  
Match normal: is a sample of healthy tissue from the same individual to distinguish germline mutations from somatic mutations

For finding a tumor variant, we need match normal to compare and also have to compare to the general population germline-variants.
