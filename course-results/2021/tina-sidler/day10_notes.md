## GATK

Align raw sequence to reference sequence -> alinged BAM -> mark duplicates -> realign -> analysing BAM sequence
Compare tumor, match normal & germline-variants from the population & panel normals -> variant callin SNV & Index -> raw variants (to normalize, don't get germline alteration -> have to exclude all "normal" alteration
Compare tumor, normal and germline-variants from the population -> Contamination
Then **filter** the raw variants and the contamination -> .... -> variants

Panel Normals: accumulation of match normals, to make sure variants we don't want have been filtered out
Match normal: from same individual as the tumor
