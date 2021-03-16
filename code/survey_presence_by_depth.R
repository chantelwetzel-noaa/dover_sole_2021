#============================================================================================
# Plot Function
#============================================================================================

library(plyr)

get_prop_present <- function(catch, bio, bin, round_dir = floor){
	catch$depth_bin = round_any(catch$Depth_m, bin, round_dir)
	bio$depth_bin = round_any(bio$Depth_m, bin, round_dir)

	tab <- table(catch$depth_bin, catch$cpue_kg_km2 > 0 )
	tab[,1] = tab[,1] / (tab[,1] + tab[,2])
	tab[,2] = 1- tab[,1]
	dimnames(tab)[[2]] <- c("Absent","Present")

	tab_sex = table(bio$depth_bin, bio$Sex == "F")
	tab_sex[,1] = tab_sex[,1] / (tab_sex[,1] + tab_sex[,2])
	tab_sex[,2] = 1 - tab_sex[,1]
	dimnames(tab_sex)[[2]] = c("Males", "Females")

	out = list(tab, tab_sex)
	return(out)
}

#============================================================================================
# 	NWFSC WCGBT
#============================================================================================
setwd("//nwcfile/FRAM/Assessments/CurrentAssessments/Dover_sole_2021/data/survey/wcgbts")

load("Catch__NWFSC.Combo_2020-10-15.rda")
catch = Out
load("Bio_All_NWFSC.Combo_2020-10-15.rda")
bio = Data

wcgbt = get_prop_present(catch = catch, bio = bio, bin = 100)

catch$state = NA
catch$state[catch$Latitude_dd < 36] = "s_ca"
catch$state[catch$Latitude_dd > 36 & catch$Latitude_dd < 42] = "n_ca"
catch$state[catch$Latitude_dd > 42 & catch$Latitude_dd < 46] = "or"
catch$state[catch$Latitude_dd > 46] = "wa"

catch_deep = catch[catch$Depth_m > 550,]
pos = sum(catch_deep$total_catch_wt_kg> 0)
pos / dim(catch_deep)[1]
# 0.75

bio$depth_bin_50 = round_any(bio$Depth_m, 50, floor)



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
catch_tri = Out
bio_tri = Data[[1]]

tri = get_prop_present(catch = catch_tri, bio = bio_tri, bin = 50)

#============================================================================================
# NWFSC Slope Data
#============================================================================================
setwd("//nwcfile/FRAM/Assessments/CurrentAssessments/Dover_sole_2021/data/survey/nwfsc_slope")
load("Catch__NWFSC.Slope_2020-09-10.rda")
load("Bio_All_NWFSC.Slope_2020-09-10.rda")
catch_nwslope = Out
bio_nwslope = Data

nwslope = get_prop_present(catch = catch_nwslope, bio = bio_nwslope, bin = 100)

catch_deep = catch_nwslope[catch_nwslope$Depth_m > 550,]
pos = sum(catch_deep$total_catch_wt_kg> 0)
pos / dim(catch_deep)[1]
# 0.78

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

catch_aslope = filter.dat$datTows
bio_aslope = filter.dat$length
bio_age_aslope = filter.dat$age

aslope = get_prop_present(catch = catch_aslope, bio = bio_aslope, bin = 100)
aslope[[1]] = aslope[[1]][1:(nrow(aslope[[1]])-1), ]

#============================================================================================
# Presence Absence Figures
#============================================================================================
setwd("//nwcfile/FRAM/Assessments/CurrentAssessments/Dover_sole_2021/data/survey/plots")


png(file.path(getwd(), 'presence_by_depth_bin.png'),
    width = 20, height = 14, units='in', res=300, pointsize=10)

par(mfrow = c(4,2), mar = c(1, 1, 1, 0.1))
plot(wcgbt[[1]], col=c(gray(.7), 'darkorchid3'), main = "NWFSC WCGBT", cex = 1)
abline(h = 0.5, col = 'white', lty = 1, lwd = 4)
plot(wcgbt[[2]], col=c('blue3', 'red'), main = "NWFSC WCGBT", cex=1)
abline(h = 0.5, col = 'white', lty = 1, lwd = 4)

plot(nwslope[[1]], col=c(gray(.7), 'darkorchid3'), main = "NWFSC Slope", cex=1)
abline(h = 0.5, col = 'white', lty = 1, lwd = 4)
plot(nwslope[[2]], col=c('blue3', 'red'), main = "NWFSC Slope",, cex=1)
abline(h = 0.5, col = 'white', lty = 1, lwd = 4)

plot(aslope[[1]], col=c(gray(.7), 'darkorchid3'), main = "AFSC Slope", cex=1)
abline(h = 0.5, col = 'white', lty = 1, lwd = 4)
plot(aslope[[2]], col=c('blue3', 'red'), main = "AFSC Slope", cex=1)
abline(h = 0.5, col = 'white', lty = 1, lwd = 4)

plot(tri[[1]], col=c(gray(.7), 'darkorchid3'), cex=1, main = "Triennial")
abline(h = 0.5, col = 'white', lty = 1, lwd = 4)
plot(tri[[2]], col=c('blue3', 'red'),main = "Triennial", cex=1)
abline(h = 0.5, col = 'white', lty = 1, lwd = 4)

dev.off()


#######################################################################################

pass1 = get_prop_present(catch = catch[catch$Pass == 1, ], bio = bio[bio$Pass == 1,], bin = 100)
pass2 = get_prop_present(catch = catch[catch$Pass == 2, ], bio = bio[bio$Pass == 2,], bin = 100)

png(file.path(getwd(), 'wcgbt_pass_presence_by_depth_bin.png'),
    width = 20, height = 14, units='in', res=300, pointsize=10)

par(mfrow = c(2,2), mar = c(1, 1, 1, 0.1))
plot(pass1[[1]], col=c(gray(.7), 'darkorchid3'), main = "Pass 1", cex = 1)
abline(h = 0.5, col = 'white', lty = 1, lwd = 4)
plot(pass1[[2]], col=c('blue3', 'red'), main = "Pass 1", cex=1)
abline(h = 0.5, col = 'white', lty = 1, lwd = 4)

plot(pass2[[1]], col=c(gray(.7), 'darkorchid3'), main = "Pass 2", cex = 1)
abline(h = 0.5, col = 'white', lty = 1, lwd = 4)
plot(pass2[[2]], col=c('blue3', 'red'), main = "Pass 2", cex=1)
abline(h = 0.5, col = 'white', lty = 1, lwd = 4)

dev.off()

######################################################################################

bio$depth_bin = round_any(bio$Depth_m, 50, floor)
bio_tri$depth_bin = round_any(bio_tri$Depth_m, 50, floor)
bio_nwslope$depth_bin = round_any(bio_nwslope$Depth_m, 50, floor)
bio_aslope$depth_bin  = round_any(bio_aslope$Depth_m, 50, floor)
bio_age_aslope$depth_bin  = round_any(bio_age_aslope$Depth_m, 50, floor)

fem_wcgbt = which(bio$Sex == "F")
fem_tri = which(bio_tri$Sex == "F")
fem_nwslope = which(bio_nwslope$Sex == "F")
fem_aslope = which(bio_aslope$Sex == "F")
fem_age_aslope = which(bio_age_aslope$Sex == "F")

png(file.path(getwd(), 'size_by_depth_surveys.png'),
    width = 20, height = 14, units='in', res=300, pointsize=10)
par(mfrow = c(4, 2), mar = c(4,4,2,2))
boxplot(bio$Length_cm[fem_wcgbt]~bio$depth_bin[fem_wcgbt], col = 'red', 
	ylim = c(0, 70), xlab = "Depth (m)", ylab = "Length (cm)", main = "WCGBT")
abline(h = 48.5, col = 'red', lty = 2)
boxplot(bio$Length_cm[-fem_wcgbt]~bio$depth_bin[-fem_wcgbt], col = 'blue',
	ylim = c(0, 70), xlab = "Depth (m)", ylab = "", main = "WCGBT")
abline(h = 43, col = 'blue', lty = 2)
boxplot(bio_tri$Length_cm[fem_tri]~bio_tri$depth_bin[fem_tri], col = 'red',
	ylim = c(0, 70), xlab = "Depth (m)", ylab = "Length (cm)", main = "Triennial")
abline(h = 48.5, col = 'red', lty = 2)
boxplot(bio_tri$Length_cm[-fem_tri]~bio_tri$depth_bin[-fem_tri], col = 'blue',
	ylim = c(0, 70), xlab = "Depth (m)", ylab = "", main = "Triennial")
abline(h = 43, col = 'blue', lty = 2)
boxplot(bio_nwslope$Length_cm[fem_nwslope]~bio_nwslope$depth_bin[fem_nwslope], col = 'red',
	ylim = c(0, 70), xlab = "Depth (m)", ylab = "Length (cm)", main = "NWFSC Slope")
abline(h = 48.5, col = 'red', lty = 2)
boxplot(bio_nwslope$Length_cm[-fem_nwslope]~bio_nwslope$depth_bin[-fem_nwslope], col = 'blue',
	ylim = c(0, 70), xlab = "Depth (m)", ylab = "", main = "NWFSC Slope")
abline(h = 43, col = 'blue', lty = 2)
boxplot(bio_aslope$Length_cm[fem_aslope]~bio_aslope$depth_bin[fem_aslope], col = 'red',
	ylim = c(0, 70), xlab = "Depth (m)", ylab = "Length (cm)", main = "AFSC Slope")
abline(h = 48.5, col = 'red', lty = 2)
boxplot(bio_aslope$Length_cm[-fem_aslope]~bio_aslope$depth_bin[-fem_aslope], col = 'blue',
	ylim = c(0, 70), xlab = "Depth (m)", ylab = "", main = "AFSC Slope")
abline(h = 43, col = 'blue', lty = 2)
dev.off()

png(file.path(getwd(), 'age_by_depth_surveys.png'),
    width = 20, height = 14, units='in', res=300, pointsize=10)
par(mfrow = c(3, 2), mar = c(4,4,2,2))
boxplot(bio$Age[fem_wcgbt]~bio$depth_bin[fem_wcgbt], col = 'red', 
	ylim = c(0, 60), xlab = "Depth (m)", ylab = "Length (cm)", main = "WCGBT")
abline(h = 60, col = 'red', lty = 2)
boxplot(bio$Age[-fem_wcgbt]~bio$depth_bin[-fem_wcgbt], col = 'blue',
	ylim = c(0, 60), xlab = "Depth (m)", ylab = "", main = "WCGBT")
abline(h = 60, col = 'blue', lty = 2)
boxplot(bio_nwslope$Age[fem_nwslope]~bio_nwslope$depth_bin[fem_nwslope], col = 'red',
	ylim = c(0, 60), xlab = "Depth (m)", ylab = "Length (cm)", main = "NWFSC Slope")
abline(h = 60, col = 'red', lty = 2)
boxplot(bio_nwslope$Age[-fem_nwslope]~bio_nwslope$depth_bin[-fem_nwslope], col = 'blue',
	ylim = c(0, 60), xlab = "Depth (m)", ylab = "", main = "NWFSC Slope")
abline(h = 60, col = 'blue', lty = 2)
boxplot(as.numeric(bio_age_aslope$Age[fem_age_aslope])~bio_age_aslope$depth_bin[fem_age_aslope], col = 'red',
	ylim = c(0, 60), xlab = "Depth (m)", ylab = "Length (cm)", main = "AFSC Slope")
abline(h = 60, col = 'red', lty = 2)
boxplot(as.numeric(bio_age_aslope$Age[-fem_age_aslope])~bio_age_aslope$depth_bin[-fem_age_aslope], col = 'blue',
	ylim = c(0, 60), xlab = "Depth (m)", ylab = "", main = "AFSC Slope")
abline(h = 60, col = 'blue', lty = 2)
dev.off()


#################################################################################################

all_ages = c(bio$Age, bio_nwslope$Age, as.numeric(bio_age_aslope$Age), Pdata$Age)
all_ages = all_ages[all_ages < 75]
quantile(all_ages, c(seq(0.99, 1, 0.0005)), na.rm = TRUE)

all_ages = c(bio$Age, bio_nwslope$Age, as.numeric(bio_age_aslope$Age))
quantile(all_ages, c(seq(0.99, 1, 0.0005)), na.rm = TRUE)

quantile(bio$Age, c(0.5, 0.99, 0.995, 0.999, 1), na.rm = TRUE)
quantile(bio_nwslope$Age, c(0.5, 0.99, 0.995, 0.999, 1), na.rm = TRUE)
quantile(as.numeric(bio_age_aslope$Age), c(0.5, 0.99, 0.995, 0.999, 1), na.rm = TRUE)


###########################################################################################
Pdata$depth_bin = round_any(Pdata$DEPTH_AVG, 50, floor)

png(file.path(getwd(), "biology", "plots", 'length_by_depth_fishery.png'),
    width = 20, height = 14, units='in', res=300, pointsize=10)
par(mfrow = c(2, 2), mar = c(4,4,2,2))
boxplot(Pdata$lengthcm[Pdata$state == "OR" & Pdata$SEX == "F"]~
		Pdata$depth_bin[Pdata$state == "OR" & Pdata$SEX == "F"], col = 'red', 
	ylim = c(0, 70), xlab = "Depth (m)", ylab = "Length (cm)", main = "OR")
abline(h = 48.5, col = 'red', lty = 2)
boxplot(Pdata$lengthcm[Pdata$state == "OR" & Pdata$SEX == "M"]~
		Pdata$depth_bin[Pdata$state == "OR" & Pdata$SEX == "M"], col = 'blue', 
	ylim = c(0, 70), xlab = "Depth (m)", ylab = "Length (cm)", main = "OR")
abline(h = 43, col = 'blue', lty = 2)
boxplot(Pdata$lengthcm[Pdata$state == "WA" & Pdata$SEX == "F"]~
		Pdata$depth_bin[Pdata$state == "WA" & Pdata$SEX == "F"], col = 'red', 
	ylim = c(0, 70), xlab = "Depth (m)", ylab = "Length (cm)", main = "WA")
abline(h = 48.5, col = 'red', lty = 2)
boxplot(Pdata$lengthcm[Pdata$state == "WA" & Pdata$SEX == "M"]~
		Pdata$depth_bin[Pdata$state == "WA" & Pdata$SEX == "M"], col = 'blue', 
	ylim = c(0, 70), xlab = "Depth (m)", ylab = "Length (cm)", main = "WA")
abline(h = 43, col = 'blue', lty = 2)
dev.off()

#####################################################################################
diff1 = pass1[[1]] - pass2[[1]]
diff2 = pass1[[2]] - pass2[[2]]
plot(diff1[,1], type = 'l', ylim = c(-0.2, 0.20), lwd = 2)
lines(diff1[,2], type = 'l', lwd = 2, col = 'red')
plot(diff1, col=c(gray(.7), 'darkorchid3'), main = "NWFSC WCGBT", cex = 1)
abline(h = 0.5, col = 'white', lty = 1, lwd = 4)
plot(diff2, col=c('blue3', 'red'), main = "NWFSC WCGBT", cex=1)
abline(h = 0.5, col = 'white', lty = 1, lwd = 4)



bio$depth_bin = round_any(bio$Depth_m, 25, floor)
find = which( bio$Pass == 1 & bio$Sex == "F")
pass1_f_median = aggregate(Age~depth_bin, bio[find,], median)
find = which( bio$Pass == 2 & bio$Sex == "F")
pass2_f_median = aggregate(Age~depth_bin, bio[find,], median)

find = which( bio$Pass == 1 & bio$Sex == "M")
pass1_m_median = aggregate(Age~depth_bin, bio[find,], median)
find = which( bio$Pass == 2 & bio$Sex == "M")
pass2_m_median = aggregate(Age~depth_bin, bio[find,], median)

plot(pass1_f_median, ylim = c(0, 50))
points(pass2_f_median, col = 'red')

plot(pass1_m_median, ylim = c(0, 50))
points(pass2_m_median, col = 'blue')

par(mfrow = c(2, 2))
find = which( bio$Pass == 1 & bio$Sex == "F")
boxplot(bio$Age[find]~bio$depth_bin[find])
boxplot(bio$Length[find]~bio$depth_bin[find])

find = which( bio$Pass == 2 & bio$Sex == "F")
boxplot(bio$Age[find]~bio$depth_bin[find])
boxplot(bio$Length[find]~bio$depth_bin[find])



pass1_fem = aggregate(Age~depth_bin, bio[bio$Pass == 1 & bio$Sex == "F",], mean)
pass2_fem = aggregate(Age~depth_bin, bio[bio$Pass == 2 & bio$Sex == "F",], mean)
plot(pass1_fem$depth_bin, pass1_fem$Age, type = 'p', ylim = c(0, 70), col = 'red')
points(pass2_fem$depth_bin, pass2_fem$Age, pch = 1, col = 'blue')

# Plot by pass
par(mfrow = c(1, 3))
find = which(catch$Pass == 1)
plot(catch$Depth_m[find], log(catch$cpue_kg_km2[find]), ylim = c(0, max(log(catch$cpue_kg_km2))),
	type = 'p', col = 'blue')
points(catch$Depth_m[-find], log(catch$cpue_kg_km2[-find]), pch = 1, col = 'green')

find = which(bio$Pass == 2 & bio$Sex == "F")
points(deep_mean_pass1$depth_bin, deep_mean_pass1$Weight, col = 'red')
points(deep_mean_pass2$depth_bin, deep_mean_pass2$Weight, col = 'blue')
plot(bio$Depth_m[find], bio$Weight[find], ylim = c(0, max(bio$Weight, na.rm = T)), type = 'p', col = 'blue')
find = which(bio$Pass == 1 & bio$Sex == "F")
points(bio$Depth_m[find], bio$Weight[find], pch = 1, col = alpha('green', 0.50))

par(mfrow = c(2,1))

find = which(bio$Pass == 1 & bio$Sex == "F")
plot(bio$Depth_m[find], bio$Age[find], ylim = c(0, max(bio$Age, na.rm = T)), type = 'p', col = 'blue')
find = which(bio$Pass == 2 & bio$Sex == "F")
points(bio$Depth_m[find], bio$Age[find], pch = 1, col = 'green')

find = which(bio$Pass == 1 & bio$Sex == "M")
plot(bio$Depth_m[find], bio$Age[find], ylim = c(0, max(bio$Age, na.rm = T)), type = 'p', col = 'blue')
find = which(bio$Pass == 2 & bio$Sex == "M")
points(bio$Depth_m[find], bio$Age[find], pch = 1, col = 'green')



catch$lat_bin = round_any(catch$Latitude_dd, 0.25, ceiling)
plot(catch$lat_bin[find], log(catch$cpue_kg_km2[find]), ylim = c(0, max(log(catch$cpue_kg_km2))),
 type = 'p', col = 'blue')
points(catch$lat_bin[-find], log(catch$cpue_kg_km2[-find]), pch = 1, col = 'green')

plot(catch$Depth_m[find], log(catch$cpue_kg_km2[find]), ylim = c(0, max(log(catch$cpue_kg_km2))),
	type = 'p', col = 'blue')
points(catch$Depth_m[-find], log(catch$cpue_kg_km2[-find]), pch = 1, col = 'green')
