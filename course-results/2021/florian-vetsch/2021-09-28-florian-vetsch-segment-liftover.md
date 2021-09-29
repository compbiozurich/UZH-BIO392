# Segment liftover
<br/>

**Problem:**  
Assesmbling a reference genome is often done in multiple releases. Those assemblies differ in coordinates of mapped elements. For genome analysis we need the same genomic coordinate system.  
  
**Solution:**  
Genomic coordinate conversion with liftover tools. 

<br/>

### Comparison between different liftover tools
|  | liftOver| CrossMap | Remap | segment_liftover |
|--------|--------|-----------|-----------|-----------|
| web service | yes| yes | limited | x |
| command line utility | yes | yes | yes | yes |
| convert between organisms | yes | x | limited | x |
| convert files in BAM/SAM/BigWig format | x | yes | x | x | x |
| dealing with non-continuous genome segments in target assembly| break the segment into smaller segments | break the segment into smaller segments |  keeps the integrity of the segment | keeps the integrity of the segment |

Segment_liftover suprasses the other tools when:
* many genome coordinated have to be lifted at the same time 
* large genome segments  may be mapped into smaller sub-segments in the target assembly (especially important in context of CNV)

<br/>  

> segment_liftover aims at continuity-preserving remapping of genome segments between assemblies.
  
**Features** provided by segment liftover:
*  approximate locus conversion
*  automated batch processing
*  comprehensive logging to facilitate processing of datasets containing large numbers of structural genome variation data  
*  good balance between performance and accuracy
  
<br/>
<img src="https://f1000researchdata.s3.amazonaws.com/manuscripts/16527/750d34c7-0b41-4b42-96ce-a37bc5a7d6c0_figure1.gif">  
