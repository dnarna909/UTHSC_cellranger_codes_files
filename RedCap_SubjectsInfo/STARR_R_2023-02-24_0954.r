#Clear existing data and graphics
rm(list=ls())
graphics.off()
#Load Hmisc library
library(Hmisc)
#Read Data
data=read.csv('STARR_DATA_2023-02-24_0954.csv')
#Setting Labels

label(data$record_id)="Record ID"
label(data$enrollment_site)="Enrollment Site"
label(data$bru_vet)="If enrolled at BRU from an existing study, is participant a Veteran?"
label(data$recruited_from)="Recruited from"
label(data$hearing_difficulty)="Hearing Difficulty:"
label(data$face_page_complete)="Complete?"
label(data$signed_consent)="PARTICIPANT SIGNED CONSENT?"
label(data$agree_questionnaires)="OPTION A:  AGREED TO QUESTIONNAIRES &  PERFORMANCE- BASED TESTING? "
label(data$agree_24hrfood)="OPTION B:  AGREED TO 24-HOUR FOOD RECALL?"
label(data$agree_genetics)="OPTION C:  AGREED TO BLOOD DRAW FOR GENETIC ANALYSIS?"
label(data$agree_fatbiopsy)="OPTION D: AGREED TO FAT BIOPSY?"
label(data$agree_skinbiopsy)="OPTION E:  AGREED TO SKIN BIOPSY?"
label(data$agree_recontacta)="OPTION Fa: AGREED TO RE-CONTACT (provide additional samples or follow-up information) "
label(data$agree_recontactb)="OPTION Fb: AGREED TO RE-CONTACT (participate in future studies)"
label(data$informed_consent_complete)="Complete?"
label(data$age_screen)="1. Are you 18 years of age or older? "
label(data$current_living_arrangement)="2. How would you describe your current living arrangement? Do you...(read choices without pausing)"
label(data$pregnancy_screen)="3. Are you currently pregnant?"
label(data$screening_complete)="Complete?"
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
label(data$part_1_demographics_complete)="Complete?"
label(data$weight)="Weight"
label(data$height_collection_methodol1)="Weight Collection Method"
label(data$height)="Height"
label(data$height_collection_method)="Height Collection Method"
label(data$bmi)="Body Mass Index"
label(data$systolic)="Systolic"
label(data$diastolic)="Diastolic"
label(data$part_2_anthropometrics_vitals_complete)="Complete?"
label(data$fasting)="1. When was the last time you had anything to eat or drink besides water?"
label(data$smoked_ever)="2. Have you ever smoked cigarettes fairly regularly?  That is, have you ever smoked as many as 100 cigarettes in your entire life?"
label(data$smoke_history)="3. Would you describe yourself as a current smoker, former smoker, or someone who has never smoked a single cigarette?"
label(data$smoke_years)="4. For how many years altogether (did you smoke/have you been smoking) cigarettes? "
label(data$smoke_per_day)="5. On average, how many cigarettes (did/do) you smoke per day?"
label(data$smoked_last)="6. When was the last time you smoked before this session?"
label(data$tubes_collected___1)="Tubes collected (choice=clinical - 8.5 cc tiger top (CMP & Lipid Panel))"
label(data$tubes_collected___2)="Tubes collected (choice=clinical - 4 cc purple top (CBC))"
label(data$tubes_collected___3)="Tubes collected (choice=clinical - 4 cc purple top (HbA1c))"
label(data$tubes_collected___4)="Tubes collected (choice=repository - 5 cc red top serum)"
label(data$tubes_collected___5)="Tubes collected (choice=repository - 5 cc green top heparin)"
label(data$tubes_collected___6)="Tubes collected (choice=repository - 10cc purple top EDTA (OPTIONAL))"
label(data$part_3_phlebotomy_complete)="Complete?"
label(data$sf36_1)="1. SF36-1"
label(data$sf36_2)="2. SF36-2"
label(data$sf36_3a)="a. Vigorous activities"
label(data$sf36_3b)="b. Moderate activities"
label(data$sf36_3c)="c. Lifting - carrying"
label(data$sf36_3d)="d. Climbing several flights"
label(data$sf36_3e)="e. Climbing one flight"
label(data$sf36_3f)="f. Bending, etc"
label(data$sf36_3g)="g. Walking more than mile"
label(data$sf36_3h)="h. Walking several hundred yards"
label(data$sf36_3i)="i. Walking one hundred yards"
label(data$sf36_3j)="j. Bathing or dressing"
label(data$sf36_4a)="a. Amount of time"
label(data$sf36_4b)="b. Accomplished less"
label(data$sf36_4c)="c. Kind of work"
label(data$sf36_4d)="d. Difficulty performing"
label(data$sf36_5a)="a. Amount of time"
label(data$sf36_5b)="b. Accomplished less"
label(data$sf36_5c)="c. Worked less carefully"
label(data$sf36_6)="6. SF-36-6 Problems interfered with social activities?"
label(data$sf36_7)="7. SF36-7 Bodily Pain "
label(data$sf36_8)="8. SF36-8 Pain interfered with social activities"
label(data$sf36_9a)="a. Full of life"
label(data$sf36_9b)="b. Very nervous"
label(data$sf36_9c)="c. Felt down in dumps"
label(data$sf36_9d)="d. Calm & peaceful"
label(data$sf36_9e)="e. A lot of energy"
label(data$sf36_9f)="f. downhearted & depressed"
label(data$sf36_9g)="g. worn out"
label(data$sf36_9h)="h. happy"
label(data$sf36_9i)="i. tired"
label(data$sf36_10)="10. SF36-10 Health Interfered with Social Activities"
label(data$sf36_11a)="a. Get sicker easier"
label(data$sf36_11b)="b. Healthy as anybody"
label(data$sf36_11c)="c. Expect to get worse"
label(data$sf36_11d)="d. Health is excellent"
label(data$sf36v2_pcs)="Physical Component Score (PCS) - to be generated later"
label(data$sf36v2_mcs)="Mental Component Score (MCS) - to be generated later"
label(data$part_4_sf36v2_use_hard_copy_selfreport_form_complete)="Complete?"
label(data$dbc1_hbp)="1.  High blood pressure"
label(data$dbc2_chol)="2.  High cholesterol"
label(data$dbc3_asthma)="3.  Asthma"
label(data$dbc4_diabetes)="4.  Diabetes"
label(data$dbc5_thyroid)="5.  Thyroid disorder"
label(data$dbc6_cbp)="6.  Chronic back pain or sciatica"
label(data$dbc7_ra)="7.  Rheumatoid arthritis"
label(data$dbc8_othra)="8.  Rhematic diseases such as fibromyalgia or lupus"
label(data$dbc9_stomach)="9.  Stomach problem such as an ulcer of gastric reflux"
label(data$dbc10_colon)="10. Colon problems such as irritable bowel or colitis"
label(data$dbc11_bldcirc)="11. Poor blood circulation in legs"
label(data$dbc12_overwt)="12. Overweight"
label(data$dbc13_hearing)="13. Hard of hearing"
label(data$dbc14_vision)="14. Vision problem"
label(data$dbc15_bronch)="15. Chronic bronchitis or emphysema"
label(data$dbc16_osteoarth)="16. Osteoarthritis (regular arthritis, not rheumatoid arthritis)"
label(data$dbc17_osteopor)="17. Osteoporosis (thinning of the bones or bone fractures)"
label(data$dbc18_cancer)="18. Cancer during the last 5 years (not including small skin cancers)"
label(data$dbc19_chf)="19. Congestive heart failure"
label(data$dbc20_hd)="20. Heart disease such as angina (chest pain from heart problem), heart attack, bypass surgery, or angioplasty"
label(data$dbc21_stroke)="21. Stroke"
label(data$dbc22_psych)="22. Anxiety, depression, or other psychiatric illness"
label(data$dbc23_dementia)="23. Alzheimers disease or other dementia"
label(data$dbc24_incont)="24. Incontinence"
label(data$dbc25_frail)="25. General old age or frailty"
label(data$dbc26_oth)="26. Do you have any other chronic medical conditions that were not mentioned above?  If so, please indicate below"
label(data$part_5_bayliss_disease_checklist_use_hard_copy_sel_complete)="Complete?"
label(data$alcohol_history)="1. Have you ever drunk any kind of alcoholic beverage including beer, wine, liquor, etc?"
label(data$how_often_any)="2. About how often do you drink some kind of alcoholic beverage now including beer, wine, liquor, etc?"
label(data$amount_beer)="3. About how many bottles or cans of beer do you usual drink each week?"
label(data$timeframe_beer)="3a.  (indicate time frame)"
label(data$type_beer)="4. When you drink beer do you usually choose?"
label(data$amount_wine)="5. About how many glasses of wine do you usually drink each week?"
label(data$timeframe_wine)="5a. (indicate time frame)"
label(data$amount_liquor)="6. About how many other alcoholic drinks do you have each week (for example, mixed drinks, vodka, rum, scotch, whiskey, bourbon, tequila, or gin)?"
label(data$timeframe_liquor)="6a. (indicate time frame)"
label(data$alcohol_weekend)="7. Do you believe that you:"
label(data$part_6_alcohol_use_hard_copy_selfreport_form_complete)="Complete?"
label(data$diabetes_doctor)="I see that you noted on the checklist that you have diabetes.  Have you been told by a doctor that you have diabetes?  "
label(data$diabetes_medicine)="Are you taking any medicine for diabetes now?"
label(data$diabetes_medicine_rx)="Was this medicine prescribed by a doctor?"
label(data$diabetes_med_complications)="Have you ever had any medical complications resulting from your diabetes?"
label(data$cholesterol_doctor)="I see you noted on the checklist that you have high cholesterol.  Have you been told by a doctor that you have high cholesterol? "
label(data$cholesterol_medication)="In the last year, have you taken any medicine for high cholesterol?"
label(data$hbp_doctor)="I see that you noted on the checklist that you have high blood pressure.  Have you been told by a doctor that you have high blood pressure? "
label(data$hbp_medicine)="In the last year, have you taken any medicine for high blood pressure?"
label(data$fallen)="In the last year, have you ever fallen?"
label(data$falls_doctor)="When you fell, did you ever injure yourself so badly that you went to see a doctor or other health care provider?"
label(data$surgeries_ever)="Have you had any surgeries? "
label(data$part_7_personal_medical_history_complete)="Complete?"
label(data$med_1_dosage_form)="Med 1 Dosage Form"
label(data$med_1_times_taken_daily)="Med 1 Times Taken Daily"
label(data$med_2_dosage_form)="Med 2 Dosage Form"
label(data$med_2_times_taken_daily)="Med 2 Times Taken Daily"
label(data$med_3_dosage_form)="Med 3 Dosage Form"
label(data$med_3_times_taken_daily)="Med 3 Times Taken Daily"
label(data$med_4_dosage_form)="Med 4 Dosage Form"
label(data$med_4_times_taken_daily)="Med 4 Times Taken Daily"
label(data$med_5_dosage_form)="Med 5 Dosage Form"
label(data$med_5_times_taken_daily)="Med 5 Times Taken Daily"
label(data$med_6_dosage_form)="Med 6 Dosage Form"
label(data$med_6_times_taken_daily)="Med 6 Times Taken Daily"
label(data$med_7_dosage_form)="Med 7 Dosage Form"
label(data$med_7_times_taken_daily)="Med 7 Times Taken Daily"
label(data$med_8_dosage_form)="Med 8 Dosage Form"
label(data$med_8_times_taken_daily)="Med 8 Times Taken Daily"
label(data$otc_1_dosage_form)="OTC 1 Dosage Form"
label(data$otc_1_times_taken_daily)="OTC 1 Times Taken Daily"
label(data$otc_2_dosage_form)="OTC 2 Dosage Form"
label(data$otc_2_times_taken_daily)="OTC 2 Times Taken Daily"
label(data$otc_3_dosage_form)="OTC 3 Dosage Form"
label(data$otc_3_times_taken_daily)="OTC 3 Times Taken Daily"
label(data$otc_4_dosage_form)="OTC 4 Dosage Form"
label(data$otc_4_times_taken_daily)="OTC 4 Times Taken Daily"
label(data$part_8_list_of_medications_complete)="Complete?"
label(data$slums_day_of_the_week)="1 What day of the week is it?"
label(data$slums_year)="2 What is the year?"
label(data$slums_state)="3 What state are we in?"
label(data$slums_money_problem)="5 Money Problem"
label(data$slums_animals)="6 Please name as many animals as you can in one minute."
label(data$slums_5_objects)="7 What were the five objects I asked you to remember?"
label(data$slums_numbers_backwards)="8 Numbers backwards"
label(data$slums_clock)="9 Clock drawing"
label(data$slums_trifig)="10 Triangle & Largest Figure"
label(data$slums_story)="11 Story"
label(data$slums_total)="12 TOTAL SLUMS"
label(data$part_9_slums_use_hard_copy_form_to_administer_complete)="Complete?"
label(data$moca1)="Visuospatial / Executive Trails"
label(data$moca2)="Visuospatial / Executive Copy Cube"
label(data$moca3)="Visuospatial / Executive Clock Contour"
label(data$moca4)="Visuospatial / Executive Clock Numbers"
label(data$moca5)="Visuospatial / Executive Clock Hands"
label(data$moca6)="Naming"
label(data$moca7)="Attention Digits Forward & Backward"
label(data$moca8)="Attention Tapping As"
label(data$moca9)="Attention Serial 7s"
label(data$moca10)="Language  Repeat Sentences"
label(data$moca11)="Language Fluency"
label(data$moca12)="Abstraction Similarity"
label(data$moca13)="Delayed Recall Uncued"
label(data$moca14)="Orientation - Date"
label(data$moca15)="Orientation - Month"
label(data$moca16)="Orientation - Year"
label(data$moca17)="Orientation - Day"
label(data$moca19)="Orientation - City"
label(data$moca20)="Education - Does participant have 12 years or less of education?  "
label(data$moca_total)="MOCA Total"
label(data$part_9_moca_use_hard_copy_form_to_administer_complete)="Complete?"
label(data$adl_walking)="1. . . . walking across a small room?"
label(data$difficulty_walking)="2. How much difficulty, on the average, do you have doing this:  "
label(data$adl_bathing)="3. (At the present time, do you need help) bathing, either a sponge bath, tub bath, or shower?"
label(data$difficulty_bathing)="4. How much difficulty on the average do you have doing this:"
label(data$adl_grooming)="5. (At the present time, do you need help with) . . . personal grooming like brushing hair, brushing teeth, or washing face?  "
label(data$difficulty_grooming)="6. How much difficulty on the average do you have doing this:"
label(data$adl_dressing)="7. (At the present time, do you need help) . . . dressing, like putting on a shirt, buttoning and zipping, or putting on shoes?"
label(data$difficulty_dressing)="8. How much difficulty on the average do you have doing this:  "
label(data$adl_eating)="9. (At the present time, do you need help) . . . eating, like holding a fork, cutting food, or drinking from a glass?"
label(data$difficulty_eating)="10. How much difficulty on the average do you have doing this:"
label(data$adl_transfer)="11. (At the present time, do you need help) . . . getting from a bed to a chair?"
label(data$diffculty_transfer)="12. How much difficulty on the average do you have doing this:  "
label(data$adl_toilet)="13. (At the present time, do you need help) . . . using the toilet?"
label(data$difficulty_toilet)="14. How much difficulty on the average do you have doing this:"
label(data$iadl_telephone)="15 a. (Can you) use the telephone without help, including looking up numbers and dialing? - If HELP/UNABLE, SKIP TO 16a"
label(data$difficulty_telephone)="15 b. How much difficulty, on average do you have doing this: no difficulty at all, a little difficulty, some difficulty,or a lot of difficulty?"
label(data$iadl_travel)="16 a. (Can you) drive your own car or travel alone on buses or taxis without help?  - If HELP/UNABLE, SKIP TO 17a"
label(data$difficulty_travel)="16 b. How much difficulty, on average do you have doing this: no difficulty at all, a little difficulty, some difficulty,or a lot of difficulty?"
label(data$iadl_shopping)="17 a. (Can you) go shopping for groceries or clothes without help, taking care of all shopping needs yourself, assuming you have transportation? -If HELP / UNABLE, SKIP TO 18a"
label(data$difficulty_shopping)="17 b. How much difficulty, on average do you have doing this: no difficulty at all, a little difficulty, some difficulty, or a lot of difficulty?"
label(data$iadl_meals)="18 a. (Can you) prepare your own meals without help, plan and cook full meals yourself? - IF HELP / UNABLE, SKIP TO 19a"
label(data$difficulty_meals)="18 b. How much difficulty, on average do you have doing this: no difficulty at all, a little difficulty, some difficulty, or a lot of difficulty?"
label(data$iadl_housework)="19 a. (Can you) do your housework without help, clean floors, etc? - IF HELP/ UNABLE, SKIP TO 20A"
label(data$difficulty_housework)="19 b. How much difficulty, on average do you have doing this: no difficulty at all, a little difficulty, some difficulty, or a lot of difficulty?"
label(data$iadl_medicine)="20 a. (Can you) take your medicine without help in the right doses at the right times? - IF HELP / UNABLE, SKIP TO 21A"
label(data$difficulty_medicine)="20 b. How much difficulty, on average do you have doing this: no difficulty at all, a little difficulty, some difficulty, or a lot of difficulty?"
label(data$iadl_money)="21 a. (Can you) handle your money without help, write checks, pay bills, etc.? - IF HELP / UNABLE, SKIP TO 22a  "
label(data$difficulty_money)="21 b. How much difficulty, on average do you have doing this: no difficulty at all, a little difficulty, some difficulty, or a lot of difficulty?  "
label(data$iadl_laundry)="22 a. (Can you) do your own laundry without help? - IF HELP / UNABLE, SKIP TO NEXT SECTION"
label(data$difficulty_laundry)="22 b. How much difficulty, on average do you have doing this: no difficulty at all, a little difficulty, some difficulty, or a lot of difficulty?"
label(data$part_10_adls_iadls_for_60_years_older_complete)="Complete?"
label(data$feel_energy)="1. Do you feel full of energy?"
label(data$lost_weight)="2. In the last year, have you lost more than 10 pounds without trying to, that is, not by diet or exercise?"
label(data$part_11_frailty_status_questions_complete)="Complete?"
label(data$walking_pleasure)="1. Walking for pleasure?"
label(data$wp_months)="1a. Number of months"
label(data$wp_per_occasion)="1c. Time per occasion (in minutes)"
label(data$wp_mets)="1d. walking_pleasure_METS"
label(data$walking2from_work)="2. Walking to/from work?"
label(data$w2w_per_occasion)="2c. Time per occasion (in minutes)"
label(data$w2w_mets)="2d.  w2w_METS"
label(data$walking_work_breaks)="3. Walking during work breaks?"
label(data$wdb_months)="3a. Number of months "
label(data$wdb_per_month)="3b. Number of times per month "
label(data$wdb_per_occasion)="3c. Time per occasion (in minutes)"
label(data$wdb_mets)="3d. wdb_METS"
label(data$using_stairs)="4. Voluntarily using stair when elevator is available"
label(data$us_months)="4a. Number of months "
label(data$us_per_month)="4b. Number of times per month "
label(data$us_per_occasion)="4c. Time per occasion (in minutes) "
label(data$us_mets)="4d. using_stairs METS"
label(data$xcountry_hiking)="5. Cross-country hiking"
label(data$xch_months)="5a. Number of months"
label(data$xch_per_month)="5b. Number of times per month"
label(data$xch_per_occasion)="5c. Time per occasion (in minutes) "
label(data$xch_mets)="5d. xch_METS"
label(data$bicycling)="6. Bicycling"
label(data$cycling_months)="6a. Number of months"
label(data$cycling_per_month)="6b. Number of times per month"
label(data$cycling_per_occasion)="6c. Time per occasion (in minutes)"
label(data$cycling_mets)="6d. cycling_METS"
label(data$dancing)="7. Dancing"
label(data$dancing_months)="7a. Number of months"
label(data$dancing_per_month)="7b. Number of times per month"
label(data$dancing_per_occasion)="7c.Time per occasion (in minutes) "
label(data$dancing_mets)="7d. dancing_METS"
label(data$home_exercises)="8. Home exercises"
label(data$hexercise_months)="8a. Number of months"
label(data$hexercise_per_month)="8b. Number of times per month"
label(data$hexercise_mets)="8d. hexercise_METS"
label(data$healthclub)="9. Health Club"
label(data$hc_months)="9a. Number of months"
label(data$hc_per_month)="9b. Number of times per month"
label(data$hc_per_occasion)="9c. Time per occasion (in minutes)"
label(data$hc_mets)="9d. hc_METS"
label(data$jogwalk)="10. Jogging-walking"
label(data$jw_months)="10a. Number of months"
label(data$jw_per_month)="10b. Number of times per month"
label(data$jw_per_occasion)="10c. Time per occasion (in minutes)"
label(data$jw_mets)="10d. jw_METS"
label(data$running)="11. Running"
label(data$running_months)="11a. Number of months"
label(data$running_per_month)="11b. Number of times per month"
label(data$running_per_occasion)="11c. Time per occasion (in minutes)"
label(data$running_mets)="11d. running_METS"
label(data$weightlifting)="12. Weight Lifting"
label(data$wlifting_months)="12a. Number of months"
label(data$wlifting_per_month)="12b. Number of times per month"
label(data$wlifting_per_occasion)="12c. Time per occasion (in minutes)"
label(data$wlifting_mets)="12d. wlifting_METS"
label(data$canoerowing)="13. Canoeing or rowing for pleasure"
label(data$crowing_months)="13a. Number of months"
label(data$crowing_per_month)="13b. Number of times per month"
label(data$crowing_per_occasion)="13c. Time per occasion (in minutes)"
label(data$crowing_mets)="13d. crowing_METS"
label(data$swimmingpool)="14. Swimming (at a pool)"
label(data$swpool_months)="14a. Number of months"
label(data$swpool_per_month)="14b. Number of times per month"
label(data$swpool_per_occasion)="14c. Time per occasion (in minutes)"
label(data$swpool_mets)="14d. swpool_METS"
label(data$swimmingbeachlake)="15. Swimming at the beach or lake"
label(data$swbeachlake_months)="15a. Number of months"
label(data$swbeachlake_per_month)="15b. Number of times per month"
label(data$swbeachlake_per_occasion)="15c. Time per occasion (in minutes)"
label(data$swbeachlake_mets)="15d. swbeachlake_METS"
label(data$snorkeling)="16. Snorkeling"
label(data$snorkeling_months)="16a. Number of months"
label(data$snorkeling_per_month)="16b. Number of times per month"
label(data$snorkeling_per_occasion)="16c. Time per occasion (in minutes)"
label(data$snorkeling_mets)="16d. snorkeling_METS"
label(data$snowskiing)="17. Snow skiing downhill"
label(data$sskiing_months)="17a. Number of months"
label(data$sskiing_per_month)="17b. Number of times per month"
label(data$sskiing_per_occasion)="17c. Time per occasion (in minutes)"
label(data$ssking_mets)="17d. ssking_METS"
label(data$bowling)="18. Bowling"
label(data$bowling_months)="18a. Number of months"
label(data$bowling_per_month)="18b. Number of times per month"
label(data$bowling_per_occasion)="18c. Time per occasion (in minutes)"
label(data$bowling_mets)="18d. bowling_METS"
label(data$volleyball)="19. Volleyball"
label(data$volleyball_months)="19a. Number of months"
label(data$volleyball_per_month)="19b. Number of times per month"
label(data$volleyball_per_occasion)="19c. Time per occasion (in minutes)"
label(data$volleyball_mets)="19d. volleyball_METS"
label(data$tabletennis)="20. Table Tennis(ping pong)"
label(data$tabletennis_months)="20a. Number of months"
label(data$tabletennis_per_month)="20b. Number of times per month"
label(data$tabletennis_per_occasion)="20c. Time per occasion (in minutes)"
label(data$tabletennis_mets)="20d. tabletennis_METS"
label(data$tennisdoubles)="21. Tennis doubles"
label(data$tennisdoubles_months)="21a. Number of months "
label(data$tennisdoubles_per_month)="21b. Number of times per month"
label(data$tennisdoubles_per_occasion)="21c. Time per occasion (in minutes)"
label(data$tennisdoubles_mets)="21d. tennisdoubles_METS"
label(data$softball)="22. Softball"
label(data$softball_months)="22a.  Number of months"
label(data$softball_per_month)="22b.  Number of times per month"
label(data$softball_per_occasion)="22c. Time per occasion (in minutes)"
label(data$softball_mets)="22d. softball_METS"
label(data$badminton)="23. Badminton"
label(data$badminton_months)="23a. Number of months"
label(data$badminton_per_month)="23b. Number of times per month"
label(data$badminton_per_occasion)="23c. Time per occasion (in minutes) "
label(data$badminton_mets)="23d. badminton_METS"
label(data$paddleball)="24. Paddleball"
label(data$paddleball_months)="24a. Number of months"
label(data$paddleball_per_month)="24b. Number of times per month"
label(data$paddleball_per_occasion)="24c. Time per occasion (in minutes)"
label(data$paddleball_mets)="24d. paddleball_METS"
label(data$racquetball)="25. Racquetball"
label(data$racquetball_months)="25a. Number of months"
label(data$racquetball_per_month)="25b. Number of times per month"
label(data$racquetball_per_occasion)="25c. Time per occasion (in minutes) "
label(data$racquetball_mets)="25d. racquetball_METS"
label(data$golfcart)="26. Gold riding a power cart"
label(data$golfcart_months)="26a. Number of months"
label(data$golfcart_per_month)="26b. Number of times per month"
label(data$golfcart_per_occasion)="26c. Time per occasion (in minutes)"
label(data$golfcart_mets)="26d. golfcart_METS"
label(data$golfwalk)="27. Golfwalk"
label(data$golfwalk_months)="27a. Number of months"
label(data$golfwalk_per_month)="27b. Number of times per month"
label(data$golfwalk_per_occasion)="27c. Time per occasion (in minutes) "
label(data$golfwalk_mets)="27d. golfwalk_METS"
label(data$golfcarry)="28. Golf walking and carrying clubs"
label(data$golfcarry_months)="28a. Number of months"
label(data$golfcarry_per_month)="28b. Number of times per month"
label(data$golfcarry_per_occasion)="28c. Time per occasion (in minutes)"
label(data$golfcarry_mets)="28d. golfcarry_METS"
label(data$mowride)="29. Mowing lawn riding a power mower"
label(data$mowride_months)="29a. Number of months"
label(data$mowride_per_month)="29b. Number of times per month"
label(data$mowride_per_occasion)="29c. Time per occasion (in minutes)"
label(data$mowride_mets)="29d. mowride_METS"
label(data$mowwalk)="30. Mowing lawn walking behind power mower"
label(data$mowwalk_months)="30a. Number of months"
label(data$mowwalk_per_month)="30b. Number of times per month "
label(data$mowwalk_per_occasion)="30c. Time per occasion (in minutes) "
label(data$mowwalk_mets)="30d. mowwalk_METS"
label(data$weeding)="31. Weeding and cultivation of garden"
label(data$weeding_months)="31a. Number of months"
label(data$weeding_per_month)="31b. Number of times per month"
label(data$weeding_per_occasion)="31c. Time per occasion (in minutes)"
label(data$weeding_mets)="31d. weeding_METS"
label(data$spading)="32. Spading, digging, filling in garden"
label(data$spading_months)="32a. Number of months"
label(data$spading_per_month)="32b. Number of times per month"
label(data$spading_per_occasion)="32c. Time per occasion (in minutes)"
label(data$spading_mets)="32d. spading_METS"
label(data$raking)="33. Raking Lawn"
label(data$raking_months)="33a. Number of months"
label(data$raking_per_month)="33b. Number of times per month"
label(data$raking_per_occasion)="33c. Time per occasion (in minutes)"
label(data$raking_mets)="33d. raking_METS"
label(data$carpentryinside)="34.  Carpentry in workshop"
label(data$carpentry_months)="34a. Number of months"
label(data$carpentry_per_month)="34b. Number of times per month"
label(data$carpentry_per_occasion)="34c. Time per occasion (in minutes)"
label(data$carpentry_mets)="34d. carpentry_METS"
label(data$paintinside)="35.  Painting inside of house or wallpaper hanging"
label(data$paintinside_months)="35a. Number of months"
label(data$paintinside_per_month)="35b. Number of times per month"
label(data$paintinside_per_occasion)="35c. Time per occasion (in minutes)"
label(data$paintinside_mets)="35d. paintinside_METS"
label(data$carpentryoutside)="36.  Carpentry outside of house"
label(data$carpentryoutside_months)="36a. Number of months"
label(data$carpentryoutside_per_month)="36a. Number of times per month"
label(data$carpentryoutside_per_occasion)="36c. Time per occasion (in minutes)"
label(data$carpentryoutside_mets)="36d. carpentryoutside_METS"
label(data$paintoutside)="37.  Painting outside of house"
label(data$paintoutside_months)="37a. Number of months"
label(data$paintoutside_per_month)="37b. Number of times per month"
label(data$paintoutside_per_occasion)="37c. Time per occasion (in minutes)"
label(data$paintoutside_mets)="37d. paintoutside_METS"
label(data$fishingriver)="38. Fishing from river bank"
label(data$fishingriver_months)="38a. Number of months"
label(data$fishingriver_per_month)="38b. Number of times per month"
label(data$fishingriver_per_occasion)="38c. Time per occasion (in minutes)"
label(data$fishingriver_mets)="38d. fishingriver_METS"
label(data$huntingpheasants)="39. Hunting pheasants or goose"
label(data$huntpheasants_months)="39a. Number of months"
label(data$huntpheasants_per_month)="39b. Number of times per month"
label(data$huntpheasants_per_occasion)="39c. Time per occasion (in minutes)"
label(data$huntpheasants_mets)="39d. huntpheasants_METS"
label(data$huntgame)="40. Hunting large game--deer, elk, bear"
label(data$huntgame_months)="40a. Number of months"
label(data$huntgame_per_month)="40b. Number of times per month"
label(data$huntgame_per_occasion)="40c. Time per occasion (in minutes)"
label(data$huntgame_mets)="40d. huntgame_METS"
label(data$activity41)="41. Other activity 41?"
label(data$activity41_months)="41a. Number of months"
label(data$activity41_per_month)="41b. Number of times per month"
label(data$activity41_per_occasion)="41c. Time per occasion (in minutes)"
label(data$activity42)="42. Other activity 42?"
label(data$activity42_months)="42a. Number of months"
label(data$activity42_per_month)="42b. Number of times per month"
label(data$activity42_per_occasion)="42c. Time per occasion (in minutes)"
label(data$activity43)="43. Other activity 43?"
label(data$activity43_months)="43a. Number of months"
label(data$activity43_per_month)="43b. Number of times per month"
label(data$activity43_per_occasion)="43c. Time per occasion (in minutes)"
label(data$total_mets)="TOTAL METS (kcal)"
label(data$totalmets_divby52)="TOTAL METS DIVIDED (kcal/week)"
label(data$frailty_score)="Frail for physical activity? (If male and kcal/week < 350.0, then then frail = 1) (if female and kcal/week < 134.0, then frail = 1) Otherwise, frailty score = 0 "
label(data$part_12_minnesota_leisure_time_questionnaire_use_o_complete)="Complete?"
label(data$armsurgery)="A. Have you had any recent arm/elbow/hand surgery?"
label(data$trial1)="B. Trial 1 (kg)"
label(data$trial2)="B. Trial 2 (kg)"
label(data$trial3)="B. Trial 3 (kg)"
label(data$handtested)="C. Hand Tested"
label(data$part_13_grip_strength_complete)="Complete?"
label(data$walkcompleted)="Ten Foot Walk, completed"
label(data$complete_trial1)="Seconds to Complete (Trial 1)"
label(data$complete_trial2)="Seconds to Complete (Trial 2)"
label(data$part_14_10_foot_walk_complete)="Complete?"
label(data$foodrecall)="Did participant consent to optional 24-hr food recall?"
label(data$part_15_asa24_24_hour_food_recall_use_of_hard_copy_complete)="Complete?"
label(data$interview_ended)="Time Interview ended (24 hr clock)"
label(data$part_16_exit_questions_complete)="Complete?"
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
label(data$part_17_clinical_labs_entered_after_results_return_complete)="Complete?"
label(data$skin_biopsy)="Skin Biopsy Performed?"
label(data$fat_biopsy)="Fat Biopsy Performed?"
label(data$biopsy_complication)="Did a complication occur with the skin and/or fat biopsy?"
label(data$part_18_biopsy_complete)="Complete?"
#Setting Units


#Setting Factors(will create new variable for factors)
data$enrollment_site.factor = factor(data$enrollment_site,levels=c("1","2","3","4","5"))
data$bru_vet.factor = factor(data$bru_vet,levels=c("1","0"))
data$recruited_from.factor = factor(data$recruited_from,levels=c("1","2","3","4"))
data$hearing_difficulty.factor = factor(data$hearing_difficulty,levels=c("1","0"))
data$face_page_complete.factor = factor(data$face_page_complete,levels=c("0","1","2"))
data$signed_consent.factor = factor(data$signed_consent,levels=c("1","0"))
data$agree_questionnaires.factor = factor(data$agree_questionnaires,levels=c("1","2"))
data$agree_24hrfood.factor = factor(data$agree_24hrfood,levels=c("1","0"))
data$agree_genetics.factor = factor(data$agree_genetics,levels=c("1","2"))
data$agree_fatbiopsy.factor = factor(data$agree_fatbiopsy,levels=c("1","0"))
data$agree_skinbiopsy.factor = factor(data$agree_skinbiopsy,levels=c("1","0"))
data$agree_recontacta.factor = factor(data$agree_recontacta,levels=c("1","2"))
data$agree_recontactb.factor = factor(data$agree_recontactb,levels=c("1","2"))
data$informed_consent_complete.factor = factor(data$informed_consent_complete,levels=c("0","1","2"))
data$age_screen.factor = factor(data$age_screen,levels=c("1","2"))
data$current_living_arrangement.factor = factor(data$current_living_arrangement,levels=c("1","2","3","4"))
data$pregnancy_screen.factor = factor(data$pregnancy_screen,levels=c("1","2","3","4","5"))
data$screening_complete.factor = factor(data$screening_complete,levels=c("0","1","2"))
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
data$part_1_demographics_complete.factor = factor(data$part_1_demographics_complete,levels=c("0","1","2"))
data$height_collection_methodol1.factor = factor(data$height_collection_methodol1,levels=c("1","2","3"))
data$height_collection_method.factor = factor(data$height_collection_method,levels=c("1","2","3"))
data$part_2_anthropometrics_vitals_complete.factor = factor(data$part_2_anthropometrics_vitals_complete,levels=c("0","1","2"))
data$fasting.factor = factor(data$fasting,levels=c("1","2"))
data$smoked_ever.factor = factor(data$smoked_ever,levels=c("1","2","3"))
data$smoke_history.factor = factor(data$smoke_history,levels=c("1","2","3","4"))
data$smoked_last.factor = factor(data$smoked_last,levels=c("1","2","3","4"))
data$tubes_collected___1.factor = factor(data$tubes_collected___1,levels=c("0","1"))
data$tubes_collected___2.factor = factor(data$tubes_collected___2,levels=c("0","1"))
data$tubes_collected___3.factor = factor(data$tubes_collected___3,levels=c("0","1"))
data$tubes_collected___4.factor = factor(data$tubes_collected___4,levels=c("0","1"))
data$tubes_collected___5.factor = factor(data$tubes_collected___5,levels=c("0","1"))
data$tubes_collected___6.factor = factor(data$tubes_collected___6,levels=c("0","1"))
data$part_3_phlebotomy_complete.factor = factor(data$part_3_phlebotomy_complete,levels=c("0","1","2"))
data$sf36_1.factor = factor(data$sf36_1,levels=c("1","2","3","4","5"))
data$sf36_2.factor = factor(data$sf36_2,levels=c("1","2","3","4","5"))
data$sf36_3a.factor = factor(data$sf36_3a,levels=c("1","2","3"))
data$sf36_3b.factor = factor(data$sf36_3b,levels=c("1","2","3"))
data$sf36_3c.factor = factor(data$sf36_3c,levels=c("1","2","3"))
data$sf36_3d.factor = factor(data$sf36_3d,levels=c("1","2","3"))
data$sf36_3e.factor = factor(data$sf36_3e,levels=c("1","2","3"))
data$sf36_3f.factor = factor(data$sf36_3f,levels=c("1","2","3"))
data$sf36_3g.factor = factor(data$sf36_3g,levels=c("1","2","3"))
data$sf36_3h.factor = factor(data$sf36_3h,levels=c("1","2","3"))
data$sf36_3i.factor = factor(data$sf36_3i,levels=c("1","2","3"))
data$sf36_3j.factor = factor(data$sf36_3j,levels=c("1","2","3"))
data$sf36_4a.factor = factor(data$sf36_4a,levels=c("1","2","3","4","5"))
data$sf36_4b.factor = factor(data$sf36_4b,levels=c("1","2","3","4","5"))
data$sf36_4c.factor = factor(data$sf36_4c,levels=c("1","2","3","4","5"))
data$sf36_4d.factor = factor(data$sf36_4d,levels=c("1","2","3","4","5"))
data$sf36_5a.factor = factor(data$sf36_5a,levels=c("1","2","3","4","5"))
data$sf36_5b.factor = factor(data$sf36_5b,levels=c("1","2","3","4","5"))
data$sf36_5c.factor = factor(data$sf36_5c,levels=c("1","2","3","4","5"))
data$sf36_6.factor = factor(data$sf36_6,levels=c("1","2","3","4","5"))
data$sf36_7.factor = factor(data$sf36_7,levels=c("1","2","3","4","5","6"))
data$sf36_8.factor = factor(data$sf36_8,levels=c("1","2","3","4","5"))
data$sf36_9a.factor = factor(data$sf36_9a,levels=c("1","2","3","4","5"))
data$sf36_9b.factor = factor(data$sf36_9b,levels=c("1","2","3","4","5"))
data$sf36_9c.factor = factor(data$sf36_9c,levels=c("1","2","3","4","5"))
data$sf36_9d.factor = factor(data$sf36_9d,levels=c("1","2","3","4","5"))
data$sf36_9e.factor = factor(data$sf36_9e,levels=c("1","2","3","4","5"))
data$sf36_9f.factor = factor(data$sf36_9f,levels=c("1","2","3","4","5"))
data$sf36_9g.factor = factor(data$sf36_9g,levels=c("1","2","3","4","5"))
data$sf36_9h.factor = factor(data$sf36_9h,levels=c("1","2","3","4","5"))
data$sf36_9i.factor = factor(data$sf36_9i,levels=c("1","2","3","4","5"))
data$sf36_10.factor = factor(data$sf36_10,levels=c("1","2","3","4","5"))
data$sf36_11a.factor = factor(data$sf36_11a,levels=c("1","2","3","4","5"))
data$sf36_11b.factor = factor(data$sf36_11b,levels=c("1","2","3","4","5"))
data$sf36_11c.factor = factor(data$sf36_11c,levels=c("1","2","3","4","5"))
data$sf36_11d.factor = factor(data$sf36_11d,levels=c("1","2","3","4","5"))
data$part_4_sf36v2_use_hard_copy_selfreport_form_complete.factor = factor(data$part_4_sf36v2_use_hard_copy_selfreport_form_complete,levels=c("0","1","2"))
data$dbc1_hbp.factor = factor(data$dbc1_hbp,levels=c("0","1","2","3","4","5"))
data$dbc2_chol.factor = factor(data$dbc2_chol,levels=c("0","1","2","3","4","5"))
data$dbc3_asthma.factor = factor(data$dbc3_asthma,levels=c("0","1","2","3","4","5"))
data$dbc4_diabetes.factor = factor(data$dbc4_diabetes,levels=c("0","1","2","3","4","5"))
data$dbc5_thyroid.factor = factor(data$dbc5_thyroid,levels=c("0","1","2","3","4","5"))
data$dbc6_cbp.factor = factor(data$dbc6_cbp,levels=c("0","1","2","3","4","5"))
data$dbc7_ra.factor = factor(data$dbc7_ra,levels=c("0","1","2","3","4","5"))
data$dbc8_othra.factor = factor(data$dbc8_othra,levels=c("0","1","2","3","4","5"))
data$dbc9_stomach.factor = factor(data$dbc9_stomach,levels=c("0","1","2","3","4","5"))
data$dbc10_colon.factor = factor(data$dbc10_colon,levels=c("0","1","2","3","4","5"))
data$dbc11_bldcirc.factor = factor(data$dbc11_bldcirc,levels=c("0","1","2","3","4","5"))
data$dbc12_overwt.factor = factor(data$dbc12_overwt,levels=c("0","1","2","3","4","5"))
data$dbc13_hearing.factor = factor(data$dbc13_hearing,levels=c("0","1","2","3","4","5"))
data$dbc14_vision.factor = factor(data$dbc14_vision,levels=c("0","1","2","3","4","5"))
data$dbc15_bronch.factor = factor(data$dbc15_bronch,levels=c("0","1","2","3","4","5"))
data$dbc16_osteoarth.factor = factor(data$dbc16_osteoarth,levels=c("0","1","2","3","4","5"))
data$dbc17_osteopor.factor = factor(data$dbc17_osteopor,levels=c("0","1","2","3","4","5"))
data$dbc18_cancer.factor = factor(data$dbc18_cancer,levels=c("0","1","2","3","4","5"))
data$dbc19_chf.factor = factor(data$dbc19_chf,levels=c("0","1","2","3","4","5"))
data$dbc20_hd.factor = factor(data$dbc20_hd,levels=c("0","1","2","3","4","5"))
data$dbc21_stroke.factor = factor(data$dbc21_stroke,levels=c("0","1","2","3","4","5"))
data$dbc22_psych.factor = factor(data$dbc22_psych,levels=c("0","1","2","3","4","5"))
data$dbc23_dementia.factor = factor(data$dbc23_dementia,levels=c("0","1","2","3","4","5"))
data$dbc24_incont.factor = factor(data$dbc24_incont,levels=c("0","1","2","3","4","5"))
data$dbc25_frail.factor = factor(data$dbc25_frail,levels=c("0","1","2","3","4","5"))
data$dbc26_oth.factor = factor(data$dbc26_oth,levels=c("0","1","2","3","4","5"))
data$part_5_bayliss_disease_checklist_use_hard_copy_sel_complete.factor = factor(data$part_5_bayliss_disease_checklist_use_hard_copy_sel_complete,levels=c("0","1","2"))
data$alcohol_history.factor = factor(data$alcohol_history,levels=c("1","2","3"))
data$how_often_any.factor = factor(data$how_often_any,levels=c("1","2","3","4","5"))
data$timeframe_beer.factor = factor(data$timeframe_beer,levels=c("1","2","3","4","5","6"))
data$type_beer.factor = factor(data$type_beer,levels=c("1","2","3","4"))
data$timeframe_wine.factor = factor(data$timeframe_wine,levels=c("1","2","3","4","5","6"))
data$timeframe_liquor.factor = factor(data$timeframe_liquor,levels=c("1","2","3","4","5","6"))
data$alcohol_weekend.factor = factor(data$alcohol_weekend,levels=c("1","2","3"))
data$part_6_alcohol_use_hard_copy_selfreport_form_complete.factor = factor(data$part_6_alcohol_use_hard_copy_selfreport_form_complete,levels=c("0","1","2"))
data$diabetes_doctor.factor = factor(data$diabetes_doctor,levels=c("1","2","-8"))
data$diabetes_medicine.factor = factor(data$diabetes_medicine,levels=c("1","2","-8"))
data$diabetes_medicine_rx.factor = factor(data$diabetes_medicine_rx,levels=c("1","2","-8"))
data$diabetes_med_complications.factor = factor(data$diabetes_med_complications,levels=c("1","2","-8"))
data$cholesterol_doctor.factor = factor(data$cholesterol_doctor,levels=c("1","2","-8"))
data$cholesterol_medication.factor = factor(data$cholesterol_medication,levels=c("1","2","-8"))
data$hbp_doctor.factor = factor(data$hbp_doctor,levels=c("1","2","-8"))
data$hbp_medicine.factor = factor(data$hbp_medicine,levels=c("1","2","-8"))
data$fallen.factor = factor(data$fallen,levels=c("1","2","-8"))
data$falls_doctor.factor = factor(data$falls_doctor,levels=c("1","2","-8"))
data$surgeries_ever.factor = factor(data$surgeries_ever,levels=c("1","2","-8"))
data$part_7_personal_medical_history_complete.factor = factor(data$part_7_personal_medical_history_complete,levels=c("0","1","2"))
data$med_1_dosage_form.factor = factor(data$med_1_dosage_form,levels=c("1","2","3","4","5","6","7","8","9"))
data$med_1_times_taken_daily.factor = factor(data$med_1_times_taken_daily,levels=c("1","2","3","4","5","6"))
data$med_2_dosage_form.factor = factor(data$med_2_dosage_form,levels=c("1","2","3","4","5","6","7","8","9"))
data$med_2_times_taken_daily.factor = factor(data$med_2_times_taken_daily,levels=c("1","2","3","4","5","6"))
data$med_3_dosage_form.factor = factor(data$med_3_dosage_form,levels=c("1","2","3","4","5","6","7","8","9"))
data$med_3_times_taken_daily.factor = factor(data$med_3_times_taken_daily,levels=c("1","2","3","4","5","6"))
data$med_4_dosage_form.factor = factor(data$med_4_dosage_form,levels=c("1","2","3","4","5","6","7","8","9"))
data$med_4_times_taken_daily.factor = factor(data$med_4_times_taken_daily,levels=c("1","2","3","4","5","6"))
data$med_5_dosage_form.factor = factor(data$med_5_dosage_form,levels=c("1","2","3","4","5","6","7","8","9"))
data$med_5_times_taken_daily.factor = factor(data$med_5_times_taken_daily,levels=c("1","2","3","4","5","6"))
data$med_6_dosage_form.factor = factor(data$med_6_dosage_form,levels=c("1","2","3","4","5","6","7","8","9"))
data$med_6_times_taken_daily.factor = factor(data$med_6_times_taken_daily,levels=c("1","2","3","4","5","6"))
data$med_7_dosage_form.factor = factor(data$med_7_dosage_form,levels=c("1","2","3","4","5","6","7","8","9"))
data$med_7_times_taken_daily.factor = factor(data$med_7_times_taken_daily,levels=c("1","2","3","4","5","6"))
data$med_8_dosage_form.factor = factor(data$med_8_dosage_form,levels=c("1","2","3","4","5","6","7","8","9"))
data$med_8_times_taken_daily.factor = factor(data$med_8_times_taken_daily,levels=c("1","2","3","4","5","6"))
data$otc_1_dosage_form.factor = factor(data$otc_1_dosage_form,levels=c("1","2","3","4","5","6","7","8","9"))
data$otc_1_times_taken_daily.factor = factor(data$otc_1_times_taken_daily,levels=c("1","2","3","4","5","6"))
data$otc_2_dosage_form.factor = factor(data$otc_2_dosage_form,levels=c("1","2","3","4","5","6","7","8","9"))
data$otc_2_times_taken_daily.factor = factor(data$otc_2_times_taken_daily,levels=c("1","2","3","4","5","6"))
data$otc_3_dosage_form.factor = factor(data$otc_3_dosage_form,levels=c("1","2","3","4","5","6","7","8","9"))
data$otc_3_times_taken_daily.factor = factor(data$otc_3_times_taken_daily,levels=c("1","2","3","4","5","6"))
data$otc_4_dosage_form.factor = factor(data$otc_4_dosage_form,levels=c("1","2","3","4","5","6","7","8","9"))
data$otc_4_times_taken_daily.factor = factor(data$otc_4_times_taken_daily,levels=c("1","2","3","4","5","6"))
data$part_8_list_of_medications_complete.factor = factor(data$part_8_list_of_medications_complete,levels=c("0","1","2"))
data$part_9_slums_use_hard_copy_form_to_administer_complete.factor = factor(data$part_9_slums_use_hard_copy_form_to_administer_complete,levels=c("0","1","2"))
data$moca20.factor = factor(data$moca20,levels=c("1","0"))
data$part_9_moca_use_hard_copy_form_to_administer_complete.factor = factor(data$part_9_moca_use_hard_copy_form_to_administer_complete,levels=c("0","1","2"))
data$adl_walking.factor = factor(data$adl_walking,levels=c("1","2","3","8"))
data$difficulty_walking.factor = factor(data$difficulty_walking,levels=c("1","2","3","4","8"))
data$adl_bathing.factor = factor(data$adl_bathing,levels=c("1","2","3","8"))
data$difficulty_bathing.factor = factor(data$difficulty_bathing,levels=c("1","2","3","4","8"))
data$adl_grooming.factor = factor(data$adl_grooming,levels=c("1","2","3","8"))
data$difficulty_grooming.factor = factor(data$difficulty_grooming,levels=c("1","2","3","4","8"))
data$adl_dressing.factor = factor(data$adl_dressing,levels=c("1","2","3","8"))
data$difficulty_dressing.factor = factor(data$difficulty_dressing,levels=c("1","2","3","4","8"))
data$adl_eating.factor = factor(data$adl_eating,levels=c("1","2","3","8"))
data$difficulty_eating.factor = factor(data$difficulty_eating,levels=c("1","2","3","4","8"))
data$adl_transfer.factor = factor(data$adl_transfer,levels=c("1","2","3","8"))
data$diffculty_transfer.factor = factor(data$diffculty_transfer,levels=c("1","2","3","4","8"))
data$adl_toilet.factor = factor(data$adl_toilet,levels=c("1","2","3","8"))
data$difficulty_toilet.factor = factor(data$difficulty_toilet,levels=c("1","2","3","4","8"))
data$iadl_telephone.factor = factor(data$iadl_telephone,levels=c("1","2","3","8"))
data$difficulty_telephone.factor = factor(data$difficulty_telephone,levels=c("1","2","3","4","8"))
data$iadl_travel.factor = factor(data$iadl_travel,levels=c("1","2","3","8"))
data$difficulty_travel.factor = factor(data$difficulty_travel,levels=c("1","2","3","4","8"))
data$iadl_shopping.factor = factor(data$iadl_shopping,levels=c("1","2","3","8"))
data$difficulty_shopping.factor = factor(data$difficulty_shopping,levels=c("1","2","3","4","8"))
data$iadl_meals.factor = factor(data$iadl_meals,levels=c("1","2","3","8"))
data$difficulty_meals.factor = factor(data$difficulty_meals,levels=c("1","2","3","4","8"))
data$iadl_housework.factor = factor(data$iadl_housework,levels=c("1","2","3","8"))
data$difficulty_housework.factor = factor(data$difficulty_housework,levels=c("1","2","3","4","8"))
data$iadl_medicine.factor = factor(data$iadl_medicine,levels=c("1","2","3","8"))
data$difficulty_medicine.factor = factor(data$difficulty_medicine,levels=c("1","2","3","4","8"))
data$iadl_money.factor = factor(data$iadl_money,levels=c("1","2","3","8"))
data$difficulty_money.factor = factor(data$difficulty_money,levels=c("1","2","3","4","8"))
data$iadl_laundry.factor = factor(data$iadl_laundry,levels=c("1","2","3","8"))
data$difficulty_laundry.factor = factor(data$difficulty_laundry,levels=c("1","2","3","4","8"))
data$part_10_adls_iadls_for_60_years_older_complete.factor = factor(data$part_10_adls_iadls_for_60_years_older_complete,levels=c("0","1","2"))
data$feel_energy.factor = factor(data$feel_energy,levels=c("1","2","-8"))
data$lost_weight.factor = factor(data$lost_weight,levels=c("1","2","-8"))
data$part_11_frailty_status_questions_complete.factor = factor(data$part_11_frailty_status_questions_complete,levels=c("0","1","2"))
data$walking_pleasure.factor = factor(data$walking_pleasure,levels=c("1","0"))
data$walking2from_work.factor = factor(data$walking2from_work,levels=c("1","0"))
data$walking_work_breaks.factor = factor(data$walking_work_breaks,levels=c("1","0"))
data$using_stairs.factor = factor(data$using_stairs,levels=c("1","0"))
data$xcountry_hiking.factor = factor(data$xcountry_hiking,levels=c("1","0"))
data$bicycling.factor = factor(data$bicycling,levels=c("1","0"))
data$dancing.factor = factor(data$dancing,levels=c("1","0"))
data$home_exercises.factor = factor(data$home_exercises,levels=c("1","0"))
data$healthclub.factor = factor(data$healthclub,levels=c("1","0"))
data$jogwalk.factor = factor(data$jogwalk,levels=c("1","0"))
data$running.factor = factor(data$running,levels=c("1","0"))
data$weightlifting.factor = factor(data$weightlifting,levels=c("1","0"))
data$canoerowing.factor = factor(data$canoerowing,levels=c("1","0"))
data$swimmingpool.factor = factor(data$swimmingpool,levels=c("1","0"))
data$swimmingbeachlake.factor = factor(data$swimmingbeachlake,levels=c("1","0"))
data$snorkeling.factor = factor(data$snorkeling,levels=c("1","0"))
data$snowskiing.factor = factor(data$snowskiing,levels=c("1","0"))
data$bowling.factor = factor(data$bowling,levels=c("1","0"))
data$volleyball.factor = factor(data$volleyball,levels=c("1","0"))
data$tabletennis.factor = factor(data$tabletennis,levels=c("1","0"))
data$tennisdoubles.factor = factor(data$tennisdoubles,levels=c("1","0"))
data$softball.factor = factor(data$softball,levels=c("1","0"))
data$badminton.factor = factor(data$badminton,levels=c("1","0"))
data$paddleball.factor = factor(data$paddleball,levels=c("1","0"))
data$racquetball.factor = factor(data$racquetball,levels=c("1","0"))
data$golfcart.factor = factor(data$golfcart,levels=c("1","0"))
data$golfwalk.factor = factor(data$golfwalk,levels=c("1","0"))
data$golfcarry.factor = factor(data$golfcarry,levels=c("1","0"))
data$mowride.factor = factor(data$mowride,levels=c("1","0"))
data$mowwalk.factor = factor(data$mowwalk,levels=c("1","0"))
data$weeding.factor = factor(data$weeding,levels=c("1","0"))
data$spading.factor = factor(data$spading,levels=c("1","0"))
data$raking.factor = factor(data$raking,levels=c("1","0"))
data$carpentryinside.factor = factor(data$carpentryinside,levels=c("1","0"))
data$paintinside.factor = factor(data$paintinside,levels=c("1","0"))
data$carpentryoutside.factor = factor(data$carpentryoutside,levels=c("1","0"))
data$paintoutside.factor = factor(data$paintoutside,levels=c("1","0"))
data$fishingriver.factor = factor(data$fishingriver,levels=c("1","0"))
data$huntingpheasants.factor = factor(data$huntingpheasants,levels=c("1","0"))
data$huntgame.factor = factor(data$huntgame,levels=c("1","0"))
data$activity41.factor = factor(data$activity41,levels=c("1","0"))
data$activity42.factor = factor(data$activity42,levels=c("1","0"))
data$activity43.factor = factor(data$activity43,levels=c("1","0"))
data$frailty_score.factor = factor(data$frailty_score,levels=c("1","0"))
data$part_12_minnesota_leisure_time_questionnaire_use_o_complete.factor = factor(data$part_12_minnesota_leisure_time_questionnaire_use_o_complete,levels=c("0","1","2"))
data$armsurgery.factor = factor(data$armsurgery,levels=c("1","2","8"))
data$handtested.factor = factor(data$handtested,levels=c("1","2","3"))
data$part_13_grip_strength_complete.factor = factor(data$part_13_grip_strength_complete,levels=c("0","1","2"))
data$walkcompleted.factor = factor(data$walkcompleted,levels=c("1","2"))
data$part_14_10_foot_walk_complete.factor = factor(data$part_14_10_foot_walk_complete,levels=c("0","1","2"))
data$foodrecall.factor = factor(data$foodrecall,levels=c("1","0"))
data$part_15_asa24_24_hour_food_recall_use_of_hard_copy_complete.factor = factor(data$part_15_asa24_24_hour_food_recall_use_of_hard_copy_complete,levels=c("0","1","2"))
data$part_16_exit_questions_complete.factor = factor(data$part_16_exit_questions_complete,levels=c("0","1","2"))
data$part_17_clinical_labs_entered_after_results_return_complete.factor = factor(data$part_17_clinical_labs_entered_after_results_return_complete,levels=c("0","1","2"))
data$skin_biopsy.factor = factor(data$skin_biopsy,levels=c("1","0"))
data$fat_biopsy.factor = factor(data$fat_biopsy,levels=c("1","0"))
data$biopsy_complication.factor = factor(data$biopsy_complication,levels=c("1","0"))
data$part_18_biopsy_complete.factor = factor(data$part_18_biopsy_complete,levels=c("0","1","2"))

levels(data$enrollment_site.factor)=c("MoTrPAC Space (at MARC)","FORU","BRU","TDI","OTHER")
levels(data$bru_vet.factor)=c("Yes","No")
levels(data$recruited_from.factor)=c("Call Center","Community Event (See below)","Referred from another study","Other")
levels(data$hearing_difficulty.factor)=c("Yes","No")
levels(data$face_page_complete.factor)=c("Incomplete","Unverified","Complete")
levels(data$signed_consent.factor)=c("Yes","No")
levels(data$agree_questionnaires.factor)=c("yes","no")
levels(data$agree_24hrfood.factor)=c("Yes","No")
levels(data$agree_genetics.factor)=c("yes","no")
levels(data$agree_fatbiopsy.factor)=c("Yes","No")
levels(data$agree_skinbiopsy.factor)=c("Yes","No")
levels(data$agree_recontacta.factor)=c("yes","no")
levels(data$agree_recontactb.factor)=c("yes","no")
levels(data$informed_consent_complete.factor)=c("Incomplete","Unverified","Complete")
levels(data$age_screen.factor)=c("Yes","No - STOP- individual is not eligible")
levels(data$current_living_arrangement.factor)=c("Live independently in the community at home?","Live in an assisted living facility? - STOP - not eligible","Live in a nursing home? - STOP - not eligible","Other")
levels(data$pregnancy_screen.factor)=c("Yes - STOP- individual is not eligible","No","N/A - male","N/A - postmenopausal","N/A - post-hysterectomy")
levels(data$screening_complete.factor)=c("Incomplete","Unverified","Complete")
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
levels(data$part_1_demographics_complete.factor)=c("Incomplete","Unverified","Complete")
levels(data$height_collection_methodol1.factor)=c("Direct measurement","Self-report","EHR")
levels(data$height_collection_method.factor)=c("Direct measurement","Self-report","EHR")
levels(data$part_2_anthropometrics_vitals_complete.factor)=c("Incomplete","Unverified","Complete")
levels(data$fasting.factor)=c("Yes, fasting","No, not fasting")
levels(data$smoked_ever.factor)=c("Yes","No","DK/REF")
levels(data$smoke_history.factor)=c("Current smoker","Former smoker","Never smoked a single cigarette","DK/REF")
levels(data$smoked_last.factor)=c("Less than or equal to 1 hour","Less than or equal to 1 day","Less than or equal to 1 month","Greater than 1 month")
levels(data$tubes_collected___1.factor)=c("Unchecked","Checked")
levels(data$tubes_collected___2.factor)=c("Unchecked","Checked")
levels(data$tubes_collected___3.factor)=c("Unchecked","Checked")
levels(data$tubes_collected___4.factor)=c("Unchecked","Checked")
levels(data$tubes_collected___5.factor)=c("Unchecked","Checked")
levels(data$tubes_collected___6.factor)=c("Unchecked","Checked")
levels(data$part_3_phlebotomy_complete.factor)=c("Incomplete","Unverified","Complete")
levels(data$sf36_1.factor)=c("Excellent","Very Good","Good","Fair","Poor")
levels(data$sf36_2.factor)=c("Much better now than one year ago","Somewhat better now than one year ago","About the same as one year ago","Somewhat worse now than one year ago","Much worse now than one year ago")
levels(data$sf36_3a.factor)=c("Yes limited a lot","Yes, limited a little","No, not limited at all")
levels(data$sf36_3b.factor)=c("Yes limited a lot","Yes, limited a little","No, not limited at all")
levels(data$sf36_3c.factor)=c("Yes limited a lot","Yes, limited a little","No, not limited at all")
levels(data$sf36_3d.factor)=c("Yes limited a lot","Yes, limited a little","No, not limited at all")
levels(data$sf36_3e.factor)=c("Yes limited a lot","Yes, limited a little","No, not limited at all")
levels(data$sf36_3f.factor)=c("Yes limited a lot","Yes, limited a little","No, not limited at all")
levels(data$sf36_3g.factor)=c("Yes limited a lot","Yes, limited a little","No, not limited at all")
levels(data$sf36_3h.factor)=c("Yes limited a lot","Yes, limited a little","No, not limited at all")
levels(data$sf36_3i.factor)=c("Yes limited a lot","Yes, limited a little","No, not limited at all")
levels(data$sf36_3j.factor)=c("Yes limited a lot","Yes, limited a little","No, not limited at all")
levels(data$sf36_4a.factor)=c("All of the time","Most of the time","Some of the time","A little of the time","None of the time")
levels(data$sf36_4b.factor)=c("All of the time","Most of the time","Some of the time","A little of the time","None of the time")
levels(data$sf36_4c.factor)=c("All of the time","Most of the time","Some of the time","A little of the time","None of the time")
levels(data$sf36_4d.factor)=c("All of the time","Most of the time","Some of the time","A little of the time","None of the time")
levels(data$sf36_5a.factor)=c("All of the time","Most of the time","Some of the time","A little of the time","None of the time")
levels(data$sf36_5b.factor)=c("All of the time","Most of the time","Some of the time","A little of the time","None of the time")
levels(data$sf36_5c.factor)=c("All of the time","Most of the time","Some of the time","A little of the time","None of the time")
levels(data$sf36_6.factor)=c("Not at all","Slightly","Moderately","Quite a bit","Extremely")
levels(data$sf36_7.factor)=c("None","Very mild","Mild","Moderate","Severe","Very severe")
levels(data$sf36_8.factor)=c("Not at all","A little bit","Moderately","Quite a bit","Extremely")
levels(data$sf36_9a.factor)=c("All of the time","Most of the time","Some of the time","A little of the time","None of the time")
levels(data$sf36_9b.factor)=c("All of the time","Most of the time","Some of the time","A little of the time","None of the time")
levels(data$sf36_9c.factor)=c("All of the time","Most of the time","Some of the time","A little of the time","None of the time")
levels(data$sf36_9d.factor)=c("All of the time","Most of the time","Some of the time","A little of the time","None of the time")
levels(data$sf36_9e.factor)=c("All of the time","Most of the time","Some of the time","A little of the time","None of the time")
levels(data$sf36_9f.factor)=c("All of the time","Most of the time","Some of the time","A little of the time","None of the time")
levels(data$sf36_9g.factor)=c("All of the time","Most of the time","Some of the time","A little of the time","None of the time")
levels(data$sf36_9h.factor)=c("All of the time","Most of the time","Some of the time","A little of the time","None of the time")
levels(data$sf36_9i.factor)=c("All of the time","Most of the time","Some of the time","A little of the time","None of the time")
levels(data$sf36_10.factor)=c("All of the time","Most of the time","Some of the time","A little of the time","None of the time")
levels(data$sf36_11a.factor)=c("Definitely true","Mostly true","Dont know","Mostly false","Definitely false")
levels(data$sf36_11b.factor)=c("Definitely true","Mostly true","Dont know","Mostly false","Definitely false")
levels(data$sf36_11c.factor)=c("Definitely true","Mostly true","Dont know","Mostly false","Definitely false")
levels(data$sf36_11d.factor)=c("Definitely true","Mostly true","Dont know","Mostly false","Definitely false")
levels(data$part_4_sf36v2_use_hard_copy_selfreport_form_complete.factor)=c("Incomplete","Unverified","Complete")
levels(data$dbc1_hbp.factor)=c("I DONT HAVE THIS CONDITION 0","NOT AT ALL 1","2","3","4","A LOT 5")
levels(data$dbc2_chol.factor)=c("I DONT HAVE THIS CONDITION 0","NOT AT ALL 1","2","3","4","A LOT 5")
levels(data$dbc3_asthma.factor)=c("I DONT HAVE THIS CONDITION 0","NOT AT ALL 1","2","3","4","A LOT 5")
levels(data$dbc4_diabetes.factor)=c("I DONT HAVE THIS CONDITION 0","NOT AT ALL 1","2","3","4","A LOT 5")
levels(data$dbc5_thyroid.factor)=c("I DONT HAVE THIS CONDITION 0","NOT AT ALL 1","2","3","4","A LOT 5")
levels(data$dbc6_cbp.factor)=c("I DONT HAVE THIS CONDITION 0","NOT AT ALL 1","2","3","4","A LOT 5")
levels(data$dbc7_ra.factor)=c("I DONT HAVE THIS CONDITION 0","NOT AT ALL 1","2","3","4","A LOT 5")
levels(data$dbc8_othra.factor)=c("I DONT HAVE THIS CONDITION 0","NOT AT ALL 1","2","3","4","A LOT 5")
levels(data$dbc9_stomach.factor)=c("I DONT HAVE THIS CONDITION 0","NOT AT ALL 1","2","3","4","A LOT 5")
levels(data$dbc10_colon.factor)=c("I DONT HAVE THIS CONDITION 0","NOT AT ALL 1","2","3","4","A LOT 5")
levels(data$dbc11_bldcirc.factor)=c("I DONT HAVE THIS CONDITION 0","NOT AT ALL 1","2","3","4","A LOT 5")
levels(data$dbc12_overwt.factor)=c("I DONT HAVE THIS CONDITION 0","NOT AT ALL 1","2","3","4","A LOT 5")
levels(data$dbc13_hearing.factor)=c("I DONT HAVE THIS CONDITION 0","NOT AT ALL 1","2","3","4","A LOT 5")
levels(data$dbc14_vision.factor)=c("I DONT HAVE THIS CONDITION 0","NOT AT ALL 1","2","3","4","A LOT 5")
levels(data$dbc15_bronch.factor)=c("I DONT HAVE THIS CONDITION 0","NOT AT ALL 1","2","3","4","A LOT 5")
levels(data$dbc16_osteoarth.factor)=c("I DONT HAVE THIS CONDITION 0","NOT AT ALL 1","2","3","4","A LOT 5")
levels(data$dbc17_osteopor.factor)=c("I DONT HAVE THIS CONDITION 0","NOT AT ALL 1","2","3","4","A LOT 5")
levels(data$dbc18_cancer.factor)=c("I DONT HAVE THIS CONDITION 0","NOT AT ALL 1","2","3","4","A LOT 5")
levels(data$dbc19_chf.factor)=c("I DONT HAVE THIS CONDITION 0","NOT AT ALL 1","2","3","4","A LOT 5")
levels(data$dbc20_hd.factor)=c("I DONT HAVE THIS CONDITION 0","NOT AT ALL 1","2","3","4","A LOT 5")
levels(data$dbc21_stroke.factor)=c("I DONT HAVE THIS CONDITION 0","NOT AT ALL 1","2","3","4","A LOT 5")
levels(data$dbc22_psych.factor)=c("I DONT HAVE THIS CONDITION 0","NOT AT ALL 1","2","3","4","A LOT 5")
levels(data$dbc23_dementia.factor)=c("I DONT HAVE THIS CONDITION 0","NOT AT ALL 1","2","3","4","A LOT 5")
levels(data$dbc24_incont.factor)=c("I DONT HAVE THIS CONDITION 0","NOT AT ALL 1","2","3","4","A LOT 5")
levels(data$dbc25_frail.factor)=c("I DONT HAVE THIS CONDITION 0","NOT AT ALL 1","2","3","4","A LOT 5")
levels(data$dbc26_oth.factor)=c("I DONT HAVE THIS CONDITION 0","NOT AT ALL 1","2","3","4","A LOT 5")
levels(data$part_5_bayliss_disease_checklist_use_hard_copy_sel_complete.factor)=c("Incomplete","Unverified","Complete")
levels(data$alcohol_history.factor)=c("yes","no","DK/REF")
levels(data$how_often_any.factor)=c("Daily or almost every day","3 or 4 times a week","Once or twice a week","Once or twice a month","Less often than once a month, or never")
levels(data$timeframe_beer.factor)=c("per day","per week","per month","per year","NEVER DRINKS BEER","DK/REF")
levels(data$type_beer.factor)=c("Regular beer","Light beer, or","About half and half","DK/REF")
levels(data$timeframe_wine.factor)=c("per day","per week","per month","per year","NEVER DRINKS WINE","DK/REF")
levels(data$timeframe_liquor.factor)=c("per day","per week","per month","per year","NEVER DRINKS OTHER ALCOHOLIC BEVERAGES","DK/REF")
levels(data$alcohol_weekend.factor)=c("Drink about the same number of alcoholic beverages every day? or","Drink alcoholic beverages mostly on weekends and holidays?","DK/REF")
levels(data$part_6_alcohol_use_hard_copy_selfreport_form_complete.factor)=c("Incomplete","Unverified","Complete")
levels(data$diabetes_doctor.factor)=c("Yes","No (SKIP TO CHOLESTEROL)","DK/REF (SKIP TO CHOLESTEROL)")
levels(data$diabetes_medicine.factor)=c("Yes","No","DK/REF")
levels(data$diabetes_medicine_rx.factor)=c("Yes","No","DK/REF")
levels(data$diabetes_med_complications.factor)=c("Yes","No (SKIP TO CHOLESTEROL)","DK/REF (SKIP TO CHOLESTEROL)")
levels(data$cholesterol_doctor.factor)=c("Yes","No (SKIP TO HIGH BLOOD PRESSURE)","DK/REF (SKIP TO HIGH BLOOD PRESSURE)")
levels(data$cholesterol_medication.factor)=c("Yes","No","DK/REF")
levels(data$hbp_doctor.factor)=c("Yes","No (SKIP TO FALLS)","DK/REF (SKIP TO FALLS)")
levels(data$hbp_medicine.factor)=c("Yes","No","DK/REF")
levels(data$fallen.factor)=c("Yes","No (SKIP TO SURGERIES)","DK/REF (SKIP TO SURGERIES)")
levels(data$falls_doctor.factor)=c("Yes","No","DK/REF")
levels(data$surgeries_ever.factor)=c("Yes","No (SKIP TO NEXT SECTION)","DK/REF (SKIP TO NEXT SECTION)")
levels(data$part_7_personal_medical_history_complete.factor)=c("Incomplete","Unverified","Complete")
levels(data$med_1_dosage_form.factor)=c("Oral Tablet","Oral Capsule","Oral Liquid Powder","Topical","Injection","Ophthalmic","Rectal or Vaginal","Inhaled or Nasal","Other")
levels(data$med_1_times_taken_daily.factor)=c("One","Two","Three","Four","As Needed","Other")
levels(data$med_2_dosage_form.factor)=c("Oral Tablet","Oral Capsule","Oral Liquid Powder","Topical","Injection","Ophthalmic","Rectal or Vaginal","Inhaled or Nasal","Other")
levels(data$med_2_times_taken_daily.factor)=c("One","Two","Three","Four","As Needed","Other")
levels(data$med_3_dosage_form.factor)=c("Oral Tablet","Oral Capsule","Oral Liquid Powder","Topical","Injection","Ophthalmic","Rectal or Vaginal","Inhaled or Nasal","Other")
levels(data$med_3_times_taken_daily.factor)=c("One","Two","Three","Four","As Needed","Other")
levels(data$med_4_dosage_form.factor)=c("Oral Tablet","Oral Capsule","Oral Liquid Powder","Topical","Injection","Ophthalmic","Rectal or Vaginal","Inhaled or Nasal","Other")
levels(data$med_4_times_taken_daily.factor)=c("One","Two","Three","Four","As Needed","Other")
levels(data$med_5_dosage_form.factor)=c("Oral Tablet","Oral Capsule","Oral Liquid Powder","Topical","Injection","Ophthalmic","Rectal or Vaginal","Inhaled or Nasal","Other")
levels(data$med_5_times_taken_daily.factor)=c("One","Two","Three","Four","As Needed","Other")
levels(data$med_6_dosage_form.factor)=c("Oral Tablet","Oral Capsule","Oral Liquid Powder","Topical","Injection","Ophthalmic","Rectal or Vaginal","Inhaled or Nasal","Other")
levels(data$med_6_times_taken_daily.factor)=c("One","Two","Three","Four","As Needed","Other")
levels(data$med_7_dosage_form.factor)=c("Oral Tablet","Oral Capsule","Oral Liquid Powder","Topical","Injection","Ophthalmic","Rectal or Vaginal","Inhaled or Nasal","Other")
levels(data$med_7_times_taken_daily.factor)=c("One","Two","Three","Four","As Needed","Other")
levels(data$med_8_dosage_form.factor)=c("Oral Tablet","Oral Capsule","Oral Liquid Powder","Topical","Injection","Ophthalmic","Rectal or Vaginal","Inhaled or Nasal","Other")
levels(data$med_8_times_taken_daily.factor)=c("One","Two","Three","Four","As Needed","Other")
levels(data$otc_1_dosage_form.factor)=c("Oral Tablet","Oral Capsule","Oral Liquid Powder","Topical","Injection","Ophthalmic","Rectal or Vaginal","Inhaled or Nasal","Other")
levels(data$otc_1_times_taken_daily.factor)=c("One","Two","Three","Four","As Needed","Other")
levels(data$otc_2_dosage_form.factor)=c("Oral Tablet","Oral Capsule","Oral Liquid Powder","Topical","Injection","Ophthalmic","Rectal or Vaginal","Inhaled or Nasal","Other")
levels(data$otc_2_times_taken_daily.factor)=c("One","Two","Three","Four","As Needed","Other")
levels(data$otc_3_dosage_form.factor)=c("Oral Tablet","Oral Capsule","Oral Liquid Powder","Topical","Injection","Ophthalmic","Rectal or Vaginal","Inhaled or Nasal","Other")
levels(data$otc_3_times_taken_daily.factor)=c("One","Two","Three","Four","As Needed","Other")
levels(data$otc_4_dosage_form.factor)=c("Oral Tablet","Oral Capsule","Oral Liquid Powder","Topical","Injection","Ophthalmic","Rectal or Vaginal","Inhaled or Nasal","Other")
levels(data$otc_4_times_taken_daily.factor)=c("One","Two","Three","Four","As Needed","Other")
levels(data$part_8_list_of_medications_complete.factor)=c("Incomplete","Unverified","Complete")
levels(data$part_9_slums_use_hard_copy_form_to_administer_complete.factor)=c("Incomplete","Unverified","Complete")
levels(data$moca20.factor)=c("Yes","No")
levels(data$part_9_moca_use_hard_copy_form_to_administer_complete.factor)=c("Incomplete","Unverified","Complete")
levels(data$adl_walking.factor)=c("Help (Skip to 3)","No help","Unable to do (Skip to 3)","DK/REF (Skip to 3)")
levels(data$difficulty_walking.factor)=c("No difficulty at all?","A little difficulty?","Some difficulty? or","A lot of difficulty?","DK/REF")
levels(data$adl_bathing.factor)=c("Help (Skip to 5)","No help","Unable to do (Skip to 5)","DK/REF (Skip to 5)")
levels(data$difficulty_bathing.factor)=c("No difficulty at all?","A little difficulty?","Some difficulty? or","A lot of difficulty?","DK/REF")
levels(data$adl_grooming.factor)=c("Help (Skip to 7)","No help","Unable to do (Skip to 7)","DK/REF (Skip to 7)")
levels(data$difficulty_grooming.factor)=c("No difficulty at all?","A little difficulty?","Some difficulty? or","A lot of difficulty?","DK/REF")
levels(data$adl_dressing.factor)=c("Help (Skip to 9)","No help","Unable to do (Skip to 9)","DK/REF (Skip to 9)")
levels(data$difficulty_dressing.factor)=c("No difficulty at all?","A little difficulty?","Some difficulty? or","A lot of difficulty?","DK/REF")
levels(data$adl_eating.factor)=c("Help (Skip to 11)","No help","Unable to do (Skip to 11)","DK/REF (Skip to 11)")
levels(data$difficulty_eating.factor)=c("No difficulty at all?","A little difficulty?","Some difficulty? or","A lot of difficulty?","DK/REF")
levels(data$adl_transfer.factor)=c("Help (Skip to 13)","No help","Unable to do (Skip to 13)","DK/REF (Skip to 13)")
levels(data$diffculty_transfer.factor)=c("No difficulty at all?","A little difficulty?","Some difficulty? or","A lot of difficulty?","DK/REF")
levels(data$adl_toilet.factor)=c("Help (Skip to IADLs)","No help","Unable to do (Skip to IADLs)","DK/REF (Skip to IADLs)")
levels(data$difficulty_toilet.factor)=c("No difficulty at all?","A little difficulty?","Some difficulty? or","A lot of difficulty?","DK/REF")
levels(data$iadl_telephone.factor)=c("W/out help","With help","Unable to do","DK/REF")
levels(data$difficulty_telephone.factor)=c("ND","LD","SD","AD","DK/REF")
levels(data$iadl_travel.factor)=c("W/out help","With help","Unable to do","DK/REF")
levels(data$difficulty_travel.factor)=c("ND","LD","SD","AD","DK/REF")
levels(data$iadl_shopping.factor)=c("W/out help","With help","Unable to do","DK/REF")
levels(data$difficulty_shopping.factor)=c("ND","LD","SD","AD","DK/REF")
levels(data$iadl_meals.factor)=c("W/out help","With help","Unable to do","DK/REF")
levels(data$difficulty_meals.factor)=c("ND","LD","SD","AD","DK/REF")
levels(data$iadl_housework.factor)=c("W/out help","With help","Unable to do","DK/REF")
levels(data$difficulty_housework.factor)=c("ND","LD","SD","AD","DK/REF")
levels(data$iadl_medicine.factor)=c("W/out help","With help","Unable to do","DK/REF")
levels(data$difficulty_medicine.factor)=c("ND","LD","SD","AD","DK/REF")
levels(data$iadl_money.factor)=c("W/out help","With help","Unable to do","DK/REF")
levels(data$difficulty_money.factor)=c("ND","LD","SD","AD","DK/REF")
levels(data$iadl_laundry.factor)=c("W/out help","With help","Unable to do","DK/REF")
levels(data$difficulty_laundry.factor)=c("ND","LD","SD","AD","DK/REF")
levels(data$part_10_adls_iadls_for_60_years_older_complete.factor)=c("Incomplete","Unverified","Complete")
levels(data$feel_energy.factor)=c("Yes","No","DK/REF")
levels(data$lost_weight.factor)=c("Yes","No","DK/REF")
levels(data$part_11_frailty_status_questions_complete.factor)=c("Incomplete","Unverified","Complete")
levels(data$walking_pleasure.factor)=c("Yes","No")
levels(data$walking2from_work.factor)=c("Yes","No")
levels(data$walking_work_breaks.factor)=c("Yes","No")
levels(data$using_stairs.factor)=c("Yes","No")
levels(data$xcountry_hiking.factor)=c("Yes","No")
levels(data$bicycling.factor)=c("Yes","No")
levels(data$dancing.factor)=c("Yes","No")
levels(data$home_exercises.factor)=c("Yes","No")
levels(data$healthclub.factor)=c("Yes","No")
levels(data$jogwalk.factor)=c("Yes","No")
levels(data$running.factor)=c("Yes","No")
levels(data$weightlifting.factor)=c("Yes","No")
levels(data$canoerowing.factor)=c("Yes","No")
levels(data$swimmingpool.factor)=c("Yes","No")
levels(data$swimmingbeachlake.factor)=c("Yes","No")
levels(data$snorkeling.factor)=c("Yes","No")
levels(data$snowskiing.factor)=c("Yes","No")
levels(data$bowling.factor)=c("Yes","No")
levels(data$volleyball.factor)=c("Yes","No")
levels(data$tabletennis.factor)=c("Yes","No")
levels(data$tennisdoubles.factor)=c("Yes","No")
levels(data$softball.factor)=c("Yes","No")
levels(data$badminton.factor)=c("Yes","No")
levels(data$paddleball.factor)=c("Yes","No")
levels(data$racquetball.factor)=c("Yes","No")
levels(data$golfcart.factor)=c("Yes","No")
levels(data$golfwalk.factor)=c("Yes","No")
levels(data$golfcarry.factor)=c("Yes","No")
levels(data$mowride.factor)=c("Yes","No")
levels(data$mowwalk.factor)=c("Yes","No")
levels(data$weeding.factor)=c("Yes","No")
levels(data$spading.factor)=c("Yes","No")
levels(data$raking.factor)=c("Yes","No")
levels(data$carpentryinside.factor)=c("Yes","No")
levels(data$paintinside.factor)=c("Yes","No")
levels(data$carpentryoutside.factor)=c("Yes","No")
levels(data$paintoutside.factor)=c("Yes","No")
levels(data$fishingriver.factor)=c("Yes","No")
levels(data$huntingpheasants.factor)=c("Yes","No")
levels(data$huntgame.factor)=c("Yes","No")
levels(data$activity41.factor)=c("Yes","No")
levels(data$activity42.factor)=c("Yes","No")
levels(data$activity43.factor)=c("Yes","No")
levels(data$frailty_score.factor)=c("Yes, Frail","No, Not frail")
levels(data$part_12_minnesota_leisure_time_questionnaire_use_o_complete.factor)=c("Incomplete","Unverified","Complete")
levels(data$armsurgery.factor)=c("Yes","No","DK/REF")
levels(data$handtested.factor)=c("Right","Left","Not Applicable")
levels(data$part_13_grip_strength_complete.factor)=c("Incomplete","Unverified","Complete")
levels(data$walkcompleted.factor)=c("Yes","No -  SKIP TO NEXT SECTION")
levels(data$part_14_10_foot_walk_complete.factor)=c("Incomplete","Unverified","Complete")
levels(data$foodrecall.factor)=c("Yes","No")
levels(data$part_15_asa24_24_hour_food_recall_use_of_hard_copy_complete.factor)=c("Incomplete","Unverified","Complete")
levels(data$part_16_exit_questions_complete.factor)=c("Incomplete","Unverified","Complete")
levels(data$part_17_clinical_labs_entered_after_results_return_complete.factor)=c("Incomplete","Unverified","Complete")
levels(data$skin_biopsy.factor)=c("Yes","No")
levels(data$fat_biopsy.factor)=c("Yes","No")
levels(data$biopsy_complication.factor)=c("Yes","No")
levels(data$part_18_biopsy_complete.factor)=c("Incomplete","Unverified","Complete")
