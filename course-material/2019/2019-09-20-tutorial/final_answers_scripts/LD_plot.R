# code based on https://www.biostars.org/p/347796/
# load libraries
library(dplyr)
library(ggplot2)

# define plotting functions
#' @title plotPairwiseLD
#' @description Plots R2 heatmap across the chromosome (like Haploview)
#' @param dfr A data.frame with minimum CHROM_A, BP_A, CHROM_B, BP_B and R2.
#' An output from tomahawk works.
#' @param chr A chromosome name.
#' @param xlim A two number vector specifying min and max x-axis limits. Any one or both can be defaulted by specifying NA.
#' @param ylim A two number vector specifying min and max y-axis limits. Any one or both can be defaulted by specifying NA.
#' @param minr2 A value between 0 and 1. All SNPs with R2 value below this 
#' value is excluded from plot.
#' 
plotPairwiseLD <- function(dfr,chr,xlim=c(NA,NA),ylim=c(NA,NA),minr2, xbreaks, title) {

  if(missing(dfr)) stop("Input data.frame 'dfr' missing.")
  ld <- dfr
  if(!missing(chr)) {
    ld <- filter(ld,CHROM_A==get("chr") & CHROM_B==get("chr"))
  }
  ld <- filter(ld,BP_A<BP_B)
  
  if(!missing(minr2)) {
    ld <- filter(ld,R2>get("minr2"))
  }
  
  
  ld$BP_A <- ld$BP_A/1000
  ld$BP_B <- ld$BP_B/1000
  
  ld <- ld %>% arrange(R2)
  
  ld$x <- ld$BP_A+((ld$BP_B-ld$BP_A)/2)
  ld$y <- (ld$BP_B-ld$BP_A)
  ld$r2c <- cut(ld$R2,breaks=seq(0,1,0.2),labels=c("0-0 - 0.2","0.2 - 0.4",
                                                   "0.4 - 0.6","0.6 - 0.8",
                                                   "0.8 - 1.0"))
  ld$r2c <- factor(ld$r2c,levels=rev(c("0-0 - 0.2","0.2 - 0.4",
                                       "0.4 - 0.6","0.6 - 0.8",
                                       "0.8 - 1.0")))
  
  if(!missing(xbreaks)) {
    x_break_vector <- round(seq(min(ld$x), max(ld$x), length = xbreaks)/10) *10
  } else {
    x_break_vector <- waiver()
  }
  ggplot(ld,aes(x=x,y=y,col=r2c))+
    geom_point(shape=20,size=0.1,alpha=0.8)+
    scale_color_manual(values=c("#ca0020","#f4a582","#d1e5f0","#67a9cf","#2166ac"))+
    scale_x_continuous(limits=xlim, breaks = x_break_vector)+
    scale_y_continuous(limits=ylim)+
    guides(colour=guide_legend(title="R2",override.aes=list(shape=20,size=8)))+
    labs(x="Chromosome position (KBp)",y="Distance (KBp)")+
    theme_bw(base_size=14)+
    theme(panel.border=element_blank(),
          axis.ticks=element_blank(),
          axis.text.x = element_text(angle = 45, hjust = 1)
          ) +
    ggtitle(title) %>%
    return()
}

#' @title plotDecayLD
#' @description Plots R2 heatmap across the chromosome (like Haploview)
#' @param dfr A data.frame with minimum CHROM_A, BP_A, CHROM_B, BP_B and R2.
#' An output from tomahawk works.
#' @param chr A chromosome name.
#' @param xlim A two number vector specifying min and max x-axis limits. Any one or both can be defaulted by specifying NA.
#' @param ylim A two number vector specifying min and max y-axis limits.  Any one or both can be defaulted by specifying NA.
#' @param avgwin An integer specifying window size. Mean R2 is computed within windows.
#' @param minr2 A value between 0 and 1. All SNPs with R2 value below this 
#' value is excluded from plot.
#' 
plotDecayLD <- function(dfr,chr,xlim=c(NA,NA),ylim=c(NA,NA),avgwin=0,minr2, title) {
  if(missing(dfr)) stop("Input data.frame 'dfr' missing.")
  ld <- dfr
  if(!missing(chr)) {
    ld <- filter(ld,CHROM_A==get("chr") & CHROM_B==get("chr"))
  }
  ld <- filter(ld,BP_A<BP_B)
  
  ld$BP_A <- ld$BP_A/1000
  ld$BP_B <- ld$BP_B/1000
  
  if(!missing(minr2)) {
    ld <- filter(ld,R2>get("minr2"))
  }
  
  ld <- ld %>% arrange(R2)
  
  ld$dist <- ld$BP_B-ld$BP_A
  
  if(avgwin>0) {
    ld$distc <- cut(ld$dist,breaks=seq(from=min(ld$dist),to=max(ld$dist),length.out =avgwin))
    ld <- ld %>% group_by(distc) %>% summarise(dist=mean(dist),R2=mean(R2))
  }
  
  ggplot(ld,aes(x=dist,y=R2))+
    geom_point(shape=20,size=0.15,alpha=0.7)+
    geom_smooth()+
    scale_x_continuous(limits=xlim)+
    scale_y_continuous(limits=ylim)+
    labs(x="Distance (KBp)",y=expression(LD~(r^{2})))+
    theme_bw(base_size=14)+
    theme(panel.border=element_blank(),
          axis.ticks=element_blank()) +
    ggtitle(title)%>%
    return()
}


library(readr)
system('plink --vcf AFR.chr20.chunk1.1kg.all.vcf.gz --maf 0.2 --r2  --ld-window-r2 0 --out afr.maf')
system('plink --vcf ALL.chr20.chunk1.vcf.gz --maf 0.2 --r2 --ld-window-r2 0 --out ALL.maf')
system('plink --vcf HAN.chr20.chunk1.1kg.all.vcf.gz --maf 0.2 --r2 --ld-window-r2 0 --out han.maf')


start = 2 * 10^6
end = 3 * 10^6

ld <- read_table2("ALL.maf.ld") 
pdf('ALL.maf.decay.pdf', width = 6, height = 5)
plotDecayLD(ld,xlim = c(0,100), ylim = c(0,1), avgwin = 80, title = 'LD decay All')
dev.off()

ld <- ld %>% filter(BP_A > start  & BP_A < end  & ld$BP_B > start  & ld$BP_B < end )
pdf('ALL.maf.ld.pdf', width = 18, height = 5)
plotPairwiseLD(ld ,ylim=c(0,300), xbreaks = 10, title = 'LD plot All') #,minr2=0.2
dev.off()

ld <- read_table2("han.maf.ld") 
pdf('han.maf.decay.pdf', width = 6, height = 5)
plotDecayLD(ld,xlim = c(0,100), ylim = c(0,1), avgwin = 80, title = 'LD decay Han Chinese')
dev.off()

ld <- ld %>% filter(BP_A > start  & BP_A < end  & ld$BP_B > start  & ld$BP_B < end )
pdf('han.maf.ld.pdf', width = 18, height = 5)
plotPairwiseLD(ld ,ylim=c(0,300), xbreaks = 10,  title = 'LD plot Han Chiense') #,minr2=0.2
dev.off()


ld <- read_table2("afr.maf.ld") 
pdf('afr.maf.decay.pdf', width = 6, height = 5)
plotDecayLD(ld,xlim = c(0,100), ylim = c(0,1), avgwin = 80, title = 'LD decay African')
dev.off()

ld <- ld %>% filter(BP_A > start  & BP_A < end  & ld$BP_B > start  & ld$BP_B < end )
pdf('afr.maf.ld.pdf', width = 18, height = 5)
plotPairwiseLD(ld ,ylim=c(0,300), xbreaks = 10, title = 'LD plot Arican') #,minr2=0.2
dev.off()

