# Bridging Comparison

devtools::load_all("C:/Users/Chantel.Wetzel/Documents/GitHub/r4ss")
wd = "C:/Assessments/2021/dover_sole_2021/models/"

base2011 = SS_output(file.path(wd, "_2011_model"))
convert = SS_output(file.path(wd, "_bridging", "0.0_bridge"))

modelnames <- c("2011", "Convert 3.30.16")
mysummary <- SSsummarize(list(base2011,  convert))

SSplotComparisons(mysummary, 
				  filenameprefix = "0_model_convert_",
				  legendlabels = modelnames, 	
				  plotdir = file.path(wd, "_bridging", "_plots"),
				  pdf = TRUE)

SSplotComparisons(mysummary, 
				  filenameprefix = "model_bridge_",
				  legendlabels = modelnames, 	
				  subplot = c(2,4),
				  plotdir = file.path(wd, "_bridging", "_plots"),
				  print = TRUE,
				  pdf = FALSE)

fleets = SS_output(file.path(wd, "_bridging", "0.1_update_fleet_structure"))
SS_plots(fleets)


modelnames <- c("2011", "Convert 3.30.16", "Fleet Structure")
mysummary <- SSsummarize(list(base2011,  convert, fleets))

SSplotComparisons(mysummary, 
				  filenameprefix = "1_fleet_structure",
				  legendlabels = modelnames, 	
				  plotdir = file.path(wd, "_bridging", "_plots"),
				  pdf = TRUE)

catch1 = SS_output(file.path(wd, "_bridging", "0.2.0_update_catches_2011"))
catch1.1 = SS_output(file.path(wd, "_bridging", "0.2.0_update_catches_2011_correct"))
catch2 = SS_output(file.path(wd, "_bridging", "0.2.1_update_catches_2011_ca_discard"))
SS_plots(catch2, plot = 2)

modelnames <- c("2011", "Convert 3.30.16", "Fleet Structure",
				"Updated Catch", "Updated Catch & CA Discard")
mysummary <- SSsummarize(list(base2011,  convert, fleets, catch1, catch2))

SSplotComparisons(mysummary, 
				  filenameprefix = "2_catches_",
				  legendlabels = modelnames, 	
				  plotdir = file.path(wd, "_bridging", "_plots"),
				  pdf = TRUE)

# AFSC and NWFSC Slope indices not yet updated
indices = SS_output(file.path(wd, "_bridging", "0.3_update_indice_2011"))

modelnames <- c("2011", "Convert 3.30.16", "Fleet Structure",
				"Updated Catch/Discard", "Triennial & WCGBT Indices")
mysummary <- SSsummarize(list(base2011,  convert, fleets, catch2, indices))

SSplotComparisons(mysummary, 
				  filenameprefix = "3_indices_",
				  legendlabels = modelnames, 	
				  plotdir = file.path(wd, "_bridging", "_plots"),
				  pdf = TRUE)

#SS_plots(indices); SS_plots(catch2); SS_plots(pik_rate)
#SS_plots(dis_len); SS_plots(pik_len)
# Discard data
rate = SS_output(file.path(wd, "_bridging", "0.4.0_update_discard_rate_2011"))
pik_rate = SS_output(file.path(wd, "_bridging", "0.4.1_update_pikitch_2011"))
pik_rate_alt = SS_output(file.path(wd, "_bridging", "0.4.1_update_pikitch_2011_1986"))
wghts = SS_output(file.path(wd, "_bridging", "0.4.2_update_discard_weights_2011"))
dis_len = SS_output(file.path(wd, "_bridging", "0.4.3_update_discard_lengths_2011"))
pik_len = SS_output(file.path(wd, "_bridging", "0.4.4_update_pikitch_lengths_2011"))

modelnames <- c("2011", "Convert 3.30.16", "Fleet Structure",
				"Updated Catch/Discard", "Triennial & WCGBT Indices",
				"Discard Rates", "Discard Weights", 
				"Discard Lengths")
mysummary <- SSsummarize(list(base2011,  convert, fleets, catch2, indices,
					          pik_rate, wghts, pik_len))

SSplotComparisons(mysummary, 
				  filenameprefix = "4.0_discard_",
				  legendlabels = modelnames, 	
				  plotdir = file.path(wd, "_bridging", "_plots"),
				  pdf = TRUE)

pik_rate_cv = SS_output(file.path(wd, "_bridging", "0.4.1_update_pikitch_2011_1986_cv"))

modelnames <- c("Triennial & WCGBT Indices",
				"WGCOP", "Pikitch Rates Updated", 
				"Pikitich Rate - 1986", "Pikitch 1986 CV = 0.2")
mysummary <- SSsummarize(list(indices, rate, pik_rate, pik_rate_alt, pik_rate_cv))

SSplotComparisons(mysummary, 
				  filenameprefix = "4.2_discard_",
				  legendlabels = modelnames, 	
				  legendloc = c(0.01, 0.75),
				  plotdir = file.path(wd, "_bridging", "_plots"),
				  pdf = TRUE)

modelnames <- c("2011", "Fleet Structure",
				"Triennial & WCGBT Indices",
				"WCGOP Rates", "Pikitch Rates", "Discard Weights", "WCGOP Lengths", 
				"Pikitch Lengths")
mysummary <- SSsummarize(list(base2011, fleets, indices, rate,
					          pik_rate, wghts, dis_len, pik_len))

SSplotComparisons(mysummary, 
				  filenameprefix = "4.1_discard_",
				  legendlabels = modelnames, 	
				  plotdir = file.path(wd, "_bridging", "_plots"),
				  pdf = TRUE)

#####################################################################
# Lengths
#####################################################################
com_len = SS_output(file.path(wd, "_bridging", "0.5.0_update_com_lengths_2011"))
surv_len = SS_output(file.path(wd, "_bridging", "0.5.1_update_survey_lengths_2011"))
# Apply MI because that is likely what is most similar to 2011 approach
dw_len = SS_output(file.path(wd, "_bridging", "0.5.2_update_dw_2011"))

modelnames <- c("2011", "Convert 3.30.16", "Fleet Structure",
				"Updated Catch/Discard", "Triennial & WCGBT Indices",
				"Discard Rates", "Discard Weights", 
				"Discard Lengths",
				"Commerical Lengths", "Survey Lengths", "Reweighted")
mysummary <- SSsummarize(list(base2011,  convert, fleets, catch2, indices,
					          pik_rate, wghts, pik_len, 
					          com_len, surv_len, dw_len))
SSplotComparisons(mysummary, 
				  filenameprefix = "5.0_lengths_",
				  legendlabels = modelnames, 
				  legendloc = 'bottomleft',	
				  plotdir = file.path(wd, "_bridging", "_plots"),
				  pdf = TRUE)

#####################################################################
# Ages
#####################################################################
com_age = SS_output(file.path(wd, "_bridging", "0.6.0_update_com_ages_2011"))
surv_age = SS_output(file.path(wd, "_bridging", "0.6.1_update_survey_ages_2011"))
# Apply MI because that is likely what is most similar to 2011 approach
dw_age = SS_output(file.path(wd, "_bridging", "0.6.2_update_dw_2011"))

modelnames <- c("2011", "Convert 3.30.16", "Fleet Structure",
				"Updated Catch/Discard", "Triennial & WCGBT Indices",
				"Discard Rates", "Discard Weights", 
				"Discard Lengths",
				"Lengths - Weighted",
				"Com. Ages", "Survey Ages", "Age - Weighted")
mysummary <- SSsummarize(list(base2011,  convert, fleets, catch2, indices,
					          pik_rate, wghts, pik_len, 
					          dw_len,
					          com_age, surv_age, dw_age))
SSplotComparisons(mysummary, 
				  filenameprefix = "6.0_ages_",
				  legendlabels = modelnames, 
				  legendloc = 'bottomleft',	
				  plotdir = file.path(wd, "_bridging", "_plots"),
				  pdf = TRUE)

dw_all = SS_output(file.path(wd, "_bridging", "0.7_update_dw_len_age_2011"))
modelnames <- c("2011", "Convert 3.30.16", "Data Updated (2011)")
mysummary <- SSsummarize(list(base2011,  convert, dw_all))
SSplotComparisons(mysummary, 
				  filenameprefix = "7.0_all_through_2011_",
				  legendlabels = modelnames, 
				  legendloc = 'topright',	
				  plotdir = file.path(wd, "_bridging", "_plots"),
				  pdf = TRUE)

modelnames <- c("2011", "Convert 3.30.16", "Fleet Structure",
				"Catch", "Indices",
				"Discard Rates & Weights", 
				"Lengths",
				"Age")
mysummary <- SSsummarize(list(base2011,  convert, fleets, catch2, indices,
					          wghts, dw_len, dw_age))

SSplotComparisons(mysummary, 
				  filenameprefix = "data_2010_bridge_",
				  legendlabels = modelnames, 	
				  subplot = c(2,4,12),
				  plotdir = file.path(wd, "_bridging", "_plots"),
				  print = TRUE,
				  pdf = FALSE)

#####################################################################
# Data Through 2020!  (Except Commercial Ages)
#####################################################################

catch = SS_output(file.path(wd, "_bridging", "1.1_catch"))
indices = SS_output(file.path(wd, "_bridging", "1.2_index"))
rates = SS_output(file.path(wd, "_bridging", "1.3_rates"))
mn_weights = SS_output(file.path(wd, "_bridging", "1.4_mn_wghts"))
com_len = SS_output(file.path(wd, "_bridging", "1.5_com_lens"))
survey_len = SS_output(file.path(wd, "_bridging", "1.6_survey_lens"))
survey_age = SS_output(file.path(wd, "_bridging", "1.7_survey_ages"))
dw = SS_output(file.path(wd, "_bridging", "1.8_dw"))

modelnames <- c("2011", "+Catch", "+Index", "+Disc. Rates", "+Disc. Wght",
				"+Com. Lengths", "+Surv. Lengths", "+Surv. Ages", "Full DW")
mysummary <- SSsummarize(list(base2011,  convert, dw_all))
SSplotComparisons(mysummary, 
				  filenameprefix = "Data_2020_",
				  legendlabels = modelnames, 
				  legendloc = 'topright',	
				  plotdir = file.path(wd, "_bridging", "_plots"),
				  pdf = TRUE)

survey_age = SS_output(file.path(wd, "_bridging", "1.7.1_survey_ages_no_disc"))

#####################################################################
#
#####################################################################


catch = SS_output(file.path(wd, "_bridging", "1.1_catch"))
indices = SS_output(file.path(wd, "_bridging", "1.2.0_index"))
len = SS_output(file.path(wd, "_bridging", "1.5.1_all_lens_no_discard"))
age = SS_output(file.path(wd, "_bridging", "1.8.0_all_data_disc0"))
all = SS_output(file.path(wd, "_bridging", "1.8.10_all_data_disc_2019"))
mi = SS_output(file.path(wd, "_bridging", "1.9.0_dw_mi"))

modelnames <- c("2011", "+Catch", "+Index", 
				"+Lengths", "+Ages", "+Discard", "All Data")
mysummary <- SSsummarize(list(base2011,  catch, indices,
			 len, age, all, mi))
SSplotComparisons(mysummary, 
				  filenameprefix = "1.1_1.9_all_data_",
				  legendlabels = modelnames, 
				  legendloc = 'topright',	
				  plotdir = file.path(wd, "_bridging", "_plots"),
				  pdf = TRUE)


#####################################################################
# Adding Discard Data Year by Year
# All lengths and ages (except commercial) through 2020 used 
#####################################################################

# Discard plots = 9
# Mean Weights = 10
# Length Fits = 16
# SS_plots( , plot = c(1,9,10,16))

# No discard data after 2009 - no new blocks
data0 = SS_output(file.path(wd, "_bridging", "1.8.0_all_data_disc0"))
# Add 2010 discard data
data10 = SS_output(file.path(wd, "_bridging", "1.8.1_all_data_disc_2010"))
# Add 2011 discard data & Block
data11 = SS_output(file.path(wd, "_bridging", "1.8.2_all_data_disc_2011"))
SS_plots(data10, plot = c(1,9,10,16))
# Add 2012 data
data12 = SS_output(file.path(wd, "_bridging", "1.8.3_all_data_disc_2012"))
SS_plots(data12, plot = c(1,9,10,16))
# Add 2013 data
data13 = SS_output(file.path(wd, "_bridging", "1.8.4_all_data_disc_2013"))
SS_plots(data13, plot = c(1,2,9,10,16))
data14 = SS_output(file.path(wd, "_bridging", "1.8.5_all_data_disc_2014"))
SS_plots(data14, plot = c(1,2,9,10,16))
data15 = SS_output(file.path(wd, "_bridging", "1.8.6_all_data_disc_2015"))
SS_plots(data15, plot = c(1,2,9,10,16))
data16 = SS_output(file.path(wd, "_bridging", "1.8.7_all_data_disc_2016"))
SS_plots(data16, plot = c(1,2,9,10,16))
data17 = SS_output(file.path(wd, "_bridging", "1.8.8_all_data_disc_2017"))
SS_plots(data17, plot = c(1,2,9,10,16))
data18 = SS_output(file.path(wd, "_bridging", "1.8.9_all_data_disc_2018"))
SS_plots(data18, plot = c(1,2,9,10,16))
data19 = SS_output(file.path(wd, "_bridging", "1.8.10_all_data_disc_2019"))
SS_plots(data19, plot = c(1,2,9,10,16))


mi = SS_output(file.path(wd, "_bridging", "1.9.0_dw_mi"))
SS_plots(mi)
# At this point the MI approach seems to be the most reasonable with ok
# selectivity, retention curves and fit to the discard lengths.
francis = SS_output(file.path(wd, "_bridging", "1.9.1_dw_francis"))
SS_plots(francis)
# The francis approach allows the model to not fit the discard lengths in the
# catch share period.
dm = SS_output(file.path(wd, "_bridging", "1.9.2_dw_dm"))
SS_plots(dm)
# The theta values in the DM hitting the upper bound of 1.0
# Fit's and results are generally reasonable, however, the afsc slope male
# selectivity is a bit weird.

modelnames <- c("2011", "2020 Data", "2020 Data-MI", "2020 Data-Francis",
				"2020 Data-Dirichlet")
mysummary <- SSsummarize(list(base2011, data19, mi, francis, dm))
SSplotComparisons(mysummary, 
				  filenameprefix = "9.0_dw_",
				  legendlabels = modelnames, 
				  legendloc = 'topright',	
				  plotdir = file.path(wd, "_bridging", "_plots"),
				  pdf = TRUE)


modelnames <- c("2011", "Update - 2010 Data", "Updata - 2020 Data No Discard", 
				"Update - 2020 All Data")
mysummary <- SSsummarize(list(base2011, dw_age, data0, mi))
SSplotComparisons(mysummary, 
				  filenameprefix = "All_Data_2020_",
				  legendlabels = modelnames, 
				  legendloc = 'topright',	
				  plotdir = file.path(wd, "_bridging", "_plots"),
				  pdf = TRUE)

SS_tune_comps

#########################################################################
# Biology updates
#########################################################################

prior = SS_output(file.path(wd, "_bridging", "2.0_m_priors"))
bio = SS_output(file.path(wd, "_bridging", "2.1_bio_params"))
offsets = SS_output(file.path(wd, "_bridging", "2.2_bio_offsets"))

modelnames <- c( "2011", "Update - 2020 All Data", "M Prior", "Bio Values",
				 "Offset Params")
mysummary <- SSsummarize(list(convert, mi, prior, bio, offsets))
SSplotComparisons(mysummary, 
				  filenameprefix = "12.0_Biology_",
				  legendlabels = modelnames, 
				  legendloc = 'topright',	
				  plotdir = file.path(wd, "_bridging", "_plots"),
				  pdf = TRUE)
