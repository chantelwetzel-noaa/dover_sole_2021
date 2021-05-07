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

# corret the input samples sizes for calcom
model = '3.2.3_selex_early_wa_calcom_inputN'
input_n = SS_output(file.path(wd, model))
SS_plots(input_n)

model = '3.2.4_selex_data_new_maturity'
maturity = SS_output(file.path(wd, model))
SS_plots(maturity, plot = c(1:4))

####################################################################
modelnames <- c("Old Maturity", "New Maturity")
mysummary <- SSsummarize(list(input_n, maturity))

SSplotComparisons(mysummary, 
				  filenameprefix = "3.2_data_maturity_",
				  ylimAdj  = 1.1,
				  legendloc = 'topright', #c(0.05, 0.95), 
				  legendlabels = modelnames, 	
				  plotdir = file.path(wd, "_plots"),
				  pdf = TRUE)

####################################################################

model = '3.2.5_dw_mi'
mi = SS_output(file.path(wd, model))
SS_tune_comps(replist = mi, option = "Francis", dir = file.path(wd, model))

model = '3.2.6_dw_francis'
francis = SS_output(file.path(wd, model))

model = '3.2.7_dw_dm'
dm = SS_output(file.path(wd, model))

# Attempting to a work-around to avoid DM hitting the upper bound for 
# some fleets. After upweighting by a factor of 3, OR/WA and the AFSC slope
# catches are still hitting the upper bounds
model = "3.2.8_dw_dm _low_weight"
dm_low = SS_output(file.path(wd, model))

####################################################################
modelnames <- c("Maturity", "MI", "Francis", "DM", "DM v. 2")
mysummary <- SSsummarize(list(maturity, mi, francis, dm, dm_low))

SSplotComparisons(mysummary, 
				  filenameprefix = "3.2_data_weighting_",
				  ylimAdj  = 1.1,
				  legendloc = 'topright', #c(0.05, 0.95), 
				  legendlabels = modelnames, 	
				  plotdir = file.path(wd, "_plots"),
				  pdf = TRUE)

####################################################################
# 3.2.5 DW MI
# NLL = 1956, R0 = 12.03, Depl = 0.69

# Estimate natural mortilty for each sex (working from model 3.2.5_dw_mi)
model = "4.0.0_bio_est_m"
m = SS_output(file.path(wd, model))
# Female M = 0.102, Male M = 0.0983
# NLL = 1954.4, R0 = 11.8, Depl = 0.6107
# Sigma = 0.174 
# AFSC Slope peak selex for females hitting bound
# Remove offset biological parameters to evaluate the change
model = "4.0.0_2011_selex"
old_selex = SS_output(file.path(wd, "_sensitivities", model))
pngfun(wd = file.path(wd, "_sensitivities", "_plots"), '4.0.0_2011selex_unavailable_biomass.png', w = 10, h = 7)
SSunavailableSpawningOutput(old_selex, plot=TRUE)
dev.off()

model = "4.0.1_bio_rm_offset" # also estimating M
m_no_offset = SS_output(file.path(wd, model))
# Also high phase estimation akin to 2011 model
# Female M = 0.10, Male M = 0.098
# NLL = 1955.12, R0 = 11.8, Depl = 0.603
# Sigma = 0.17

# Explore Lorenzen M estimation based on 2011 STAR Panel
# age at break point set to a50 ~ 10 years for females
model = "4.0.2_bio_lorenzen_m" # using offsets
lorenzen = SS_output(file.path(wd, model))
SS_plots(lorenzen)
# NLL = 1949, R0 = 13.0, Depl = 0.604
# Female older M = 0.118, Male older M = 0.124
# The majority of the NLL change is coming from ages
# Better fit to WCGBT CAAL but worse fit to OR/WA ages

# 4.02.1_bio_lorenzen_m_age11
# NLL = 1949.18, R0 = 13.0, depl = 0.604
# Female older M = 0.114, Male older M = 0.120

model = "4.0.3_bio_breakpoint_m" # using offsets
age_m = SS_output(file.path(wd, model))
SS_plots(age_m)
# NLL = 1944.96, R0 = 12.15, Depl = 0.63 
# NLL improvement in lengths and ages
# Female M10 = 0.124, M30 = 0.087
# Male M10 = 0.116, M30 = 0.104

####################################################################
modelnames <- c("MI (M fixed)", "Est. M (offsets)", "Est. M", 
				"Lorenzen M", "Breakpoint M (10 & 30)")
mysummary <- SSsummarize(list(mi, m, m_no_offset, lorenzen, age_m))

SSplotComparisons(mysummary, 
				  filenameprefix = "4.0_bio_m_",
				  ylimAdj  = 1.1,
				  legendloc = 'topright', 
				  legendlabels = modelnames, 	
				  plotdir = file.path(wd, "_plots"),
				  pdf = TRUE)

# Adding additional flexibility in M estimation does result in a slight
# improvement in NLL but not sure how beneficial it is since the answer
# ends up being the same (trade-off between N parameters)

####################################################################

# Just realized the M prior I have been using corresponds to a max age = 60
# Update to be based on max = 60 (in contrast 2011 based it on 70 using older methods)
model = "4.0.4_bio_update_m_prior"
m_prior = SS_output(file.path(wd, model))
SS_plots(m_prior)
# NLL = 1954.44, R0 = 11.8

# Try to estimate males as the offset similar to the slope surveys
model = "4.0.5_bio_selex_wcgbt"
wcgbt = SS_output(file.path(wd, model))
# NLL = 2018.72 vs. 1954.44 above
# WCGBT Len NLL = 324.864, Age NLL = 970.983

# Working from 4.0.4
# Add block for early and late tri for just male params firt
model = "4.1.0_selex_block_tri"
tri_selex = SS_output(file.path(wd, model))
SS_plots(tri_selex, plot = c(2, 16))
# NLL = 1944.8, tri len NLL = 50.64
# R0 = 11.8, depl = 0.64

# Add the ability to estimate female offsets in blocks as well
model = "4.1.1_selex_block_tri_w_offset"
tri_selex2 = SS_output(file.path(wd, model))
SS_plots(tri_selex2, plot = c(2, 16))
# NLL = 1945, tri len NLL = 50.4, R0 = 11.8

# Change CA & OR/WA selex blocks from: 1910 - 1980, 1981 - 1995, 1996 - 
# to: 1910 - 1984, 1985 - 1995, 1996 - 
# based on visual investigation of length observations
model = "4.1.2_selex_com_blocks"
com_block = SS_output(file.path(wd, model))
SS_plots(com_block)
# NLL = 1929.1, CA Lengths = 317, OR/WA Lengths = 216
# Discard = -82 (CA = -6, OR/WA = -76)
# R0 = 11.6, Depl = 0.56
# Most of the likelihood improvement is coming from CA com lengths

# Explore adding ascending time block to try to get the visual fit to improve
model = "4.1.3_selex_com_blocks_asc"
com_block = SS_output(file.path(wd, model))
SS_plots(com_block, plot = c(2, 16))
# NLL = 1923, CA Lengths = 313, OR/WA Lengths = 214
# R0 = 11.7

# $parameters_with_highest_gradients
#                                           Value     Gradient
# Size_DblN_peak_OR_WA(2)_BLK1repl_1985 35.496400  0.000269775
# SzSel_Fem_Peak_OR_WA(2)                5.119660 -0.000219988
# SR_LN(R0)                             11.678900 -0.000197606
# L_at_Amax_Mal_GP_1                    -0.126628 -0.000129694
# SzSel_Fem_Peak_OR_WA(2)_BLK1repl_1985  4.871800  0.000101783

model = "4.1.4_selex_com_block_rm"
rm_block = SS_output(file.path(wd, model))
SS_plots(rm_block)
# NLL = 1957, Discard = -69.9 (CA = -5.6, OR/WA = -63.3)
# CA Length = 330.6, OR/WA = 233
# R0 = 11.6, depl = 56%

# Added back selex block and add asc to block
# Use simplified retention blocks 
model = "4.1.5_selex_block_rm_ret"
rm_block2 = SS_output(file.path(wd, model))
SS_plots(rm_block2)
# NLL = 1938, Discard = -68 (CA = -5.9, OR/WA = -62)
# CA Length = 314, OR/WA Length = 215

# Move around retention blocks
model = "4.1.6_selex_com_blocks_ca_or_ret"
selex = SS_output(file.path(wd, model))
SS_plots(selex)
# NLL = 1960, Discard = -57 (CA = -6, OR/WA = -51.6)
# CA Length = 317, OR/WA Length = 220

# After exploration moving back to model "4.1.2_selex_com_blocks"
# but with minor simplification of the CA retention and change in 
# block year for 2002 vs. 2004
model = "4.1.7_selex_ret_ca"
ret = SS_output(file.path(wd, model))
SS_plots(ret)
# NLL = 1935, Discard = -74 (CA = -6, OR/WA = -68)
# Length CA = 319, Length Or/WA = 219
# R0 = 11.6
####################################################################

base2011 = SS_output(file.path(wd, "_2011_model"))
mi = SS_output(file.path(wd, "_bridging", "1.9.0_dw_mi"))
selex = SS_output(file.path(wd, "1.3_selex_dw_mi"))
model = '3.2.4_selex_data_new_maturity'
maturity = SS_output(file.path(wd, model))

modelnames <- c("2011", "2020 Data", "Update Selectivity", "Maturity",
				"Commercial Selex", "Retention")
mysummary <- SSsummarize(list(base2011, mi, selex, maturity, com_block, ret))

SSplotComparisons(mysummary, 
				  filenameprefix = "4.1_comparison_",
				  ylimAdj  = 1.1,
				  legendloc = 'topright', 
				  legendlabels = modelnames, 	
				  plotdir = file.path(wd, "_plots"),
				  pdf = TRUE)

####################################################################
model = '5.0.0_rec_adj_start'
hess = SS_output(file.path(wd, model))
SS_plots(hess)
SS_tune_comps(replist = hess, option = "Francis", dir = file.path(wd, model))

model = '5.1.0_dw_mi'
mi = SS_output(file.path(wd, model))
SS_plots(mi)

model = '5.1.1_dw_francis'
francis = SS_output(file.path(wd, model))
SS_plots(francis)

model = '5.1.2_dw_dm_1'
dm1 = SS_output(file.path(wd, model))
SS_plots(dm1)

model = '5.1.3_dw_dm_2'
dm2 = SS_output(file.path(wd, model))
SS_plots(dm2)

# OR/WA retained lengths weighted low vs. discard lengths high for MI
# Update the Herman and Harry Discard Length Input Sample Size
model = '5.1.4_dw_mi_orwa_disc'
mi_disc = SS_output(file.path(wd, model))
SS_tune_comps(replist = mi_disc, option = "MI", dir = file.path(wd, model))
SS_plots(mi_disc)

model = '5.1.5_dw_mi_rm_hh'
rm_hh = SS_output(file.path(wd, model))
SS_plots(rm_hh, plot = 16)
SS_tune_comps(replist = rm_hh, option = "MI", dir = file.path(wd, model))

model = '5.1.6_dw_dm_inputN_disc_edits'
dm_inputN = SS_output(file.path(wd, model))

model = '5.1.7_dw_dm2_inputN_disc_edits'
dm2_inputN = SS_output(file.path(wd, model))

####################################################################

modelnames <- c("5.1 MI", "5.1 Francis", "5.1 DM-Linear", "5.1 DM-Saturation", 
				"5.1 DM - Linear (Input N = Total Fish)",
				"5.1 DM - Saturation (Input N = Total Fish)")
mysummary <- SSsummarize(list(mi, francis, dm1, dm2, dm_inputN, dm2_inputN))

SSplotComparisons(mysummary, 
				  filenameprefix = "5.1_dw_",
				  ylimAdj  = 1.1,
				  legendloc = 'topright', 
				  legendlabels = modelnames, 	
				  plotdir = file.path(wd, "_plots"),
				  pdf = TRUE)

####################################################################

model = '5.2.1_selex_tri_female_offset'
tri = SS_output(file.path(wd, model))
SS_plots(tri, plot = c(2, 16))
# NLL = 1952 (5.1.4_dw_mi_orwa_disc NLL = 1933, tri length = 57)
# NLL = 1948
# NLL = 1961
# Tri Len = 70.37

model = '5.2.2_selex_all_2011'
all = SS_output(file.path(wd, model))
SS_plots(all)

# Revert to the 2011 survey select parameterization for comparison
model = '5.2.2_selex_survey_2011'
selex_2011 = SS_output(file.path(wd, model))
SS_plots(selex_2011)
# Qs:
# R0 = 11.5
# NLL = 1969
# Length_like  36.8 (AFSC)  66.7 (TRI)  41.5 (NWFSC)  335.9 (WCGBT)


# Examining the weird behavior of the R0 profile relative to survey length/age data
# It looks like it may be due to at least the afsc slope (if not both slopes) based
# on comparison of 5.2.3_selex_survey_2011_update_wcgbt_profile_SR_LN(R0) vs.
# 5.2.4_selex_survey_2011_update_afslope_profile_SR_LN(R0) where the afsc slope
# model moved from the 2011 parameterization to the new.  The new one forces females
# to be asymptotic.  Alternatively, it could be that the spline shape vs. double
# normal is the driver behind this behavior.
#-----------------------------------------------------------------------
# 5.1.4_dw_mi_orwa_disc: double normal - female = 1.0 slopes
# Length_like: 742.046  329.26 231.233 63.5965 57.3836 70.4098 305.615
# Age_like: 1411.02  434.557 454.069 0 0 74.6594 929.378
# Total NLL = 1933
#-----------------------------------------------------------------------
# 2011 Parameterization for both fishery and surveys
# Length_like: 796.44  345.1 342.652 35.6478 65.5825 40.5167 331.076
# Age_like: 1459.76  440.565 487.148 0 0 73.3794 959.209
# Total NLL = 2038
#-----------------------------------------------------------------------
# 2011 Parameterization for surveys
# Length_like: 759.872  341.194 258.349 36.7859 66.652 41.4903 335.917
# Age_like: 1427.12  440.442 454.842 0 0 73.8575 942.55
# Total NLL = 1969
#-----------------------------------------------------------------------
# 5.2.5_  Males as offset slopes but females not forced to asymptote
# for the slopes or wcgbt
# Length_like: 744.41  328.415 238.826 64.1346 57.2838 67.7033 305.52
# Total NLL = 1938
#-----------------------------------------------------------------------
# 5.2.6 Slope surveys as splines 
# Length_like: 712.239  330.282 240.325 40.4243 56.9722 43.4743 307.802
# Age_like: 1412.71  439.383 465.648 0 0 74.4373 922.979
# Total NLL = 1907
#-----------------------------------------------------------------------
# 5.2.8 Slopes Spline & WCGBT Actually Asym Females
# Length_like: 755.547  343.316 236.269 40.9088 56.6596 44.9586 345.707
# Age_like: 1449.36  453.333 447.73 0 0 76.8918 960.38
# Total NLL = 1989
#-----------------------------------------------------------------------
# OR/WA retained lengths weighted low vs. discard lengths high for MI
# Update the Herman and Harry Discard Length Input Sample Size
model = '5.1.4_dw_mi_orwa_disc'
base = SS_output(file.path(wd, model))
# sigma = 0.154

model = '5.2.2_selex_all_2011'
all_2011 = SS_output(file.path(wd, model))
# sigma = 0.178

model = '5.2.2_selex_survey_2011'
survey_2011 = SS_output(file.path(wd, model))
# sigma = 0.161

model = '5.2.6_selex_slope_splines'
spline = SS_output(file.path(wd, model))

model = "5.2.8_selex_splines_wcgbt_asym"
asym = SS_output(file.path(wd, model))
# sigma = 0.120

####################################################################

modelnames <- c("2021 Base: Slopes Asym", 
				"2011 Selectivity Parameterization", 
				"2011 Survey Parameterization", 
				"2021 Slopes as Splines (none asym.)",
				"2021 Slopes as Splines & WCGBT Asym.")
mysummary <- SSsummarize(list(base, all_2011, survey_2011,
				spline, asym))

SSplotComparisons(mysummary, 
				  filenameprefix = "5.2_selex_",
				  ylimAdj  = 1.25,
				  legendloc = 'topright', 
				  legendlabels = modelnames, 	
				  plotdir = file.path(wd, "_plots"),
				  pdf = TRUE)

####################################################################

# Fix male L1
# Fix AFSC Slope Peak
# Change M prior back to 0.108 based on max age of 50
$likelihoods_used
                                    values lambdas
TOTAL                1931.8499999999999091      NA
Survey                -52.1903999999999968      NA
Discard               -74.2947999999999951      NA
Mean_body_wt          -80.8833999999999946      NA
Length_comp           741.9289999999999736      NA
Age_comp             1409.3099999999999454      NA
Recruitment           -12.1567000000000007       1

$likelihoods_by_fleet
              Label          ALL           CA        OR_WA AFSC_Slope Triennial NWFSC_Slope NWFSC_WCGBT
176      Catch_like  1.24060e-12  3.21974e-13  9.18621e-13    0.00000    0.0000      0.0000       0.000
180       Surv_like -5.21904e+01  0.00000e+00  0.00000e+00   -5.63488   -3.8118     -9.0568     -33.687
184       Disc_like -7.42948e+01 -5.88987e+00 -6.84050e+01    0.00000    0.0000      0.0000       0.000
188       mnwt_like -8.08834e+01 -3.46701e+01 -4.62133e+01    0.00000    0.0000      0.0000       0.000
192     Length_like  7.41929e+02  3.28716e+02  2.31696e+02   63.60410   57.2815     70.3852     305.645
196        Age_like  1.40931e+03  4.33561e+02  4.52612e+02    0.00000    0.0000     74.6713     928.885

$parameters_with_highest_gradients
                                          Value     Gradient
SzSel_Fem_Peak_OR_WA(2)_BLK1repl_1910  7.409750 -0.007663470
Size_DblN_peak_OR_WA(2)_BLK1repl_1910 43.084500 -0.002850600
SR_LN(R0)                             11.513900 -0.002145660
L_at_Amax_Mal_GP_1                    -0.123009 -0.001205610
Size_DblN_peak_OR_WA(2)               36.513600 -0.000749814

# 5.3.0 Try to clean up selectivity if possible. Fix the afsc slope peak paremter
model = "5.3.0_selex"
base = SS_output(file.path(wd, model))
# NLL = 1940, R0 = 11.5, Qs high, Ms = 0.0925 (males = 0.0881)
# Length_like: 753.022  328.35 254.209 63.6125 57.3004 70.4323 305.613

model = "5.3.0_selex_data_slope_caal - Copy"
caal = SS_output(file.path(wd, model))
SS_plots(caal)
SS_tune_comps(replist = caal, option = "MI", dir = file.path(wd, model))
# NLL = 2035 (Copy folder) vs. NLL = 1986.9 
# Length_like: 755.342  329.158 255.75 64.1202 57.4945 70.5882 305.979
# Age_like: 1456.72  434.667 456.647 0 0 171.564 925.279

####################################################################
modelnames <- c("NWFSC Slope Marginals", "NWFSC CAAL")
mysummary <- SSsummarize(list(base, caal))
SSplotComparisons(mysummary, 
				  filenameprefix = "5.3_data_",
				  ylimAdj  = 1.1,
				  legendloc = 'topright', 
				  legendlabels = modelnames, 	
				  plotdir = file.path(wd, "_plots"),
				  pdf = TRUE)
####################################################################

# Reduce OR/WA Discard input N to try to correct weighting
model = "5.3.1_selex_data_orwa_disc_inputN - Copy"
disc = SS_output(file.path(wd, model))
SS_plots(disc, plot = c(2, 16, 17, 18))
SS_tune_comps(replist = disc, option = "MI", dir = file.path(wd, model))
# NLL = 2167.56
# Length_like: 815.177  329.769 192.553 150.901 58.3792 66.9462 311.262
# Age_like: 1572.32  435.389 465.284 0 0 378.837 932.57
# Natural mortality low ~ 0.08
# Old using control.ss file
# NLL = 1960.6
# Length_like: 731.101  329.617 206.631 64.0511 57.4277 70.4983 306.248

# Turn off m estimates due to downward creeping values
# Reset the or/wa discard input N back to full values
# Pin some parameters at estimates due to gradient issues (or/wa female early peaks)
# Change end rec dev year and move early devs to an earlier phase
model = "5.3.2_selex_clean_up"
selex = SS_output(file.path(wd, model))
SS_tune_comps(replist = selex, option = "MI", dir = file.path(wd, model))
SS_plots(selex)
# NLL = 1765
# Pinning M increases R0 to ~12.0, Slope Qs < 1.0 WCGBT = 1.39
# Length_like: 732.543  328.124 226.045 69.3574 63.5284 68.8072 288.17
# Age_like: 1254.9  430.342 459.472 0 0 378.385 620.8

# Allow AFSC Slope to estimate females as the offset
model = "5.3.3_selex_afslope"
aslope = SS_output(file.path(wd, model))
SS_plots(aslope, plot = c(2, 16))
# NLL = 1713
# Length_like: 685.78  331.225 228.191 15.4606 63.9392 71.9852 290.679
# Age_like: 1244.83  433.36 458.762 0 0 371.719 612.914

model = "5.4.0_data_nwslope"
nw_index = SS_output(file.path(wd, model))
SS_plots(nw_index)

model = "5.4.1_data_afslope"
af_index = SS_output(file.path(wd, model))
SS_plots(af_index)
# NLL = 1765
# Length_like: 732.537  328.106 226.047 69.3472 63.5329 68.798 288.182
# Age_like: 1254.91  430.32 459.494 0 0 378.391 620.808
# Qs: AFSC Slope = 0.67, NWFSC Slope = 0.85, WCGBT = 1.4
#              vs. 5.3.2 selex clean up 
# Qs: AFSC Slope = 0.85, NWFSC Slope = 0.69, WCGBT = 1.4

####################################################################
modelnames <- c("Base (fixed M)", "Update NWFSC Slope Index", "Update AFSC Slope Index")
mysummary <- SSsummarize(list(selex, nw_index, af_index))
SSplotComparisons(mysummary, 
				  filenameprefix = "5.4_data_",
				  ylimAdj  = 1.1,
				  legendloc = 'topright', 
				  legendlabels = modelnames, 	
				  plotdir = file.path(wd, "_plots"),
				  pdf = TRUE)
####################################################################

model = "5.5.0_data_log_sd"
log_sd = SS_output(file.path(wd, model))
SS_plots(log_sd, plot = 1)
# NLL = 1757
# Improves fit to the length data but fits slightly worse to age data
# R0 = 12.0

model = "5.5.1_data_cv_a"
cv_a = SS_output(file.path(wd, model))
SS_plots(cv_a, plot = 1)
# NLL = 1771.5 - slighty better fit to the lengths but worse to the age data

model = "5.5.2_data_sd_a"
sd_a = SS_output(file.path(wd, model))
# NLL 3087 - worse fit to everything!

model = "5.5.3_data_sd_laa"
sd_laa = SS_output(file.path(wd, model))
SS_plots(sd_laa, plot = 1)
# NLL = 1780 - worse fit to both lengths and ages!


####################################################################
modelnames <- c("Base - cv(laa)", "log_sd(A)", "cv(a)", "sd(a)", "sd(laa)")
mysummary <- SSsummarize(list(af_slope, log_sd, cv_a, sd_a, sd_laa))
SSplotComparisons(mysummary, 
				  filenameprefix = "5.5_data_cv_sd_",
				  ylimAdj  = 1.1,
				  legendloc = 'topright', 
				  legendlabels = modelnames, 	
				  plotdir = file.path(wd, "_plots"),
				  pdf = TRUE)
####################################################################

model = "5.6.0_data_larval_period"
larval = SS_output(file.path(wd, model))
SS_plots(larval, plot = 1:5)
# NLL = 1761.8

model = "5.6.1_data_larval_period_1.5"
larval_v2 = SS_output(file.path(wd, model))
SS_plots(larval_v2, plot = 1:5)
# NLL = 1757

####################################################################
modelnames <- c("Base", "Laval Period = 1 yr", "Larval Period = 1.5 yr")
mysummary <- SSsummarize(list(af_index, larval, larval_v2))
SSplotComparisons(mysummary, 
				  filenameprefix = "5.6_data_larval_",
				  ylimAdj  = 1.1,
				  legendloc = 'topright', 
				  legendlabels = modelnames, 	
				  plotdir = file.path(wd, "_plots"),
				  pdf = TRUE)
####################################################################

model = "5.7.0_dw_mi"
mi = SS_output(file.path(wd, model))
SS_tune_comps(replist = mi, option = "MI", dir = file.path(wd, model))
SS_plots(mi)

model = "5.7.1_dw_francis"
francis = SS_output(file.path(wd, model))
SS_tune_comps(replist = francis, option = "Francis", dir = file.path(wd, model))
SS_plots(francis)
# NL = 1145

####################################################################
modelnames <- c("5.7.0 MI", "5.7.1 Francis")
mysummary <- SSsummarize(list(mi, francis))
SSplotComparisons(mysummary, 
				  filenameprefix = "5.7_dw_",
				  ylimAdj  = 1.1,
				  legendloc = 'topright', 
				  legendlabels = modelnames, 	
				  plotdir = file.path(wd, "_plots"),
				  pdf = TRUE)
####################################################################

model = "5.8.0_selex_afsc_slope"
afsc = SS_output(file.path(wd, model))
SS_plots(afsc, plot = c(2, 16))
# afsc slope using a spline 
# NLL = 1041

####################################################################
modelnames <- c("Base - AFSC Slope Asym.", "AFSC Slope Spline")
mysummary <- SSsummarize(list(francis, afsc))
SSplotComparisons(mysummary, 
				  filenameprefix = "5.8_data_selex_",
				  ylimAdj  = 1.1,
				  legendloc = 'topright', 
				  legendlabels = modelnames, 	
				  plotdir = file.path(wd, "_plots"),
				  pdf = TRUE)
####################################################################

# 1) add pre-model devs, 2) reduce pop len bin, 3) rec bias adj and
# 4) update data weighting
model = "5.8.1_minor_adj"
minor = SS_output(file.path(wd, model))
SS_plots(minor, plot = c(2, 16))
SS_tune_comps(replist = minor, option = "Francis", dir = file.path(wd, model))
# NLL = 973.8

modelnames <- c("AFSC Slope Spline", "Minor Adj.")
mysummary <- SSsummarize(list(afsc, minor))
SSplotComparisons(mysummary, 
				  #filenameprefix = "5.8_data_selex_",
				  ylimAdj  = 1.1,
				  legendloc = 'topright', 
				  legendlabels = modelnames, 	
				  #plotdir = file.path(wd, "_plots"),
				  print = FALSE,
				  pdf = FALSE)


model = "5.8.2_data_lambda_nwfsc_slope"
lambda = SS_output(file.path(wd, model))
SS_plots(lambda)
SS_tune_comps(replist = lambda, option = "Francis", dir = file.path(wd, model))

modelnames <- c("AFSC Slope Spline", "Minor Adj.", "Lambda")
mysummary <- SSsummarize(list(afsc, minor, lambda))
SSplotComparisons(mysummary, 
				  #filenameprefix = "5.8_data_selex_",
				  ylimAdj  = 1.1,
				  legendloc = 'topright', 
				  legendlabels = modelnames, 	
				  #plotdir = file.path(wd, "_plots"),
				  print = FALSE,
				  pdf = FALSE)

# The early retention block for or/wa did not have any length data to 
# inform it since I removed that Hermann & Harry lengths
# This run removes the early block and only applies 2 blocks
# 1910 - 2001 (pikitch lengths) 2002 - 2010 (WCGOP) 
model = "5.8.3_data_orwa_ret_block"
ret = SS_output(file.path(wd, model))
SS_plots(ret)
# NLL = 1033.61, R0 = 12.14
# Disc_like: -71.2769  -5.8105 -65.4665 0 0 0 0
# Length_like: 350.546  153.174 176.587 31.4346 24.3489 21.5751 108.306
#

model = "5.8.4_data_hermann_harry_data"
hh_dat = SS_output(file.path(wd, model))

modelnames <- c("5.8.3 No Early Disc Lengths", "5.8.4 w/ HH Discard Lengths")
mysummary <- SSsummarize(list(ret, hh_dat))
SSplotComparisons(mysummary, 
				  filenameprefix = "5.8.3_orwa_disc_lengths_",
				  ylimAdj  = 1.1,
				  legendloc = 'topright', 
				  legendlabels = modelnames, 	
				  plotdir = file.path(wd, "_plots"),
				  pdf = TRUE)

model = "5.9.0_selex_nwfsc_slope"
nwslope = SS_output(file.path(wd, model))
SS_plots(nwslope, plot = c(2, 16:20))
# NLL = 1018.2
# Length_like: 339.151  155.54 170.402 29.4033 24.6534 13.2897 108.833

model = "5.9.1_selex_spline_adj_peak"
adj_peak = SS_output(file.path(wd, model))
SS_plots(adj_peak, plot = c(2, 16))
# NLL = 1018.7
# Length_like: 333.479  155.671 167.05 25.5374 24.6742 13.3339 108.573
# better fit to length but slightly worse fit to discards and ages

# Removing super-year 
# NLL = 1019.18

# Now with the disc length/block fixed - try estimating early selex 
# offset for female for OR/WA
# Also added forecast catch and tv-buffers
model = "5.9.3_selex_clean_up"
selex = SS_output(file.path(wd, model))
SS_plots(selex)
# NLL = 1013.5
# Both of the slope spline has a female flat high selex at the large sizes

# Reduce the spline knots from 5 to 4
model = "5.9.4_selex_spline_rm_knot"
knot = SS_output(file.path(wd, model))
SS_plots(knot, plot = c(2, 16))
# NLL = 1015

# Try only 3 knots for each spline
model = "5.9.5_selex_spline_knot_3"
knot3 = SS_output(file.path(wd, model))
SS_plots(knot3, plot = c(2, 16))
# NLL = 1025

model = "5.9.6_selex_spline_fem_offset"
offset = SS_output(file.path(wd, model))
SS_plots(offset, plot = c(2, 16))
# NLL = 1016.5

model = "5.9.7_selex_"
selex = SS_output(file.path(wd, model))
SS_plots(selex)
# NLL = 1015.23
# Surv_like: -49.8651  0 0 -6.32421 -3.53247 -7.95552 -32.0529
# Disc_like: -71.8564  -5.82537 -66.031 0 0 0 0
# mnwt_like: -81.1762  -35.0972 -46.079 0 0 0 0
# Length_like: 337.663  157.085 171.948 26.2034 24.9036 13.1391 108.9
# Age_like: 896.363  104.389 154.276 0 0 71.205 695.825

model = "5.9.8_selex_spline_auto"
auto = SS_output(file.path(wd, model))
SS_plots(auto)
# NLL = 1015.23
# Surv_like: -49.8651  0 0 -6.32422 -3.53248 -7.95553 -32.0529
# Disc_like: -71.8564  -5.82538 -66.0311 0 0 0 0
# mnwt_like: -81.1762  -35.0972 -46.079 0 0 0 0
# Length_like: 337.663  157.085 171.947 26.2035 24.9036 13.1391 108.9
# Age_like: 896.363  104.389 154.276 0 0 71.2051 695.826

model = "5.9.9_selex_pin_slope_wcgbt_params"
wcgbt = SS_output(file.path(wd, model))

##########################################################################
modelnames <- c("Only AFSC Spline", "Both Slopes as Splines",
				 "Adj Spline Knots","Spline 4 Knots")
mysummary <- SSsummarize(list(ret, nwslope,adj_peak,selex))
SSplotComparisons(mysummary, 
				  filenameprefix = "5.9_splines_",
				  ylimAdj  = 1.1,
				  legendloc = 'topright', 
				  legendlabels = modelnames, 	
				  plotdir = file.path(wd, "_plots"),
				  pdf = TRUE)

#########################################################################

model = "6.0.0_data_caal_afsc_slope"
caal = SS_output(file.path(wd, model))
SS_plots(caal, plot = 16:20)

SS_tune_comps(replist = caal, option = "Francis", dir = file.path(wd, model))

##########################################################################
modelnames <- c("Base 5.9.9", "AFSC Slope CAAL Data")
mysummary <- SSsummarize(list(wcgbt, caal))
SSplotComparisons(mysummary, 
				  filenameprefix = "6.0_caal_data_",
				  ylimAdj  = 1.1,
				  legendloc = 'topright', 
				  legendlabels = modelnames, 	
				  plotdir = file.path(wd, "_plots"),
				  pdf = TRUE)

#########################################################################

model = "6.2.0_selex_mirror_com_fleets"
mirror = SS_output(file.path(wd, model))
SS_plots(mirror)
SS_tune_comps(replist = mirror, option = "Francis", dir = file.path(wd, model))
# I had to pin the 2003-2010 OR/WA discard parameters to keep them from shooting
# up discards in this run.
# I reweighted the model so can't compare NLL.
# However, the visual fits to the OR/WA fleet length data is fairly bad, especially
# for males. 

##########################################################################
modelnames <- c("Base 5.9.9", "Mirror Fishery Selex")
mysummary <- SSsummarize(list(wcgbt, mirror))
SSplotComparisons(mysummary, 
				  filenameprefix = "6.2_selex_mirror_",
				  ylimAdj  = 1.1,
				  legendloc = 'topright', 
				  legendlabels = modelnames, 	
				  plotdir = file.path(wd, "_plots"),
				  pdf = TRUE)
###############################################################################

model = "6.3.0_data_humboldt_disc_rate"
disc = SS_output(file.path(wd, model))
SS_plots(disc)

##########################################################################
modelnames <- c("Base 5.9.9", "Update Humboldt Discard Rate")
mysummary <- SSsummarize(list(wcgbt, disc))
SSplotComparisons(mysummary, 
				  filenameprefix = "6.3_data_humboldt_",
				  ylimAdj  = 1.1,
				  legendloc = 'topright', 
				  legendlabels = modelnames, 	
				  plotdir = file.path(wd, "_plots"),
				  pdf = TRUE)
###############################################################################

# Change to B0-S2 run which has a better AIC but a higher change in uncertainty
model = "6.3.2_data_age_error_b0_s2"
cap = SS_output(file.path(wd, model))
SS_plots(cap)

model = "6.3.3_data_age_error_b0_s2_cdfw_b1_s2"
cdfw = SS_output(file.path(wd, model))
SS_plots(cdfw)

##########################################################################
modelnames <- c("6.3.0", "CAP B0 S2", "CDFW B1 S2")
mysummary <- SSsummarize(list(disc, cap, cdfw))
SSplotComparisons(mysummary, 
				  filenameprefix = "6.3_data_age_error_",
				  ylimAdj  = 1.1,
				  legendloc = 'topright', 
				  legendlabels = modelnames, 	
				  plotdir = file.path(wd, "_plots"),
				  pdf = TRUE)
###############################################################################

model = "6.3.0_data_humboldt_disc_rate"
disc = SS_output(file.path(wd, model))
# > disc$Pstar_sigma
# [1] 0.1213638

model = "6.3.4_data_bio_no_offsets_est_m"
offset_estm = SS_output(file.path(wd, model))
# > offset_estm$Pstar_sigma
# [1] 0.1813876

model = "6.3.5_data_bio_no_offsets"
offset = SS_output(file.path(wd, model))
# > offset$Pstar_sigma
# [1] 0.1212076

##########################################################################
modelnames <- c("6.3.0", "Offset Est M", "Offset")
mysummary <- SSsummarize(list(disc, offset_estm, offset))
SSplotComparisons(mysummary, 
				  filenameprefix = "6.3_data_offset_",
				  ylimAdj  = 1.1,
				  legendloc = 'topright', 
				  legendlabels = modelnames, 	
				  plotdir = file.path(wd, "_plots"),
				  pdf = TRUE)
##########################################################################
model = "6.3.7_data_est_male_m"
est_male_m = SS_output(file.path(wd, model))

model = "7.0.0_base"
base = SS_output(file.path(wd, model))
SS_plots(base)

model = "7.0.0_base"
base_jitter = SS_output(file.path(wd, model))
SS_plots(base_jitter)
SS_tune_comps(replist = base_jitter, option = "Francis", dir = file.path(wd, model))


##########################################################################
modelnames <- c("7.0.0 Base", "7.0.1 Estimate Male M")
mysummary <- SSsummarize(list(base_jitter, new_base))
SSplotComparisons(mysummary, 
				  filenameprefix = "7.0.1_base_",
				  ylimAdj  = 1.1,
				  legendloc = 'topright', 
				  legendlabels = modelnames, 	
				  plotdir = file.path(wd, "_plots"),
				  pdf = TRUE)


model = "7.0.1_base"
new_base = SS_output(file.path(wd, model))
SS_plots(new_base)
SS_tune_comps(replist = new_base, option = "Francis", dir = file.path(wd, model))


########################################################################################
model = "7.0.1_base"
base = SS_output(file.path(wd, model))
model = "_sensitivities/7.0.1_base_wcgbt_marginals_est_bio"
est = SS_output(file.path(wd, model))
model = "_sensitivities/7.0.1_base_wcgbt_marginals_fix_bio"
fix = SS_output(file.path(wd, model))
SS_tune_comps(replist = est, option = "Francis", dir = file.path(wd, model))


modelnames <- c("7.0.1 Base", "WCGBT Marginal Ages (Est. Bio.)", "WCGBT Marginal Ages (Fix Bio.)")
mysummary <- SSsummarize(list(base, est, fix))
SSplotComparisons(mysummary, 
				  filenameprefix = "7.0.1_base_wcgbt_marginal_",
				  ylimAdj  = 1.1,
				  legendloc = 'topright', 
				  legendlabels = modelnames, 	
				  plotdir = file.path(wd, "_plots"),
				  pdf = TRUE)

########################################################################################
model = "7.0.1_base"
base = SS_output(file.path(wd, model))
model = "_sensitivities/7.0.1_base_2011_wcgbt_selex"
wcgbt_selex = SS_output(file.path(wd, model))
model = "_sensitivities/7.0.1_base_2011_survey_select"
survey_selex = SS_output(file.path(wd, model))

modelnames <- c("7.0.1 Base", "2011 WCGBTS (DogLeg)", "2011 Survey Selectivity")
mysummary <- SSsummarize(list(base, wcgbt_selex, survey_selex))
SSplotComparisons(mysummary, 
				  filenameprefix = "7.0.1_base_survey_selex_",
				  ylimAdj  = 1.1,
				  legendloc = 'topright', 
				  legendlabels = modelnames, 	
				  plotdir = file.path(wd, "_plots"),
				  pdf = TRUE)

###########################################################################################
model = "7.0.0_base"
fixed_m = SS_output(file.path(wd, model))
model = "7.0.1_base"
base = SS_output(file.path(wd, model))
model = "_sensitivities/7.0.1_base_no_bio_offsets_est_m"
no_offset_est_m = SS_output(file.path(wd, model))
model = "_sensitivities/7.0.1_base_est_m"
est_m = SS_output(file.path(wd, model))
model = "_sensitivities/7.0.1_base_no_bio_offsets"
no_offset = SS_output(file.path(wd, model))

modelnames <- c("7.0.1 Base", "Fix M = 0.108 (both)", "Fix M (f), Est. M (m), No Offsets", 
				"Est. M (both), Offsets", "Est. M (both), No Offsets")
mysummary <- SSsummarize(list(base, fixed_m, no_offset, est_m, no_offset_est_m))
SSplotComparisons(mysummary, 
				  filenameprefix = "7.0.1_base_offset_m_",
				  ylimAdj  = 1.25,
				  legendloc = 'topright', 
				  legendlabels = modelnames, 	
				  plotdir = file.path(wd, "_sensitivities/_plots"),
				   subplot = c(2,4), 
                  print = TRUE, 
                  pdf = FALSE)

##############################################################################################
model = "7.0.1_base"
base = SS_output(file.path(wd, model))
model = "_sensitivities/7.0.1_base_tri_full_split"
tri = SS_output(file.path(wd, model))
model = "_sensitivities/7.0.1_base_tri_rm_2004"
tri_2004 = SS_output(file.path(wd, model))
model = "_sensitivities/7.0.1_base_tri_late_tweedie"
tri_tweedie = SS_output(file.path(wd, model))

modelnames <- c("7.0.1 Base", "Full Triennial Split", "Trienial -2004", "Triennial Late Tweedie")
mysummary <- SSsummarize(list(base, tri, tri_2004, tri_tweedie))
SSplotComparisons(mysummary, 
				  filenameprefix = "7.0.1_base_triennial_",
				  ylimAdj  = 1.1,
				  legendloc = 'topright', 
				  legendlabels = modelnames, 
				  subplot = 1:8, 	
				  plotdir = file.path(wd, "_plots"),
				  pdf = TRUE)

##############################################################################################
modelnames <- c("7.0.1 Base", "2011 Survey Selectivity")
mysummary <- SSsummarize(list(base, selex))
SSplotComparisons(mysummary, 
				  filenameprefix = "7.0.1_base_2011_survey_selex_",
				  ylimAdj  = 1.1,
				  legendloc = 'topright', 
				  legendlabels = modelnames,  	
				  plotdir = file.path(wd, "_plots"),
				  pdf = TRUE)

##############################################################################################
model = "7.0.1_base"
base = SS_output(file.path(wd, model))
model = "7.0.1_base_decision_table_0.125"
low = SS_output(file.path(wd, model))
model = "7.0.1_base_decision_table_0.875"
hi = SS_output(file.path(wd, model))

modelnames <- c("7.0.1 Base", "Low State of Nature", "High State of Nature")
mysummary <- SSsummarize(list(base, low, hi))
SSplotComparisons(mysummary, 
				  filenameprefix = "7.0.1_base_decision_table_test_",
				  ylimAdj  = 1.1,
				  legendloc = 'topright', 
				  legendlabels = modelnames, 
				  plotdir = file.path(wd, "_plots"),
				  pdf = TRUE)

##############################################################################################
model = "7.0.1_base"
base = SS_output(file.path(wd, model))
model = "_sensitivities/7.0.1_base_discard_se"
discard_se = SS_output(file.path(wd, model))
model = "_sensitivities/7.0.1_base_discard_se_0.05"
discard_se_5 = SS_output(file.path(wd, model))
model = "_sensitivities/7.0.1_base_discard_hh_lengths"
hh = SS_output(file.path(wd, model))

modelnames <- c("7.0.1 Base", "Added Discard Variance = 0.10", 
				"Added Discard Variance = 0.05", "Hermann & Harry Discard Block")
mysummary <- SSsummarize(list(base, discard_se, discard_se_5, hh))
SSplotComparisons(mysummary, 
				  filenameprefix = "7.0.1_base_discard_",
				  ylimAdj  = 1.1,
				  legendloc = 'topright', 
				  legendlabels = modelnames, 
				  plotdir = file.path(wd, "_plots"),
				  pdf = TRUE)

#############################################################################################

model = "_sensitivities/7.0.1_base_2011_survey_select_no_offset"
selex_no_offset = SS_output(file.path(wd, model))

model = "_sensitivities/7.0.1_base_no_bio_offsets_est_m"
base_no_offsets_est_m = SS_output(file.path(wd, model))


model = "_sensitivities/7.0.1_base_wcgbt_asym"
asym = SS_output(file.path(wd, model))


##############################################################################################
model = "7.0.1_base"
base = SS_output(file.path(wd, model))
model = "_bridging/3.0_final_2021_data"
full_data_bridge = SS_output(file.path(wd, model))
SS_tune_comps(replist = full_data_bridge, option = "Francis", dir = file.path(wd, model))
model = "_bridging/3.0_final_2021_data_retro_10"
bridge_retro = SS_output(file.path(wd, model))
model = "_bridging/3.0_final_2021_data_dw"
full_data_bridge_dw = SS_output(file.path(wd, model))


modelnames <- c("7.0.1 Base", "Final Data Bridge", 
				"Final Data Bridge w/ DW", "Final Data Bridge Retro -10")
mysummary <- SSsummarize(list(base, full_data_bridge, full_data_bridge_dw, bridge_retro))
SSplotComparisons(mysummary, 
				  filenameprefix = "7.0.1_data_bridge_",
				  ylimAdj  = 1.1,
				  endyrvec = c(2021, 2021, 2021, 2011),
				  legendloc = 'topright', 
				  legendlabels = modelnames, 
				  plotdir = file.path(wd, "_plots"),
				  pdf = TRUE)

##############################################################################################
model = "7.0.1_base"
base = SS_output(file.path(wd, model))

model = "_sensitivities/7.0.1_base_tri_late_tweedie"
tri = SS_output(file.path(wd, model))

modelnames <- c("7.0.1 Base", "Triennial Late - Tweedie")
mysummary <- SSsummarize(list(base, tri))
SSplotComparisons(mysummary, 
				  filenameprefix = "7.0.1_triennial_tweedie_",
				  ylimAdj  = 1.1,
				  legendloc = 'topright', 
				  legendlabels = modelnames, 
				  plotdir = file.path(wd, "_plots"),
				  pdf = TRUE)

##############################################################################################
model = "7.0.1_base"
base = SS_output(file.path(wd, model))
model = "_sensitivities/7.0.1_base_wcgbt_selex_males"
wcgbt_males = SS_output(file.path(wd, model))
SS_plots(wcgbt_males, plot = 2)

modelnames <- c("7.0.1 Base", "WCGBTS Males Asymptotic Selex")
mysummary <- SSsummarize(list(base, wcgbt_males))
SSplotComparisons(mysummary, 
				  filenameprefix = "7.0.1_base_wcgbt_",
				  ylimAdj  = 1.1,
				  legendloc = 'topright', 
				  legendlabels = modelnames, 
				  plotdir = file.path(wd, "_plots"),
				  pdf = TRUE)
