
dir = dir = "//nwcfile/FRAM/Assessments/CurrentAssessments/Dover_sole_2021/data"

library(nwfscSurvey)


# load the 3 data files:
discard.cs = read.csv(file.path(dir, 'discard_data', "dover_OB_DisRatios_boot_cs_Gear_North_South_2021-01-19.csv"))
discard.ncs= read.csv(file.path(dir, 'discard_data', "dover_OB_DisRatios_boot_ncs_Gear_North_South_2021-01-19.csv"))
discard.em = read.csv(file.path(dir, 'discard_data', "dover_DisRatios_noboot_cs_EM_Gears_North_South_2021-01-19.csv"))

# Load in the PacFIN catch which is used to weight the discard rates
# Washington state has provided a catch series for the PacFIN years, but the recent years
# which this runs over is nearly identical to PacFIN so using these values because they can
# be broken down by gear.

load(file.path("PacFIN.DOVR.Catch.INPFC.28.Jan.2021.RData"))
catch <- PacFIN.POP.Catch.INPFC.23.Dec.2016


#GetDiscards(catch, discard.ncs, discard.cs, total = FALSE, input.cs.cv = 0.05)
#GetDiscards(catch, discard.ncs, discard.cs, total = TRUE,  input.cs.cv = 0.05)
#Explore_Pikitch(plot = FALSE, month = 7, fleet = 1)

GetDiscards <- function(catch, discard.ncs, discard.cs, total = TRUE, month = 7, fleet = 1, input.cs.cv ){
	# catch = input catch file from PacFIN
	# discard.ncs = discard csv from the non-catch share sector
	# discard.cs  = discard cv from the catch-share sector
	# total = TRUE is you want to use discard totals in SS, FALSE for discard rates
	# month = sampling month for SS
	# fleet = fishery fleet for the discards, currently only set up to have fleet based on pop
	# input.cs.cv = assumed value for the uncertainty surrounding the catch share discards, assumed to be low < 0.05

	# Subset for on the years
	ind = catch$YEAR >= min(discard.ncs$ryear)
	catch = catch[ind,]
	catch$mt = catch$CATCH.KG * 0.001

	# Determine the percent of catches that are catch share vs. non catch share
	catch$fleet <- rep(NA, nrow(catch))
	catch$fleet[catch$GRID %in% c("BMT","BTT","CBF","CBJ","DNT","FFT","FTS","GFL","GFS","GFT","LFZ","MDT","MPT","OTW","PRT","RLT","SFZ",
								  "SRM","TWL")] <- "TWL"
	catch$fleet[catch$GRID %in% c("DST", "PWT","SHT","SST", "TWS")] <- "TWS"
	catch$fleet[catch$GRID %in% c("DRL","HDL","HLR","JIG","LGL","OHL","POL","STL","VHL","HKL")] <- "HKL"
	catch$fleet[catch$GRID %in% c("DGN","DPN","GLN","ONT","SEN","SGN","STN","TML","NET")] <- "NET"
	catch$fleet[catch$GRID %in% c("CLP","CPT","FPT","LPT","OPT","PRW","SPT","POT")] <- "POT"
	catch$fleet[catch$GRID %in% c("BTR", "DVG", "TRL")] <- "OTH"	
	
	catch$fleet.comb <- rep(NA, nrow(catch))
	catch$fleet.comb[catch$fleet %in% c("HKL", "NET", "OTH", "POT", "TWS")] <- "NTWL"
	catch$fleet.comb[catch$fleet %in% c("TWL")] <- "TWL"

	temp = aggregate(mt ~ YEAR + fleet.comb, sum, data = catch)

	ind = which(temp$fleet.comb == "NTWL")
	catch.ncs = temp[ind,]
	catch.cs = temp[-ind,]


	if (total == TRUE){
		discard.ncs$use.value = discard.ncs$Observed_DISCARD.LBS * 0.000453592
		discard.cs$use.value  = discard.cs$Observed_DISCARD.LBS * 0.000453592
		discard.ncs$use.cv = discard.ncs$CV.Boot_DISCARD.LBS
	}

	if (total == FALSE){ # This will pull the ratio values
		discard.ncs$use.value = discard.ncs$Observed_Ratio
		discard.cs$use.value  = discard.cs$Observed_Ratio
		discard.ncs$use.cv = discard.ncs$CV.Boot_Ratio
	}

	#Prior to 2011 all discard is non-catch share based
	ind = discard.ncs$ryear < 2011
	pre.cs.disc = discard.ncs$use.value[ind]
	pre.cs.cv = discard.ncs$use.cv[ind]

	yrs = 2011:max(discard.cs$ryear)

	prop.ncs = as.matrix( subset(catch.ncs, catch.ncs$YEAR >= yrs[1], "mt") / 
					(subset(catch.ncs, catch.ncs$YEAR >= yrs[1], "mt") + subset(catch.cs, catch.cs$YEAR >= yrs[1], "mt")) )
	prop.cs  = as.matrix( subset(catch.cs, catch.cs$YEAR >= yrs[1], "mt") / 
					(subset(catch.ncs, catch.ncs$YEAR >= yrs[1], "mt") + subset(catch.cs, catch.cs$YEAR >= yrs[1], "mt")) )
	cs.disc  = cs.cv = NULL
	for (y in 1:length(yrs)){

		yy = yrs[y]
		xx = discard.ncs$ryear==yy
		temp1 = discard.ncs[xx,]

		xx = discard.cs$ryear==yy
		temp2 = discard.cs[xx]

		cs.disc = c(cs.disc,
					temp1$use.value*prop.ncs[y] + temp2$use.value*prop.cs[y])

		cs.cv = c(cs.cv,
					temp1$use.cv*prop.ncs[y] + input.cs.cv*prop.cs[y])

	}

	# Create data file to be used in SS
	out = cbind(discard.ncs$ryear, 
				rep(month, dim(discard.ncs)[1]),
				rep(fleet, dim(discard.ncs)[1]),
				c(pre.cs.disc, cs.disc),
				c(pre.cs.cv, cs.cv) )

	colnames(out) = c("Year", "Month", "Fleet", "Discard", "CV")
	if (total) { write.csv (out, file = "forSS/Discards_total_forSS.csv")  }
	if (!total) { write.csv (out, file = "forSS/Discards_rates_forSS.csv")  }

}
