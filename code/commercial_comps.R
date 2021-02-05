##################################################################################################
#
#	PacFIN Data Expansion for Dover sole 2021
# 		
#		Written by Chantel Wetzel
#
##################################################################################################

devtools::load_all("C:/Users/Chantel.Wetzel/Documents/GitHub/PacFIN.Utilities")
#devtools::load_all("C:/Users/Chantel.Wetzel/Documents/GitHub/HandyCode")

dir = "N://Assessments/CurrentAssessments/Dover_sole_2021/data"
setwd(dir)

bds_file = "PacFIN.DOVR.bds.08.Jan.2021.RData"
bds_file = "PacFIN.DOVR.bds.13.Aug.2020.RData"
load(file.path(getwd(), "commercial_comps", "pacfin", bds_file))
out = PacFIN.DOVR.bds.13.Aug.2020

# Modify the column names to the new structure
out_mod = cleanColumns(data = out)

# Investigate the AGE_METHODS and determine what type to retain
bb = which(out_mod$AGE_METHOD %in% c("B", 1))
sc = which(out_mod$AGE_METHOD %in% c(3))
uk = which(out_mod$AGE_METHOD %in% c("U"))
plot(out_mod[bb, "age1"], out_mod[bb, "FISH_LENGTH"], xlim = c(0, 60), col = 'blue')
points(out_mod[s, "age1"], out_mod[s, "FISH_LENGTH"], col = 'red')
points(out_mod[sc, "age1"], out_mod[sc, "FISH_LENGTH"], col = 'red')
points(out_mod[uk, "age1"], out_mod[uk, "FISH_LENGTH"], col = 'green')
# Both the scale and unknown are different - do not use

# There are some records in the pull that do not have a GRID but I
# don't want them thrown out or to cause issue in the expansions
#table(out_mod$GRID, exclude = FALSE)
#find = which(is.na(out_mod$GRID))
#out_mod[find, "GRID"] = "TWL"

#  Example code below from the updated PacFIN.Utilities package
Pdata <- cleanPacFIN(Pdata = out_mod,
					 keep_age_method = c("B", 1),
  					 CLEAN = TRUE, 
  					 verbose = TRUE,
  					 calc_lw = FALSE)

# Oregon Data
# SAMPLE_QUALITY == 63 or SAMPLE_TYPE == "S"
# These records either have EXP_WT/EXPANDED_SAMPLE_WEIGHT of 0 or NA
# Ali has said that these records were special samples which typically would
# be removed from the data set.

# Need to think about better way to define fleet in cleanPacFIN
# How to combine geargroups and areas

# N sample weights not available for OR or CA
#  (note these are not removed with CLEAN): 24126, 84084
#> table(Pdata$state)
#    CA     OR     WA 
# 84084 150864  56554 
# So essentially all CA samples do not have weights and a subset of OR.
# Turns out the OR samples without EXP_WT are special samples so we are ok.
# However, for the state of CA all SPECIES_WGT (SPECIES_WEIGHT_LBS ), 
# FEMALES_NUM (NUMBER_OF_MALES), and MALES_NUM (NUMBER_OF_FEMALES) are NA


# Pdata = out_mod
# keep_inpfc = c(NA, "VUS","CL","VN","COL","NC","SC","EU","CP","EK","MT")
# keep_sample_type = c("", "M")
# keep_sample_method = "R"
# keep_age_method = NULL
# keep_missing_lengths = FALSE
# keep_states = c("WA", "OR", "CA")
# area = "US"
# CLEAN = TRUE
# spp = NULL
# verbose = TRUE

# Load in sex specific growth estimates from the survey
load(file.path(dir, "biology", "growth_estimates_survey.Rdat"))
fa = as.numeric(est_growth$all_F[1])
fb = as.numeric(est_growth$all_F[2]) 
ma = as.numeric(est_growth$all_M[1])
mb = as.numeric(est_growth$all_M[2])
ua = (fa + ma) / 2
ub = (fb + mb) / 2

# Load in the catch file for expansion
catch = read.csv(file.path(dir, "catches", "forSS", "commercial_catch_by_state.csv"))
colnames(catch) = c("Year", "CA_ALL", "OR_ALL", "WA_ALL")

# Define geargroups and fleets in a better way than cleanPacFIN
Pdata$geargroup = "ALL"
Pdata$fleet[Pdata$state != "CA"] = "WA_OR"
Pdata$fleet[Pdata$state == "CA"] = "CA"

##########################################################################################
# Let do some data checking
##########################################################################################
quantile(Pdata$lengthcm, na.rm = TRUE)
find = which(Pdata$lengthcm < 10)
# These two records were in cm rather than mm to start so fix
Pdata[find,"lengthcm"] = Pdata[find,"lengthcm"] * 10

# Currently can't remove and data because the EF1_Denominator check errors out for OR
# if the number of sex samples do not match....

# Check lengths by sex
# These are just starting values - estimates will be based on sex
# k = 0.128; Linf = 47.8; L0 = 10.5; CV1 = 0.20; CV2 = 0.10
# Par = list(k, Linf, L0, CV1, CV2)
# Pdata = checkLenAge(Pdata = Pdata, Par = Par, keepAll = TRUE, Optim = TRUE)
# # See which records are outside 4*sd
# remove = which(Pdata[,'lengthcm'] > Pdata[,'Lhat_high'] | Pdata[,'lengthcm'] < Pdata[,'Lhat_low'])
# plot(Pdata[,"age"], Pdata[,"lengthcm"], type = 'pch', col = 'grey', xlim = c(0,80))
# points(Pdata[remove, "age"], Pdata[remove, "lengthcm"], pch = 16, col = 'red', lwd = 3)
# Pdata[remove, c("lengthcm", "age")] = NA
# 
# # quantile(Pdata$age, na.rm = TRUE)
# remove = which(Pdata$lengthcm > 70 | Pdata$age > 70)
# # # 4 total records being removed: 1 length 91 cm and 3 ages 71, 90, and 113
# Pdata[remove, c("lengthcm", "age")] = NA


####################################################################################################

# This calculation is currently super slow...
start = Sys.time()
test <- getExpansion_1(Pdata = Pdata,
					   fa = fa, fb = fb, ma = ma, mb = mb, ua = ua, ub = ub)
end = Sys.time()

test <- getExpansion_2(Pdata = test, 
					   Catch = catch, 
					   Units = "MT",
  					   stratification.cols = c("state", "geargroup"))

test$Final_Sample_Size <- capValues(test$Expansion_Factor_1_L * test$Expansion_Factor_2)

comps <- getComps(test[!is.na(test$lengthcm), ], 
				  Comps = "LEN")
compsSR <- doSexRatio(comps)

myLbins = c(seq(8, 60, 2))
out_name = sub(pattern = "(.*)\\..*$", replacement = "\\1", bds_file)

writeComps(inComps = compsSR, 
		   returns = "FthenM",
		   fname = file.path(dir, "commercial_comps", "forSS", paste0("Length_",out_name, ".csv")), 
		   lbins = myLbins, 
		   partition = 2, 
		   dummybins = FALSE)

# Calculate the expansion for age data
test$Final_Sample_Size = capValues(test$Expansion_Factor_1_A * test$Expansion_Factor_2)
comps <- getComps(test[!is.na(test$age), ], 
				  Comps = "Age")
compsSR <- doSexRatio(comps)

myAbins = 1:60
writeComps(inComps = compsSR, 
		   returns = "FthenM",
		   fname = file.path(dir, "commercial_comps", "forSS", paste0("Age_", out_name, ".csv")), 
		   abins = myAbins, 
		   partition = 2, 
		   dummybins = FALSE)


###############################################################################################
# Let's format the csv files for direct use in SS
#####################################################################################

out = read.csv(file.path(dir, "commercial_comps", "forSS", paste0("Length_",out_name, ".csv")), 
				skip = 3, header = TRUE)
start = which(as.character(out[,1]) %in% c(" Females then males ")) + 2
end   = nrow(out)
cut_out = out[start:end,]

# format the length comps
cut_out$fleetnum = NA
cut_out$fleetnum[cut_out$fleet =="CA"] = 1
cut_out$fleetnum[cut_out$fleet =="WA_OR"] = 2

ind = which(colnames(cut_out) %in% paste0("L",min(myLbins))):
	  which(colnames(cut_out) %in% paste0("L",max(myLbins), ".1"))
format = cbind(cut_out$fishyr, cut_out$season, cut_out$fleetnum, cut_out$sex, cut_out$partition, cut_out$Nsamps, cut_out$Ntows, cut_out[,ind])
colnames(format) = c("fishyr", "month", "fleet", "sex", "part", "Nsamps", "Ntows", colnames(cut_out[ind]))
format = format[format$fishyr != 2021, ]
write.csv(format[,!(colnames(format) %in% c("Nsamps"))], 
		  file = file.path(dir, "commercial_comps", "forSS", paste0("Lcomps_", out_name, ".csv")), 
		  row.names = FALSE)

# Let's create the sample table
temp = Pdata[!is.na(Pdata$lengthcm) & Pdata$fishyr < 2021,]
Nfish = table(temp$fishyr, temp$fleet)
colnames(Nfish) = c("CA", "WA_OR")

aa = unique(temp$fleet)
yy = sort(unique(temp$fishyr))
Ntows = matrix(0, length(yy), length(aa))
for(y in 1:length(yy)){
	for(a in 1:length(aa)){
		ind = which(temp$fishyr == yy[y] & temp$fleet  == aa[a])
		if(length(ind) > 0) {Ntows[y, a] = length(unique(temp$SAMPLE_NO[ind])) }
	}
}
colnames(Ntows) = aa
rownames(Ntows) = yy

samples = cbind(rownames(Ntows), Ntows[,"CA"] , Nfish[,"CA"], 
			    Ntows[,"WA_OR"] , Nfish[,"WA_OR"])

colnames(samples) = c("Year", "CA Ntows", "CA Nfish",
	 				  "OR/WA Ntows", "OR/WA Nfish")
write.csv(samples, 
		  file = file.path(dir, "commercial_comps", "forSS", paste0("Com_Length_Samples.csv")), 
		  row.names = FALSE)

###############################################################################################
# Format Age Samples
out = read.csv(file.path(dir, "commercial_comps", "forSS", paste0("Age_",out_name, ".csv")), 
				skip = 3, header = TRUE)
start = which(as.character(out[,1]) %in% c(" Females then males ")) + 2
end   = nrow(out)
cut_out = out[start:end,]

# format the length comps
cut_out$fleetnum = NA
cut_out$fleetnum[cut_out$fleet =="CA"] = 1
cut_out$fleetnum[cut_out$fleet =="WA_OR"] = 2

ind = which(colnames(cut_out) %in% paste0("A",min(myAbins))):
	  which(colnames(cut_out) %in% paste0("A",max(myAbins), ".1"))
format = cbind(cut_out$fishyr, cut_out$season, cut_out$fleetnum, cut_out$sex, cut_out$partition, cut_out$Nsamps, cut_out$Ntows, cut_out[,ind])
colnames(format) = c("fishyr", "month", "fleet", "sex", "part", "Nsamps", "Ntows", colnames(cut_out[ind]))
format = format[format$fishyr != 2021, ]
write.csv(format[,!(colnames(format) %in% c("Nsamps"))], 
		  file = file.path(dir, "commercial_comps", "forSS", paste0("Acomps_forSS_", out_name, ".csv")), 
		  row.names = FALSE)

# Let's create the sample table
temp = Pdata[!is.na(Pdata$age) & Pdata$fishyr < 2021,]
Nfish = table(temp$fishyr, temp$fleet)
colnames(Nfish) = c("CA", "WA_OR")

aa = unique(temp$fleet)
yy = sort(unique(temp$fishyr))
Ntows = matrix(0, length(yy), length(aa))
for(y in 1:length(yy)){
	for(a in 1:length(aa)){
		ind = which(temp$fishyr == yy[y] & temp$fleet  == aa[a])
		if(length(ind) > 0) {Ntows[y, a] = length(unique(temp$SAMPLE_NO[ind])) }
	}
}
colnames(Ntows) = aa
rownames(Ntows) = yy

samples = cbind(rownames(Ntows), Ntows[,"CA"] , Nfish[,"CA"], 
			    Ntows[,"WA_OR"] , Nfish[,"WA_OR"])

colnames(samples) = c("Year", "CA Ntows", "CA Nfish",
	 				  "OR/WA Ntows", "OR/WA Nfish")
write.csv(samples, 
		  file = file.path(dir, "commercial_comps", "forSS", paste0("Com_Age_Samples.csv")), 
		  row.names = FALSE)
