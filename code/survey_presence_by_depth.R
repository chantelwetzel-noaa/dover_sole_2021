#============================================================================================
# 	NWFSC WCGBT
#============================================================================================

setwd("//nwcfile/FRAM/Assessments/CurrentAssessments/Dover_sole_2021/data/survey/wcgbts")

load("Catch__NWFSC.Combo_2020-10-15.rda")
catch = Out
load("Bio_All_NWFSC.Combo_2020-10-15.rda")
bio = Data

catch$state = NA
catch$state[catch$Latitude_dd < 36] = "s_ca"
catch$state[catch$Latitude_dd > 36 & catch$Latitude_dd < 42] = "n_ca"
catch$state[catch$Latitude_dd > 42 & catch$Latitude_dd < 46] = "or"
catch$state[catch$Latitude_dd > 46] = "wa"

# create new depth variable binned to 10m 
library(plyr)
catch$depth_bin_10 = round_any(catch$Depth_m, 10)
catch$depth_bin_25 = round_any(catch$Depth_m, 25)
catch$depth_bin_50 = round_any(catch$Depth_m, 50, floor)
catch$depth_bin_100 = round_any(catch$Depth_m, 100, floor)
bio$depth_bin_50 = round_any(bio$Depth_m, 50, floor)
bio$depth_bin_100 = round_any(bio$Depth_m, 100, floor)

tab <- table(catch$depth_bin_100, catch$cpue_kg_km2 > 0 )
tab[,1] = tab[,1] / (tab[,1] + tab[,2])
tab[,2] = 1- tab[,1]
dimnames(tab)[[2]] <- c("Absent","Present")
# It would be nice to expand this to look at sex by depth
tabf = table(bio$depth_bin_100, bio$Sex == "F")
tabf[,1] = tabf[,1] / (tabf[,1] + tabf[,2])
tabf[,2] = 1 - tabf[,1]
dimnames(tabf)[[2]] = c("Males", "Females")

png(file.path(getwd(), 'plots', 'WCGBTS_presence_by_depth_bin.png'),
    width = 10, height = 7, units='in', res=300, pointsize=10)
par(mfrow = c(2,1), mar = c(1, 1, 1, 0.1))
plot(tab, col=c(gray(.7), 'darkorchid3'), main="NWFSC WCGBT", cex=1)
abline(h = 0.5, col = 'white', lty = 1, lwd = 4)
plot(tabf, col=c('blue3', 'red'), main="", cex=1)
abline(h = 0.5, col = 'white', lty = 1, lwd = 4)
dev.off()

find = which(catch$cpue_kg_km2 > 0)
med_cpue = aggregate(cpue_kg_km2~depth_bin_50+state, catch[find,], median)
wa = which(med_cpue$state == "wa")
plot(med_cpue$depth_bin_50[wa], med_cpue$cpue_kg_km2[wa], type = 'l', lwd = 2, 
	col = 'blue', yaxs="i", xaxis = 'i', ylim = c(0, 4000), xlim = c(0, 1300))
or = which(med_cpue$state == "or")
lines(med_cpue$depth_bin_50[or], med_cpue$cpue_kg_km2[or],lwd = 2, col = 'purple')
n_ca = which(med_cpue$state == "n_ca")
lines(med_cpue$depth_bin_50[n_ca], med_cpue$cpue_kg_km2[n_ca], lwd = 2, col = 'red')
s_ca = which(med_cpue$state == "s_ca")
lines(med_cpue$depth_bin_50[s_ca], med_cpue$cpue_kg_km2[s_ca], lwd = 2, col = 'orange')

#============================================================================================
# 	Triennial Early
#============================================================================================
setwd("//nwcfile/FRAM/Assessments/CurrentAssessments/Dover_sole_2021/data/survey/triennial")

load("Catch__Triennial_2020-09-10.rda")
load("Bio_All_Triennial_2020-09-10.rda")
catch = Out
bio = Data[[1]]

catch$depth_bin_50 = round_any(catch$Depth_m, 50, floor)
bio$depth_bin_50 = round_any(bio$Depth_m, 50, floor)

tab <- table(catch$depth_bin_50, catch$cpue_kg_km2 > 0 )
tab[,1] = tab[,1] / (tab[,1] + tab[,2])
tab[,2] = 1- tab[,1]
dimnames(tab)[[2]] <- c("Absent","Present")
# It would be nice to expand this to look at sex by depth
tabf = table(bio$depth_bin_50, bio$Sex == "F")
tabf[,1] = tabf[,1] / (tabf[,1] + tabf[,2])
tabf[,2] = 1 - tabf[,1]
dimnames(tabf)[[2]] = c("Males", "Females")

png(file.path(getwd(), 'plots', 'Triennial_presence_by_depth_bin.png'),
    width = 10, height = 7, units='in', res=300, pointsize=10)
par(mfrow = c(2,1), mar = c(1, 1, 3, 1))
plot(tab, col=c(gray(.7), 'darkorchid3'), cex=1, main = "Triennial")
abline(h = 0.5, col = 'white', lty = 1, lwd = 4)
plot(tabf, col=c('blue3', 'red'), main="", cex=1)
abline(h = 0.5, col = 'white', lty = 1, lwd = 4)
dev.off()

#============================================================================================
# NWFSC Slope Data
#============================================================================================

setwd("//nwcfile/FRAM/Assessments/CurrentAssessments/Dover_sole_2021/data/survey/nwfsc_slope")
load("Catch__NWFSC.Slope_2020-09-10.rda")
load("Bio_All_NWFSC.Slope_2020-09-10.rda")

catch = Out
bio = Data

catch$depth_bin_100 = round_any(catch$Depth_m, 100, floor)
bio$depth_bin_100 = round_any(bio$Depth_m, 100, floor)

tab <- table(catch$depth_bin_100, catch$cpue_kg_km2 > 0 )
tab[,1] = tab[,1] / (tab[,1] + tab[,2])
tab[,2] = 1- tab[,1]
dimnames(tab)[[2]] <- c("Absent","Present")
# It would be nice to expand this to look at sex by depth
tabf = table(bio$depth_bin_100, bio$Sex == "F")
tabf[,1] = tabf[,1] / (tabf[,1] + tabf[,2])
tabf[,2] = 1 - tabf[,1]
dimnames(tabf)[[2]] = c("Males", "Females")

png(file.path(getwd(), 'plots', 'NWFSC_Slope_presence_by_depth_bin.png'),
    width = 10, height = 7, units='in', res=300, pointsize=10)
par(mfrow = c(2,1), mar = c(1, 1, 3, 1))
plot(tab, col=c(gray(.7), 'darkorchid3'), main="NWFSC Slope", cex=1)
abline(h = 0.5, col = 'white', lty = 1, lwd = 4)
plot(tabf, col=c('blue3', 'red'), main="", cex=1)
abline(h = 0.5, col = 'white', lty = 1, lwd = 4)
dev.off()

#============================================================================================
# AFSC Slope Data
#============================================================================================

devtools::load_all("C:/Users/Chantel.Wetzel/Documents/GitHub/nwfscSurvey")

setwd("//nwcfile/FRAM/Assessments/CurrentAssessments/Dover_sole_2021/data/survey/afsc_slope")

load(file.path(getwd(), "Dover.AK.28.MAr.2010.dmp"))
load(file.path(getwd(), "AK.Surveys.Bio.Dover.17.Mar.11.dmp"))
filter.dat = Format.AKSlope.fn(datTows = Dover.AK.28.MAr.2010, 
                 datL = AK.Surveys.Bio.Dover.17.Mar.11, 
                 start.year = 1997) 

catch = filter.dat$datTows
bio = filter.dat$length

catch$depth_bin_100 = round_any(catch$Depth_m, 100, floor)
bio$depth_bin_100 = round_any(bio$Depth_m, 100, floor)

tab <- table(catch$depth_bin_100, catch$cpue_kg_km2 > 0 )
tab[,1] = tab[,1] / (tab[,1] + tab[,2])
tab[,2] = 1- tab[,1]
dimnames(tab)[[2]] <- c("Absent","Present")
tab = tab[-nrow(tab),]
# It would be nice to expand this to look at sex by depth
tabf = table(bio$depth_bin_100, bio$Sex == "F")
tabf[,1] = tabf[,1] / (tabf[,1] + tabf[,2])
tabf[,2] = 1 - tabf[,1]
dimnames(tabf)[[2]] = c("Males", "Females")

png(file.path(getwd(), 'plots', 'AFSC_Slope_presence_by_depth_bin.png'),
    width = 10, height = 7, units='in', res=300, pointsize=10)
par(mfrow = c(2,1), mar = c(1, 1, 3, 1))
plot(tab, col=c(gray(.7), 'darkorchid3'), main="AFSC Slope", cex=1)
abline(h = 0.5, col = 'white', lty = 1, lwd = 4)
plot(tabf, col=c('blue3', 'red'), main="", cex=1)
abline(h = 0.5, col = 'white', lty = 1, lwd = 4)
dev.off()
