#######################################################################################################
#
# 			Dover sole 2021 Decision Table
#
#######################################################################################################

library(r4ss)

wd = "C:/Assessments/2021/dover_sole_2021/models/_decision_table/abc_25_5/3.0_base"
# Allocation percent by fleet: California and Oregon/Washington
percent = c(0.40, 0.60)

# Approach #1----------------------------------------------------------------
# This first approach finds the 12.5 and 87.5 quantiles of the SSB_2021 estimate
base_loc = "C:/Assessments/2021/dover_sole_2021/models/7.0.1_base"
base = SS_output(base_loc)
final.sb = base$derived_quants[base$derived_quants$Label == "SSB_2021", ]
vals = qnorm(c(0.125, 0.875), mean = final.sb[,2], sd = final.sb[,3])
# Now need to find R0 value associated with SB2021 = 186,336 and 277,794 mt

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
run_loc = 
run_name = 
find = which(base$derived_quants$Label == "ForeCatch_2023")

ForeCatchAll = base$derived_quants[find:(find+9), 2]
years = 2023:2032
fore.catch = NULL 
for(y in 1:10){
	for(f in 1:4){
		calc = c(years[y], 1, f, percent[f]*ForeCatchAll[y])
		fore.catch = rbind(fore.catch, calc)
	}
}
write.csv(fore.catch, file.path(wd, run_loc, paste0(run_name, ".csv"))


###################################################################################################
# Fixed catch = XXXX
####################################################################################################
run_loc = 
run_name = 

ForeCatchAll = 10000
years = 2023:2032
fore.catch = NULL 

for(y in 1:10){
	for(f in 1:4){
		calc = c(years[y], 1, f, percent[f]*ForeCatchAll)
		fore.catch = rbind(fore.catch, calc)
	}
}

write.csv(fore.catch, file.path(wd, run_loc, paste0(run_name, ".csv"))
