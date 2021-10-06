## Workflow

1. Set the notebook up, get the files,start IGV, etc.
2. Call somatic SNV & indels with Mutect2
  * Get somatic short mutations on the HCC1143 tumor sample and matched normal -> The matched normal excludes rare germline variation that is not captured by the germline resource and individual-specific artifacts.



Questions:
1. What is the value of using a matched normal control?
  * The matched normal excludes rare germline variation that is not captured by the germline resource and individual-specific artifacts.

PoN: Panel of Normals has a vital role that fills a gap between the matched normal and the population resource. It is used to catch additional sites of noise in sequencing data, like mapping artifacts or other somewhat random but systematic artifacts of sequencing and data processing.
