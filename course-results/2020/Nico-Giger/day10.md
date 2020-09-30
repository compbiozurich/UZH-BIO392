# Task d10

## Notes:
- **Mutect2**: uses the matched normal to additionally exclude rare germline variation, as well as a germline population resource
- **matched normal**: is a sample of healthy tissue of the same individual, in order to distinguish germline mutations from somatic mutations.
- **virtual normal**: samples from healthy, unrelated individuals (in contrast to matched normal)
- **Panel of Normals (PoN)**: set of in-house unrelated normal genomes --> aids in removing recurrent technical artifacts
- **Cross-sample contamination**:
 - GetPileupSummaries: summarize read support for a set number of known variant sites --> limit analysis to sites that are commonly variant.
 - CalculateContamination: Estimate contamination
- **FilterMutectCalls**: uses the annotations within the callset, and if provided, uses the contamination table and produces a VCF callset --> PASS label or labeled with reason (false positives)
- **igv.sh**: load from URL --> visualization & additional filtering

## Questions
* **How does this work exactly?**  
 "Let's also try out an additional feature of the tool. We can provide both the tumor and the matched normal **pileup table**. The pairing can allow for a slightly more accurate estimate." (CalculateContamination)

* **Where does the blue HC come from?**

## Task

* **What is the value of using a matched normal control?**  
Comparison to 'normal' data allows to distinguish relevant from non-relevant variations.

* **We see a C→T variant light up in red for the tumor but not the normal. What do you think is happening in 2_tumor_normal_m2.bam?**  
Tumor has mutation C→T at CpG,  possibly an epigenetic effect in TP53 gene (tumor suppressor). Hydrolysis of 5mC or deamination to Uracil and methylation to Thymine

* **What does the coverage tell you?**  
Rarity of a variation

* **What are the three grouped tracks for the bamout? What do the colors indicate? What differentiates the pastel versus gray reads?**  
HC: created assembly as reference; Colors: alligned HC tag
 - Normal cell line --> red  
 - Tumor cell line --> green  


* **How do you feel about this somatic call?**  
Worked pretty well for this example. I do not understand/know the algorithms behind the applied methods so I am not sure how 'reliable' the workflow is for other examples. I know what I did but not how exactly I did it...
