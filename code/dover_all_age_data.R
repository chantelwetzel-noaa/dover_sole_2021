###################################################################################
#
#			Dover sole
#
#############################################################################################

devtools::load_all("C:/Users/Chantel.Wetzel/Documents/GitHub/nwfscSurvey")
devtools::load_all("C:/Users/Chantel.Wetzel/Documents/GitHub/PacFIN.Utilities")
#devtools::load_all("C:/Users/Chantel.Wetzel/Documents/GitHub/HandyCode")
devtools::load_all("C:/Users/Chantel.Wetzel/Documents/GitHub/dataModerate_2021")

start_dir = "//nwcfile/FRAM/Assessments/CurrentAssessments/Dover_sole_2021"

############################################################################################
#	Load Data
############################################################################################
#load(file.path(start_dir, "data", "commercial_comps", "pacfin", "PacFIN.DOVR.bds.13.Aug.2020.RData"))
load(file.path(start_dir, "data", "commercial_comps", "pacfin", "PacFIN.DOVR.bds.12.Feb.2021.RData"))
pacfin 	 = bds.pacfin #PacFIN.DOVR.bds.13.Aug.2020
pacfin = rename_pacfin(data = pacfin)

# NWFSC WCGBTS -----------------------------------------------------------------------------
load(file.path(start_dir, "data", "survey", "wcgbts", "Bio_All_NWFSC.Combo_2020-10-15.rda"))
bio_wcgbt = rename_survey_data(data = Data, survey_name = "nwfsc_wcgbts" )

# Triennial    -----------------------------------------------------------------------------
load(file.path(start_dir,  "data", "survey", "triennial", "Bio_All_Triennial_2020-09-10.rda"))
bio_tri = rename_survey_data(data = Data$Lengths,  survey_name = "triennial"  )

# NWFSC Slope  -----------------------------------------------------------------------------
load(file.path(start_dir,  "data", "survey", "nwfsc_slope", "Bio_All_NWFSC.Slope_2020-09-10.rda"))
bio_nwfsc_slope = rename_survey_data(data = Data,  survey_name = "nwfsc_slope"  )

# AFSC Slope   -----------------------------------------------------------------------------
load(file.path(start_dir, "data", "survey", "afsc_slope", "Dover.AK.28.MAr.2010.dmp"))
load(file.path(start_dir, "data", "survey", "afsc_slope", "AK.Surveys.Bio.Dover.17.Mar.11.dmp"))
format_dat = Format.AKSlope.fn(datTows = Dover.AK.28.MAr.2010, 
						 	   datL = AK.Surveys.Bio.Dover.17.Mar.11,
							   start.year = 1997)
bio_afsc_slope_len = rename_survey_data(data = format_dat$length,  survey_name = "afsc_slope" )
bio_afsc_slope_age = rename_survey_data(data = format_dat$age,  survey_name = "afsc_slope" )

# Calcom -----------------------------------------------------------------------------------------------

dir = "N:/Assessments/CurrentAssessments/Dover_sole_2021/data/commercial_comps/calcom/csv"
age_early = read.csv(file.path(dir, "Dover_flatfish_bin_age_query_with_length_sex_stratum_2021.csv"))
# remove the early scale reads
age_early = age_early[age_early$year > 1980,]
age_late = read.csv(file.path(dir, "raw_data_1990-2009_Dover_master_fish_age_not_null.csv"))
# remove 1991 samples
age_late = age_late[age_late$year != 1991, ]

age_early$Sex = NA
age_early$Sex[age_early$sex == 1] = "M"
age_early$Sex[age_early$sex == 2] = "F"
age_early$Sex[age_early$sex == 9] = "U"

age_early$len = as.numeric(age_early$tlength)/10

early_df = data.frame(
Year = age_early$year,
Lat = rep(NA, length(age_early$year)),
Lon = rep(NA, length(age_early$year)),
State = rep("CA", length(age_early$year)),
State_Areas = NA,
Areas = NA,
Depth = NA,
Sex = age_early$Sex,
Length = age_early$len,
Weight = rep(NA, length(age_early$year)),
Age = age_early$best_age,
Fleet = rep(NA, length(age_early$year)),
Data_Type = rep("RETAINED", length(age_early$year)),
Source = rep("CALCOM", length(age_early$year))
)


age_late$Sex = NA
age_late$Sex[age_late$sex == 1] = "M"
age_late$Sex[age_late$sex == 2] = "F"
age_late$Sex[age_late$sex == 9] = "U"

late_df = data.frame(
Year = age_late$year,
Lat = NA,
Lon = NA,
State = "CA",
State_Areas = NA,
Areas = NA,
Depth = NA,
Sex = age_late$Sex,
Length = age_late$flength/10,
Weight = NA,
Age = age_late$age,
Fleet = NA,
Data_Type = "RETAINED",
Source = "CALCOM"
)

#-------------------------------------------------------------------------------------------------

# Create list of all the data sources
input = list()
input[[1]] = pacfin
input[[2]] = bio_wcgbt
input[[3]] = bio_tri
input[[4]] = bio_nwfsc_slope
input[[5]] = bio_afsc_slope_len
input[[6]] = bio_afsc_slope_age
input[[7]] = early_df
input[[8]] = late_df
 
############################################################################################
#	Create data frame with all the input data
############################################################################################
out = create_data_frame(data_list = input)
out$Age = as.numeric(out[,"Age"]) 

remove = which(out$Source == "AFSC_Slope" & !is.na(out$Age) )
data = out[-remove,]

remove = which(out$Source == "PacFIN" & out$State == "CA" & !is.na(out$Age))
data = data[-remove,]


temp = checkLenAge(Pdata = data, 
   			      Par =  list( 0.15, 45, 8, 0.10, 0.10), 
   			      len_col = "Length", 
   			      age_col = "Age", 
   			      sex_col = "Sex",
   			      mult = 1)

# remove data that are outside the 4*sd interval
remove = which(temp$Length < temp$Lhat_low | temp$Length > temp$Lhat_high)
plot(temp$Age[remove],temp$Length[remove], type = 'p', col = rgb(0,0,0, alpha = 0.1))
#points(out$Age[remove], out$Length[remove], col = 'red')

all_ages = temp[-remove,]

# remove 3 age records that seem unreasonable
quantile(all_ages$Age, na.rm = TRUE)
remove = which(all_ages$Age > 70)
all_ages = all_ages[-remove,]

start_dir = "//nwcfile/FRAM/Assessments/CurrentAssessments/Dover_sole_2021"
save(all_ages, file = file.path(start_dir, "data", "biology", "dover_all_ages.Rdat"))

