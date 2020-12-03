###################################################################################
#
#		Dover sole
#
#############################################################################################

devtools::load_all("C:/Users/Chantel.Wetzel/Documents/GitHub/nwfscSurvey")
devtools::load_all("C:/Users/Chantel.Wetzel/Documents/GitHub/HandyCode")
devtools::load_all("C:/Users/Chantel.Wetzel/Documents/GitHub/dataModerate_2021")

source("C:/Assessments/2020/survey_summary/code_package/functions/plot_cpue.R")

dir = "//nwcfile/FRAM/Assessments/CurrentAssessments/Dover_sole_2021/data/survey"


############################################################################################
#	Load the Survey Data
############################################################################################

load(file.path(dir, "wcgbts", "Dover sole_catch.rda"))
load(file.path(dir, "wcgbts", "Dover sole_bio.rda"))
catch_wcgbt = catch
bio_wcgbt = bio

load(file.path(dir, "triennial", "Catch__Triennial_2020-09-10.rda"))
load(file.path(dir, "triennial", "Bio_All_Triennial_2020-09-10.rda"))
catch_tri = Out
bio_tri = Data$Lengths

load(file.path(dir, "nwfsc_slope", "Catch__NWFSC.Slope_2020-09-10.rda"))
load(file.path(dir, "nwfsc_slope", "Bio_All_NWFSC.Slope_2020-09-10.rda"))
catch_nwfsc_slope = Out
bio_nwfsc_slope = Data

load(file.path(dir, "afsc_slope", "Dover.AK.28.MAr.2010.dmp"))
load(file.path(dir, "afsc_slope", "AK.Surveys.Bio.Dover.17.Mar.11.dmp"))
format_dat = Format.AKSlope.fn(datTows = Dover.AK.28.MAr.2010, 
						 	   datL = AK.Surveys.Bio.Dover.17.Mar.11,
							   start.year = 1997)

catch_afsc_slope = format_dat$datTows
bio_afsc_slope = format_dat$length

# There is a NA in the catch data
catch_afsc_slope[is.na(catch_afsc_slope$cpue_kg_km2), c("Area_Swept_ha", "cpue_kg_km2")] = 0


plot_cpue_fn(dir = file.path(dir, "plots"), 
			 name = "Dover_sole", 
			 catch = catch_wcgbt, bio = bio_wcgbt, 
			 plot = 1:3, n = 20000)

plot_cpue_fn(dir = file.path(dir, "plots"), 
			 name = "Dover_sole", 
			 catch = catch_tri, bio = bio_tri, 
			 plot = 1:3, n = 20000)

plot_cpue_fn(dir = file.path(dir, "plots"), 
			 name = "Dover_sole", 
			 catch = catch_nwfsc_slope, bio = bio_nwfsc_slope, 
			 plot = 1:3, n = 20000)

plot_cpue_fn(dir = file.path(dir, "plots"), 
			 name = "Dover_sole", 
			 catch = catch_afsc_slope, bio = bio_afsc_slope, 
			 plot = 1:3, n = 20000)