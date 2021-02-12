###########################################################################
#
#     Format the WCGOP Length Frequencies & Mean Weights for SS
#					Dover sole 2021
#		       Written by Chantel Wetzel
#
##########################################################################


wd = "//nwcfile/FRAM/Assessments/CurrentAssessments/Dover_sole_2021/data/discard_data"

# This is length frequency sheet provided by Andi put in a csv file
len  = read.csv(file.path(wd, "dover_2021_length_frequency_itq_only.csv"), header = TRUE)
samp = read.csv(file.path(wd, "dover_2021_lf_sample_size_itq_only.csv"), header = TRUE)
wgts = read.csv(file.path(wd, "dover_2021_mean_weights_itq_only.csv"), header = TRUE)

# Remove the "other" gear records and only use bottom trawl
len = len[len$Gear == "TRAWL", ]
len$name = paste0(len$Gear, "_", len$State)
fleet = sort(unique(len$name))[1:2]
len_bins = unique(len$Lenbin)
sex = 0
part = 1
Nsamp = "NA"
month = 1

#samp$name = paste0(samp$Fleet, "_", samp$Season)
samp = samp[samp$Gear == "TRAWL", ]
samp$fleet = paste0(samp$Gear, "_", samp$State)

# Grab the frequencies by fleet
tmp = NULL
for(a in fleet){

	d = len[len$name == a, ]
	yind = unique(d$Year)

	for (y in yind){
		prop = d[d$Year == y, "Prop.wghtd"]
		fleet_num = ifelse(a == "TRAWL_CA", 1, 2)

		ind = which(samp$fleet == a & samp$Year == y)

		Ninput = round(ifelse(samp$N_Fish[ind] / samp$N_unique_Trips[ind] < 44,
					   samp$N_unique_Trips[ind] + 0.138 * samp$N_Fish[ind],
					   7.06 * samp$N_unique_Trips[ind]), 0)

		tmp = rbind(tmp,
					c(y, month, fleet_num, sex, part, Ninput, prop, prop))
	}
}

colnames(tmp) = c("Year", "Month", "Fleet", "Sex", "Part", "Nsamp", len_bins, len_bins)
write.csv(tmp, file = paste0(wd, "/forSS/v2_DiscardLengths_BT_Only_for_SS.csv"), row.names = FALSE)


################################################################################
# Process and calculate mean weights
################################################################################
wgts = wgts[wgts$Gear == "TRAWL", ]
wgts$fleet = paste0(wgts$Gear, "_", wgts$State)
month = 1 
part = 1
type = 2
fleet = 1:2

# Convert pounds to kilograms
wgts$ave_wt_kg = wgts$Wghtd.AVG_W * 0.453592
wgts$CV = wgts$Wghtd.AVG_W.SD / wgts$Wghtd.AVG_W
wgts$SD = wgts$Wghtd.AVG_W.SD / 2.205 #/ wgts$Wghtd.AVG_W
wgts$altSD = wgts$AVG_WEIGHT.SD
wgts$check = (wgts$Wghtd.AVG_W.SD / wgts$ave_wt_kg) / 2.205

use = c("CV", "SD", "check")[1]

ind = which(wgts$fleet == "TRAWL_CA")
ca = cbind(wgts[ind,"Year"], month, fleet[1], part, type, wgts[ind,"ave_wt_kg"], wgts[ind,use])

ind = which(wgts$fleet == "TRAWL_WA-OR")
or_wa = cbind(wgts[ind,"Year"], month, fleet[2], part, type, wgts[ind,"ave_wt_kg"], wgts[ind,use])

out = rbind(round(ca, 3),
			round(or_wa, 3))

colnames(out) = c("#Year", "Month", "Fleet", "Part", "Type", "Ob", use)
write.csv(out, file = file.path(wd, "forSS", paste0("v2_Discard_Avg_Wts_BT_Only_for_SS_", use, ".csv")), row.names = FALSE)

