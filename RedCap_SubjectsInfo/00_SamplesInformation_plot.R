#' change "D:/" to "/media/jianie/Extreme SSD1/" # if in LUNIX computer

rm(list = ls(all.names = TRUE)) #will clear all objects includes hidden objects.
gc() #free up memrory and report the memory usage.
memory.limit(size = 80000000)

# set parameters
# set parameters for QC
# Disk <- c("/media/jianie/Extreme SSD1/") 
Disk <- c("D:/")

# set parameters for Sample Information
# sample.info.disk <- "/media/jianie/DATA/"
sample.info.disk <- "C:/Users/niej/Documents/"
sample.info.path <- "UTHSC_cellranger_codes_files/RedCap_SubjectsInfo/"

sample.file.name1 <- "sglt2.sn.all.subject.info.rds"
sample.file.name2 <- "STARR.all.subject.info.rds"

library(dplyr)

# add patient information ----------------------------------------------------------------
# SGLT2
sglt2 <- rio::import(paste0(sample.info.disk, sample.info.path, sample.file.name1),  
                    sheet = "SGLT2") %>% mutate(Project = "SGLT2", Group = ifelse(`Group Assignment:` == "Nutritional counseling", "C",
                                                                                  ifelse(`Group Assignment:` == "Drug - dapagliflozin", "D", NA)))
col.name <- sglt2 %>% 
  select_if(is.character) %>% 
  select(any_of(c("Height (inches)", "Weight (pounds)", 
            "BMI" , "Glucose",  "A1c Value" , "Age"))) %>% colnames()
sglt2 <- sglt2 %>% mutate_at(col.name, as.numeric)
sglt2 %>% select_if(is.numeric)


# STARR
starr <-readRDS(paste0(sample.info.disk, sample.info.path, sample.file.name2)) %>% rename( subject_id = id)
starr %>%  select_if(is.character)
starr %>% select_if(is.numeric)


library(readxl)
# insulin result -1
Insulin_Results_1 <- rio::import(paste0(sample.info.disk, sample.info.path, "STARR_Insulin Measurement.xlsx"),  
                                sheet = "Insulin_1", col_types = c("text", "text", "numeric", "numeric"))

# insulin result - 2
Insulin_Results_2 <- rio::import(paste0(sample.info.disk, sample.info.path, "STARR_Insulin Measurement.xlsx"),  
                                sheet = "Insulin_2", col_types = c("text", "numeric"))

starr <- starr %>% left_join(Insulin_Results_1, by = c("subject_id" = "id") ) %>% 
  left_join(Insulin_Results_2, by = c("subject_id" = "id") ) 
colnames(starr)

# combine
# patient <- sglt2 %>% full_join(starr, by = intersect(colnames(sglt2), colnames(starr))) 
patient <- starr %>% arrange(subject_id) %>% 
  mutate(Dataset = paste0("Sample", stringr::str_pad( 1: n(), 2, pad = "0") ),
         `HOMA-IR` = Glucose * `Insulin(µIU/mL)_MSD`/405) 
#, HOMA-IR = Glucose_mM * Insulin / 22.5, Glucose_mg/dL * Insulin / 405
# HOMA-IR was calculated according to the formula: fasting insulin (microU/L) x fasting glucose (nmol/L)/22.5.
unique(patient$Dataset)
saveRDS(patient, file = paste0(sample.info.disk, sample.info.path, "all.patients.rds"))

# plotting ----------------------------------
df <- patient %>% filter(SingleNuclei != "No")

# plot patient dots ------------------------------------------------------------------------------------
library("RColorBrewer")
library("ggpubr")
library("ggplot2")
# Age_BMI
table(is.na(df$Age))
table(is.na(df$BMI))
table(is.na(df$SingleNuclei))
table(is.na(df$Gender))
table(is.na(substr(df$subject_id, 7,9)))
      
p <- ggplot(df, aes(x = Age, y = BMI)) + 
  geom_point(aes(color=SingleNuclei, shape = Gender), size = ifelse(df$dbc4_diabetes.factor == 2, 4, 2)) +
  labs(title="Patients distribution", y = "Body mass index", x = "Age (years)") +  
  ylim(min(df$BMI), max(df$BMI)+1) + xlim(30, max(df$Age)+1) + 
  theme_classic() +
  theme(panel.border = element_rect(linetype = "solid", fill = NA, colour = "black"),
        axis.title.x = element_text(color = "black", size = 13, face = "plain"),
        axis.title.y = element_text(color = "black", size = 13, face = "plain"),
        axis.text.x = element_text(color = "black", size = 11.5, face = "plain", angle = 0, hjust = 1),
        plot.title = element_text(color = "black", size = 14, face = "bold", hjust = 0.5),
        legend.text = element_text(color = "black", size = 10.5, face = "plain"),
        #legend.position = c(0.9, 0.8),
        legend.position = c(.11, .81),
        #legend.position = "none",
        #legend.justification = c("left", "bottom"),
        #legend.box.just = "left",
        legend.spacing.y = unit(0.15, 'cm') ,
        legend.key.size = unit(0.45, "cm"),
        legend.background = element_rect( fill = "grey98", color = "grey98", size = 1)
  ) + 
  geom_vline(xintercept = 66, color = "black", linetype="dashed", size=0.2) +
  geom_vline(xintercept = 45, color = "black", linetype="dashed", size=0.2) +
  geom_hline(yintercept = 29.9, color = "black", linetype="dashed", size=0.2) +
  geom_hline(yintercept = 24.9, color = "black", linetype="dashed", size=0.2) + 
  geom_text(aes(color=SingleNuclei),
    label= substr(df$subject_id, 7,9),
    nudge_x=0.5, nudge_y=0.5,
    check_overlap=F
  )
p
png(file=paste0(sample.info.disk, sample.info.path, "/", "All_PatientInfor_Age_BMI_distribution.png"), 
    width=8, height=8, units = "in", res = 300)
p
dev.off()

# A1c_Glucose
p2 <- ggplot(df , aes(x = `A1c Value`, y = Glucose)) + 
  geom_point(aes(color=SingleNuclei, shape = Gender), size = ifelse(df$dbc4_diabetes.factor == 2, 4, 2)) +
  labs(title="Patients distribution", y = "Fasting Glucose (mg/dL)", x= "Hemoglobin A1C (%)") + # , y = "BMI", y = "BMI" 
  ylim(min(df$Glucose), max(df$Glucose)) + xlim(min(df$`A1c Value`), max(df$`A1c Value`)) + 
  theme_classic() +
  theme(panel.border = element_rect(linetype = "solid", fill = NA, colour = "black"),
        axis.title.x = element_text(color = "black", size = 13, face = "plain"),
        axis.title.y = element_text(color = "black", size = 13, face = "plain"),
        axis.text.x = element_text(color = "black", size = 11.5, face = "plain", angle = 0, hjust = 1),
        plot.title = element_text(color = "black", size = 14, face = "bold", hjust = 0.5),
        legend.text = element_text(color = "black", size = 10.5, face = "plain"),
        #legend.position = c(0.9, 0.8),
        legend.position = c(.11, .812),
        #legend.position = "none",
        #legend.justification = c("left", "bottom"),
        #legend.box.just = "left",
        legend.spacing.y = unit(0.15, 'cm') ,
        legend.key.size = unit(0.45, "cm"),
        legend.background = element_rect( fill = "grey98", color = "grey98", size = 1)
  ) + 
  geom_vline(xintercept = 5.7, color = "black", linetype="dashed", size=0.2) +
  geom_vline(xintercept = 6.4, color = "black", linetype="dashed", size=0.2) +
  geom_hline(yintercept = 100, color = "black", linetype="dashed", size=0.2) +
  geom_hline(yintercept = 125, color = "black", linetype="dashed", size=0.2) + 
  geom_text(aes(color=SingleNuclei), 
            label= substr(df$subject_id, 7,9),
            nudge_x=0.1, nudge_y=0.2, 
            check_overlap=F
  )
p2
png(file=paste0(sample.info.disk, sample.info.path, "/", "All_PatientInfor_A1c_Glucose_distribution.png"), 
    width=8, height=8, units = "in", res = 300)
p2
dev.off()


