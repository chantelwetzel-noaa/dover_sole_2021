###################################################################################
#
#			Dover sole
#
#############################################################################################

devtools::load_all("C:/Users/Chantel.Wetzel/Documents/GitHub/nwfscSurvey")
devtools::load_all("C:/Users/Chantel.Wetzel/Documents/GitHub/PacFIN.Utilities")
#devtools::load_all("C:/Users/Chantel.Wetzel/Documents/GitHub/HandyCode")
devtools::load_all("C:/Users/Chantel.Wetzel/Documents/GitHub/dataModerate_2021")

start_dir = "//nwcfile/FRAM/Assessments/CurrentAssessments/Dover_sole_2021"

############################################################################################
#	Load Data
############################################################################################
load(file.path(start_dir, "data", "commercial_comps", "pacfin", "PacFIN.DOVR.bds.13.Aug.2020.RData"))
pacfin 	 = PacFIN.DOVR.bds.13.Aug.2020
# There are a handful of weights by washington that look like they are in grams
find = which(pacfin$FISH_WEIGHT > 100) 
pacfin[find, "FISH_WEIGHT"] = pacfin[find, "FISH_WEIGHT"] / 10
pacfin = rename_pacfin(data = pacfin)
# Removing the Oregon special samples from the early years which were not collected using standard
# sampling protocols.  These records do not have total sample weights preventing expansion as well.
remove = which(pacfin$SAMPLE_QUALITY == 63)
pacfin = pacfin[-remove, ]

# Emailed Ali to get guidance on how to deal with SAMPLE_QUALITY == 63 records which is the majority of 
# records prior to 1980.

# NWFSC WCGBTS -----------------------------------------------------------------------------
load(file.path(start_dir, "data", "survey", "wcgbts", "Bio_All_NWFSC.Combo_2020-10-15.rda"))
bio_wcgbt = rename_survey_data(data = Data, survey_name = "nwfsc_wcgbts" )

# Triennial    -----------------------------------------------------------------------------
load(file.path(start_dir,  "data", "survey", "triennial", "Bio_All_Triennial_2020-09-10.rda"))
bio_tri = rename_survey_data(data = Data$Lengths,  survey_name = "triennial"  )

# NWFSC Slope  -----------------------------------------------------------------------------
load(file.path(start_dir,  "data", "survey", "nwfsc_slope", "Bio_All_NWFSC.Slope_2020-09-10.rda"))
bio_nwfsc_slope = rename_survey_data(data = Data,  survey_name = "nwfsc_slope"  )

# AFSC Slope   -----------------------------------------------------------------------------
load(file.path(start_dir, "data", "survey", "afsc_slope", "Dover.AK.28.MAr.2010.dmp"))
load(file.path(start_dir, "data", "survey", "afsc_slope", "AK.Surveys.Bio.Dover.17.Mar.11.dmp"))
format_dat = Format.AKSlope.fn(datTows = Dover.AK.28.MAr.2010, 
						 	   datL = AK.Surveys.Bio.Dover.17.Mar.11,
							   start.year = 1997)
bio_afsc_slope_len = rename_survey_data(data = format_dat$length,  survey_name = "afsc_slope" )
bio_afsc_slope_age = rename_survey_data(data = format_dat$age,  survey_name = "afsc_slope" )


# Create list of all the data sources
input = list()
input[[1]] = pacfin
input[[2]] = bio_wcgbt
input[[3]] = bio_tri
input[[4]] = bio_nwfsc_slope
input[[5]] = bio_afsc_slope_len
input[[6]] = bio_afsc_slope_age

############################################################################################
#	Create data frame with all the input data
############################################################################################
out = create_data_frame(data_list = input)
out$Age = as.numeric(out[,"Age"]) 


############################################################################################
#	Clean the data - look for unusual data points
############################################################################################

# Start with weights
remove = which(out$Weight > 6)
# 900 WA records and 1 OR records
out[remove, "Weight"] = NA

pngfun(wd = file.path(start_dir, "data", "biology", "plots"), file = "Length_Weight_All_Sources.png", w = 7, h = 7, pt = 12)
par(mfrow = c(3,2))
for(s in unique(out$Source)){
	plot(out[out$Source == s, "Length"], out[out$Source == s, "Weight"], main = s, 
		xlim = c(0, 80), ylim = c(0,10), xlab = 'Length (cm)', ylab = 'Weight (kg)')
}
dev.off()

# 2011 Growth Parameters
# 5.40492 # L_at_Amin_Fem_GP_1
# 47.8063  # L_at_Amax_Fem_GP_1
# 0.149724  # VonBert_K_Fem_GP_1
# 9.04059  # L_at_Amin_Mal_GP_1
# 39.9106  # L_at_Amax_Mal_GP_1
# 0.171273  # VonBert_K_Mal_GP_1

out = checkLenAge(Pdata = out, 
   			      Par =  list( 0.15, 45, 8, 0.10, 0.10), 
   			      len_col = "Length", 
   			      age_col = "Age", 
   			      sex_col = "Sex",
   			      mult = 1)

# remove data that are outside the 4*sd interval
remove = which(out$Length < out$Lhat_low | out$Length > out$Lhat_high)
#plot(out$Age, out$Length, type = 'p', col = rgb(0,0,0, alpha = 0.1))
#points(out$Age[remove], out$Length[remove], col = 'red')

out = out[-remove,]

# remove 3 age records that seem unreasonable
quantile(out$Age, na.rm = TRUE)
remove = which(out$Age > 70)
# Year Lat Lon State State_Areas Areas Depth Sex Length Weight Age Fleet Data_Type Source Lhat_pred Lhat_low Lhat_high
# 1988  NA  NA    CA          NA    NA    NA   M   39.3     NA  71  <NA>  RETAINED PacFIN        45       30        61
# 1998  NA  NA    WA          NA    NA    NA   M   34.0     NA  90  <NA>  RETAINED PacFIN        46       31        61
# 2000  NA  NA    CA          NA    NA    NA   M   35.5     NA 113  <NA>  RETAINED PacFIN        46       31        61
out = out[-remove, ]

pngfun(wd = file.path(start_dir, "data", "biology", "plots"), file = "Data_Summary_Len_by_Year.png", w = 7, h = 7, pt = 12)
par(mfrow = c(2, 3), mar = c(4,4,2,2), oma = c(1,1,1,1))
for (ss in c("F", "M")){
	for(aa in sort(unique(out$State))){
		find = which(out$State == aa & out$Sex == ss)
		col = ifelse(ss == "F", alpha('red', 0.15), alpha('blue', 0.15))
		plot(out$Year[find], out$Length[find], type = 'p', col = col,
			ylab = "Length (cm)", xlab = "Year", ylim = c(0, 75), main = aa)
		tmp = aggregate (Length ~ Year, data = out[find,], FUN = median)
		lines(tmp$Year, tmp$Length, lty = 1, col = 1, lwd = 3)	
	}
}
dev.off()

pngfun(wd = file.path(start_dir, "data", "biology", "plots"), file = "Data_Summary_Age_by_Year.png", w = 7, h = 7, pt = 12)
par(mfrow = c(2, 3), mar = c(4,4,2,2), oma = c(1,1,1,1))
for (ss in c("F", "M")){
	for(aa in sort(unique(out$State))){
		find = which(out$State == aa & out$Sex == ss)
		col = ifelse(ss == "F", alpha('red', 0.15), alpha('blue', 0.15))
		plot(out$Year[find], out$Age[find], type = 'p', col = col, 
			ylab = "Age", xlab = "Year", ylim = c(0, 70), main = aa)
		tmp = aggregate (Age ~ Year, data = out[find,], FUN = median)
		lines(tmp$Year, tmp$Age, lty = 1, col = 1, lwd = 3)
	}
}
dev.off()

pngfun(wd = file.path(start_dir, "data", "biology", "plots"), file = "Data_Summary_Len_by_Year_Survey.png", w = 7, h = 7, pt = 12)
par(mfrow = c(2, 3), mar = c(4,4,2,2), oma = c(1,1,1,1))
for (ss in c("F", "M")){
	for(aa in sort(unique(out$State))){
		find = which(out$State == aa & out$Sex == ss & out$Source %in% c("NWFSC_WCGBTS", "Triennial", "NWFSC_Slope", "AFSC_Slope"))
		col = ifelse(ss == "F", alpha('red', 0.15), alpha('blue', 0.15))
		plot(out$Year[find], out$Length[find], type = 'p', col = col,
			ylab = "Length (cm)", xlab = "Year", ylim = c(0, 75), main = aa)
		tmp = aggregate (Length ~ Year, data = out[find,], FUN = median)
		lines(tmp$Year, tmp$Length, lty = 1, col = 1, lwd = 3)	
	}
}
dev.off()


pngfun(wd = file.path(start_dir, "data", "biology", "plots"), file = "Data_Summary_Age_by_Year_Survey.png", w = 7, h = 7, pt = 12)
par(mfrow = c(2, 3), mar = c(4,4,2,2), oma = c(1,1,1,1))
for (ss in c("F", "M")){
	for(aa in sort(unique(out$State))){
		find = which(out$State == aa & out$Sex == ss & out$Source %in% c("NWFSC_WCGBTS"))
		col = ifelse(ss == "F", alpha('red', 0.15), alpha('blue', 0.15))
		plot(out$Year[find], out$Age[find], type = 'p', col = col, 
			ylab = "Age", xlab = "Year", ylim = c(0, 70), main = aa)
		tmp = aggregate (Age ~ Year, data = out[find,], FUN = median)
		lines(tmp$Year, tmp$Age, lty = 1, col = 1, lwd = 3)
	}
}
dev.off()

library(plyr)
out$lat_bin = round_any(out$Lat, 0.5)
pngfun(wd = file.path(start_dir, "data", "biology", "plots"), file = "Len_by_Latitude_WCGBTS.png", w = 7, h = 7, pt = 12)
par(mfrow = c(2, 1), mar = c(4,4,2,2), oma = c(1,1,1,1))
for (ss in c("F", "M")){
	find = which(out$Sex == ss & out$Source %in% c("NWFSC_WCGBTS"))
	col = ifelse(ss == "F", alpha('red', 0.6), alpha('blue', 0.6))
	boxplot(out$Length[find] ~ out$lat_bin[find],  col = col, ylim = c(0, 70),
		ylab = "Length (cm)", xlab = "Latitude", main = ss)
}
dev.off()

pngfun(wd = file.path(start_dir, "data", "biology", "plots"), file = "Age_by_Latitude_WCGBTS.png", w = 7, h = 7, pt = 12)
par(mfrow = c(2, 1), mar = c(4,4,2,2), oma = c(1,1,1,1))
for (ss in c("F", "M")){
	find = which(out$Sex == ss & out$Source %in% c("NWFSC_WCGBTS"))
	col = ifelse(ss == "F", alpha('red', 0.6), alpha('blue', 0.6))
	boxplot(out$Age[find] ~ out$lat_bin[find],  col = col, ylim = c(0, 60),
		ylab = "Age", xlab = "Latitude", main = ss)
}
dev.off()


############################################################################################
# Summarize the remaining data
############################################################################################

data_sum = summarize_data(dir = file.path(start_dir, "data", "biology"), data = out)


############################################################################################
# Estimate Growth Using only Survey data
############################################################################################

survey_dat <- out[out$Source %in% c("NWFSC_WCGBTS", "Triennial", "NWFSC_Slope", "AFSC_Slope"),]

est_growth <- estimate_length_weight(data = survey_dat)

save(est_growth, file = file.path(start_dir, "data", "biology", "growth_estimates_survey.Rdat"))

# 2011
# Females = alpha = 2.805e-6, beta = 3.345
# Males = alpha = 2.231e-6, beta = 3.412
length_weight_plot(dir = file.path(start_dir, "data", "biology"),
				   nm_append = "Survey", data = survey_dat, ests = est_growth)

$NWFSC_WCGBTS_F
     (Intercept) log(data$Length) 
    3.026542e-06     3.325182e+00 

$NWFSC_WCGBTS_M
     (Intercept) log(data$Length) 
    2.596295e-06     3.371055e+00 

data = survey_dat
ests = est_growth
lens = 1:max(data$Length, na.rm = TRUE)
ymax = max(data$Weight, na.rm = TRUE)
xmax = max(data$Length, na.rm = TRUE)

line_col = c("red", 'blue', "grey")
sex_col = c(alpha(line_col[1:2], 0.1), alpha(line_col[3], 0.1))


# Quick comparison of growth
len = 0:70
pngfun(wd = file.path(start_dir, "data", "biology", "plots"), file = "Length_Weight_Comparison_2011_2020.png", w = 7, h = 7, pt = 12)
plot(data[data$Sex == 'F', "Length"], data[data$Sex == 'F', "Weight"], las = 1,
	cex.lab = 1.5, cex.axis = 1.5, cex = 1.5,
     xlab = "Length (cm)", ylab = "Weight (kg)", main = "", 
     ylim = c(0, ymax), xlim = c(0, xmax), pch = 1, col = sex_col[1]) 
points(data[data$Sex == 'M', "Length"], data[data$Sex == 'M', "Weight"], pch = 1, col = sex_col[2])
lines(len, est_growth$NWFSC_WCGBTS_F[1] * len ^ est_growth$NWFSC_WCGBTS_F[2], col = 'red', lwd = 2)
lines(len, est_growth$NWFSC_WCGBTS_M[1] * len ^ est_growth$NWFSC_WCGBTS_M[2], col = 'blue', lwd = 2)
lines(len, 2.805e-6 * len ^ 3.345, col = 'red', lwd = 2, lty = 2)
lines(len, 2.231e-6 * len ^ 3.412, col = 'blue', lwd = 2, lty = 2)
legend("topleft", bty = 'n', legend = c("F - 2020", "M - 2020", "F - 2011", "M - 2020"), col = (rep(c('red', 'blue'),2)), lty = c(1,1,2,2), lwd = 2)
dev.off()
############################################################################################
#	Comparison between lengths by sex and across data sources
############################################################################################

length_freq_plot(dir = file.path(start_dir, "data", "biology"), data = out, ylim = c(0, 0.20))

length_by_depth_plot(dir = file.path(start_dir, "data", "biology"), data = out)


############################################################################################
# Estimate Length-at-Age Using only Survey data
############################################################################################

len_age <- estimate_length_age(data = survey_dat)
len_age_all <- estimate_length_age(data = out)

save(len_age, 
	file = file.path(start_dir, "data", "biology", "length_age_estimates_survey.Rdat"))

length_age_plot(dir = file.path(start_dir, "data", "biology"), 
				data = survey_dat, nm_append = "Survey", ests = len_age)

length_age_plot(dir = file.path(start_dir, "data", "biology"), 
				data = out, nm_append = "All", ests = len_age_all)

line_col = c("red", 'blue')
sex_col = alpha(line_col, 0.15)
keep = which(!is.na(out$Age))
tmp = out[keep, ]
lens = 1:max(tmp$Length, na.rm = TRUE)
xmax = max(tmp$Age + 2,    na.rm = TRUE)
ymax = max(tmp$Length + 2, na.rm = TRUE)

# 2011 Assessment Estimates
# 5.40492 # L_at_Amin_Fem_GP_1
# 47.8063 # L_at_Amax_Fem_GP_1
# 0.149724 # VonBert_K_Fem_GP_1
# # Sex: 2  BioPattern: 1  Growth
#  9.04059 # L_at_Amin_Mal_GP_1
# 39.9106   # L_at_Amax_Mal_GP_1
# 0.171273  # VonBert_K_Mal_GP_1


pngfun(wd = file.path(start_dir, "data", "biology", "plots"), file = "Length_Age_by_Sex_with_2011_Ests.png", w = 7, h = 7, pt = 12)
par(mfrow = c(1, 1))
plot(tmp[tmp$Sex == "F", "Age"], tmp[tmp$Sex == "F", "Length"], xlab = "Age", ylab = "Length (cm)",
	xaxs = "i", yaxs = "i", ylim = c(0, ymax), xlim = c(0, xmax), pch = 1, col = sex_col[1]) 
points(tmp[tmp$Sex == "M", "Age"], tmp[tmp$Sex == "M", "Length"], pch = 1, col = sex_col[2])
lines(0:ymax, vb_fn(age = 0:ymax, Linf = len_age$all_F[1], L0 = len_age$all_F[2], k = len_age$all_F[3]), 
	col = line_col[1], lty = 2, lwd = 2)
lines(0:ymax, vb_fn(age = 0:ymax, Linf = len_age$all_M[1], L0 = len_age$all_M[2], k = len_age$all_M[3]), 
	col = line_col[2], lty = 2, lwd = 2)	
# 2011 Assessment parameters
lines(0:xmax, vb_fn(age = 0:xmax, Linf = 47.8, L0 = 5.4, k = 0.15), col = 'red',  lty = 3, lwd = 2)
lines(0:xmax, vb_fn(age = 0:xmax, Linf = 39.9, L0 = 9.0, k = 0.17), col = 'blue', lty = 3, lwd = 2) 
# Love unpublished 
leg = c(paste0("F : Linf = ", round(len_age$all_F[1], 1),  " L1 = ", round(len_age$all_F[2], 1)," k = ", round(len_age$all_F[3], 3)),
		paste0("M : Linf = ", round(len_age$all_M[1], 1),  " L1 = ", round(len_age$all_M[2], 1)," k = ", round(len_age$all_M[3], 3)),
		"F: 2011 Assessment", "M: 2011 Assessment" )
legend("bottomright", bty = 'n', legend = leg, lty = c(2,2,3,3,4), col = c(rep(line_col,2), "springgreen4"), lwd = 2)
dev.off()

############################################################################################
# Double check the distribution of all lengths vs. the ages
############################################################################################

pngfun(wd = file.path(start_dir, "data", "biology", "plots"), file = "Compare_Lengths_for_Aged_Unaged_Fish.png", w = 7, h = 7, pt = 12)
par(mfrow = c(2,2))
for(sex in c("F", "M")){
	hist(out[out$Sex == sex, "Length"], xlim = c(0, 60),  xlab = "Length (cm)", 
		col = ifelse(sex == "F", alpha('red', 0.65), alpha('blue', 0.5)), main = paste0("All Fish Lengths: ", sex))
	abline(v = median(out[out$Sex == sex, "Length"], na.rm = TRUE), lty = 2, lwd = 3, col = 1)
}
for(sex in c("F", "M")){
	find = which(!is.na(out$Age) & out$Sex == sex)
	hist(out[find, "Length"], , xlim = c(0, 60), xlab = "Length (cm)", 
		col = ifelse(sex == "F", alpha('red', 0.65), alpha('blue', 0.5)), main = paste0("Aged Fish Lengths: ", sex))
	abline(v = median(out[find, "Length"], na.rm = TRUE), lty = 2, lwd = 3, col = 1)
}
dev.off()

############################################################################################
# Double check the distribution of all lengths vs. the ages by source
############################################################################################
pngfun(wd = file.path(start_dir, "data", "biology", "plots"), file = "Compare_Lengths_for_Aged_Unaged_Fish_by_Source.png", w = 7, h = 7, pt = 12)
n = sort(c("PacFIN", "NWFSC_WCGBTS", "NWFSC_Slope",  "AFSC_Slope"))
par(mfrow = c(2, length(n)))
for(source in n){
	tmp2 = out[which(out$Source == source), ]
	ymax = max(table(tmp2$Sex)) / 2
	hist(tmp2[tmp2$Sex == "F", "Length"], xlim = c(0, 60), ylim = c(0, ymax), xlab = "Length (cm)", col = alpha('red', 0.5), main = paste(source, ": All Lengths"))
	hist(tmp2[tmp2$Sex == "M", "Length"], xlim = c(0, 60), ylim = c(0, ymax), xlab = "Length (cm)", col = alpha('blue', 0.5), add = TRUE)
	mtext(side = 3, "All Fish Lengths", outer = TRUE)
	abline(v = median(tmp2[tmp2$Sex == "F", "Length"], na.rm = TRUE), lty = 2, lwd = 3, col = 'red')
	abline(v = median(tmp2[tmp2$Sex == "M", "Length"], na.rm = TRUE), lty = 2, lwd = 3, col = 'blue')
}
for(source in n){
	find = which(!is.na(out$Age) & out$Source == source)
	tmp3 = out[find, ]
	ymax = max(table(tmp3$Sex)) / 2
	hist(tmp3[tmp3$Sex == "F", "Length"], xlim = c(0, 60), ylim = c(0, ymax), xlab = "Length (cm)", col = alpha('red', 0.5) , main = "Lengths of Aged Fish")
	hist(tmp3[tmp3$Sex == "M", "Length"], xlim = c(0, 60), ylim = c(0, ymax), xlab = "Length (cm)", col = alpha('blue', 0.5), add = TRUE)
	mtext(side = 3, "All Aged Fish Lengths", outer = TRUE)
	abline(v = median(tmp3[tmp3$Sex == "F", "Length"], na.rm = TRUE), lty = 2, lwd = 3, col = 'red')
	abline(v = median(tmp3[tmp3$Sex == "M", "Length"], na.rm = TRUE), lty = 2, lwd = 3, col = 'blue')
}
dev.off()

#tmp = out[which(out$Source %in% c("NWFSC_WCGBTS", "NWFSC_Slope",  "AFSC_Slope")), ]
#l = ggplot(tmp, aes(Length, fill = Source, color = Source)) +
#		geom_density(alpha = 0.4, lwd = 0.8, adjust = 0.5, bw = 1)
#tmp2 = tmp[which(!is.na(tmp$Age)), ]
#a = ggplot(tmp2, aes(Length, fill = Source, color = Source)) +
#		geom_density(alpha = 0.4, lwd = 0.8, adjust = 0.5, bw = 1)
#figure = ggpubr::ggarrange(l, a, labels = c("All Lengths", "Lengths of Aged Fish"))

pngfun(wd = file.path(start_dir, "data", "biology", "plots"), file = "Survey_Compare_Lengths_for_Aged_Fish_ggplot.png", w = 12, h = 7, pt = 12)


out$type = "length"
out$type[which(!is.na(out$Age))] = "age"
#pngfun(wd = file.path(start_dir, "data", "biology", "plots"), 
#	file = "All_by_State_Compare_Lengths_for_Aged_Fish_ggplot_3_6.png", w = 12, h = 7, pt = 12)
ggplot(out[which(out$Source != "Triennial"),], aes(Length, fill = type, color = type)) +
	facet_wrap(facets = c("Source", "State"), nrow = 2, ncol = 6) +
	geom_density(alpha = 0.4, lwd = 0.8, adjust = 0.5, bw = 1)
dev.off()

############################################################################################
# Look at lengths by areas
# The estimated length-at-age parameters are fairly different for other studies looking
# at California fish.  What do the CA lengths look like relative to OR and WA?
############################################################################################
check = aggregate(Length ~ State + Sex, data = out, FUN = function(x) quantile(x, 0.99, na.rm = TRUE))
check[sort(check$State, index.return = TRUE)$ix, ]
# State Sex Length
#    CA   F 51.000
#    CA   M 45.100
#    CA   U 51.432
#    OR   F 55.000
#    OR   M 45.000
#    OR   U 50.320
#    WA   F 57.000
#    WA   M 46.000
#    WA   U 56.000


data_hist(dir = file.path(start_dir, "data", "biology", "plots"), 
		  data = out, 
		  data_type = "Length", 
		  group_column = "State", 
	 	  fleet_column = "Source", 
	 	  ymax = c(0.1, 0.1, 0.1), 
	 	  do_abline = TRUE)



pngfun(wd = file.path(dir, "data", "biology", "plots"), file = "Length_by_Sex_State.png", w = 12, h = 7, pt = 12)
ggplot(out, aes(Length, fill = Sex, color = Sex)) +
	facet_wrap(facets = c("State")) + #, "Source")) +
	#scale_color_manual(values = c("F" = alpha('red',0.5), "M" = alpha('blue', 0.5), "U" = alpha('black', 0.2))) 
	geom_density(alpha = 0.4, lwd = 0.8, adjust = 0.5, bw = 1)
dev.off()

pngfun(wd = file.path(dir, "data", "biology", "plots"), file = "Length_by_Sex_Source.png", w = 12, h = 7, pt = 12)
tmp = out[which(out$Source != "AFSC_Slope"),]
ggplot(tmp, aes(Length, fill = Sex, color = Sex)) +
	facet_wrap(facets = c("Source")) + #, "Source")) +
	#scale_color_manual(values = c("F" = alpha('red',0.5), "M" = alpha('blue', 0.5), "U" = alpha('black', 0.2))) 
	geom_density(alpha = 0.4, lwd = 0.8, adjust = 0.5, bw = 1)
dev.off()

pngfun(wd = file.path(start_dir, "data", "biology", "plots"), file = "Length_by_Sex_State_Source.png", w = 12, h = 7, pt = 12)
tmp = out[which(!out$Source %in% c("Triennial", "AFSC_Slope") & out$Sex != "U"),]
ggplot(tmp, aes(Length, fill = Sex, color = Sex)) +
	facet_wrap(facets = c("State", "Source")) + #, "Source")) +
	#scale_color_manual(values = c("F" = alpha('red',0.5), "M" = alpha('blue', 0.5), "U" = alpha('black', 0.2))) 
	geom_density(alpha = 0.4, lwd = 0.8, adjust = 0.5, bw = 1)
dev.off()

pngfun(wd = file.path(start_dir, "data", "biology", "plots"), file = "Length_by_Sex_State_PacFIN.png", w = 12, h = 7, pt = 12)
tmp = out[which(out$Source %in% c("PacFIN") & out$Sex != "U"),]
ggplot(tmp, aes(Length, fill = Sex, color = Sex)) +
	facet_wrap(facets = c("State")) + #, "Source")) +
	#scale_color_manual(values = c("F" = alpha('red',0.5), "M" = alpha('blue', 0.5), "U" = alpha('black', 0.2))) 
	geom_density(alpha = 0.4, lwd = 0.8, adjust = 0.5, bw = 1)
dev.off()

pngfun(wd = file.path(start_dir, "data", "biology", "plots"), file = "Age_by_Sex_State_PacFIN.png", w = 12, h = 7, pt = 12)
tmp = out[which(out$Source %in% c("PacFIN") & out$Sex != "U"),]
ggplot(tmp, aes(Age, fill = Sex, color = Sex)) +
	facet_wrap(facets = c("State")) + #, "Source")) +
	#scale_color_manual(values = c("F" = alpha('red',0.5), "M" = alpha('blue', 0.5), "U" = alpha('black', 0.2))) 
	geom_density(alpha = 0.4, lwd = 0.8, adjust = 0.5, bw = 1)
dev.off()


# Remove 3 crazy ages to improve plotting
remove = which(out$Age > 70)
out = out[-remove, ]

pngfun(wd = file.path(dir, "data", "biology", "plots"), file = "Age_by_Sex_Source.png", w = 12, h = 7, pt = 12)
tmp = out[which(!out$Source %in% c("Triennial", "AFSC_Slope") & out$Sex != "U"),]
ggplot(tmp, aes(Age, fill = Sex, color = Sex)) +
	facet_wrap(facets = c("Source")) + #, "Source")) +
	#scale_color_manual(values = c("F" = alpha('red',0.5), "M" = alpha('blue', 0.5), "U" = alpha('black', 0.2))) 
	geom_density(alpha = 0.4, lwd = 0.8, adjust = 0.5, bw = 1)
dev.off()

pngfun(wd = file.path(start_dir, "data", "biology", "plots"), file = "Age_by_Sex_State_Source.png", w = 12, h = 7, pt = 12)
tmp = out[which(!out$Source %in% c("Triennial", "AFSC_Slope") & out$Sex != "U"),]
ggplot(tmp, aes(Age, fill = Sex, color = Sex)) +
	facet_wrap(facets = c("State", "Source")) + #, "Source")) +
	#scale_color_manual(values = c("F" = alpha('red',0.5), "M" = alpha('blue', 0.5), "U" = alpha('black', 0.2))) 
	geom_density(alpha = 0.4, lwd = 0.8, adjust = 0.5, bw = 1)
dev.off()

aggregate(Length~State+Sex, data = out[which(out$Source == "PacFIN" & out$Sex != "U" & out$Year > 1990),], FUN = function(x) quantile(x, c(0.025,0.25, 0.50, 0.75, 0.975)) )
aggregate(Age~State+Sex, data = out[which(out$Source == "PacFIN" & out$Sex != "U" & out$Year > 1990),], FUN = function(x) quantile(x, c(0.025,0.25, 0.50, 0.75, 0.975)) )

aggregate(Length~State+Sex+Source, data = out[which(out$Sex != "U" & out$Year > 1990),], FUN = function(x) quantile(x, c(0.025,0.25, 0.50, 0.75, 0.975)) )
aggregate(Age~State+Sex+Source, data = out[which(out$Sex != "U" & out$Year > 1990),], FUN = function(x) quantile(x, c(0.025,0.25, 0.50, 0.75, 0.975)) )



plot(out[which(out$State == "CA" & out$Source == "PacFIN"), "Age"],
	out[which(out$State == "CA" & out$Source == "PacFIN"), "Length"], 
	col = alpha('red', 0.40), ylim = c(0, 80), xlim = c(0, 70))
points(out[which(out$State == "OR" & out$Source == "PacFIN"), "Age"],
	out[which(out$State == "OR" & out$Source == "PacFIN"), "Length"], 
	col = alpha('orange', 0.40))
points(out[which(out$State == "WA" & out$Source == "PacFIN"), "Age"],
	out[which(out$State == "WA" & out$Source == "PacFIN"), "Length"], 
	col = alpha('blue', 0.40))





