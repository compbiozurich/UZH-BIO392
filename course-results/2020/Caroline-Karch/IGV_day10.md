##### 1. We see a C→T variant light up in red for the tumor but not the normal. What do you think is happening in 2_tumor_normal_m2.bam?

We see that both samples are present in the “2_tumor_normal_m2.bam” file. We get 40% C coverage (blue) and 60% T coverage (red). By regarding the pure tumor and normal blood samples we can say that all mutation in the “2_tumor_normal_m2.bam” file belongs to the tumor, since the normal blood cells do not have any mutation at this locus. 

##### 2. What are the three grouped tracks for the bamout? What do the colors indicate? What differentiates the pastel versus gray reads?

Three bamout files:
- Normal bam: HCC1143_normal
-	Tumor bam: HCC1143_tumor
- P_Germline?

Colors: The alignments are colored by tag HC. I think the grey ones does not belong to this HC group and therefore were not colored. 
the red pastel samples belong to the normal cell linage and the green to the tumor cell linage.
For the grey I detect tumor and normal cell samples. I don't really understand what this means...

