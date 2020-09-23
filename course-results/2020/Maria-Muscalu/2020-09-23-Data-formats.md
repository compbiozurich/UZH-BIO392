### 1. [Genome Reference Consortium]( https://www.ncbi.nlm.nih.gov/grc/human)
It provides reference assembly reference for human genome. They can generate multiple representations for too complex regions and patches for a specific locus.

### 2.  [GFF/GTF file format](https://www.ensembl.org/info/website/upload/gff.html)
The General Feature Format (GFF) has one line per feature, and the information is divided in nine tab separated, mandatory columns and additional information [[1]].  The first field is the **seqname**, which indicates the chromosome or scaffold, followed by **source**, which names the program that generated the feature. The next columns inform about the **feature type**, the **start** and **end** position. The **score** gives the floating point value, the **standard** defines if it is forward (+) or reverse (-). The **frame** is indicated by **0**, **1** or  **2** and then comes the **attribute** field. 

[1]: https://www.ensembl.org/info/website/upload/gff.html

### 3. [Wiggle Track Format (WIG)]( https://genome.ucsc.edu/goldenpath/help/wiggle.html)
This is the recommended format for the graphing track. The first line of the Wiggle format is a track definition line. The files are composed of declaration and data lines. The data can be formatted in two ways: variableStep and fixedStep.

variableStep format is used for irregular intervals between two data points. The first two lines  give the track definition and the declaration. The following data is separated in 2 columns and informs about the chromosome position and data values.

fixedStep format contains data with regular intervals between new data. The format of the first two lines is the same as for the variableStep. The rest of the data is arranged in one column, which indicates the data values.
