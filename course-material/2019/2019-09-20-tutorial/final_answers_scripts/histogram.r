### MAF histogram

library(readr)
setwd('/Users/qingyao/Desktop/tutorial_20-09')
HAN <- read_table2("data/HAN.frq")
AFR <- read_table2("data/AFR.frq")
ALL <- read_table2("data/ALL.frq")

# par(mfrow = c(1,3))
# hist(ALL$MAF)
# hist(AFR$MAF)
# hist(HAN$MAF)

library(ggplot2)
n = nrow(ALL)
df <- data.frame(MAF = c(ALL$MAF, AFR$MAF, HAN$MAF), Population = c(rep('ALL', n), rep('AFR',n), rep('HAN',n)))
df$Population <- factor(df$Population, levels = c('ALL', 'AFR', 'HAN'))
ggplot(df, aes(x=MAF, fill=Population)) +
  geom_histogram() + facet_grid(.~Population)
