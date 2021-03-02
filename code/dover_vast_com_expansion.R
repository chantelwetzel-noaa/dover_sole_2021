# Download release number 3.0.0; its useful for reproducibility to use a specific release number
#.libPaths("C:/Program Files/R/R-3.5.2/library")
#devtools::install_github("james-thorson/VAST", ref="3.0.0")
#devtools::install_github("kaskr/TMB_contrib_R/TMBhelper", force = TRUE)

# Load packages
library(TMB)
library(VAST)
library(TMBhelper)
devtools::load_all("C:/Users/Chantel.Wetzel/Documents/GitHub/nwfscSurvey")

#############################################################################################################
# Pull the data and create the stage one expansion data:
#############################################################################################################

setwd("//nwcfile/FRAM/Assessments/CurrentAssessments/Dover_sole_2021/data/survey/wcgbts")

# Define the bin structure for age and length data
# Starting with the same definition as used in the 2011 assessment
len.bins = seq(8, 60, 2)
age.bins = 1:60

# Pull the catch and biological data
#catch = PullCatch.fn(Name = "Dover sole", SurveyName = "NWFSC.Combo", SaveFile = TRUE, Dir = getwd())
#bio   = PullBio.fn(Name = "Dover sole", SurveyName = "NWFSC.Combo",  SaveFile = TRUE, Dir = getwd())
load("Catch__NWFSC.Combo_2020-10-15.rda")
catch = Out
load("Bio_All_NWFSC.Combo_2020-10-15.rda")
len = Data

strata = CreateStrataDF.fn(names=c("shallow_45_49", "shallow_405_45", "shallow_345_405", "shallow_32_345",
                                   "mid_45_49", "mid_405_45", "mid_345_405", "mid_32_345",
                                   "mid_deep_45_49", "mid_deep_405_45", "mid_deep_345_405", "mid_deep_32_345",
                                   "deep_405_49", "deep_345_405", "deep_32_345"), 
                           depths.shallow = c( 55,   55,   55,  55, 183, 183, 183, 183, 549, 549, 549, 549,  900,  900,  900),
                           depths.deep    = c(183,  183,  183, 183, 549, 549, 549, 549, 900, 900, 900, 900, 1280, 1280, 1280),
                           lats.south     = c(45.0, 40.5, 34.5, 32.0, 45.0, 40.5, 34.5, 32.0, 45.0, 40.5, 34.5, 32.0, 40.5, 34.5, 32.0),
                           lats.north     = c(49.0, 45.0, 40.5, 34.5, 49.0, 45.0, 40.5, 34.5, 49.0, 45.0, 40.5, 34.5, 49.0, 40.5, 34.5))



# Expand and format length composition data for SS
stage_one <- SurveyLFs.fn(dir = file.path(getwd(), "vast_comps"), datL = len, datTows = catch,  
                    strat.df = strata, lgthBins = len.bins, sex = 3, 
                    sexRatioStage = 2, sexRatioUnsexed = 0.5, maxSizeUnsexed = 20, 
                    outputStage1 = TRUE)

# Need to have both negative and positive observations...
pos_tows = unique(stage_one$Trawl_id)
neg_ind  = catch[!(catch$Trawl_id %in% pos_tows), ]
# Need to fill out matrix with 0 by all length bins, add 0 to length bins with 0 samples in positive tows, and
# create new data frame.  

len.bins = seq(6, 60,2)
# Create the length bins names
bin_size = 2
lo = len.bins[findInterval(stage_one$Length_cm, len.bins, left.open=T)]
hi = lo + bin_size
Length_bin = paste0(lo, "-", hi, "cm")

# The comps are calculated seperately by sex:
by_sex = "female"

sex = ifelse(by_sex == "female", "Nf", "Nm")
temp = stage_one[,c("Year", "Latitude_dd", "Longitude_dd", "areaFished", sex)]
temp$Length_bin = as.factor(Length_bin)
# The below conversion is just done to put the area fished on the same scale as the lingcod example
temp$areaFished = temp$areaFished / 10000 # need to double check this
colnames(temp) = c("Year", "Lat", "Lon", "AreaSwept_km2", "First_stage_expanded_numbers", "Length_bin")

# This is the old widow 2015 stratification used for the comp. expansion
# strata.limits <- data.frame( 'STRATA' = c("shallow_s", "deep_s", "shallow_n", "deep_n"), 
#                             'north_border' = c(49.0, 40.5), 'south_border' = c(34.5, 40.5),
#                             'shallow_border' = c(55, 183), 'deep_border' = c(183, 400) ) 

# This is based on the example strata.limits to correspond with the latitude from the 2015 assessment
strata.limits <- data.frame('STRATA' = 'all', 'north_border' = 49.0, 'south_border' = 32.0)

# Create data list in the right format
data_in = list()
data_in$sampling_data = temp
data_in$Region = "california_current"
data_in$strata.limits = strata.limits

setwd("//nwcfile/FRAM/Assessments/CurrentAssessments/Dover_sole_2021/data/survey/wcgbts/vast_comps")

# Make settings
settings = FishStatsUtils::make_settings( n_x = 50, 
										  Region = data_in$Region, 
										  purpose = "index2", 
										  strata.limits = data_in$strata.limits )

# Change settings from defaults
# settings$ObsModel = c(2, 0) # Gamma
settings$ObsModel = c(2, 3) # gamma with encounter probability = 1
settings$use_anisotropy = FALSE
settings$fine_scale = FALSE

# Run Model
fit = FishStatsUtils::fit_model( "settings" = settings, 
								                 "Lat_i" = data_in$sampling_data[,'Lat'], 
								                 "Lon_i" = data_in$sampling_data[,'Lon'],
  								               "t_i" = data_in$sampling_data[,'Year'], 
  								               "c_i" = as.numeric(data_in$sampling_data[,"Length_bin"]) - 1,
  								               "b_i" = data_in$sampling_data[,'First_stage_expanded_numbers'],
  								               "a_i" = data_in$sampling_data[,'AreaSwept_km2'], 
  								               model_args = list("Npool" = 40),
  								               newtonsteps = 1 )

# Error when running the code above:
# Error in par[-random] <- x : replacement has length zero
# In addition: Warning message:
# In (function (obj, fn = obj$fn, gr = obj$gr, startpar = obj$par,  :
#   Hessian is not positive definite, so standard errors are not available

# Plot results
results = FishStatsUtils::plot_results( settings=settings, fit=fit )

# Calculate proportions
proportions = FishStatsUtils::calculate_proportion( TmbData = fit$data_list, 
													Index = results$Index, 
													Year_Set = fit$year_labels )


####################################################################################################
# Kelli's VASTwestcoast package
###################################################################################################
.libPaths("C:/Program Files/R/R-3.5.2/library")

devtools::load_all("C:/Users/Chantel.Wetzel/Documents/GitHub/VASTWestCoast")

#devtools::install_github("nwfsc-assess/VASTWestCoast")
#library(VASTWestCoast)

dist = "lognormal"

setwd(paste0("C:/Assessments/2019/widow_2019/data/nwfsc_combo/vast_w_strata/", dist))

strata.limits <- data.frame( 'STRATA' = c("shallow_s", "deep_s", "shallow_n", "deep_n"), 
                              'north_border' = c(49.0, 40.5), 'south_border' = c(34.5, 40.5),
                              'shallow_border' = c(55, 183), 'deep_border' = c(183, 400) )

if (dist == "lognormal"){ obs_model = c(1,0)}
if (dist == "gamma"){ obs_model = c(2,0)}

Sim_Settings <- list( "Species" = "WCGBTS_Sebastes_entomelas",
                      "ObsModelcondition" = obs_model,
                      "nknots" = 50,
                      "depth" = c("no", "linear", "squared")[1],
                      "strata" = strata.limits,
                      "version" = "VAST_v5_4_0",
                      "Passcondition" = TRUE
                      )


downloaddir <- getwd()

# Error: Error in VAST::make_data(...) : 
# Must provide `spatial_list` for Version >= 8.0.0
# To fix I specified an earlier version number above.

test <- VAST_condition(conditiondir = downloaddir,
                       settings = Sim_Settings, 
                       spp = Sim_Settings$Species,
                       datadir = downloaddir,
                       overdispersion = NULL)

VAST_diagnostics(downloaddir)