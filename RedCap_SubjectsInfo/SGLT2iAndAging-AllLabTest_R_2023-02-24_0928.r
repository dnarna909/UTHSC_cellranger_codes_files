#Clear existing data and graphics
rm(list=ls())
graphics.off()
#Load Hmisc library
library(Hmisc)
#Read Data
data=read.csv('SGLT2iAndAging-AllLabTest_DATA_2023-02-24_0928.csv')
#Setting Labels

label(data$record_id)="Record ID: 766-"
label(data$redcap_event_name)="Event Name"
label(data$redcap_repeat_instrument)="Repeat Instrument"
label(data$redcap_repeat_instance)="Repeat Instance"
label(data$diabetesyn)="Has a doctor told you that you have diabetes?"
label(data$age)="Age at Consent"
label(data$sex)="Gender"
label(data$race)="Race"
label(data$random_yn)="Was subject randomized?"
label(data$randgroup)="Group Assignment:"
label(data$treatment_group_complete)="Complete?"
label(data$visitnumber_vs)="Visit #"
label(data$weight)="Weight (pounds)"
label(data$bmi)="BMI"
label(data$bpsystol_vs)="Blood Pressure Systolic"
label(data$bpdiastol_vs)="Blood Pressure Diastolic"
label(data$heartrate_vs)="Heart Rate (bpm)"
label(data$resprate_vs)="Respirations per minute"
label(data$temp_vs)="Temperature (F)"
label(data$dm)="Diabetes"
label(data$white_blood_cell)="White Blood Cell - WBC"
label(data$red_blood_cell)="Red Blood Cell - RBC"
label(data$hemoglobin)="Hemoglobin"
label(data$hematocrit)="Hematocrit"
label(data$cbc_monocyte)="Monocyte"
label(data$cbc_granulo)="Granulocytes"
label(data$cbc_neutrophil)="Neutrophils"
label(data$cbc_eosinophil)="Eosinophils"
label(data$cbc_basophils)="Basophils"
label(data$cbc_mcv)="MCV"
label(data$cbc_mch)="MCH"
label(data$cbc_mchc)="MCHC"
label(data$cbc_rdw)="RDW"
label(data$cbc_platelets)="Platelets"
label(data$cbc_complete)="Complete?"
label(data$ua_glucose)="Urine Glucose"
label(data$ua_blood)="Urine Blood"
label(data$ua_urobilinogen)="Urobilinogen"
label(data$ua_nitrite)="Urine Nitrite"
label(data$liverfibroscan_yn)="Was liver fibroscan done? "
label(data$liver_fibroscan_complete)="Complete?"
label(data$six_min_walk_done)="6 min walk done?"
label(data$total_number_of_half_laps)="Total number of half laps completed:"
label(data$conversion_to_feet)="Conversion to feet:"
label(data$conversion_to_meters)="Conversion to meters:"
label(data$additional_distance_conver)="Additional distance converted from inches to meters:"
label(data$total_6min_walk)="Total:"
label(data$total_number_times_stopped)="Total number times stopped during walk:"
label(data$was_the_test_terminated)="Was the test terminated?"
label(data$mobility_aid_used)="Mobility aid used?"
label(data$minute_walk_complete)="Complete?"
label(data$visit_biodex)="Visit: "
label(data$biodex_done)="Was biodex done at this visit?"
label(data$repeated_biodex)="Did it have to be repeated?"
label(data$biodex_complete)="Complete?"
label(data$hand_grip_completed)="Hand grip completed?"
label(data$armsurgery)="A. Have you had any recent arm/elbow/hand surgery?"
label(data$hand_tested)="Hand tested?"
label(data$t1)="t1"
label(data$t2)="t2"
label(data$t3)="t3"
label(data$grip_tests_taken)="Grip Tests taken"
label(data$trial1)="B. Trial 1 (kg) "
label(data$trial_1_score)="Trial 1 Score "
label(data$trial2)="B. Trial 2 (kg)"
label(data$trial_2_score)="Trial 2 Score"
label(data$trial3)="B. Trial 3 (kg)"
label(data$trial_3_score)="Trial 3 Score"
label(data$trial_avg)="Trial Average "
label(data$grip_strength_complete)="Complete?"
label(data$mbx_collected)="Was muscle biopsy collected?"
label(data$muscle_biopsy_collection_complete)="Complete?"
#Setting Units


#Setting Factors(will create new variable for factors)
data$redcap_event_name.factor = factor(data$redcap_event_name,levels=c("logs_arm_1","repeat_labs_arm_1","checklists_arm_1","visit_1_arm_1","visit_2_arm_1","visit_3_arm_1","visit_4_arm_1","visit_5_arm_1","visit_5__1_week_arm_1","visit_6_arm_1","visit_7_arm_1","visit_8_arm_1","visit_9_arm_1","visit_10_arm_1","visit_11_arm_1","visit_12_arm_1","unscheduled_visit_arm_1"))
data$redcap_repeat_instrument.factor = factor(data$redcap_repeat_instrument,levels=c("protocol_deviation_tracking_log_repeating","enrollment_status","adverse_events_log_repeating","concomitant_medications_repeating_instrument","nutrition_consult"))
data$diabetesyn.factor = factor(data$diabetesyn,levels=c("1","0"))
data$sex.factor = factor(data$sex,levels=c("0","1"))
data$race.factor = factor(data$race,levels=c("0","1","2","3","4","5","6"))
data$random_yn.factor = factor(data$random_yn,levels=c("1","0"))
data$randgroup.factor = factor(data$randgroup,levels=c("1","2"))
data$treatment_group_complete.factor = factor(data$treatment_group_complete,levels=c("0","1","2"))
data$visitnumber_vs.factor = factor(data$visitnumber_vs,levels=c("0","1","2","3","4","5","6","7","8","9","10","12","11"))
data$dm.factor = factor(data$dm,levels=c("1","2"))
data$cbc_complete.factor = factor(data$cbc_complete,levels=c("0","1","2"))
data$ua_glucose.factor = factor(data$ua_glucose,levels=c("1","2"))
data$ua_blood.factor = factor(data$ua_blood,levels=c("1","2"))
data$ua_urobilinogen.factor = factor(data$ua_urobilinogen,levels=c("1","2"))
data$ua_nitrite.factor = factor(data$ua_nitrite,levels=c("1","2"))
data$liverfibroscan_yn.factor = factor(data$liverfibroscan_yn,levels=c("1","0"))
data$liver_fibroscan_complete.factor = factor(data$liver_fibroscan_complete,levels=c("0","1","2"))
data$six_min_walk_done.factor = factor(data$six_min_walk_done,levels=c("1","2","3","4"))
data$was_the_test_terminated.factor = factor(data$was_the_test_terminated,levels=c("1","2"))
data$mobility_aid_used.factor = factor(data$mobility_aid_used,levels=c("1","2"))
data$minute_walk_complete.factor = factor(data$minute_walk_complete,levels=c("0","1","2"))
data$visit_biodex.factor = factor(data$visit_biodex,levels=c("1","2","3","4","5","6","7","8","9","10","11","12","13","14","15"))
data$biodex_done.factor = factor(data$biodex_done,levels=c("1","0","2","3","4"))
data$repeated_biodex.factor = factor(data$repeated_biodex,levels=c("1","0"))
data$biodex_complete.factor = factor(data$biodex_complete,levels=c("0","1","2"))
data$hand_grip_completed.factor = factor(data$hand_grip_completed,levels=c("1","2","3","4"))
data$armsurgery.factor = factor(data$armsurgery,levels=c("1","2","8"))
data$hand_tested.factor = factor(data$hand_tested,levels=c("1","2","3"))
data$t1.factor = factor(data$t1,levels=c("1","99.6","99.8","99.9"))
data$t2.factor = factor(data$t2,levels=c("1","99.6","99.8","99.9"))
data$t3.factor = factor(data$t3,levels=c("1","99.6","99.8","99.9"))
data$grip_strength_complete.factor = factor(data$grip_strength_complete,levels=c("0","1","2"))
data$mbx_collected.factor = factor(data$mbx_collected,levels=c("1","0"))
data$muscle_biopsy_collection_complete.factor = factor(data$muscle_biopsy_collection_complete,levels=c("0","1","2"))

levels(data$redcap_event_name.factor)=c("Logs","Repeat Labs","Checklists","Visit 1","Visit 2","Visit 3","Visit 4","Visit 5","Visit 5 + 1 week","Visit 6","Visit 7","Visit 8","Visit 9","Visit 10","Visit 11","Visit 12","Unscheduled Visit")
levels(data$redcap_repeat_instrument.factor)=c("Protocol Deviation Tracking Log Repeating","Enrollment Status","Adverse Events Log Repeating","Concomitant Medications Repeating Instrument","Nutrition Consult")
levels(data$diabetesyn.factor)=c("Yes","No")
levels(data$sex.factor)=c("Female","Male")
levels(data$race.factor)=c("American Indian/Alaska Native","Asian","Native Hawaiian or Other Pacific Islander","Black or African American","White","More Than One Race","Unknown / Not Reported")
levels(data$random_yn.factor)=c("Yes","No")
levels(data$randgroup.factor)=c("Drug - dapagliflozin","Nutritional counseling")
levels(data$treatment_group_complete.factor)=c("Incomplete","Unverified","Complete")
levels(data$visitnumber_vs.factor)=c("Visit -1 Screening","Visit 1","Visit 2","Visit 3","Visit 4","Visit 5","Visit 6","Visit 7","Visit 8","Visit 9","Visit 10","Visit 11","Interim/Unscheduled Visit")
levels(data$dm.factor)=c("No","Yes")
levels(data$cbc_complete.factor)=c("Incomplete","Unverified","Complete")
levels(data$ua_glucose.factor)=c("negative","positive")
levels(data$ua_blood.factor)=c("negative","positive")
levels(data$ua_urobilinogen.factor)=c("negative","positive")
levels(data$ua_nitrite.factor)=c("negative","positive")
levels(data$liverfibroscan_yn.factor)=c("Yes","No")
levels(data$liver_fibroscan_complete.factor)=c("Incomplete","Unverified","Complete")
levels(data$six_min_walk_done.factor)=c("Completed","Refused","N/A","DNQ")
levels(data$was_the_test_terminated.factor)=c("No","Yes")
levels(data$mobility_aid_used.factor)=c("No","Yes")
levels(data$minute_walk_complete.factor)=c("Incomplete","Unverified","Complete")
levels(data$visit_biodex.factor)=c("Visit 1","Visit 2","Visit 3","Visit 4","Visit 5","Visit 6","Visit 7","Visit 8","Visit 9","Visit 10","Visit 11","Visit 12","Visit 13","Visit 14","Visit 15")
levels(data$biodex_done.factor)=c("Completed","No","N/A","Refused","DNQ")
levels(data$repeated_biodex.factor)=c("Yes","No")
levels(data$biodex_complete.factor)=c("Incomplete","Unverified","Complete")
levels(data$hand_grip_completed.factor)=c("Completed","Refused","N/A","DNQ")
levels(data$armsurgery.factor)=c("Yes","No","DK/REF")
levels(data$hand_tested.factor)=c("Right","Left","Not applicable")
levels(data$t1.factor)=c("test taken","unable or discontinued","not performed for safety reasons","refused")
levels(data$t2.factor)=c("test taken","unable or discontinued","not performed for safety reasons","refused")
levels(data$t3.factor)=c("test taken","unable or discontinued","not performed for safety reasons","refused")
levels(data$grip_strength_complete.factor)=c("Incomplete","Unverified","Complete")
levels(data$mbx_collected.factor)=c("Yes","No")
levels(data$muscle_biopsy_collection_complete.factor)=c("Incomplete","Unverified","Complete")
