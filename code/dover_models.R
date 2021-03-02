########################################################
#
#			Dover sole 2021 Model Runs
#
########################################################

devtools::load_all("C:/Users/Chantel.Wetzel/Documents/GitHub/r4ss")
wd = "C:/Assessments/2021/dover_sole_2021/models"

model = "_2011_model"
mod_2011 = SS_output(file.path(wd, model))
# mod_2011$Pstar_sigma = 0.3893363

model = "2.3_bio_offsets_cleaned_files"
update = SS_output(file.path(wd, "_bridging", model))

model = "0.1.1_update_fleet_structure_new_comp_test"
compare = SS_output(file.path(wd, "_bridging", model))

model = "0.0_updated_data_model_structure"
start = SS_output(file.path(wd, model))
# Pstar_sigma = 0.34
# TOTAL 6108.91 NA
# Survey -45.4593 NA
# Discard 3327.33 NA
# Mean_body_wt -67.5177 NA
# Length_comp 1335.2 NA
# Age_comp 1583.84 NA

model = "0.1_cv_laa"
cv_laa = SS_output(file.path(wd, model))
#SS_plots(base)
#TOTAL 6099.62, Length_comp 1360.43, Age_comp 1553.99

model = "0.2_cv_age"
cv_age = SS_output(file.path(wd, model))
# Total = 6111.12

model = "0.3_sd_laa"
sd_laa = SS_output(file.path(wd, model))
# Total = 6084, Length = 1354, Age = 1544

model = "0.4_sd_age"
sd_age = SS_output(file.path(wd, model))
# Total = 6073, Length = 1341, Age = 1551

#####################################################################
modelnames <- c("0.0", "CV LAA", "CV Age", "SD LAA", "SD Age")
mysummary <- SSsummarize(list(start, cv_laa, cv_age, sd_laa, sd_age))

SSplotComparisons(mysummary, 
				  filenameprefix = "0_growth_uncertainty_",
				  legendlabels = modelnames, 	
				  plotdir = file.path(wd, "_plots"),
				  pdf = TRUE)
####################################################################

model = "1.0_selex_fishery"
selex_fishery = SS_output(file.path(wd, model))
SS_plots(selex, plot = c(2, 9, 16) )
# NLL = 6106.68 - fit the length comps better, age comps slightly worse

model = "1.1_selex_survey"
selex_survey = SS_output(file.path(wd, model))
SS_plots(selex, plot = c(2, 9))#, 16) )
# NLL = 6087.79
# Model slogs through phase 7 - male natural mortality 

model = "1.2_selex_pin_orwa_final"
selex_fix = SS_output(file.path(wd, model))
SS_plots(selex, plot = c(2,16))
SS_tune_comps(replist = dw, option = "Francis", dir = file.path(wd, model))


model = "1.3_selex_dw_mi"
dw = SS_output(file.path(wd, model))
#SS_tune_comps(replist = dw, options = "MI", dir = file.path(wd, model))
SS_plots(dw, plot = c(2, 16, 17, 18, 19))
# Pstar Sigma = 0.175 (m's estimated)


model = "1.4_selex_dw_francis"
francis = SS_output(file.path(wd, model))
SS_plots(francis, plot = c(2, 16, 17, 18, 19))

# there is really weird behavior when I try to data weight the model using
# MI or Francis.  A) the model does not end up anywhere near properly weighted,
# and B) trying to data weight result in wild mis-fits in recent data.  The
# misfits are likely linked to the change in discarding practices I think.

model = "1.5_selex_dw_none"
no_dw = SS_output(file.path(wd, model))
SS_plots(no_dw, plot = c(2, 16, 17, 18))
SS_tune_comps(replist = no_dw, option = "MI", dir = file.path(wd, model))

model = "1.6_selex_dw_dm"
dm = SS_output(file.path(wd, model))
SS_plots(dm, plot = c(2, 16, 17, 18, 19))


model = "1.8_selex_dome_m"
selex_dome = SS_output(file.path(wd, model))
SS_plots(selex)

#####################################################################
modelnames <- c("2011", "Data Update", "Fishery Selex", "Survey Selex", "OR-WA Dome (fix Ms)")
mysummary <- SSsummarize(list(mod_2011, update, selex_fishery, selex_survey,selex_dome))

SSplotComparisons(mysummary, 
				  filenameprefix = "1.0_selex_",
				  legendlabels = modelnames, 	
				  plotdir = file.path(wd, "_plots"),
				  pdf = TRUE)
####################################################################

model = "2.0_survey_time_min_n"
timing = SS_output(file.path(wd, model))
SS_plots(update)
SS_tune_comps(replist = update, option = "MI", dir = file.path(wd, model))

#####################################################################
modelnames <- c("2011", "Data Update", "Selex (fix Ms)", "Survey Timing")
mysummary <- SSsummarize(list(mod_2011, update, selex_dome, timing))

SSplotComparisons(mysummary, 
				  filenameprefix = "2.0_timing_min_n_",
				  legendlabels = modelnames, 	
				  plotdir = file.path(wd, "_plots"),
				  pdf = TRUE)
####################################################################


model = "2.1.0_dw_mi"
mi = SS_output(file.path(wd, model))
SS_plots(mi, plot = c(2, 15:19))
SS_tune_comps(replist = mi, option = "MI", dir = file.path(wd, model))
# NLL = 5074.76 Length = 783.22 Age = 1666.84, Discard = 2739.16

model = "2.1.1_dw_mi_disc_rates"
disc_t = SS_output(file.path(wd, model))
SS_plots(disc_t, plot = c(2, 15:19))
# NLL = 1892.83, Length = 496.815, Age = 1524.2, Discard = 22.58
SS_tune_comps(replist = disc_t, option = "MI", dir = file.path(wd, model))
SSMethod.TA1.8(disc_t, type='len', fleet = 1, part=1) # discards
#CA      w        lo        hi 
#0.2234719 0.1420177 0.5736319 
#OR-WA    w        lo        hi 
# 0.3913724 0.2478838 0.8346797 
SSMethod.TA1.8(disc_t, type='len', fleet = 1, part=2) # retained
#CA      w        lo        hi 
#0.6922740 0.4496556 1.2796898 
#ORWA    w        lo        hi 
#1.3308810 0.9342335 2.2067545

model = "2.1.2_dw_mi_ret_blocks"
disc_block = SS_output(file.path(wd, model))
SS_plots(disc_block)
SS_tune_comps(replist = disc_block, option = "Francis", dir = file.path(wd, model))
# NLL = 1758.75, Length = 480.4, Age = 1528, Discard = -88.576
SSMethod.TA1.8(disc_t, type='len', fleet = 1, part=1)
SSMethod.TA1.8(disc_t, type='len', fleet = 1, part=2)
# SS_plots plot 8 SPR erroring during plotting

model = "2.1.3_dw_francis_ret_blocks"
disc_block_francis = SS_output(file.path(wd, model))
SS_plots(disc_block_francis, plot = c(1:7, 9:22))

#####################################################################
modelnames <- c("2011", "Data Update","MI - Discard Block & t-dist", "Francis - Discard Block & t-dist")
mysummary <- SSsummarize(list(mod_2011, update, disc_block, disc_block_francis))

SSplotComparisons(mysummary, 
				  filenameprefix = "2.1_discard_",
				  legendlabels = modelnames, 	
				  plotdir = file.path(wd, "_plots"),
				  pdf = TRUE)
####################################################################

model = "3.0.0_data_ae_cap"
cap = SS_output(file.path(wd, model))
SS_plots(cap, plot = c(1:7, 9:22))

model = "3.0.1_data_ae_cap_cdfw"
cdfw = SS_output(file.path(wd, model))
SS_plots(cdfw, plot = c(1:7, 9:22))

model = "3.0.2_data_catch_fix"
catch = SS_output(file.path(wd, model))
SS_plots(catch, plot = c(1:7, 9:22))

model = "3.0.3_data_lengths"
len = SS_output(file.path(wd, model))
SS_plots(len, plot = c(1:7, 9:22))


model = "3.0.4_data_ages"
age = SS_output(file.path(wd, model))
SS_plots(age)
SS_tune_comps(replist = age, option = "MI", dir = file.path(wd, model))


model = "3.0.5_data_calcom"
calcom = SS_output(file.path(wd, model))
SS_tune_comps(replist = calcom, option = "MI", dir = file.path(wd, model))
model = "3.0.5_data_calcom_sub"
calcom2 = SS_output(file.path(wd, model))
SS_plots(calcom)

model = "3.0.6_data_pacfin_dw_mi"
mi = SS_output(file.path(wd, model))

#####################################################################
modelnames <- c("2011", "Data Update", 
				"AE", "Catch Fix", "PacFIN Lengths", 
				"PacFIN Ages", "MI")
mysummary <- SSsummarize(list(mod_2011, update,  cdfw, catch, 
						len, age,  mi))

SSplotComparisons(mysummary, 
				  filenameprefix = "3.0_data_",
				  legendloc = c(0.05, 0.95), 
				  legendlabels = modelnames, 	
				  plotdir = file.path(wd, "_plots"),
				  pdf = TRUE)

modelnames <- c("PacFIN Comps", "Calcom Comps", "Calcom Similar Years")
mysummary <- SSsummarize(list(age, calcom, calcom2))

SSplotComparisons(mysummary, 
				  filenameprefix = "3.0_pacfin_calcom_updated_",
				  legendloc = 'topright', #c(0.05, 0.95), 
				  legendlabels = modelnames, 	
				  plotdir = file.path(wd, "_plots"),
				  pdf = TRUE)

####################################################################
 
model = "3.0.7_data_calcom_pacfin_mi"
dw = SS_output(file.path(wd, model))
SS_plots(dw, sexes = 1:2)
# NLL = 1751.74

model = "3.1.0_selex_slope_surveys"
slope = SS_output(file.path(wd, model))
SS_plots(slope, plot = c(2, 16), sexes = 1:2)
# NLL = 1820.95
# Need sex-specific selex to fit each sex. 
# Turned off forecast devs (phase 7)

model = "3.1.1_selex_slope_sex_specific"
sex_slope = SS_output(file.path(wd, model))
SS_plots(sex_slope, plot = c(2, 16), sexes = 1:2)
# Sex specific selex with females forced to by asymptotic.
# NLL = 1768.95

# Still missing the male peak of the afsc slope
model = "3.1.2_selex_slope_male_offset_with_tri"
male_slope_tri = SS_output(file.path(wd, model))
SS_plots(male_slope, plot = c(2, 16), sexes = 1:2)
# NLL = 1767.2 - only afsc slope
# Allow both slope and tri to have males offset
# NLL = 1764 - the improvement comes from the triennial
# afsc slope females - males offset, nwfsc slope males - females

model = "3.1.3_selex_slope_male_offset"
male_slope = SS_output(file.path(wd, model))
SS_plots(male_slope, plot = c(2, 16), sexes = 1:2)
# NLL = 1755

# Try a single selex curve for the triennial and allow wcgbt to be domed
model = "3.1.4_selex_wcgbt"
wcgbt = SS_output(file.path(wd, model))
SS_plots(wcgbt, sexes = 1:2)
# NLL = 1653.84

model = "3.1.5_selex_ca"
selex = SS_output(file.path(wd, model))
SS_plots(selex, sexes = 1:2)
# NLL = 1653.84

####################################################################

modelnames <- c("Start Model DW", "Slope Selex", "Tri Selex", "WCGBT Selex", "CA Selex")
mysummary <- SSsummarize(list(dw, sex_slope, male_slope, wcgbt, selex))

SSplotComparisons(mysummary, 
				  filenameprefix = "3.1_selex_",
				  ylimAdj  = 1.1,
				  legendloc = 'topright', #c(0.05, 0.95), 
				  legendlabels = modelnames, 	
				  plotdir = file.path(wd, "_plots"),
				  pdf = TRUE)

####################################################################

# Data remove 1991 ages - add corrected input samples size for ca ages
model = "3.2.0_selex_data_dw"
hess = SS_output(file.path(wd, model))
SS_plots(hess)
#SS_tune_comps(replist = data, option = "MI", dir = file.path(wd, model))
# NLL = 1900.84
# hess$Pstar_sigma = 0.1065432 with M's fixed

model = "3.2.1_selex_data_est_m"
m = SS_output(file.path(wd, model))
# m$Pstar_sigma = 0.183 with M's estimated
# Female M = 0.104, Male M = 0.101 (males estimated as offsets)


# early or-wa selectivity - add female peak offset to the block
model = "3.2.2_selex_early_wa"
wa = SS_output(file.path(wd, model))
SS_plots(wa, plot = c(2, 16))
# NLL = 1903.3
# Had to move the starting parameter for the male early peak to get a better visual fit
# Added female peak offsets to the block and did get distint offset diff by block


