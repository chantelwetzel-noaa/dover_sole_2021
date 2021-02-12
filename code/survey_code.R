##########################################################################
#
#    https://github.com/nwfsc-assess/nwfscSurvey
#   devtools::install_github("nwfsc-assess/nwfscSurvey")
#    Code use to create the 2021 survey comps in the 
#           2021 Dover sole assessment
#
#           Started by: Chantel Wetzel
#              September 9, 2020
#
#########################################################################

devtools::load_all("C:/Users/Chantel.Wetzel/Documents/GitHub/nwfscSurvey")

# The 2011 assessment used survey data from the Triennial, NWFSC Slope, AFSC slope, 
# and the NWFSC WCGBTS data.  

#########################################################################
# 
#  NWFSC WCGBT Survey
#
##########################################################################
devtools::load_all("C:/Users/Chantel.Wetzel/Documents/GitHub/nwfscSurvey")

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
bio = Data

# Mimic the 2011 stratification (page 58) of the 2011 assessment
# The table gives the southern latitude as 30 degree but this is not an available split in the data based on the SA3.
strata = CreateStrataDF.fn(names=c("shallow_45_49", "shallow_405_45", "shallow_345_405", "shallow_32_345",
                                   "mid_45_49", "mid_405_45", "mid_345_405", "mid_32_345",
                                   "mid_deep_45_49", "mid_deep_405_45", "mid_deep_345_405", "mid_deep_32_345",
                                   "deep_405_49", "deep_345_405", "deep_32_345"), 
                           depths.shallow = c( 55,   55,   55,  55, 183, 183, 183, 183, 549, 549, 549, 549,  900,  900,  900),
                           depths.deep    = c(183,  183,  183, 183, 549, 549, 549, 549, 900, 900, 900, 900, 1280, 1280, 1280),
                           lats.south     = c(45.0, 40.5, 34.5, 32.0, 45.0, 40.5, 34.5, 32.0, 45.0, 40.5, 34.5, 32.0, 40.5, 34.5, 32.0),
                           lats.north     = c(49.0, 45.0, 40.5, 34.5, 49.0, 45.0, 40.5, 34.5, 49.0, 45.0, 40.5, 34.5, 49.0, 40.5, 34.5))

write.csv(strata, file = file.path(getwd(), "forSS", "nwfcs_wgbts_2011_strata.csv"))

num.strata = CheckStrata.fn(dir = getwd(), dat = catch, strat.vars = c("Depth_m","Latitude_dd"), strat.df = strata, printfolder = "forSS",  verbose = TRUE)
file.rename(file.path(getwd(), "forSS", "strata_observations.csv"), 
            file.path(getwd(), "forSS", "nwfsc_wcgbts_strata_observations.csv"))

# Calculate the design based index
biomass.nwfsc = Biomass.fn(dir = getwd(), dat = catch,  strat.df = strata, printfolder = "forSS", outputMedian = T) 
file.rename(file.path(getwd(), "forSS", "design_based_indices.csv"), 
            file.path(getwd(), "forSS", "nwfsc_wcgbts_design_based_indices.csv"))

# Plot the biomass index
PlotBio.fn(dir = getwd(), dat = biomass.nwfsc, main = "NWFSC WCGBTS", dopng = TRUE)
PlotBioStrata.fn(dir = getwd(), dat = biomass.nwfsc, survey.name = "NWFSC WCGBTS", 
      mfrow.in = c(4,4), gap = 0.01, sameylim = TRUE, dopng = TRUE)

#============================================================================================
#Length Biological Data 
#============================================================================================
len = bio

# Calculate the effN
n = GetN.fn(dir=getwd(), dat = len, type = "length", species = "flatfish", printfolder = "forSS")
file.rename(file.path(getwd(), "forSS", "length_SampleSize.csv"), 
            file.path(getwd(), "forSS", "nwfsc_wcgbts_length_samps.csv") )

# The 2011 assessment used the number of tows as the input sample size
# Will likely opt to use the Stewart & Hamel approach
# out = read.csvfile.path(getwd(), "forSS", "nwfsc_wcgbts_length_samps.csv", header = TRUE)
# n = out$Tows

# Expand and format length composition data for SS
LFs <- SurveyLFs.fn(dir = getwd(), datL = len, datTows = catch,  
                    strat.df = strata, lgthBins = len.bins, sex = 3, 
                    sexRatioStage = 2, sexRatioUnsexed = 0.5, maxSizeUnsexed = 20, 
                    nSamps = n, fleet = 7)
file.rename(file.path(getwd(), "forSS", "Survey_Sex3_Bins_8_60_LengthComps.csv"), 
            file.path(getwd(), "forSS", "nwfsc_wcgbts_Bins_8_60_LengthComps.csv") )
file.remove(file.path(getwd(), "forSS", "Survey_Sex3_Bins_-999_60_LengthComps.csv") )

PlotFreqData.fn(dir = getwd(), dat = LFs, ylim=c(0, 42), inch = 0.10,
      main = "NWFSC WCGBTS", yaxs="i", ylab="Length (cm)", dopng = TRUE)
file.rename(paste0(getwd(), "/plots/NWFSC WCGBTS_Length_Frequency.png"), 
            paste0(getwd(), "/plots/NWFSC WCGBTS_Length_Frequency_Max_40.png"))
PlotFreqData.fn(dir = getwd(), dat = LFs, ylim=c(0, max(len.bins)), inch = 0.10,
      main = "NWFSC WCGBTS", yaxs="i", ylab="Length (cm)", dopng = TRUE)

PlotSexRatio.fn(dir = getwd(), dat = len, data.type = "length", dopng = TRUE, 
      main = "NWFSC WCGBTS")


#============================================================================================
# Marginal Ages Biological Data 
#============================================================================================
age = bio

n = GetN.fn(dir = getwd(), dat = age, type = "age", species = "flatfish", printfolder = "forSS")
file.rename(file.path(getwd(), "forSS", "age_SampleSize.csv"), 
            file.path(getwd(), "forSS", "nwfsc_wcgbts_age_samps.csv") )

# Exand and format the marginal age composition data for SS
Ages <- SurveyAFs.fn(dir = getwd(), datA = age, datTows = catch,  
                     strat.df = strata, ageBins = age.bins, 
                     sexRatioStage = 2, sexRatioUnsexed = 0.50, maxSizeUnsexed = 1, 
                     sex = 3, nSamps = n, month = 7, fleet = NA, ageErr = NA, 
                     agelow = -1, agehigh = -1)
file.rename(file.path(getwd(), "forSS", "Survey_Sex3_Bins_1_60_AgeComps.csv"), 
            file.path(getwd(), "forSS", "nwfsc_wcgbts_Bins_1_60_AgeComps.csv") )
file.remove(file.path(getwd(), "forSS", "Survey_Sex3_Bins_-999_60_AgeComps.csv") )

PlotFreqData.fn(dir = getwd(), dat = Ages, main = "NWFSC WCGBTS", ylim=c(0, max(age.bins) + 2), yaxs="i", ylab="Age (yr)", dopng=TRUE)
file.rename(paste0(getwd(), "/plots/NWFSC WCGBTS_Age_Frequency.png"), 
            paste0(getwd(), "/plots/NWFSC WCGBTS_Age_Frequency_All_Ages.png"))
PlotFreqData.fn(dir = getwd(), dat = Ages, main = "NWFSC WCGBTS", ylim=c(0, 15), yaxs="i", ylab="Age (yr)", dopng=TRUE)
file.rename(paste0(getwd(), "/plots/NWFSC WCGBTS_Age_Frequency.png"), 
            paste0(getwd(), "/plots/NWFSC WCGBTS_Age_Frequency_Age_15.png"))

PlotVarLengthAtAge.fn(dir = getwd(), dat = age, main = "NWFSC WCGBTS", dopng = TRUE) 
PlotSexRatio.fn(dir = getwd(), dat = age, data.type = "age", xlim = c(0, 20), dopng = TRUE, 
  main = "NWFSC WCGBTS")

#============================================================================================
# Conditional Ages
#============================================================================================
Ages <- SurveyAgeAtLen.fn (dir = getwd(), datAL = age, datTows = catch, 
                          strat.df = strata, lgthBins = len.bins, ageBins = age.bins, 
                          partition = 0, ageErr = 1, month = 7, fleet = NA)



######################################################################################################################
######################################################################################################################
# 
# 	Triennial Early
#
######################################################################################################################
######################################################################################################################
setwd("//nwcfile/FRAM/Assessments/CurrentAssessments/Dover_sole_2021/data/survey/triennial")

len.bins = seq(8, 60, 2)
age.bins = 1:60

#catch_all = PullCatch.fn(Name = "Dover sole", SurveyName = "Triennial", SaveFile = TRUE, Dir = getwd())
#bio_all   = PullBio.fn(Name = "Dover sole", SurveyName = "Triennial", SaveFile = TRUE, Dir = getwd())

load("Catch__Triennial_2020-09-10.rda")
load("Bio_All_Triennial_2020-09-10.rda")
catch_all = Out
bio_all = Data

catch = catch_all[catch_all$Year <= 1992, ]
len   = bio_all$Lengths[bio_all$Lengths$Year <= 1992, ]

# There are no ages in the triennial data
# age   = bio_all$Ages[bio_all$Ages$Year <= 1992, ]

# Early triennial strata used in 2011 (page 57)
strata = CreateStrataDF.fn(names=c("shallow_north", "shallow_central", "shallow_south", 
                                    "mid_north", "mid_central", "mid_south"), 
                           depths.shallow = c( 55,  55,   55, 183, 183, 183),
                           depths.deep    = c(183, 183,  183, 400, 400, 400),
                           lats.south     = c(45.0, 40.5, 36.5, 45.0, 40.5, 36.5),
                           lats.north     = c(49.0, 45.0, 40.5, 49.0, 45.0, 40.5))

write.csv(strata, file = paste0(getwd(), "/triennial_early_strata.csv"))

num.strata = CheckStrata.fn(dir = getwd(), dat = catch, strat.vars = c("Depth_m","Latitude_dd"), strat.df = strata, printfolder = "forSS",  verbose = TRUE)
file.rename(file.path(getwd(), "forSS", "strata_observations.csv"), 
            file.path(getwd(), "forSS", "triennial_early_strata_observations.csv"))

# Calculate the design based index
biomass.early.tri = Biomass.fn(dir = getwd(), dat = catch,  strat.df = strata, 
                               printfolder = "forSS", outputMedian = T) 
file.rename(file.path(getwd(), "forSS", "design_based_indices.csv"), 
            file.path(getwd(), "forSS", "triennial_early_design_based_indices.csv"))

# Plot the biomass index
PlotBio.fn(dir = getwd(), dat = biomass.early.tri, main = "Triennial-Early", dopng = TRUE)
PlotBioStrata.fn(dir = getwd(), dat = biomass.early.tri, survey.name = "Triennial-Early", 
      mfrow.in = c(2,3), gap = 0.01, sameylim = TRUE, dopng = TRUE)

#============================================================================================
#Length Biological Data 
#============================================================================================

# Calculate the effN
n = GetN.fn(dir=getwd(), dat = len, type = "length", species = "flatfish", printfolder = "forSS")
file.rename(file.path(getwd(), "forSS", "length_SampleSize.csv"), 
            file.path(getwd(), "forSS", "triennial_early_length_samps.csv") )

lfs.early.tri <- SurveyLFs.fn(dir = getwd(), datL = len, datTows = catch,  
                              strat.df = strata, lgthBins = len.bins, sex = 3, 
                              sexRatioStage = 2, sexRatioUnsexed = 0.5, maxSizeUnsexed = 20, 
                              nSamps = n, month = 7, fleet = NA)

file.rename(file.path(getwd(), "forSS", "Survey_Sex3_Bins_8_60_LengthComps.csv"), 
            file.path(getwd(), "forSS", "triennial_early_Bins_8_60_LengthComps.csv") )
file.remove(file.path(getwd(), "forSS", "Survey_Sex3_Bins_-999_60_LengthComps.csv") )

PlotFreqData.fn(dir = getwd(), dat = lfs.early.tri, main = "Triennial-Early", inch = 0.10,
     ylim=c(0, max(len.bins)), yaxs="i", ylab="Length (cm)", dopng = TRUE)

#============================================================================================
#Age Biological Data  
#============================================================================================

# There are no triennial ages



#########################################################################
# 
# 	Triennial Late
#
##########################################################################

catch = catch_all[catch_all$Year > 1992, ]
len   = bio_all$Lengths[bio_all$Lengths$Year > 1992, ]

# Late triennial strata used in 2011 (page 57)
strata = CreateStrataDF.fn(names=c("shallow_north", "shallow_central", "shallow_south", 
                                    "mid_north", "mid_central", "mid_south"), 
                           depths.shallow = c( 55,  55,   55, 183, 183, 183),
                           depths.deep    = c(183, 183,  183, 500, 500, 500),
                           lats.south     = c(45.0, 40.5, 36.5, 45.0, 40.5, 36.5),
                           lats.north     = c(49.0, 45.0, 40.5, 49.0, 45.0, 40.5))
write.csv(strata, file = paste0(getwd(), "/forSS/triennial_late_strata.csv"))

# Calculate the design based index
biomass.tri.late = Biomass.fn(dir = getwd(), dat = catch,  strat.df = strata, printfolder = "forSS", outputMedian = T) 
file.rename(file.path(getwd(), "forSS", "design_based_indices.csv"), 
            file.path(getwd(), "forSS", "triennial_late_design_based_indices.csv"))

# Creates a csv file within the "printfolder" that will be saved within the directory location (dir).

# Plot the biomass index
PlotBio.fn(dir = getwd(), dat = biomass.tri.late, main = "Triennial-Late", dopng = TRUE)
PlotBioStrata.fn(dir = getwd(), dat = biomass.early.tri, survey.name = "Triennial-Late", 
      mfrow.in = c(2,3), gap = 0.01, sameylim = TRUE, dopng = TRUE)
#============================================================================================
#Length Biological Data 
#============================================================================================

# Calculate the effN
n = GetN.fn(dir=getwd(), dat = len, type = "length", species = "flatfish", printfolder = "forSS")
file.rename(file.path(getwd(), "forSS", "length_SampleSize.csv"), 
            file.path(getwd(), "forSS", "triennial_late_length_samps.csv") )

tri.late.lfs <- SurveyLFs.fn(dir = getwd(), datL = len, datTows = catch,  
                    strat.df = strata, lgthBins = len.bins, sex = 3, 
                    sexRatioStage = 2, sexRatioUnsexed = 0.5, maxSizeUnsexed = 20, 
                    nSamps = n, month = 7, fleet = NA)

file.rename(file.path(getwd(), "forSS", "Survey_Sex3_Bins_8_60_LengthComps.csv"), 
            file.path(getwd(), "forSS", "triennial_late_Bins_8_60_LengthComps.csv") )
file.remove(file.path(getwd(), "forSS", "Survey_Sex3_Bins_-999_60_LengthComps.csv") )

PlotFreqData.fn(dir = getwd(), dat = tri.late.lfs, main = "Triennial-Late", inch = 0.10,
      ylim=c(0, max(len.bins)), yaxs="i", ylab="Length (cm)", dopng = TRUE)

#============================================================================================
#Age  Biological Data 
#============================================================================================

# There are no triennial late ages



#============================================================================================
# NWFSC Slope Data
#============================================================================================

setwd("//nwcfile/FRAM/Assessments/CurrentAssessments/Dover_sole_2021/data/survey/nwfsc_slope")

#catch_all = PullCatch.fn(Name = "Dover sole", SurveyName = "NWFSC.Slope", SaveFile = TRUE, Dir = getwd())
#bio_all   = PullBio.fn(Name = "Dover sole", SurveyName = "NWFSC.Slope", SaveFile = TRUE, Dir = getwd())

load("Catch__NWFSC.Slope_2020-09-10.rda")
load("Bio_All_NWFSC.Slope_2020-09-10.rda")

catch = Out
bio = Data

strata = CreateStrataDF.fn(names=c("shallow_north", "shallow_central", "shallow_south", "mid_north", "mid_central", "mid_south", 
                                    "deep_north_central", "deep_south"), 
                           depths.shallow = c(183,  183,  183,  549,  549,  549,  900,   900),
                           depths.deep    = c(549,  549,  549,  900,  900,  900, 1280,  1280),
                           lats.south     = c(45.0, 40.5, 34.5, 45.0, 40.5, 34.5, 40.5, 34.5),
                           lats.north     = c(49.0, 45.0, 40.5, 49.0, 45.0, 40.5, 49.0, 40.5))
write.csv(strata, file = paste0(getwd(), "/forSS/nwfsc_slope_strata.csv"))


num.strata = CheckStrata.fn(dir = getwd(), dat = catch, strat.vars = c("Depth_m","Latitude_dd"), strat.df = strata, printfolder = "forSS",  verbose = TRUE)
file.rename(file.path(getwd(), "forSS", "strata_observations.csv"), 
            file.path(getwd(), "forSS", "nwfcs_slope_strata_observations.csv"))


# Calculate the design based index
biomass = Biomass.fn(dir = getwd(), dat = catch,  strat.df = strata, printfolder = "forSS", outputMedian = T) 
file.rename(file.path(getwd(), "forSS", "design_based_indices.csv"), 
            file.path(getwd(), "forSS", "nwfsc.slope_design_based_indices.csv"))

# Plot the biomass index
PlotBio.fn(dir = getwd(), dat = biomass, main = "NWFSC Slope", dopng = TRUE)
PlotBioStrata.fn(dir = getwd(), dat = biomass.early.tri, survey.name = "NWFSC Slope", 
      mfrow.in = c(2,3), gap = 0.01, sameylim = TRUE, dopng = TRUE)

#============================================================================================
#Length Biological Data 
#============================================================================================
len = bio
# Calculate the effN
n = GetN.fn(dir=getwd(), dat = len, type = "length", species = "flatfish", printfolder = "forSS")
file.rename(file.path(getwd(), "forSS", "length_SampleSize.csv"), 
            file.path(getwd(), "forSS", "nwfsc_slope_length_samps.csv") )

slope.lfs <- SurveyLFs.fn(dir = getwd(), datL = len, datTows = catch,  
                    strat.df = strata, lgthBins = len.bins, sex = 3, 
                    sexRatioStage = 2, sexRatioUnsexed = 0.5, maxSizeUnsexed = 20, 
                    nSamps = n, month = 7, fleet = NA)

file.rename(file.path(getwd(), "forSS", "Survey_Sex3_Bins_8_60_LengthComps.csv"), 
            file.path(getwd(), "forSS", "nwfsc_slope_Bins_8_60_LengthComps.csv") )
file.remove(file.path(getwd(), "forSS", "Survey_Sex3_Bins_-999_60_LengthComps.csv") )

PlotFreqData.fn(dir = getwd(), dat = slope.lfs, main = "NWFSC Slope", inch = 0.10,
      ylim=c(0, max(len.bins)), yaxs="i", ylab="Length (cm)", dopng = TRUE)


#============================================================================================
# Marginal Ages Biological Data 
#============================================================================================
age = bio

n = GetN.fn(dir = getwd(), dat = age, type = "age", species = "flatfish", printfolder = "forSS")
file.rename(file.path(getwd(), "forSS", "age_SampleSize.csv"), 
            file.path(getwd(), "forSS", "nwfsc_slope_age_samps.csv") )

# Exand and format the marginal age composition data for SS
Ages <- SurveyAFs.fn(dir = getwd(), datA = age, datTows = catch,  
                     strat.df = strata, ageBins = age.bins, 
                     sexRatioStage = 2, sexRatioUnsexed = 0.50, maxSizeUnsexed = 1, 
                     sex = 3, nSamps = n, month = 7, fleet = NA, ageErr = NA, 
                     agelow = -1, agehigh = -1)

file.rename(file.path(getwd(), "forSS", "Survey_Sex3_Bins_1_60_AgeComps.csv"), 
            file.path(getwd(), "forSS", "nwfsc_slope_Bins_1_60_AgeComps.csv") )
file.remove(file.path(getwd(), "forSS", "Survey_Sex3_Bins_-999_60_AgeComps.csv") )

PlotFreqData.fn(dir = getwd(), dat = Ages, main = "NWFSC Slope", 
      ylim=c(0, max(age.bins) + 2), yaxs="i", ylab="Age (yr)", dopng=TRUE)
file.rename(paste0(getwd(), "/plots/NWFSC Slope_Age_Frequency.png"), 
            paste0(getwd(), "/plots/NWFSC Slope_Age_Frequency_All_Ages.png"))
PlotFreqData.fn(dir = getwd(), dat = Ages, main = "NWFSC Slope", ylim=c(0, 15), 
      yaxs="i", ylab="Age (yr)", dopng=TRUE)
file.rename(paste0(getwd(), "/plots/NWFSC Slope_Age_Frequency.png"), 
            paste0(getwd(), "/plots/NWFSC Slope_Age_Frequency_Age_15.png"))

PlotVarLengthAtAge.fn(dir = getwd(), dat = age, main = "NWFSC Slope", dopng = TRUE) 
PlotSexRatio.fn(dir = getwd(), dat = age, data.type = "age", xlim = c(0, 20), dopng = TRUE, 
  main = "NWFSC Slope")

#============================================================================================
# Conditional Ages
#============================================================================================
Ages <- SurveyAgeAtLen.fn (dir = getwd(), datAL = age, datTows = catch, 
                          strat.df = strata, lgthBins = len.bins, ageBins = age.bins, 
                          partition = 0, ageErr = 2, month = 7, fleet = NA)

file.rename(file.path(getwd(), "forSS", "Survey_CAAL_Female_Bins_8_60_1_60.csv"), 
            file.path(getwd(), "forSS", "nwfsc_slope_CAAL_Females_Bins_8_60_1_60.csv") )

file.rename(file.path(getwd(), "forSS", "Survey_CAAL_Male_Bins_8_60_1_60.csv"), 
            file.path(getwd(), "forSS", "nwfsc_slope_CAAL_Males_Bins_8_60_1_60.csv") )


#============================================================================================
# AFSC Slope Data
#============================================================================================

setwd("//nwcfile/FRAM/Assessments/CurrentAssessments/Dover_sole_2021/data/survey/afsc_slope")

len.bins = seq(8, 60, 2)
age.bins = 1:60

load(file.path(getwd(), "Dover.AK.28.MAr.2010.dmp"))
load(file.path(getwd(), "AK.Surveys.Bio.Dover.17.Mar.11.dmp"))
filter.dat = Format.AKSlope.fn(datTows = Dover.AK.28.MAr.2010, 
                 datL = AK.Surveys.Bio.Dover.17.Mar.11, 
                 start.year = 1997) 

catch = filter.dat$datTows
len = filter.dat$length
age = filter.dat$age


# AFSC slope strata used in 2011 (page 56)
strata = CreateStrataDF.fn(names=c("shallow_north", "shallow_central", "shallow_south", 
                                          "mid_north", "mid_central", "mid_south", 
                                          "deep_north", "deep_south"), 
                           depths.shallow = c(183,  183,  183,  549,  549,  549,   900,  900),
                           depths.deep    = c(549,  549,  549,  900,  900,  900,  1280, 1280),
                           lats.south     = c(45.0, 40.5, 34.5, 45.0, 40.5, 34.5, 40.5, 34.5),
                           lats.north     = c(49.0, 45.0, 40.5, 49.0, 45.0, 40.5, 49.0, 40.5))

write.csv(strata, file = paste0(getwd(), "/forSS/afsc_slope_strata.csv"))

num.strata = CheckStrata.fn(dir = getwd(), dat = catch, strat.vars = c("Depth_m","Latitude_dd"), strat.df = strata, printfolder = "forSS",  verbose = TRUE)
file.rename(file.path(getwd(), "forSS", "strata_observations.csv"), 
            file.path(getwd(), "forSS", "afcs_slope_strata_observations.csv"))


# Calculate the design based index
biomass = Biomass.fn(dir = getwd(), dat = catch,  strat.df = strata, printfolder = "forSS", outputMedian = T) 
file.rename(file.path(getwd(), "forSS", "design_based_indices.csv"), 
            file.path(getwd(), "forSS", "afsc_slope_design_based_indices.csv"))

# Plot the biomass index
PlotBio.fn(dir = getwd(), dat = biomass, main = "AFSC Slope", dopng = TRUE)
PlotBioStrata.fn(dir = getwd(), dat = biomass, survey.name = "AFSC Slope", 
      mfrow.in = c(3,3), gap = 0.01, sameylim = TRUE, dopng = TRUE)

#============================================================================================
#Length Biological Data 
#============================================================================================

# Calculate the effN
n = GetN.fn(dir=getwd(), dat = len, type = "length", species = "flatfish", printfolder = "forSS")
file.rename(file.path(getwd(), "forSS", "length_SampleSize.csv"), 
            file.path(getwd(), "forSS", "afsc_slope_length_samps.csv") )

slope.lfs <- SurveyLFs.fn(dir = getwd(), datL = len, datTows = catch,  
                    strat.df = strata, lgthBins = len.bins, sex = 3, 
                    sexRatioStage = 2, sexRatioUnsexed = 0.5, maxSizeUnsexed = 20, 
                    nSamps = n, month = 7, fleet = NA)

file.rename(file.path(getwd(), "forSS", "Survey_Sex3_Bins_8_60_LengthComps.csv"), 
            file.path(getwd(), "forSS", "afsc_slope_Bins_8_60_LengthComps.csv") )
file.remove(file.path(getwd(), "forSS", "Survey_Sex3_Bins_-999_60_LengthComps.csv") )

PlotFreqData.fn(dir = getwd(), dat = slope.lfs, main = "AFSC Slope", inch = 0.10,
      ylim=c(0, max(len.bins)), yaxs="i", ylab="Length (cm)", dopng = TRUE)

#============================================================================================
# Age Data 
#============================================================================================

# The AFSC Slope age data do not appear to be a random sample from the lengths.
# This data set was omitted in the 2011 assessment as well.