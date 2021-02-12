##################################################################
# 		Process and combine the WCGOP discard rates
# 				2021 Dover sole assesment.
#               Written by: Chantel Wetzel
##################################################################


wd = "//nwcfile/FRAM/Assessments/CurrentAssessments/Dover_sole_2021/data/discard_data"

#load packages
library(plyr)
library(dplyr)

#----------------------------------------------------------------------
# Fleet numbering
# 1 - California
# 2 - Oregon / Washington

#Read in new discard rates
#ncs for non-catch-share
dis.boot.ncs <- read.csv(file.path(wd,'dover_OB_DisRatios_boot_ncs_Gear_North_South_2021-01-19.csv'),stringsAsFactors = FALSE)

dis.boot.ncs <- dis.boot.ncs[, c("ryear", "State", "gear2", "Observed_Ratio", "CV.Boot_Ratio", "StdDev.Boot_Ratio")]

#filter out the non-trawl samples
keep = which(dis.boot.ncs$gear2 == "Trawl")
dis.boot.ncs = dis.boot.ncs[keep, ]

assign.fleets <- data.frame(State = unique(dis.boot.ncs$State), Fleet = 1:2)

dis.boot.ncs <- merge(dis.boot.ncs, assign.fleets, by = 'State')
dis.boot.ncs$month <- 1
dis.boot.ncs <- dis.boot.ncs[, c('ryear', 'month', 'Fleet', 'Observed_Ratio',"CV.Boot_Ratio", 'StdDev.Boot_Ratio')]

# CRW rename season to month
names(dis.boot.ncs) <- c("Yr", "Month", "Flt", "Discard", "CV", "Std_in")

# There are ncs observations post 2010
# Currently cut them due to low observations, discards
# If there is time - may want to explore weighting these rates with cs based on catch
keep = 2002:2010
dis.ncs = dis.boot.ncs[dis.boot.ncs$Yr %in% keep, ]

#-----------------------------------
# Now do the catch share years
#-----------------------------------
dis.cs <- read.csv(file.path(wd, "dover_OB_DisRatios_boot_cs_Gear_North_South_2021-01-19.csv"), stringsAsFactors = FALSE)

#filter out the non-trawl samples
keep = which(dis.cs$gear2 == "Trawl")
dis.cs = dis.cs[keep, ]

assign.fleets <- data.frame(State = unique(dis.cs$State), Fleet = 1:2)

dis.cs <- merge(dis.cs, assign.fleets, by = 'State')
dis.cs$month <- 1
dis.cs$std <- dis.cs$cv<- 0.01
dis.cs <- dis.cs[, c('ryear', 'month', 'Fleet', 'Observed_Ratio', 'cv', 'std')]

names(dis.cs) <- c("Yr", "Month", "Flt", "Discard", "CV", "Std_in")

# Combine the cs with the ncs data
all_data = rbind(dis.ncs, dis.cs)

# CRW order the years 
out = NULL
for (a in 1:max(all_data$Flt)){
	tmp = all_data[all_data$Flt == a, ]
	ind = sort(tmp$Yr, index.return = T)$ix
	out = rbind(out, tmp[ind,])
}

write.csv(out[,-ncol(out)], file.path(wd, "forSS", "discard_rates_forSS.csv"), row.names = FALSE)

