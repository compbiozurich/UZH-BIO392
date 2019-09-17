## An example of how to convert a file to BED format ##

library(tidyverse)

# read into dataframe
data <- read_delim("segments.tsv", 
                               "\t", escape_double = FALSE, trim_ws = TRUE)

# rename chromosomes
data <- mutate(data, CHRO=paste0('chr',CHRO))
# select columns
data <- select(data, CHRO, SEGSTART, SEGSTOP)
# write to a new file
write.table(data, file='data.bed', quote=FALSE, sep='\t', row.names = FALSE, col.names = FALSE)
