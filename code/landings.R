##############################################################################################################
#
# 	Purpose: Summarize Dover Sole Landing
#
#			  by Chantel Wetzel 
#
##############################################################################################################

library(HandyCode)
library(dplyr)
options(stringsAsFactors = FALSE)

dir = "//nwcfile/FRAM/Assessments/CurrentAssessments/Dover_sole_2021/data/catches"


#-----------------------------------------------------------------------------------
# Load the Historical Data
#-----------------------------------------------------------------------------------

# The california historical catches comes in 3 sections:
#	1. 1911-1947: from Sampson 2005 which represent removals (landings + discards)
#	2. 1948-1968: Ralston et al reconstruction
#	3. 1969-1980: CalCOM 
ca_1911 = read.csv(file.path(dir, "ca", "dover_ca_removals_1911-1947_from_2005_assess.csv"))
ca_1948 = read.csv(file.path(dir, "ca", "ca_dover_commercial_catches_1948_1968.csv"))
ca_1969 = read.csv(file.path(dir, "ca", "dover_ca_1969_1980_from_ej.csv"))

or_hist = read.csv(file.path(dir, "or", "or_commercial_reconstruction.csv"))
or_hist = or_hist[or_hist$SPECIES_NAME == "Dover Sole", ]

# Theresa directed me to use the historical landings from 2011
wa_hist = read.csv(file.path(dir, "2011_landings.csv"))

or_wa_hist = read.csv(file.path(dir, "or", "ca_historical_caught_in_or_wa.csv"))

pound_conv = 2204.62262

#-----------------------------------------------------------------------------------
# Load the PacFIN Commercial Data
#-----------------------------------------------------------------------------------

#load(file.path(dir, "pacfin", "kj", "DOVR.CompFT.05.Oct.2020.RData"))
load(file.path(dir, "pacfin", 'PacFIN.DOVR.Catch.INPFC.28.Jan.2021.RData'))
pacfin = PacFIN.DOVR.Catch.INPFC.28.Jan.2021[[1]]
pacfin$round_mt = pacfin$ROUND_WEIGHT_MTONS #/ pound_conv

#-----------------------------------------------------------------------------------
# Evaluate the commercial landings
#-----------------------------------------------------------------------------------

# You can identify research catch by "REMOVAL_TYPE_CODE" == "R"
# Tribal catch can be found via the "FLEET_CODE" == "TI"
research = aggregate(round_mt~LANDING_YEAR + AGENCY_CODE, data = pacfin[pacfin$REMOVAL_TYPE_CODE == "R", ], FUN = sum)
tribal = aggregate(round_mt~LANDING_YEAR + AGENCY_CODE, data = pacfin[pacfin$FLEET_CODE == "TI", ], FUN = sum)

table(pacfin$PACFIN_GROUP_GEAR_CODE) # used to be GRGROUP
#   HKL    MSC    NET    POT    TLS    TWL    TWS 
# 14578     45    391   1930     88 456749  17668 

tmp = aggregate(pacfin$round_mt, list(year = pacfin$LANDING_YEAR, gear = pacfin$PACFIN_GROUP_GEAR_CODE), FUN = sum, drop = FALSE)
catch_gear_df = data.frame(year = sort(unique(tmp$year)),
						   hkl = tmp[tmp$gear == "HKL", "x"],
						   msc = tmp[tmp$gear == "MSC", "x"],
						   net = tmp[tmp$gear == "NET", "x"], 
						   pot = tmp[tmp$gear == "POT", "x"], 
						   tls = tmp[tmp$gear == "TLS", "x"],
						   twl = tmp[tmp$gear == "TWL", "x"],
						   tws = tmp[tmp$gear == "TWS", "x"])
catch_gear_df[is.na(catch_gear_df)] = 0

# Percent overall by gear type
round(apply(catch_gear_df[,-1], 2, sum) / sum(catch_gear_df[,-1]), 4)
#    hkl    msc    net    pot    tls    twl    tws 
# 0.0008 0.0000 0.0003 0.0003 0.0001 0.9957 0.0028 

tmp = aggregate(pacfin$round_mt, list(year = pacfin$LANDING_YEAR, state = pacfin$AGENCY_CODE), FUN = sum, drop = FALSE)
catch_area_df = data.frame(year = sort(unique(tmp$year)),
						   ca = tmp[tmp$state == "C", "x"],
						   or = tmp[tmp$state == "O", "x"],
						   wa = tmp[tmp$state == "W", "x"])

catch_area_df[is.na(catch_area_df)] = 0

catch_area_df = catch_area_df[catch_area_df$year != 2021, ]

percent_by_area = round(catch_area_df[ , 2:dim(catch_area_df)[2]] / 
					    apply(catch_area_df[ , 2:dim(catch_area_df)[2]], 1, sum), 2)
# Up until ~ 1997 the majority of catch was landed in California but since the majority of catches
# have been landed in Oregon. Washington has had limited landings since 1981.
# Will need to double check this when I sub in OR historical for 1981-1986.

# apply(percent_by_area, 2, mean)
#      ca      or      wa 
# 0.40000 0.50950 0.09125

#---------------------------------------------------------------------------
# Historical Oregon commercial catches
#---------------------------------------------------------------------------
or_tmp = aggregate(or_hist$ROUND_MTONS, list(year = or_hist$YEAR, gear = or_hist$GEAR_NAME), FUN = sum, drop = FALSE)
or_catch_gear_df = data.frame(year = sort(unique(or_tmp$year)),
						   hkl = or_tmp[or_tmp$gear == "Hook & Line", "x"],
						   lng = or_tmp[or_tmp$gear == "Longline", "x"],
						   drg = or_tmp[or_tmp$gear == "Scallop Dredge", "x"], 
						   trl = or_tmp[or_tmp$gear == "Troll", "x"], 
						   twl = or_tmp[or_tmp$gear == "Bottom Trawl, Unspecified", "x"],
						   oth = or_tmp[or_tmp$gear == "Other Gear", "x"])

or_catch_gear_df[is.na(or_catch_gear_df)] = 0
apply(or_catch_gear_df[,-1], 2, sum, na.rm = TRUE)
#         hkl          lng          drg          trl          twl          oth 
#     0.04847     19.68661      2.76420     10.79553 122620.85395    110.94933
or_percent_by_gear = round(or_catch_gear_df[ , 2:dim(or_catch_gear_df)[2]] / 
					 apply(or_catch_gear_df[ , 2:dim(or_catch_gear_df)[2]], 1, sum), 2)
# trawl landings meaningfully begin in 1932
# prior years landing is a majority from longline gear (total ~ 2.05 mt)

or_hist_df = data.frame (year = sort(unique(or_catch_gear_df$year)), 
						 catch_mt = apply(or_catch_gear_df[,-1], 1, sum))

# remove records before 1911 to be consistent with ca later
or_hist_df = or_hist_df[or_hist_df$year >= 1911, ]

#---------------------------------------------------------------------------
# Historical Washington commercial catches
#---------------------------------------------------------------------------
tmp = wa_hist[wa_hist$Year < 1981, ]
wa_hist_df = data.frame (year = tmp$Year,
					     catch_mt = tmp$WA)

#---------------------------------------------------------------------------
# Add in the catch excluded from the CA recon which were
# attributed to OR and WA
#---------------------------------------------------------------------------
find = which(or_hist_df$year %in% or_wa_hist$Year)
or_hist_df[find, 'catch_mt'] = or_hist_df[find, "catch_mt"] + or_wa_hist[, "Oregon"]

find = which(wa_hist_df$year %in% or_wa_hist$Year) 
wa_hist_df[find, 'catch_mt'] = wa_hist_df[find, 'catch_mt'] + or_wa_hist[,"Washington"]

#---------------------------------------------------------------------------
# Historical California commercial catches
#---------------------------------------------------------------------------

ca_tmp_1948 = aggregate((ca_1948$pounds / pound_conv), list(year = ca_1948$year), FUN = sum, drop = FALSE)
ca_tmp_1969 = aggregate(ca_1969$catch_mt, list(year = ca_1969$Year), FUN = sum, drop = FALSE)

ca_hist_df = data.frame(year = c(ca_1911$Year, ca_tmp_1948$year, ca_tmp_1969$year),
						catch_mt = c(ca_1911$CA, ca_tmp_1948$x, ca_tmp_1969$x)) 

#---------------------------------------------------------------------------
# Combine the historical catches to the PacFIN years
#---------------------------------------------------------------------------

all_com = matrix(NA, length(1911:2020), 4)
colnames(all_com) = c("year", "ca", "or", "wa")
all_com[,'year'] = 1911:2020

# PacFIN data first
all_com[all_com[,'year'] %in% catch_area_df$year, "ca"] = catch_area_df[,"ca"]
all_com[all_com[,'year'] %in% catch_area_df$year, "or"] = catch_area_df[,"or"]
all_com[all_com[,'year'] %in% catch_area_df$year, "wa"] = catch_area_df[,"wa"]
# Historical catches
all_com[all_com[,'year'] %in% wa_hist_df$year, "wa"] = wa_hist_df[wa_hist_df$year %in% all_com[,'year'], 'catch_mt']
all_com[all_com[,'year'] %in% or_hist_df$year, "or"] = or_hist_df[or_hist_df$year %in% all_com[,'year'], 'catch_mt']
all_com[all_com[,'year'] %in% ca_hist_df$year, "ca"] = ca_hist_df[ca_hist_df$year %in% all_com[,'year'], 'catch_mt']

all_com[is.na(all_com)] = 0

write.csv(all_com, 
		  file = file.path(dir, "forSS", "commercial_catch_by_state_new.csv"), 
		  row.names = FALSE)


north = all_com[, 'or'] + all_com[, 'wa']
model_catch = rbind(cbind(as.numeric(all_com[,"year"]), 1, 1, round(all_com[,"ca"], 2), 0.01),
				    cbind(as.numeric(all_com[,"year"]), 1, 2, round(north, 2), 0.01))
colnames(model_catch) = c("Year", "Season", "Fleet", "Catch", "SE")

write.csv(model_catch, 
		  file = file.path(dir, "forSS", "model_commercial_catch_new.csv"), 
		  row.names = FALSE)


#---------------------------------------------------------------------------
# Plots created for the pre-assessment data webinar
#---------------------------------------------------------------------------

pngfun(wd = file.path(dir, "plots"), file = "Commercial_Catch_by_State.png", w = 12, h = 7, pt = 12)
plot(0, 0, type = 'l', xlim = c(1910, 2020), ylim = c(0, max(all_com)), ylab = "Catch (mt)", xlab = "Year", main = "Commercial Catch")
lines(rownames(all_com), all_com[,"ca"], lwd = 2, col = "red")
lines(rownames(all_com), all_com[,"or"],   lwd = 2, col = 'purple')
lines(rownames(all_com), all_com[,"wa"],   lwd = 2, col = 'blue')
legend("topright", bty = 'n', legend = c("California", "Oregon", "Washington"),
	lwd = 2, lty = 1, col = c('red', 'purple', 'blue'))
dev.off()


# Stacked barplot of catches by state
pngfun(wd = file.path(dir, "plots"), file = "Commercial_Catch_by_State_Stacked.png", w = 12, h = 7, pt = 12)
barplot(as.vector(apply(all_com, 1, sum)), border = TRUE, col="Red", xlab = "Years", ylab = "Catch (mt)", 
	axes = TRUE, names.arg = seq(1910, 2020, 1), angle = 45)
barplot(as.vector(apply(all_com[,2:3], 1, sum)),border = TRUE, col = "Purple", add = TRUE)
barplot(as.vector(all_com[,3]),  col="Green", border = FALSE, add = TRUE)
legend("topleft", bty = 'n', legend = c("California", "Oregon", "Washington"),
	lwd = 6, lty = 1, col = c('red', 'purple', 'green'))
dev.off()

# Percent of catches by state across time
percent = all_com[rownames(all_com) >=1969, ] / apply(all_com[rownames(all_com) >=1969, ], 1, sum)
pngfun(wd = file.path(dir, "plots"), file = "Commercial_Catch_Percent_by_State_1969.png", w = 12, h = 7, pt = 12)
barplot(as.vector(apply(percent, 1, sum)), border = TRUE, col="Red", xlab = "Years", ylab = "Percent (%)", 
	axes = TRUE, ylim = c(0, 1.19), names.arg = seq(1969, 2020, 1), angle = 45)
barplot(as.vector(apply(percent[,2:3], 1, sum)),border = TRUE, col = "Purple", add = TRUE)
barplot(as.vector(percent[,3]),  col="Green", border = FALSE, add = TRUE)
legend("topleft", bty = 'n', legend = c("California", "Oregon", "Washington"),
	lwd = 6, lty = 1, col = c('red', 'purple', 'green'))
dev.off()


#---------------------------------------------------------------------------
# Comparison Plots with the 2011 Catch
#---------------------------------------------------------------------------

all_2011 = read.csv(file.path(dir, "2011_landings.csv"))
ca_diff = all_com[rownames(all_com) %in% all_2011$Year,"ca"] - all_2011[,"CA"]
ca_diff[names(ca_diff) < 1969] = 0
or_diff = all_com[rownames(all_com) %in% all_2011$Year,"or"] - all_2011[,"OR"]
wa_diff = all_com[rownames(all_com) %in% all_2011$Year,"wa"] - all_2011[,"WA"]
tot_diff = ca_diff + or_diff + wa_diff
diff_bind = cbind(ca_diff, or_diff, wa_diff)

# Oregon differences are likely driven by the research catchs, but what about WA?
# aggregate(round_mt ~ AGENCY_CODE + YEAR + PACFIN_GROUP_GEAR_CODE + REMOVAL_TYPE_CODE + FLEET_CODE, 
# 	data = pacfin[pacfin$AGENCY_CODE == "W" & pacfin$YEAR == 1983,], FUN = sum)
# tmp = pacfin[pacfin$AGENCY_CODE == "W" & pacfin$YEAR == 1983,]
# tmp2 = pacfinold[pacfinold$AGID == "W" & pacfin$YEAR == 1983,]

y = c(min(c(ca_diff, or_diff, wa_diff)), max(tot_diff) + 25)
pngfun(wd = file.path(dir, "plots"), file = "Catch_Comparison.png", w = 12, h = 7, pt = 12)
barplot(tot_diff[names(tot_diff) > 1930], col = "Red", ylim = y, names.arg = seq(1931, 2010, 1), 
	xlab = "Year", ylab = "Total Difference (mt)", main = "Comparison between 2011 & 2020")
barplot(or_diff[names(or_diff) > 1930] + wa_diff[names(wa_diff) > 1930], col = "Purple", add = TRUE)
barplot(wa_diff[names(wa_diff) > 1930], col = "Green", add = TRUE)
legend("topleft", bty = 'n', legend = c("California", "Oregon", "Washington"),
	lwd = 6, lty = 1, col = c('red', 'purple', 'green'))
dev.off()

x = 1910:2010 
plot(x, ca_diff, type = 'l', lwd = 2, col = "red", ylab = "Catch (mt)", ylim = y)
lines(x, or_diff, lty = 1, lwd = 2, col = "purple")
lines(x, wa_diff, lty = 1, lwd = 2, col = "green")
abline(h = 0, col = 'black', lty = 2)
legend("topleft", bty = 'n', legend = c("CA", "OR", "WA"), lty = 1, lwd = 2, col = c('red', 'purple', 'green'))

pngfun(wd = file.path(dir, "plots"), file = "Catch_Comparison_Totals.png", w = 12, h = 7, pt = 12)
x = 1910:2010 
par(mfrow = c(3, 1), mar = c(4,4,1,1), oma = c(1,1,1,1))
plot(x, all_com[rownames(all_com) %in% x,"ca"], type = 'l', lwd = 2, col = "red", ylab = "Landings (mt)", xlab = "")
lines(x, all_2011[,"CA"], lty = 2, col = 1, lwd = 1)
legend("topleft", bty = 'n', legend = c("2020 - California", "2011"), lty = 1:2, lwd = c(3,2), col = c('red',1), cex = 1.5)
plot(x, all_com[rownames(all_com) %in% x,"or"], type = 'l', lwd = 2, col = "purple", ylab = "Landings (mt)", xlab = "")
lines(x, all_2011[,"OR"], lty = 2, col = 1, lwd = 1)
legend("topleft", bty = 'n', legend = c("2020 - Oregon", "2011"), lty = 1:2, lwd = c(3,2), col = c('purple',1), , cex = 1.5)
plot(x, all_com[rownames(all_com) %in% x,"wa"], type = 'l', lwd = 2, col = "green", xlab = "Year", ylab = "Landings (mt)")
lines(x, all_2011[,"WA"], lty = 2, col = 1, lwd = 1)
legend("topleft", bty = 'n', legend = c("2020 - Washington", "2011"), lty = 1:2, lwd = c(3,2), col = c('green',1), , cex = 1.5)
dev.off()