##########################################################################
#
#    https://github.com/nwfsc-assess/nwfscSurvey
#   devtools::install_github("nwfsc-assess/nwfscSurvey")
#    Code use to create the 2019 survey comps in the 
#    2019 petrale sole update assessment
#
#           Written by: Chantel Wetzel
#              February 4, 2019
#
#########################################################################

devtools::install_github("nwfsc-assess/nwfscSurvey")
devtools::load_all("C:/Users/Chantel.Wetzel/Documents/GitHub/nwfscSurvey")
library(nwfscSurvey)


#########################################################################
# 
#  NWFSC Combo Survey
#
##########################################################################
setwd("C:/Assessments/2019/petrale_2019/Data/NWFSC_Combo")

# Define the bin structure for age and length data
len.bins = seq(12, 62, 2)
age.bins = 1:17

# Pull the catch and biological data
catch = PullCatch.fn(Name = "petrale sole", SurveyName = "NWFSC.Combo", SaveFile = TRUE, Dir = getwd())

bio   = PullBio.fn(Name = "petrale sole", SurveyName = "NWFSC.Combo",  SaveFile = TRUE, Dir = getwd())

# Mimic the 2013 and 2015 stratification
strata = CreateStrataDF.fn(names=c("shallow_van", "shallow_col", "shallow_eur", "shallow_mon", "shallow_con", 
                           "mid_van", "mid_col", "mid_eur", "mid_mon", "mid_con", "deep_van_col_eur", "deep_mon", "deep_con"), 
                           depths.shallow = c( 55,   55,   55,   55,   55,    100,  100,  100,  100,  100,  183,  183, 183),
                           depths.deep    = c(100,  100,  100,   100,  100,   183,  183,  183,  183,  183,  549,  549, 549),
                           lats.south     = c(47.5,  43, 40.5,  36.0,  34.5, 47.5, 43.0, 40.5, 36.0, 34.5, 40.5, 36.0,  32),
                           lats.north     = c(49,  47.5, 43.0,  40.5,  36.0, 49.0, 47.5, 43.0, 40.5, 36.0,   49, 40.5,  36))
write.csv(strata, file = paste0(getwd(), "/nwfcs_strata.csv"))
write.csv(strata, file = "C:/Users/Chantel.Wetzel/Documents/GitHub/Petrale_2019/txt_files/nwfsc_strata.csv")

num.strata = CheckStrata.fn(dir = getwd(), dat = catch, strat.vars = c("Depth_m","Latitude_dd"), strat.df = strata, printfolder = "forSS",  verbose = TRUE)

# Calculate the design based index
biomass.nwfsc = Biomass.fn(dir = getwd(), dat = catch,  strat.df = strata, printfolder = "forSS", outputMedian = T) 

# Creates a csv file within the "printfolder" that will be saved within the directory location (dir).

# Plot the biomass index
PlotBio.fn(dir = getwd(), dat = biomass.nwfsc, main = "NWFSC Groundfish Bottom Trawl Survey", dopng = TRUE)
PlotBioStrata.fn(dir = getwd(), dat = biomass.nwfsc, main = "NWFSC Groundfish Bottom Trawl Survey", mfrow.in = c(3,5), gap = 0.01, sameylim = TRUE, ylim = c(0, 22), dopng = TRUE)

#============================================================================================
#Length Biological Data 
#============================================================================================
len = bio


# Calculate the effN
n = GetN.fn(dir=getwd(), dat = len, type = "length", species = "flatfish", printfolder = "forSS")

# The 2015 update calculated input N as:
# Nsamp <- round((0.138*(Nfish/Ntow) +1)*Ntow, 0)
# I am unsure where this comes from. The widow 2015 assessment has a calculation using 0.138 but does not match above.
out = read.csv("C:/Assessments/2019/petrale_2019/Data/NWFSC_Combo/forSS/length_SampleSize.csv", header = TRUE)
n = round((0.138*(out$All_Fish / out$Tows) +1)*out$Tows, 0)
out[,"Sample_Size"] = n
write.csv(out, file = "C:/Assessments/2019/petrale_2019/Data/NWFSC_Combo/forSS/nwfsc_combo_length_sample_size.csv", row.names = FALSE)


# The 2015 update set the sexRatioUnsexed = 0.60 which would assign 60% of the unsexed fish to females.
# This seems opposite of what should be done given that 40% of the data are females.
# This should not matter because there are only 81 unsexed fish across all years.

# Expand and format length composition data for SS
LFs <- SurveyLFs.fn(dir = getwd(), datL = len, datTows = catch,  
                    strat.df = strata, lgthBins = len.bins, gender = 3, 
                    sexRatioStage = 2, sexRatioUnsexed = 0.5, maxSizeUnsexed=35, 
                    nSamps = n, fleet = 7)

PlotFreqData.fn(dir = getwd(), dat = LFs, ylim=c(0, max(len.bins) + 4), main = "NWFSC Groundfish Bottom Trawl Survey", 
      yaxs="i", ylab="Length (cm)", dopng = TRUE)
PlotSexRatio.fn(dir = getwd(), dat = len, data.type = "length", dopng = TRUE, main = "NWFSC Groundfish Bottom Trawl Survey")


#============================================================================================
# Marginal Ages Biological Data 
#============================================================================================
age = bio

n = GetN.fn(dir = getwd(), dat = age, type = "age", species = "flatfish", printfolder = "forSS")

# The 2015 update calculated input N as:
# Nsamp <- round((0.138*(Nfish/Ntow) +1)*Ntow, 0)
# I am unsure where this comes from. The widow 2015 assessment has a calculation using 0.138 but does not match above.
out = read.csv("C:/Assessments/2019/petrale_2019/Data/NWFSC_Combo/forSS/age_SampleSize.csv", header = TRUE)
n = round((0.138*(out$All_Fish / out$Tows) +1)*out$Tows, 0)
out[,"Sample_Size"] = n
write.csv(out, file = "C:/Assessments/2019/petrale_2019/Data/NWFSC_Combo/forSS/nwfsc_combo_age_sample_size.csv", row.names = FALSE)

# Exand and format the marginal age composition data for SS
Ages <- SurveyAFs.fn(dir = getwd(), datA = age, datTows = catch,  
                     strat.df = strata, ageBins = age.bins, 
                     sexRatioStage = 2, sexRatioUnsexed = 0.50, maxSizeUnsexed = 1, 
                     gender = 3, nSamps = n, month = 7, fleet = 7, ageErr = 2, agelow = -1, agehigh = -1)



PlotFreqData.fn(dir = getwd(), dat = Ages, main = "NWFSC Groundfish Bottom Trawl Survey", ylim=c(0, max(age.bins) + 2), yaxs="i", ylab="Age (yr)", dopng=TRUE)
PlotVarLengthAtAge.fn(dir = getwd(), dat = age, main = "NWFSC Groundfish Bottom Trawl Survey", dopng = TRUE) 
PlotSexRatio.fn(dir = getwd(), dat = age, data.type = "age", xlim = c(0, 20), dopng = TRUE, main = "NWFSC Groundfish Bottom Trawl Survey")

#============================================================================================
# Conditional Ages
#============================================================================================
Ages <- SurveyAgeAtLen.fn (dir = getwd(), datAL = age, datTows = catch, 
                          strat.df = strata, lgthBins = len.bins, ageBins = age.bins, 
                          partition = 0, ageErr = 2, month = 7, fleet = 7)




######################################################################################################################
######################################################################################################################

#########################################################################
# 
# 	Triennial Early
#
##########################################################################

#---The 2015 update did not re-process the Triennial data-------

setwd("C:/Assessments/2019/petrale_2019/Data/Triennial/early")

catch = PullCatch.fn(Name = "petrale sole", SurveyName = "Triennial", YearRange = c(1980, 1992))

bio   = PullBio.fn(Name = "petrale sole", SurveyName = "Triennial", YearRange = c(1980, 1992))

strata = CreateStrataDF.fn(names=c("shallow_van_con", "shallow_eur", "shallow_mon_con", "deep_van_col_eur", "deep_mon_con"), 
                           depths.shallow = c( 55,  55,   55, 100,   100),
                           depths.deep    = c(100, 100,  100, 400,   400),
                           lats.south     = c(43, 40.5, 32.0, 40.5, 32.0),
                           lats.north     = c(49, 43.0, 40.5, 49.0, 40.5))
write.csv(strata, file = paste0(getwd(), "/tri_early_strata.csv"))
write.csv(strata, file = "C:/Users/Chantel.Wetzel/Documents/GitHub/Petrale_2019/txt_files/tri_early_strata.csv", row.names = FALSE)
strata


# Calculate the design based index
biomass.early.tri = Biomass.fn(dir = getwd(), dat = catch,  strat.df = strata, printfolder = "forSS", outputMedian = T) 

# Creates a csv file within the "printfolder" that will be saved within the directory location (dir).

# Plot the biomass index
PlotBio.fn(dir = getwd(), dat = biomass.early.tri, main = "Triennial Early", dopng = TRUE)

#============================================================================================
#Length Biological Data 
#============================================================================================
len = bio$Lengths

# Calculate the effN
n = GetN.fn(dir=getwd(), dat = len, type = "length", species = "flatfish", printfolder = "forSS")
# The 2015 assessment calculated sample sizes based on the equation below for the shelf-slope survey
# but the triennial survey sample sizes were not calculated this way (can't find code and does not match).
# The triennial ns match closest to the bootstrap method detailed in the GetN.fn. To be consistent, going 
# to calculated ns based on the shelf-slope equation applied in 2015.

out = read.csv("C:/Assessments/2019/petrale_2019/Data/Triennial/early/forSS/length_SampleSize.csv", header = TRUE)
n = round((0.138*(out$All_Fish / out$Tows) +1)*out$Tows, 0)
out[,"Sample_Size"] = n
write.csv(out, file = "C:/Assessments/2019/petrale_2019/Data/Triennial/early/forSS/triennial_early_length_sample_size.csv", row.names = FALSE)

LFs <- SurveyLFs.fn(dir = getwd(), datL = len, datTows = catch,  
                    strat.df = strata, lgthBins = len.bins, gender = 3, 
                    sexRatioStage = 2, sexRatioUnsexed = 0.5, maxSizeUnsexed=35, 
                    nSamps = n, fleet = 5)


PlotFreqData.fn(dir = getwd(), dat = LFs, main = "Triennial Early", ylim=c(0, max(len.bins) + 4), yaxs="i", ylab="Length (cm)", dopng = TRUE)

#============================================================================================
#Age Biological Data  
#============================================================================================

# There are no triennial early ages





#########################################################################
# 
# 	Triennial Late
#
##########################################################################
setwd("C:/Assessments/2019/petrale_2019/Data/Triennial/late")
catch = PullCatch.fn(Name = "petrale sole", SurveyName = "Triennial", YearRange = c(1995, 2004))

bio   = PullBio.fn(Name = "petrale sole", SurveyName = "Triennial", YearRange = c(1995, 2004))

strata = CreateStrataDF.fn(names=c("shallow_van_col", "shallow_eur", "shallow_mon_con", "deep_van_col", "deep_eur", "deep_mon", "deep_con"), 
                           depths.shallow = c( 55,   55,   55,  100, 100,   100, 100),
                           depths.deep    = c(100,  100,  100,  500, 500,   500, 500),
                           lats.south     = c(43,  40.5, 32.0,  43, 40.5, 36.0, 32.0),
                           lats.north     = c(49,  43.0, 40.5,  49, 43.0, 40.5, 36.0 ))
write.csv(strata, file = paste0(getwd(), "/forSS/tri_late_strata.csv"))
write.csv(strata, file = "C:/Users/Chantel.Wetzel/Documents/GitHub/Petrale_2019/txt_files/tri_late_strata.csv")

# Calculate the design based index
biomass.tri.late = Biomass.fn(dir = getwd(), dat = catch,  strat.df = strata, printfolder = "forSS", outputMedian = T) 

# Creates a csv file within the "printfolder" that will be saved within the directory location (dir).

# Plot the biomass index
PlotBio.fn(dir = getwd(), dat = biomass.tri.late, main = "Triennial Late", dopng = TRUE)

#============================================================================================
#Length Biological Data 
#============================================================================================

len = bio$Lengths

# Calculate the effN
n = GetN.fn(dir=getwd(), dat = len, type = "length", species = "flatfish", printfolder = "forSS")
out = read.csv("C:/Assessments/2019/petrale_2019/Data/Triennial/late/forSS/length_SampleSize.csv", header = TRUE)
n = round((0.138*(out$All_Fish / out$Tows) +1)*out$Tows, 0)
out[,"Sample_Size"] = n
write.csv(out, file = "C:/Assessments/2019/petrale_2019/Data/Triennial/late/forSS/triennial_late_length_sample_size.csv", row.names = FALSE)


LFs <- SurveyLFs.fn(dir = getwd(), datL = len, datTows = catch,  
                    strat.df = strata, lgthBins = len.bins, gender = 3, 
                    sexRatioStage = 2, sexRatioUnsexed = 0.5, maxSizeUnsexed=35, 
                    nSamps = n, fleet = 6)

PlotFreqData.fn(dir = getwd(), dat = LFs, main = "Triennial Late", ylim=c(0, max(len.bins) + 4), yaxs="i", ylab="Length (cm)", dopng = TRUE)

#============================================================================================
#Age  Biological Data 
#============================================================================================

# There are no triennial late ages

