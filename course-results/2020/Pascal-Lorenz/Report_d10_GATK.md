:octocat:
- ### What is the value of using a matched normal control? ###
    - Every person has some rare variations compared to the reference that don't actually cause the tumor. This is evident because even the healthy cells (from the blood line sample) have them. So in order to ignore those, and look at variations that show up in the tumor cells only, we filter with the normal control.

- ### We see a C→T variant light up in red for the tumor but not the normal. What do you think is happening in 2_tumor_normal_m2.bam? ###
    - Clearly, the tumor cells have a mutation in this location compared to the normal body cells. 100% of the aligned tumor reads have a T here, while 100% of the normal aligned reads have a C.

- ### What does the coverage tell you? ###
    - The high coverage here means that this alteration shows up commonly in this cancer strain.

- ### What are the three grouped tracks for the bamout? What do the colors indicate? What differentiates the pastel versus gray reads? ###
    - The first group (HC) contains the new "reference" that was created here. Since this region has a high amount of variation compared to the hg38 reference, aligning our read to hg38 would be hard. So instead, our reads are assembled into a new "reference" here, and everything is aligned to this new assembly in this region. 
    The next group is the normal cell line, and the last is tumor.
    The colors indicate what HC alignment the reads are part of. So eg. the red reads are what was used to make the red HC sequence. It seems that the red HC is based on the normal strain, the green HC on the tumor strain, and the other two hardly show up in the current small region. The grey ones were, I think, not used to make a new HC.

- ### How do you feel about this somatic call? ###
    - Pretty good. Especially the clear separation of normal vs tumor in regards to that C -> T mutation are promising for this being an important distinguisher. The fact that the red and green HC clearly come from the two separate strains also speaks for high quality of our findings.
