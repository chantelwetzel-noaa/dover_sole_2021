#######################################################################################################
#
# 			Dover sole 2021 Decision Table
#
#######################################################################################################

library(r4ss)

wd = "C:/Assessments/2021/dover_sole_2021/models/_decision_tables"
# Allocation percent by fleet: California and Oregon/Washington
percent = c(0.40, 0.60)

# Approach #1----------------------------------------------------------------
# This first approach finds the 12.5 and 87.5 quantiles of the SSB_2021 estimate
base_loc = "C:/Assessments/2021/dover_sole_2021/models/7.0.1_base"
base = SS_output(base_loc)
final.sb = base$derived_quants[base$derived_quants$Label == "SSB_2021", ]
vals = qnorm(c(0.125, 0.875), mean = final.sb[,2], sd = final.sb[,3])
# Now need to find R0 value associated with SB2021 = 186,336 and 277,794 mt
# Female Ms would be 0.0993 and 0.1144 while Male M estimated

# If you use the default category 1 sigma of 0.50 rather than the base model 
# uncertainty the low and high SB2021 values are 130,584 and 412,410 which
# corresponds to Female Ms of 0.084 and 0.126

# Let's visually look at the spread across these option
wd = "C:/Assessments/2021/dover_sole_2021/models"
model = "7.0.1_base"
base = SS_output(file.path(wd, model))
model = "7.0.1_base_decision_table_0.125"
low_17 = SS_output(file.path(wd, model))
model = "7.0.1_base_decision_table_0.875"
hi_17 = SS_output(file.path(wd, model))
model = "_decision_tables/7.0.1_base_m_decision_table_1.15_0.5_0.125"
low_50 = SS_output(file.path(wd, model))
model = "_decision_tables/7.0.1_base_m_decision_table_1.15_0.5_0.875"
hi_50 = SS_output(file.path(wd, model))

modelnames <- c("7.0.1 Base", "Low (Model Uncertainty)", "High (Model Uncertainty)",
				"Low (Cat. 1 Uncertainty)", "High (Cat. 1 Uncertainty)")
mysummary <- SSsummarize(list(base, low_17, hi_17, low_50, hi_50))
SSplotComparisons(mysummary, 
				  filenameprefix = "7.0.1_base_decision_table_options_",
				  ylimAdj  = 1.25,
				  legendloc = 'topright', 
				  legendlabels = modelnames, 
				  plotdir = file.path(wd, "_decision_tables"),
				  pdf = TRUE)

SSplotComparisons(mysummary, 
				  filenameprefix = "7.0.1_base_decision_table_options_",
				  ylimAdj  = 1.2,
				  legendloc = 'topright', 
				  legendlabels = modelnames, 
				  plotdir = file.path(wd, "_decision_tables"),
				  subplots = c(2, 4),
				  print = TRUE,
				  pdf = FALSE)

modelnames <- c("7.0.1 Base","Low (Cat. 1 Uncertainty)", "High (Cat. 1 Uncertainty)")
mysummary <- SSsummarize(list(base, low_50, hi_50))
SSplotComparisons(mysummary, 
				  filenameprefix = "7.0.1_base_decision_table_options_sigma_0.50_",
				  ylimAdj  = 1.2,
				  legendloc = 'topright', 
				  legendlabels = modelnames, 
				  plotdir = file.path(wd, "_decision_tables"),
				  subplots = c(2, 4),
				  print = TRUE,
				  pdf = FALSE)

modelnames <- c("7.0.1 Base", "Low (Model Uncertainty)", "High (Model Uncertainty)")
mysummary <- SSsummarize(list(base, low_17, hi_17))
SSplotComparisons(mysummary, 
				  filenameprefix = "7.0.1_base_decision_table_options_sigma_0.17_",
				  ylimAdj  = 1.2,
				  legendloc = 'topright', 
				  legendlabels = modelnames, 
				  plotdir = file.path(wd, "_decision_tables"),
				  subplots = c(2, 4),
				  print = TRUE,
				  pdf = FALSE)

# Approach #2----------------------------------------------------------------
# Define the low and high state based on likelihood profile for selected parameter
# where a difference of +- 0.66 NLL units defines the low and high parameter values
# based on the chi square distribution with one degree of freedom.
# For Dover sole, if using female M this may not work since there are large NLL
# changes for small changes in M values from the fixed value (not give a wide range).
# Alternatively, the M that minimizes the NLL is a fair bit lower than the fixed 
# values - how would you incorporate this into the selection of values to use. 



###################################################################################################
# ABC 25:5 P* = 0.45
####################################################################################################
run_name = "ABC"
run_loc = "C:/Assessments/2021/dover_sole_2021/models/_decision_tables"
base_name = "7.0.1_base_m"
base_loc = file.path("C:/Assessments/2021/dover_sole_2021/models", base_name)
percent = c(0.40, 0.60)

base = SS_output(file.path(base_loc))
find = which(base$derived_quants$Label == "ForeCatch_2023")

ForeCatchAll = base$derived_quants[find:(find+9), 2]
years = 2023:2032
fore.catch = NULL 

for(y in 1:10){
	for(f in 1:2){
		calc = c(years[y], 1, f, percent[f]*ForeCatchAll[y])
		fore.catch = rbind(fore.catch, calc)
	}
}
write.csv(fore.catch, file.path(run_loc, run_name, paste0(base_name, "_", run_name, ".csv")))


###################################################################################################
# 40% of the ABC 25:5 P* = 0.45
####################################################################################################
run_name = "40_percent_ABC"
run_loc = "C:/Assessments/2021/dover_sole_2021/models/_decision_tables"
base_name = "7.0.1_base"
base_loc = file.path("C:/Assessments/2021/dover_sole_2021/models", base_name)
percent = c(0.40*0.40, 0.40*0.60)

base = SS_output(file.path(base_loc))
find = which(base$derived_quants$Label == "ForeCatch_2023")

ForeCatchAll = base$derived_quants[find:(find+9), 2]
years = 2023:2032
fore.catch = NULL 

for(y in 1:10){
	for(f in 1:2){
		calc = c(years[y], 1, f, percent[f]*ForeCatchAll[y])
		fore.catch = rbind(fore.catch, calc)
	}
}
colnames(fore.catch) = c("Year", "Seas", "Fleet", "Catch or F")
rownames(fore.catch) = NULL
write.csv(fore.catch, file.path(run_loc, run_name, paste0(base_name, "_", run_name, ".csv")), row.names = FALSE)


###################################################################################################
# Fixed catch = 7,000
####################################################################################################
run_name = "7000_test"
run_loc = "C:/Assessments/2021/dover_sole_2021/models/_decision_tables"
base_name = "7.0.1_base_m"
percent = c(0.40, 0.60)

ForeCatchAll = 7000
years = 2023:2032
fore.catch = NULL 

for(y in 1:10){
	for(f in 1:2){
		calc = c(years[y], 1, f, percent[f]*ForeCatchAll)
		fore.catch = rbind(fore.catch, calc)
	}
}
colnames(fore.catch) = c("#year", "season", "fleet", "catch")
rownames(fore.catch) = NULL
write.csv(fore.catch, file.path(run_loc, run_name, paste0(run_name, "_forecatch.csv")), row.names = FALSE)

###################################################################################################
# Fixed catch = 20,000
####################################################################################################
run_name = "20000"
run_loc = "C:/Assessments/2021/dover_sole_2021/models/_decision_tables"
base_name = "7.0.1_base"
base_loc = file.path("C:/Assessments/2021/dover_sole_2021/models", base_name)

percent = c(0.40, 0.60)

ForeCatchAll = 20000
years = 2023:2032
fore.catch = NULL 

for(y in 1:10){
	for(f in 1:2){
		calc = c(years[y], 1, f, percent[f]*ForeCatchAll)
		fore.catch = rbind(fore.catch, calc)
	}
}
colnames(fore.catch) = c("Year", "Seas", "Fleet", "Catch or F")
rownames(fore.catch) = NULL
write.csv(fore.catch, file.path(run_loc, run_name, paste0(run_name, "_forecatch.csv")), row.names = FALSE)


###########################################################################
# Run the model 
###########################################################################
dt_param = c(0.084, 0.126)
dir.create(file.path(run_loc, run_name, base_name))
dir.create(file.path(run_loc, run_name, paste0(base_name, "_low")))
dir.create(file.path(run_loc, run_name, paste0(base_name, "_high")))

all_files <- list.files(base_loc)

capture.output(file.copy(from = file.path(base_loc, all_files), 
		  to = file.path(run_loc, run_name, base_name), overwrite = TRUE), 
		  file = "run_diag_warning.txt")
capture.output(file.copy(from = file.path(base_loc, all_files), 
		  to = file.path(run_loc, run_name, paste0(base_name, "_low")), overwrite = TRUE), 
		  file = "run_diag_warning.txt")
capture.output(file.copy(from = file.path(base_loc, all_files), 
		  to = file.path(run_loc, run_name, paste0(base_name, "_high")), overwrite = TRUE), 
		  file = "run_diag_warning.txt")

fore = SS_readforecast(file = file.path(run_loc, run_name, base_name, "forecast.ss"))
fore$Flimitfraction_m$Fraction = 1
fore$ForeCatch = rbind(fore$ForeCatch, fore.catch)
SS_writeforecast(mylist = fore, dir = file.path(run_loc, run_name, base_name), 
				 overwrite = TRUE)
SS_writeforecast(mylist = fore, dir = file.path(run_loc, run_name, paste0(base_name, "_low")), 
				 overwrite = TRUE)
SS_writeforecast(mylist = fore, dir = file.path(run_loc, run_name, paste0(base_name, "_high")), 
				 overwrite = TRUE)

starter <- r4ss::SS_readstarter(file.path(run_loc, run_name, base_name, 'starter.ss'))
starter$init_values_src <- 1 # run from the par file	
SS_writestarter(starter, dir = file.path(run_loc, run_name, base_name), overwrite=TRUE)	
SS_writestarter(starter, dir = file.path(run_loc, run_name, paste0(base_name, "_low")), overwrite=TRUE)	
SS_writestarter(starter, dir = file.path(run_loc, run_name, paste0(base_name, "_high")), overwrite=TRUE)	

rawpar = readLines( file.path(run_loc, run_name, base_name, "ss.par"))
which_line = grep("MGparm[1]", rawpar, fixed = TRUE) + 1
rawpar[which_line] = dt_param[1]
writeLines(rawpar, con = file.path(file.path(run_loc, run_name, paste0(base_name, "_low"), "ss.par")))
#rawpar = readLines( file.path(run_loc, run_name, base_name "ss.par"))
#which_line = grep("MGparm[1]", rawpar, fixed = TRUE) + 1
rawpar[which_line] = dt_param[2]
writeLines(rawpar, con = file.path(file.path(run_loc, run_name, paste0(base_name, "_high"), "ss.par")))

setwd(file.path(run_loc, run_name, base_name))
shell("ss -nohess -maxfun 0 > output.txt 2>&1")
setwd(file.path(run_loc, run_name, paste0(base_name, "_low")))
shell("ss -nohess -maxfun 0 > output.txt 2>&1")
setwd(file.path(run_loc, run_name, paste0(base_name, "_high")))
shell("ss -nohess -maxfun 0 > output.txt 2>&1")

################################################################################
# Grab all run results to build table
################################################################################
source("C:/Handy_Code/get_values_fn.R")

run_name = "20000"
run_loc = "C:/Assessments/2021/dover_sole_2021/models/_decision_tables"
base_name = "7.0.1_base"
base_loc = file.path("C:/Assessments/2021/dover_sole_2021/models", base_name)

years = 2021:2032
ci_value = 0.95
base = SS_output(file.path(run_loc, run_name, base_name))
low  = SS_output(file.path(run_loc, run_name, paste0(base_name, "_low")))
high = SS_output(file.path(run_loc, run_name, paste0(base_name, "_high")))

out = data.frame(
	Year = years,
	Catch = round(Get.Values(replist = base, label = "ForeCatch", yrs = years, ci_value)$dq,0),
	Low_SB = round(Get.Values(replist = low, label = "SSB", yrs = years, ci_value)$dq,0),
	Low_Depl = round(Get.Values(replist = low, label = "Bratio", yrs = years, ci_value)$dq,3),
	SB = round(Get.Values(replist = base, label = "SSB", yrs = years, ci_value)$dq,0),
	Depl = round(Get.Values(replist = base, label = "Bratio", yrs = years, ci_value)$dq,3),
	High_SB = round(Get.Values(replist = high, label = "SSB", yrs = years, ci_value)$dq,0),
	High_Depl = round(Get.Values(replist = high, label = "Bratio", yrs = years, ci_value)$dq,3)
	)
write.csv(out, file.path(run_loc, run_name, paste0(run_name, "_dt_row.csv")), row.names = FALSE)
