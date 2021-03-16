########################################################
#
#			Dover sole 2021 Sensitivity Runs
#
########################################################

devtools::load_all("C:/Users/Chantel.Wetzel/Documents/GitHub/r4ss")
wd = "C:/Assessments/2021/dover_sole_2021/models"


model = "4.0.0_bio_est_m"
m = SS_output(file.path(wd, model))
# Female M = 0.102, Male M = 0.0983
# NLL = 1954.4, R0 = 11.8, Depl = 0.6107
# Sigma = 0.174 

# Sensitivity
model = "4.0.0_2011_selex"
selex = SS_output(file.path(wd, "_sensitivities", model))
# Worse fit to both the length and age
# NLL = 2020.28, R0 = 11.9, Depl = 0.66
# Female M = 0.098, Male M = 0.127
# Flip-flop in M estimates by sex compared to updated selectivity forms 
# Sigma = 0.211

####################################################################
modelnames <- c("4.0.0 Base", "2011 Selex Parameterization")
mysummary <- SSsummarize(list(m, selex))

SSplotComparisons(mysummary, 
				  filenameprefix = "4.0_selex_",
				  ylimAdj  = 1.1,
				  legendloc = 'topright', 
				  legendlabels = modelnames, 	
				  plotdir = file.path(wd, "_sensitivities", "_plots"),
				  pdf = TRUE)
####################################################################

