## Let's try it in R

## Clear R's brain
rm(list=ls())

## Load libraries
library(tidyverse)
library(readr)
library(survival)
library(survminer)
library(lubridate)

## Load data
survival <- read.csv("C:/Users/ann-k/Desktop/sarcoma.csv")
tp53 <- read.csv("C:/Users/ann-k/Desktop/sarcoma_tp53del.csv")
myc <- read.csv("C:/Users/ann-k/Desktop/sarcoma_MYC_dup.csv")
erbb2 <- read.csv("C:/Users/ann-k/Desktop/sarcoma_erbb2dup.csv")
cdkn2a <- read.csv("C:/Users/ann-k/Desktop/sarcoma_cdkn2adel.csv")

## Match data
Id_surv <- survival %>%
  select(X_id)

Id_tp53 <- tp53 %>%
  select(X_id)

Id_myc <- myc %>%
  select(X_id)

Id_erbb2 <- erbb2 %>%
  select(X_id)

Id_cdkn2a <- cdkn2a %>%
  select(X_id)

list_tp53 <- inner_join(Id_surv, Id_tp53)
list_myc <- inner_join(Id_surv, Id_myc)
list_erbb2 <- inner_join(Id_surv, Id_erbb2)
list_cdkn2a <- inner_join(Id_surv, Id_cdkn2a)

masterlist <- survival %>%
  mutate(TP53=case_when(survival$X_id %in% list_tp53$X_id == TRUE ~ "DEL",
                            TRUE ~ "WT"))
masterlist <- masterlist %>%
  mutate(MYC=case_when(survival$X_id %in% list_myc$X_id == TRUE ~ "DUP",
                            TRUE ~ "WT"))
masterlist <- masterlist %>%
  mutate(ERBB2=case_when(survival$X_id %in% list_erbb2$X_id == TRUE ~ "DUP",
                            TRUE ~ "WT"))
masterlist <- masterlist %>%
  mutate(CDKN2A=case_when(survival$X_id %in% list_cdkn2a$X_id == TRUE ~ "DEL",
                            TRUE ~ "WT"))

## Try plotting the data

## Pooled
ggplot(data=survival, mapping=aes(x=reorder(histologicalDiagnosis.label, info.cnvstatistics.cnvfraction,mean), y=info.cnvstatistics.cnvfraction)) +
  geom_boxplot() +
  scale_x_discrete(guide = guide_axis(angle = 20)) +
  ggtitle("CNV fraction of different sarcoma types, irrespective of mutation status") +
  xlab("Sarcoma type") +
  ylab("CNV fraction") +
  theme_bw()

ggplot(data=masterlist, mapping=aes(x=histologicalDiagnosis.label, y=info.cnvstatistics.cnvfraction, colour=TP53)) +
  geom_boxplot() +
  scale_x_discrete(guide = guide_axis(angle = 20)) +
  ggtitle("CNV fraction of different sarcoma types, grouped by mutation status of TP53") +
  xlab("Sarcoma type") +
  ylab("CNV fraction") +
  theme_bw()

ggplot(data=masterlist, mapping=aes(x=histologicalDiagnosis.label, y=info.cnvstatistics.cnvfraction, colour=MYC)) +
  geom_boxplot() +
  scale_x_discrete(guide = guide_axis(angle = 20)) +
  ggtitle("CNV fraction of different sarcoma types, grouped by mutation status of MYC") +
  xlab("Sarcoma type") +
  ylab("CNV fraction") +
  theme_bw()

ggplot(data=masterlist, mapping=aes(x=histologicalDiagnosis.label, y=info.cnvstatistics.cnvfraction, colour=ERBB2)) +
  geom_boxplot() +
  scale_x_discrete(guide = guide_axis(angle = 20)) +
  ggtitle("CNV fraction of different sarcoma types, grouped by mutation status of ERBB2") +
  xlab("Sarcoma type") +
  ylab("CNV fraction") +
  theme_bw()

ggplot(data=masterlist, mapping=aes(x=histologicalDiagnosis.label, y=info.cnvstatistics.cnvfraction, colour=CDKN2A)) +
  geom_boxplot() +
  scale_x_discrete(guide = guide_axis(angle = 20)) +
  ggtitle("CNV fraction of different sarcoma types, grouped by mutation status of CDKN2A") +
  xlab("Sarcoma type") +
  ylab("CNV fraction") +
  theme_bw()

## Survival plots
ggsurvplot(
  fit = survfit(Surv(info.followupMonths, info.death) ~ 1, data = masterlist), 
  title = "Pooled",
  xlab = "Follow-up in months", 
  ylab = "Survival probability")

Pooled_bysex <- survfit(Surv(info.followupMonths, info.death) ~ sex, data = masterlist)
ggsurvplot(
  Pooled_bysex, conf.int="TRUE", xlab = "Follow-up in months", ylab="Survival probability", 
  legend.title = "Sex", legend.labs = c("Female", "Male"), title = "Survival probability in all sarcoma types, grouped by sex", 
  ggtheme = theme_bw())

Pooled_byTP53 <- survfit(Surv(info.followupMonths, info.death) ~ TP53, data = masterlist)
ggsurvplot(
  Pooled_byTP53, conf.int="TRUE", xlab = "Follow-up in months", ylab="Survival probability", 
  legend.title = "TP53 status", legend.labs = c("Deletion", "Wildtype"), title = "Survival probability in all sarcoma types, grouped by mutation status of TP53", 
  ggtheme = theme_bw())

Pooled_byMYC <- survfit(Surv(info.followupMonths, info.death) ~ MYC, data = masterlist)
ggsurvplot(
  Pooled_byMYC, conf.int="TRUE", xlab = "Follow-up in months", ylab="Survival probability", 
  legend.title = "MYC status", legend.labs = c("Duplication", "Wildtype"), title = "Survival probability in all sarcoma types, grouped by mutation status of MYC", 
  ggtheme = theme_bw())

Pooled_byERBB2 <- survfit(Surv(info.followupMonths, info.death) ~ ERBB2, data = masterlist)
ggsurvplot(
  Pooled_byERBB2, conf.int="TRUE", xlab = "Follow-up in months", ylab="Survival probability", 
  legend.title = "ERBB2 status", legend.labs = c("Duplication", "Wildtype"), title = "Survival probability in all sarcoma types, grouped by mutation status of ERBB2", 
  ggtheme = theme_bw())

Pooled_byCDKN2A <- survfit(Surv(info.followupMonths, info.death) ~ CDKN2A, data = masterlist)
ggsurvplot(
  Pooled_byCDKN2A, conf.int="TRUE", xlab = "Follow-up in months", ylab="Survival probability", 
  legend.title = "CDKN2A status", legend.labs = c("Deletion", "Wildtype"), title = "Survival probability in all sarcoma types, grouped by mutation status of CDKN2A", 
  ggtheme = theme_bw())

## By diagnosis => Not ideal
Pooled_bydiagnosis <- survfit(Surv(info.followupMonths, info.death) ~ histologicalDiagnosis.label, data = masterlist)
ggsurvplot(
  Pooled_bydiagnosis, conf.int="TRUE", xlab = "Follow-up in months", ylab="Survival probability", 
  legend.title = "Diagnosis", title = "Survival probability in all tumor types", 
  ggtheme = theme_bw())

## Check how many data points there are for each category
table(masterlist$histologicalDiagnosis.label)

## Only do the 4 most frequent ones
filtered_masterlist <- masterlist %>%
  filter(histologicalDiagnosis.label %in% c("Chondrosarcoma", "Leiomyosarcoma", "Malignant Peripheral Nerve Sheath Tumor", "Osteosarcoma"))

Pooled_bydiagnosis_top <- survfit(Surv(info.followupMonths, info.death) ~ histologicalDiagnosis.label, data = filtered_masterlist)
ggsurvplot(
  Pooled_bydiagnosis_top, conf.int="FALSE", xlab = "Follow-up in months", ylab="Survival probability", 
  legend.title = "Sarcoma type", legend.labs = c("Chondrosarcoma", "Leiomyosarcoma", "Malignant Peripheral Nerve Sheath Tumor", "Osteosarcoma"), 
  title = "Survival probability of patients with the four most frequent sarcoma types", ggtheme = theme_bw())
