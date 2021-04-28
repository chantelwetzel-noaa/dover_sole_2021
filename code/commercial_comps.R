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
bds_file = "PacFIN.DOVR.bds.12.Feb.2021.RData"
load(file.path(getwd(), "commercial_comps", "pacfin", bds_file))
out = bds.pacfin #PacFIN.DOVR.bds.13.Aug.2020
bds_file = "PacFIN.DOVR.bds.12.Feb.2021_check"

# Example code below from the updated PacFIN.Utilities package
Pdata <- cleanPacFIN(Pdata = out,
					 keep_age_method = c("B", "BB", 1),
  					 CLEAN = TRUE, 
  					 verbose = TRUE)

# N SAMPLE_TYPEs changed from M to S for special samples from OR: 0
# N not in keep_sample_type (SAMPLE_TYPE): 57790
# N not in keep_sample_method (SAMPLE_METHOD): 24
# N with SAMPLE_NO of NA: 0
# N without length: 1605
# N without age: 202318
# N without length and age: 202350
# N records: 292378
# N remaining if CLEAN: 227326
# N records will be removed if CLEAN: 65052
# The following are not removed with CLEAN ...
# N sample weights not available for OR: 0
# N sample weights not available for CA: 84959

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

# Check lengths by sex
# These are just starting values - estimates will be based on sex
k = 0.128; Linf = 47.8; L0 = 10.5; CV1 = 0.20; CV2 = 0.10
Par = list(k, Linf, L0, CV1, CV2)
Pdata = checkLenAge(Pdata = Pdata, Par = Par, keepAll = TRUE, Optim = TRUE)
# # See which records are outside 4*sd
remove = which(Pdata[,'lengthcm'] > Pdata[,'Lhat_high'] | Pdata[,'lengthcm'] < Pdata[,'Lhat_low'])
#plot(Pdata[,"age"], Pdata[,"lengthcm"], type = 'pch', col = 'grey', xlim = c(0,80))
#points(Pdata[remove, "age"], Pdata[remove, "lengthcm"], pch = 16, col = 'red', lwd = 3)
Pdata[remove, c("lengthcm", "age")] = NA
 
quantile(Pdata$age, na.rm = TRUE)
remove = which(Pdata$lengthcm > 70 | Pdata$age > 70)
# # # 4 total records being removed: 1 length 91 cm and 3 ages 71, 90, and 113
Pdata[remove, c("lengthcm", "age")] = NA

####################################################################################################

Pdata_exp <- getExpansion_1(Pdata = Pdata,
					   fa = fa, fb = fb, ma = ma, mb = mb, ua = ua, ub = ub)

Pdata_exp <- getExpansion_2(Pdata = Pdata_exp, 
					   Catch = catch, 
					   Units = "MT",
  					   stratification.cols = c("state", "geargroup"),
  					   savedir = file.path(dir, "commercial_comps"))

Pdata_exp$Final_Sample_Size <- capValues(Pdata_exp$Expansion_Factor_1_L * Pdata_exp$Expansion_Factor_2)

comps <- getComps(Pdata = Pdata_exp[!is.na(Pdata_exp$lengthcm), ], 
				  Comps = "LEN")

# Commenting out for now because I don't want to assign unsexed 
# due to the dimorphic growth
# There area a fair number of U in CA and in the early years of WA
# compSR <- doSexRatio(CompData = comps, 
# 					 ratioU = 0.5, 
# 					 maxsizeU = 25, 
# 					 savedir = file.path(dir, "commercial_comps"))

myLbins = c(seq(8, 60, 2))
out_name = sub(pattern = "(.*)\\..*$", replacement = "\\1", bds_file)
out_name = paste0(out_name, "_check")

writeComps(inComps = comps, 
		   fname = file.path(dir, "commercial_comps", "forSS", paste0("Lengths_", out_name, ".csv")), 
		   lbins = myLbins, 
		   sum1 = TRUE, 
		   partition = 2, 
		   dummybins = FALSE)

# writeComps(inComps = compSR, 
# 		   fname = file.path(dir, "commercial_comps", "forSS", paste0("Lengths_", out_name, "_sexRatio_applied.csv")), 
# 		   lbins = myLbins, 
# 		   sum1 = TRUE, 
# 		   partition = 2, 
# 		   dummybins = FALSE)

# Calculate the expansion for age data
Pdata_exp$Final_Sample_Size = capValues(Pdata_exp$Expansion_Factor_1_A * Pdata_exp$Expansion_Factor_2)

age_comps <- getComps(Pdata_exp[!is.na(Pdata_exp$age), ], 
				      Comps = "Age")

#age_compsSR <- doSexRatio(age_comps)

myAbins = 1:60
# writeComps(inComps = age_compsSR, 
# 		   fname = file.path(dir, "commercial_comps", "forSS", paste0("Age_", out_name, "_sexRatio_applied.csv")), 
# 		   abins = myAbins, 
# 		   sum1 = TRUE, 
# 		   partition = 2, 
# 		   dummybins = FALSE)

writeComps(inComps = age_comps, 
		   fname = file.path(dir, "commercial_comps", "forSS", paste0("Age_", out_name, ".csv")), 
		   abins = myAbins, 
		   sum1 = TRUE, 
		   partition = 2, 
		   dummybins = FALSE)


###############################################################################################
# Let's format the csv files for direct use in SS
#####################################################################################

out = read.csv(file.path(dir, "commercial_comps", "forSS", paste0("Lengths_",out_name, ".csv")), 
				skip = 3, header = TRUE)
start = 1 #which(as.character(out[,1]) %in% c(" Females then males ")) + 2
end   = which(as.character(out[,1]) %in% c(" Females only "))-1 #nrow(out)
cut_out = out[start:end,]

# format the length comps
cut_out$fleet[cut_out$fleet =="CA"] = 1
cut_out$fleet[cut_out$fleet =="WA_OR"] = 2

ind = which(colnames(cut_out) %in% paste0("L",min(myLbins))):
	  which(colnames(cut_out) %in% paste0("L",max(myLbins), ".1"))
format = cbind(cut_out$fishyr, cut_out$month, cut_out$fleet, cut_out$sex, cut_out$partition, cut_out$InputN, cut_out[,ind])
colnames(format) = c("fishyr", "month", "fleet", "sex", "part", "InputN", colnames(cut_out[ind]))
format = format[format$fishyr != 2021, ]
write.csv(format[,!(colnames(format) %in% c("Nsamps"))], 
		  file = file.path(dir, "commercial_comps", "forSS", paste0("Lcomps_for_SS_", out_name, ".csv")), 
		  row.names = FALSE)


# Let's create the sample table
temp = Pdata[!is.na(Pdata$lengthcm) & Pdata$fishyr < 2021,]
Nfish = table(temp$fishyr, temp$state) #temp$fleet)
colnames(Nfish) = sort(unique(temp$state)) #c("WA_OR") #c("CA", "WA_OR")

aa = sort(unique(temp$state)) #unique(temp$fleet)
yy = sort(unique(temp$fishyr))
Ntows = matrix(0, length(yy), length(aa))
for(y in 1:length(yy)){
	for(a in 1:length(aa)){
		ind = which(temp$fishyr == yy[y] & temp$state  == aa[a])
		if(length(ind) > 0) {Ntows[y, a] = length(unique(temp$SAMPLE_NO[ind])) }
	}
}
colnames(Ntows) = aa
rownames(Ntows) = yy

samples = cbind(rownames(Ntows), Ntows[,"CA"] , Nfish[,"CA"], 
			    Ntows[,"OR"] , Nfish[,"OR"],  Ntows[,"WA"] , Nfish[,"WA"])

colnames(samples) = c("Year", "CA Ntows", "CA Nfish",
	 				  "OR Ntows", "OR Nfish", "WA Ntows", "WA Nfish")
write.csv(samples, 
		  file = file.path(dir, "commercial_comps", "forSS", paste0("Com_Length_Samples_by_State.csv")), 
		  row.names = FALSE)

###############################################################################################
# Format Age Samples
out = read.csv(file.path(dir, "commercial_comps", "forSS", paste0("Age_",out_name, ".csv")), 
				skip = 3, header = TRUE)
start = 1 #which(as.character(out[,1]) %in% c(" Females then males ")) + 2
end   = which(as.character(out[,1]) %in% c(" Females only ")) - 1 #nrow(out)
cut_out = out[start:end,]

# format the length comps
cut_out$fleet[cut_out$fleet =="CA"] = 1
cut_out$fleet[cut_out$fleet =="WA_OR"] = 2
cut_out$ageErr[cut_out$fleet == 1] = 2
cut_out$ageErr[cut_out$fleet == 2] = 1

ind = which(colnames(cut_out) %in% paste0("A",min(myAbins))):
	  which(colnames(cut_out) %in% paste0("A",max(myAbins), ".1"))
format = cbind(cut_out$fishyr, cut_out$month, cut_out$fleet, cut_out$sex, cut_out$partition, 
			   cut_out$ageErr, cut_out$LbinLo, cut_out$LbinHi, cut_out$InputN, cut_out[,ind])
colnames(format) = c("fishyr", "month", "fleet", "sex", "part", "AgeErr", "Low", "High", "InputN", colnames(cut_out[ind]))
format = format[format$fishyr != 2021, ]
write.csv(format[,!(colnames(format) %in% c("Nsamps"))], 
		  file = file.path(dir, "commercial_comps", "forSS", paste0("Acomps_forSS_", out_name, ".csv")), 
		  row.names = FALSE)

# Let's create the sample table
temp = Pdata[!is.na(Pdata$age) & Pdata$fishyr < 2021,]
Nfish = table(temp$fishyr, temp$state)
colnames(Nfish) = unique(temp$state) 

aa = sort(unique(temp$state))
yy = sort(unique(temp$fishyr))
Ntows = matrix(0, length(yy), length(aa))
for(y in 1:length(yy)){
	for(a in 1:length(aa)){
		ind = which(temp$fishyr == yy[y] & temp$state  == aa[a])
		if(length(ind) > 0) {Ntows[y, a] = length(unique(temp$SAMPLE_NO[ind])) }
	}
}
colnames(Ntows) = aa
rownames(Ntows) = yy

samples = cbind(rownames(Ntows), Ntows[,"CA"] , Nfish[,"CA"], 
			    Ntows[,"OR"] , Nfish[,"OR"], Ntows[,"WA"] , Nfish[,"WA"])

colnames(samples) = c("Year", "CA Ntows", "CA Nfish",
	 				  "OR Ntows", "OR Nfish", "WA Ntows", "WA Nfish")
write.csv(samples, 
		  file = file.path(dir, "commercial_comps", "forSS", paste0("Com_Age_Samples_by_State.csv")), 
		  row.names = FALSE)
######################################################################################################
######################################################################################################
library(plyr)
library(HandyCode)
data = Pdata

table(data$state, is.na(data$DEPTH_AVG))
table(data$fishyr, data$state, !is.na(data$DEPTH_AVG))
# Depth on availabe for some Oregon and Washington (not all)

by_month = table(data$state, data$SAMPLE_MONTH)
prop_by_month = rbind(by_month[1,] / apply(by_month, 2, sum), 
					  by_month[2,] / apply(by_month, 2, sum),
					  by_month[3,] / apply(by_month, 2, sum))
dimnames(prop_by_month)[[1]] = c("CA", "OR", "WA")

sub_data = data[!is.na(data$DEPTH_AVG), ]
sub_data$depth_bin = round_any(sub_data$DEPTH_AVG, 50, floor)
table(sub_data$SAMPLE_MONTH, sub_data$depth_bin)
boxplot(sub_data$depth_bin~sub_data$SAMPLE_MONTH)

aggregate(lengthcm~state+SAMPLE_MONTH, data, quantile)
boxplot(data$lengthcm~data$SAMPLE_MONTH)
par(mfrow = c(3,1))
boxplot(data$DEPTH_AVG~data$SAMPLE_MONTH)
boxplot(data$DEPTH_AVG[data$state == "OR"]~data$SAMPLE_MONTH[data$state == "OR"])
boxplot(data$DEPTH_AVG[data$state == "WA"]~data$SAMPLE_MONTH[data$state == "WA"])

par(mfrow = c(3,1))
boxplot(data$lengthcm[data$state == "CA"]~data$SAMPLE_MONTH[data$state == "CA"])
boxplot(data$lengthcm[data$state == "OR"]~data$SAMPLE_MONTH[data$state == "OR"])
boxplot(data$lengthcm[data$state == "WA"]~data$SAMPLE_MONTH[data$state == "WA"])


plot(data$DEPTH_AVG, data$lengthcm)

par(mfrow = c(2,1))
f = which(data$SEX == "F")
plot(data$SAMPLE_MONTH[f], data$lengthcm[f], col = 'red')
f = which(data$SEX == "M")
plot(data$SAMPLE_MONTH[f], data$lengthcm[f], col = 'blue')

