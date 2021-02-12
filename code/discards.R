##############################################################################################################
#
# 	Purpose: Summarize Dover Sole Discard Rates
#
#			  by Chantel Wetzel 
#
##############################################################################################################
library(HandyCode)
library(dplyr)
options(stringsAsFactors = FALSE)

dir = "//nwcfile/FRAM/Assessments/CurrentAssessments/Dover_sole_2021/data/discard_data"
dir.create(file.path(dir, "plots"))

#-----------------------------------------------------------------------------------
# Load the Historical Data
#-----------------------------------------------------------------------------------
load(file.path(dir, "Pikitch et al. Discard Rates and Length information",
	  "Groundfish Tows", "Discard Rates", "Pikitch.et.al.DOVR.Discard.Rates 03 Aug 2020.RData"))
pikitch = Pikitch.et.al.DOVR.Discard.Rates

ncs = read.csv(file.path(dir, 'wcgop', 'dover_OB_DisRatios_boot_ncs_Gear_State_2020-09-28.csv'))
cs = read.csv(file.path(dir, 'wcgop', 'dover_OB_DisRatios_boot_cs_Gear_State_2020-09-28.csv'))
em = read.csv(file.path(dir, 'wcgop', 'dover_DisRatios_noboot_cs_EM_Gears_State_2020-09-28.csv'))


discard_2011 = read.csv(file.path(dir, "2011", "discard_rates_2011.csv"))
plot = FALSE

#============================================================================================================
Explore_Pikitch <- function(dir, plot = FALSE, month = 1, fleet = NA){
	dir.create(file.path(dir, "forSS"))
	if (plot){
		area = unique(pikitch$Areas)
		pngfun(wd = file.path(dir, "plots"), file = "Pikitch_Discards_by_Area.png", w = 12, h = 7, pt = 12)
		par(mfrow = c(2,3))
		for (a in 1:length(area)){
			plot(pikitch$Year[pikitch$Areas==area[a]], pikitch$DiscardRate.Sp.Wt.Wgting[pikitch$Areas==area[a]], 
				ylim = c(-0.05, 0.25), type = 'l', col =1, main = area[a], xlab = "Year", ylab = "Rate")
			lines(pikitch$Year[pikitch$Areas==area[a]], 
				pikitch$DiscardRate.Sp.Wt.Wgting[pikitch$Areas==area[a]] + pikitch$SD.DiscardRate.Sp.Wt.Wgting[pikitch$Areas==area[a]], col = 1, lty = 2)
			lines(pikitch$Year[pikitch$Areas==area[a]], 
				pikitch$DiscardRate.Sp.Wt.Wgting[pikitch$Areas==area[a]] - pikitch$SD.DiscardRate.Sp.Wt.Wgting[pikitch$Areas==area[a]], col = 1, lty = 2)
		}
		dev.off()
	}

	# Pull the values by area 
	area = unique(pikitch$Areas)
	for( a in 1:length(area)){
		out = cbind(pikitch$Year[pikitch$Areas==area[a]], 
					rep(month, length(pikitch$Year[pikitch$Areas==area[a]])),
					rep(fleet, length(pikitch$Year[pikitch$Areas==area[a]])),
					pikitch$DiscardRate.Sp.Wt.Wgting[pikitch$Areas==area[a]], 
					pikitch$SD.DiscardRate.Sp.Wt.Wgting[pikitch$Areas==area[a]])

		colnames(out) = c("Year", "Month", "Fleet", "Discard", "CV")
		write.csv (out, file = file.path(dir, "forSS", paste0("PikitchDiscard_", area[a], ".csv")))  
	}

}


# Pikitch data --------------------------------------------------------------------------------------------
# Use only the area combinded (oregon & washington) pikitch stuff for now
pikitch = pikitch[pikitch$Areas == "2B 2C 3A 3B 3S", ]
# Only 1985 - 87 are the actual data points, the other years are predictions
pikitch = pikitch[pikitch$Year %in% c(1985, 1986, 1987), ]

# Pikitch lengths ---------------------------------------------------------------------------------------

load(file.path(dir, "Pikitch et al. Discard Rates and Length information",
	  "Groundfish Tows", "Length Comps", "Pikitch.et.al.DOVR.Lengths.wt.PacFIN.assm 11 Aug 2020.RData"))
pikitch_lens = Pikitch.et.al.DOVR.Lengths.wt.PacFIN.assm
disc_lens = pikitch_lens[pikitch_lens$Disposition == "Discarded" & pikitch_lens$Areas == "3A 3S_&_3B 2C 2B", ]
# The bins run from 8 to 60 -- no observations in the final bins so cutting
col = which(colnames(disc_lens) == "L.12"):which(colnames(disc_lens) == "L.60")
fem_len  = disc_lens[disc_lens$Sex == "Female", col]
male_len = disc_lens[disc_lens$Sex == "Male", col]

# Not sure of the right way to calculate input sample sizes for these data
# opting to make them relative to the minimum sample
tot = aggregate(disc_lens$Num.Study.Lengths~disc_lens$Year, FUN = sum)
nsamp = round(tot[,2] / min(tot[,2]),0)
# Format the length comps
# Year	Month	Fleet	Sex	Part	Nsamp
year = sort(unique(pikitch_lens$Year))
out = cbind(year, 1, 2, 3, 1, nsamp, 0, 0, fem_len, 0, 0, male_len)
bins = paste0("L", seq(8, 60, 2))
colnames(out) = c("year", "month", "fleet", "sex", "partition", "ninput", bins, bins)

write.csv(out, file.path(dir, "forSS", "pikitch_discard_lengths.csv"), row.names = FALSE)





# The below analysis was for the pre-assessment webinar but was not used in the
# data prep for the assessemnt.
# EM data first --------------------------------------------------------------------------------------------
ret = aggregate(Observed_RETAINED.MTS~ ryear + gear2 + State, data = em, FUN = sum, drop = FALSE)
dis = aggregate(Observed_DISCARD.MTS~ ryear + gear2 + State, data = em, FUN = sum, drop = FALSE)
rates = aggregate(Observed_Ratio~ ryear + gear2 + State, data = em, FUN = sum, drop = FALSE) 

em_df = cbind(ret[,1:3], round(ret$Observed_RETAINED.MTS, 2),
			  round(dis$Observed_DISCARD.MTS,2), round(rates$Observed_Ratio,3))
colnames(em_df) = c('year', 'gear', 'state', 'ret', 'dis', 'rates')
em_df[is.na(em_df)] = 0

# em - lets only look at the trawl data for now
em_df = em_df[em_df$gear == "Trawl", ]
# discarding in the em fleet for dover for now is very low
# this may change in the future given the ability to discard other flatfish in the dover category


# Catch share  --------------------------------------------------------------------------------------------
ret = aggregate(Observed_RETAINED.MTS~ ryear + gear2 + State, data = cs, FUN = sum, drop = FALSE)
dis = aggregate(Observed_DISCARD.MTS~ ryear + gear2 + State, data = cs, FUN = sum, drop = FALSE)
rates = aggregate(Observed_Ratio~ ryear + gear2 + State, data = cs, FUN = sum, drop = FALSE) 

cs_df = cbind(ret[,1:3], round(ret$Observed_RETAINED.MTS, 2),
			  round(dis$Observed_DISCARD.MTS,2), round(rates$Observed_Ratio,3))
colnames(cs_df) = c('year', 'gear', 'state', 'ret', 'dis', 'rates')
cs_df[is.na(cs_df)] = 0

cs_df = cs_df[cs_df$gear == "Trawl", ]


# Non-catch share --------------------------------------------------------------------------------------------
ret = aggregate(Observed_RETAINED.MTS~ ryear + gear2 + State, data = ncs, FUN = sum, drop = FALSE)
dis = aggregate(Observed_DISCARD.MTS~ ryear + gear2 + State, data = ncs, FUN = sum, drop = FALSE)
rates = aggregate(Observed_Ratio~ ryear + gear2 + State, data = ncs, FUN = sum, drop = FALSE) 
sd = aggregate(StdDev.Boot_Ratio ~ ryear + gear2 + State, data = ncs, FUN = sum, drop = FALSE)

hi = qlnorm(0.975, meanlog = log(rates$Observed_Ratio), sdlog = sd$StdDev.Boot_Ratio )
lo = qlnorm(0.025, meanlog = log(rates$Observed_Ratio), sdlog = sd$StdDev.Boot_Ratio )

ncs_df = cbind(ret[,1:3], round(ret$Observed_RETAINED.MTS, 2),
			  round(dis$Observed_DISCARD.MTS,2), round(rates$Observed_Ratio,3), sd$StdDev.Boot_Ratio, lo, hi)
colnames(ncs_df) = c('year', 'gear', 'state', 'ret', 'dis', 'rates', 'sd', 'sd_low', 'sd_hi')
ncs_df[is.na(ncs_df)] = 0

ncs_df = ncs_df[ncs_df$gear == "Trawl", ]
ncs_df = ncs_df[ncs_df$year < 2011, ]



# Plot the rates between 2011 and 2020  ---------------------------------------------
pngfun(wd = file.path(dir, "plots"), file = "WCGOP_discard_rate_comparison.png", w = 12, h = 10, pt = 12)
par(mfrow = c(3,1), mar = c(1,1,0,0), oma = c(6,6,1,1))
plot(cs_df[cs_df$state == "CA", "year"], cs_df[cs_df$state == "CA", "rates"], las = 1,
	type = 'p', axes = FALSE, col = "red", xlab = "", ylab = "", xlim = c(2002, 2019), ylim = c(0, 0.25), cex.lab = 2, cex.axis = 2)
points(discard_2011[discard_2011$Fleet == "ca", "Year"], discard_2011[discard_2011$Fleet == "ca", "Rate"], pch = 24, cex = 2, col = "red")
points(cs_df[cs_df$state == "CA", "year"], cs_df[cs_df$state == "CA", "rates"], pch = 16, col = 'red', cex = 2)
points(ncs_df[ncs_df$state == "CA", "year"], ncs_df[ncs_df$state == "CA" & ncs_df$year <= 2011, "rates"], pch = 16, col = 'red', cex = 2)
#arrows(x0 = ncs_df[ncs_df$state == "CA", "year"], y0 = ncs_df[ncs_df$state == "CA", "sd_low"], 
#	x1 = ncs_df[ncs_df$state == "CA", "year"], y1 = ncs_df[ncs_df$state == "CA", "sd_hi"], 
#	angle = 90, code = 3, length = 0.01, col = 'grey') 
box(); axis(side = 2, las = 1, cex.axis = 2)
legend("topright", bty = 'n', legend = c("2011", "2020"),
	cex = 2, pch = c(24, 16), col = c('red'))
print.letter(xy = c(0.07, 0.10), label = "California", cex = 2)

plot(cs_df[cs_df$state == "OR", "year"], cs_df[cs_df$state == "OR", "rates"], las = 1,
	type = 'p', axes = FALSE, col = "purple", xlab = "", ylab = "", xlim = c(2002, 2019), ylim = c(0, 0.25), cex.lab = 2, cex.axis = 2)
points(discard_2011[discard_2011$Fleet == "or", "Year"], discard_2011[discard_2011$Fleet == "or", "Rate"], pch = 24, cex = 2, col = "purple")
points(cs_df[cs_df$state == "OR", "year"], cs_df[cs_df$state == "OR", "rates"], pch = 16, col = 'purple', cex = 2)
points(ncs_df[ncs_df$state == "OR", "year"], ncs_df[ncs_df$state == "OR" & ncs_df$year <= 2011, "rates"], pch = 16, col = 'purple', cex = 2)
#arrows(x0 = ncs_df[ncs_df$state == "OR", "year"], y0 = ncs_df[ncs_df$state == "OR", "sd_low"], 
#	x1=ncs_df[ncs_df$state == "OR", "year"], y1 = ncs_df[ncs_df$state == "OR", "sd_hi"], 
#	angle = 90, code = 3, length = 0.01, col = 'grey')
box(); axis(side = 2, las = 1, cex.axis = 2) 
print.letter(xy = c(0.05, 0.10), labe = "Oregon", cex = 2)

plot(cs_df[cs_df$state == "WA", "year"], cs_df[cs_df$state == "WA", "rates"], las = 1,
	type = 'p', axes = FALSE, col = "green", xlab = "Year", ylab = "", xlim = c(2002, 2019), ylim = c(0, 0.25), cex.lab = 2, cex.axis = 2)
points(discard_2011[discard_2011$Fleet == "wa", "Year"], discard_2011[discard_2011$Fleet == "wa", "Rate"], pch = 24, cex = 2, col = "green")
points(cs_df[cs_df$state == "WA", "year"], cs_df[cs_df$state == "WA", "rates"], pch = 16, col = 'green', cex = 2)
points(ncs_df[ncs_df$state == "WA", "year"], ncs_df[ncs_df$state == "WA" & ncs_df$year <= 2011, "rates"], pch = 16, col = 'green', cex = 2)
#arrows(x0 = ncs_df[ncs_df$state == "WA", "year"], y0 = ncs_df[ncs_df$state == "WA", "sd_low"], 
#	x1 = ncs_df[ncs_df$state == "WA", "year"], y1 = ncs_df[ncs_df$state == "WA", "sd_hi"], 
#	angle = 90, code = 3, length = 0.01, col = 'grey') 
axis(side = 1, cex.axis = 2); mtext(side = 1, "Year", line = 3.5, cex = 2)
box(); axis(side = 2, las = 1, cex.axis = 2); mtext(side = 2, "Discard Rate", line = 3.5, cex = 2, outer  = TRUE)
print.letter(xy = c(0.07, 0.10), labe = "Washington", cex = 2)
dev.off()


#===================================================================================================
cbind(em[em$gear2 == "Trawl", "State"], 
	round(em[em$gear2 == "Trawl", "Observed_RETAINED.MTS"] / 
	cs[cs$gear2 == "Trawl" & cs$ryear >= 2015, "Observed_RETAINED.MTS"], 2))

round(em[em$gear2 == "Trawl", "Observed_Ratio"], 3)
round(em[em$gear2 == "Trawl", "Observed_DISCARD.MTS"], 2)