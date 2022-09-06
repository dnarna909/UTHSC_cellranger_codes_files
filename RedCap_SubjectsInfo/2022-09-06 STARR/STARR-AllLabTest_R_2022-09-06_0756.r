#Clear existing data and graphics
rm(list=ls())
graphics.off()
#Load Hmisc library
library(Hmisc)
#Read Data
data=read.csv('STARR-AllLabTest_DATA_2022-09-06_0756.csv')
#Setting Labels

label(data$record_id)="Record ID"
label(data$recruited_from)="Recruited from"
label(data$age)="1. How old are you? "
label(data$sex)="3. What is your sex?"
label(data$race___1)="2. What is your race?  Please indicate all that apply (choice=American Indian or Alaska Native)"
label(data$race___2)="2. What is your race?  Please indicate all that apply (choice=Asian)"
label(data$race___3)="2. What is your race?  Please indicate all that apply (choice=Black or African American)"
label(data$race___4)="2. What is your race?  Please indicate all that apply (choice=Native Hawaiian or Other Pacific Islander)"
label(data$race___5)="2. What is your race?  Please indicate all that apply (choice=White)"
label(data$race___6)="2. What is your race?  Please indicate all that apply (choice=Some other race or origin)"
label(data$race___7)="2. What is your race?  Please indicate all that apply (choice=DK/REF)"
label(data$ethnicity)="Are you of Hispanic, Latino, or Spanish origin?"
label(data$education)="What is the highest grade or level of schooling that you have completed?"
label(data$marital_status)="Are you presently married, or are you widowed, separated, divorced, or have you never been married?"
label(data$diabetes_doctor)="I see that you noted on the checklist that you have diabetes.  Have you been told by a doctor that you have diabetes?  "
label(data$diabetes_medicine)="Are you taking any medicine for diabetes now?"
label(data$diabetes_medicine_rx)="Was this medicine prescribed by a doctor?"
label(data$cholesterol_doctor)="I see you noted on the checklist that you have high cholesterol.  Have you been told by a doctor that you have high cholesterol? "
label(data$cholesterol_medication)="In the last year, have you taken any medicine for high cholesterol?"
label(data$hbp_doctor)="I see that you noted on the checklist that you have high blood pressure.  Have you been told by a doctor that you have high blood pressure? "
label(data$hbp_medicine)="In the last year, have you taken any medicine for high blood pressure?"
label(data$white_blood_cell)="White Blood Cell"
label(data$red_blood_cell)="Red Blood Cell"
label(data$hemoglobin)="Hemoglobin "
label(data$hematocrit)="Hematocrit"
label(data$mcv)="MCV"
label(data$mch)="MCH "
label(data$platelets)="Platelets"
label(data$glucose)="Glucose"
label(data$bun)="BUN"
label(data$creatinine)="Creatinine"
label(data$sodium)="Sodium"
label(data$potassium)="Potassium"
label(data$calcium)="Calcium"
label(data$protein_total)="Protein, total"
label(data$albumin)="Albumin"
label(data$alkaline_phosphatase)="Alkaline Phosphatase"
label(data$total_bilirubin)="Total Bilirubin"
label(data$ast)="AST"
label(data$alt)="ALT"
label(data$cholesterol)="Cholesterol"
label(data$triglycerides)="Triglycerides"
label(data$hdl)="HDL"
label(data$ldl)="LDL"
label(data$vldl)="VLDL"
label(data$hemoglobin_a1c)="Hemoglobin A1c"
label(data$skin_biopsy)="Skin Biopsy Performed?"
label(data$fat_biopsy)="Fat Biopsy Performed?"
label(data$biopsy_complication)="Did a complication occur with the skin and/or fat biopsy?"
label(data$weight)="Weight"
label(data$height)="Height"
label(data$bmi)="Body Mass Index"
label(data$systolic)="Systolic"
label(data$diastolic)="Diastolic"
label(data$fasting)="1. When was the last time you had anything to eat or drink besides water?"
label(data$dbc4_diabetes)="4.  Diabetes"
label(data$dbc1_hbp)="1.  High blood pressure"
label(data$dbc2_chol)="2.  High cholesterol"
label(data$dbc12_overwt)="12. Overweight"
#Setting Units


#Setting Factors(will create new variable for factors)
data$recruited_from.factor = factor(data$recruited_from,levels=c("1","2","3","4"))
data$sex.factor = factor(data$sex,levels=c("1","2","3","4"))
data$race___1.factor = factor(data$race___1,levels=c("0","1"))
data$race___2.factor = factor(data$race___2,levels=c("0","1"))
data$race___3.factor = factor(data$race___3,levels=c("0","1"))
data$race___4.factor = factor(data$race___4,levels=c("0","1"))
data$race___5.factor = factor(data$race___5,levels=c("0","1"))
data$race___6.factor = factor(data$race___6,levels=c("0","1"))
data$race___7.factor = factor(data$race___7,levels=c("0","1"))
data$ethnicity.factor = factor(data$ethnicity,levels=c("1","2"))
data$education.factor = factor(data$education,levels=c("1","2","3","4","5","6","7","8"))
data$marital_status.factor = factor(data$marital_status,levels=c("1","2","3","4","5","6"))
data$diabetes_doctor.factor = factor(data$diabetes_doctor,levels=c("1","2","-8"))
data$diabetes_medicine.factor = factor(data$diabetes_medicine,levels=c("1","2","-8"))
data$diabetes_medicine_rx.factor = factor(data$diabetes_medicine_rx,levels=c("1","2","-8"))
data$cholesterol_doctor.factor = factor(data$cholesterol_doctor,levels=c("1","2","-8"))
data$cholesterol_medication.factor = factor(data$cholesterol_medication,levels=c("1","2","-8"))
data$hbp_doctor.factor = factor(data$hbp_doctor,levels=c("1","2","-8"))
data$hbp_medicine.factor = factor(data$hbp_medicine,levels=c("1","2","-8"))
data$skin_biopsy.factor = factor(data$skin_biopsy,levels=c("1","0"))
data$fat_biopsy.factor = factor(data$fat_biopsy,levels=c("1","0"))
data$biopsy_complication.factor = factor(data$biopsy_complication,levels=c("1","0"))
data$fasting.factor = factor(data$fasting,levels=c("1","2"))
data$dbc4_diabetes.factor = factor(data$dbc4_diabetes,levels=c("0","1","2","3","4","5"))
data$dbc1_hbp.factor = factor(data$dbc1_hbp,levels=c("0","1","2","3","4","5"))
data$dbc2_chol.factor = factor(data$dbc2_chol,levels=c("0","1","2","3","4","5"))
data$dbc12_overwt.factor = factor(data$dbc12_overwt,levels=c("0","1","2","3","4","5"))

levels(data$recruited_from.factor)=c("Call Center","Community Event (See below)","Referred from another study","Other")
levels(data$sex.factor)=c("Female","Male","Other","Unreported")
levels(data$race___1.factor)=c("Unchecked","Checked")
levels(data$race___2.factor)=c("Unchecked","Checked")
levels(data$race___3.factor)=c("Unchecked","Checked")
levels(data$race___4.factor)=c("Unchecked","Checked")
levels(data$race___5.factor)=c("Unchecked","Checked")
levels(data$race___6.factor)=c("Unchecked","Checked")
levels(data$race___7.factor)=c("Unchecked","Checked")
levels(data$ethnicity.factor)=c("Yes","No")
levels(data$education.factor)=c("Grammar school","High school or equivalent","Vocational technical school (2 year)","Some college","Associate degree","Bachelors degree","Masters degree","Doctoral or professional degree (PhD, MD, JD, etc)")
levels(data$marital_status.factor)=c("Married","Widowed","Separated","Divorced","Never Married","DK/REF")
levels(data$diabetes_doctor.factor)=c("Yes","No (SKIP TO CHOLESTEROL)","DK/REF (SKIP TO CHOLESTEROL)")
levels(data$diabetes_medicine.factor)=c("Yes","No","DK/REF")
levels(data$diabetes_medicine_rx.factor)=c("Yes","No","DK/REF")
levels(data$cholesterol_doctor.factor)=c("Yes","No (SKIP TO HIGH BLOOD PRESSURE)","DK/REF (SKIP TO HIGH BLOOD PRESSURE)")
levels(data$cholesterol_medication.factor)=c("Yes","No","DK/REF")
levels(data$hbp_doctor.factor)=c("Yes","No (SKIP TO FALLS)","DK/REF (SKIP TO FALLS)")
levels(data$hbp_medicine.factor)=c("Yes","No","DK/REF")
levels(data$skin_biopsy.factor)=c("Yes","No")
levels(data$fat_biopsy.factor)=c("Yes","No")
levels(data$biopsy_complication.factor)=c("Yes","No")
levels(data$fasting.factor)=c("Yes, fasting","No, not fasting")
levels(data$dbc4_diabetes.factor)=c("I DONT HAVE THIS CONDITION 0","NOT AT ALL 1","2","3","4","A LOT 5")
levels(data$dbc1_hbp.factor)=c("I DONT HAVE THIS CONDITION 0","NOT AT ALL 1","2","3","4","A LOT 5")
levels(data$dbc2_chol.factor)=c("I DONT HAVE THIS CONDITION 0","NOT AT ALL 1","2","3","4","A LOT 5")
levels(data$dbc12_overwt.factor)=c("I DONT HAVE THIS CONDITION 0","NOT AT ALL 1","2","3","4","A LOT 5")

saveRDS(data, "STARR-AllLabTest_DATA_2022-09-06_0756.rds")
xlsx::write.xlsx(data, file = "STARR-AllLabTest_DATA_2022-09-06_0756.xlsx", row.names=FALSE)
