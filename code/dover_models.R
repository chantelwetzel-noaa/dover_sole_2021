########################################################
#
#			Dover sole 2021 Model Runs
#
########################################################

devtools::load_all("C:/Users/Chantel.Wetzel/Documents/GitHub/r4ss")
wd = "C:/Assessments/2021/dover_sole_2021/models"

model = "0.0_updated_data_model_structure"
start = SS_output(file.path(wd, model))
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
selex = SS_output(file.path(wd, model))
SS_plots(selex, plot = c(2, 9, 16) )
# NLL = 6106.68 - fit the length comps better, age comps slightly worse


model = "1.1_selex_survey"
selex = SS_output(file.path(wd, model))
SS_plots(selex, plot = c(2, 9, 16) )
# NLL = 6087.79
# Model slogs through phase 7 - male natural mortality 

# Evaluate selectivity form - female offsets
# Need to deal with params on the bound
# Reweight the model