###############################################
# 		 STAR Panel Day 1 Requests
###############################################
library(HandyCode)
# Request 3: Look at selex block for the CA fleet in 2003 (RCA intro) or
# starting in 2011.
devtools::load_all("C:/Users/Chantel.Wetzel/Documents/GitHub/r4ss")
wd = "C:/Assessments/2021/dover_sole_2021/models"
savedir = file.path(wd, "_star_panel_requests/day_1_request_3")

model = "7.0.1_base"
base = SS_output(file.path(wd, model))

model = "_star_panel_requests/day_1_request_3/7.0.1_base_selex_ca_2003"
selex_2003 = SS_output(file.path(wd, model))
SS_plots(selex_2003)

model = "_star_panel_requests/day_1_request_3/7.0.1_base_selex_ca_2011"
selex_2011 = SS_output(file.path(wd, model))
SS_plots(selex_2011)

model = "_star_panel_requests/day_1_request_3/7.0.1_base_selex_ca_2011_dw"
selex_2011_dw = SS_output(file.path(wd, model))

model = "_star_panel_requests/day_1_request_3/7.0.1_base_selex_ca_2003_2011"
selex_03_11 = SS_output(file.path(wd, model))
SS_plots(selex_03_11)

model = "_star_panel_requests/day_1_request_3/7.0.1_base_selex_ca_2003_2011_dw"
selex_03_11_dw = SS_output(file.path(wd, model))

modelnames <- c("7.0.1 Base", "CA Block: 2003 - 2020", "CA Block: 2011 - 2020",
				"CA Block: 2011 = 2020 (DW)", "CA Block: 2003 - 2010, 2011 - 2020",
				"CA Block: 2003 - 2010, 2011 - 2020 (DW)")
mysummary <- SSsummarize(list(base, selex_2003, selex_2011, selex_2011_dw, selex_03_11, 
				selex_03_11_dw))

modelnames <- c("Base Model", "CA Block: 2003 - 2020", "CA Block: 2011 - 2020",
				 "CA Block: 2003 - 2010, 2011 - 2020")
mysummary <- SSsummarize(list(base, selex_2003, selex_2011, selex_03_11))
SSplotComparisons(mysummary, 
				  filenameprefix = "Day_1_Request_3_",
				  ylimAdj  = 1.25,
				  legendloc = 'topright', 
				  legendlabels = modelnames, 
				  plotdir = file.path(wd, "_star_panel_requests/day_1_request_3"),
				  pdf = TRUE)

SSplotComparisons(mysummary, 
				  filenameprefix = "Day_1_Request_3_",
				  ylimAdj  = 1.15,
				  legendloc = 'topright', 
				  legendlabels = modelnames, 
				  plotdir = file.path(wd, "_star_panel_requests/day_1_request_3"),
				  subplots = c(2, 4),
				  print = TRUE,
				  pdf = FALSE)

ii = 1:length(modelnames)
n = length(modelnames)
out<- matrix(NA, 24, max(ii))

x = mysummary

out = rbind(
            round(as.numeric(x$likelihoods[x$likelihoods$Label == "TOTAL",1:n]),2), 
            round(as.numeric(x$likelihoods[x$likelihoods$Label == "Survey",1:n]),2), 
            round(as.numeric(x$likelihoods[x$likelihoods$Label == "Length_comp",1:n]),2),
            round(as.numeric(x$likelihoods[x$likelihoods$Label == "Age_comp",1:n]),2), 
            round(as.numeric(x$likelihoods[x$likelihoods$Label == "Recruitment",1:n]),2), 
            round(as.numeric(x$likelihoods[x$likelihoods$Label == "Forecast_Recruitment",1:n]),2),
            round(as.numeric(x$likelihoods[x$likelihoods$Label == "Parm_priors",1:n]),2),
            round(as.numeric(x$pars[x$pars$Label == "SR_LN(R0)", 1:n]),2), 
            round(as.numeric(x$SpawnBio[x$SpawnBio$Label == "SSB_Virgin", 1:n]),0),
            round(as.numeric(x$SpawnBio[x$SpawnBio$Label == "SSB_2021", 1:n]),0),
            round(as.numeric(x$Bratio[x$Bratio$Label == "Bratio_2021", 1:n]),2), 
            round(as.numeric(x$quants[x$quants$Label == "Dead_Catch_SPR", 1:n]),0),
            as.numeric(x$pars[x$pars$Label == "SR_BH_steep", 1:n]),
            round(as.numeric(x$pars[x$pars$Label == "NatM_p_1_Fem_GP_1", 1:n]),3),
            round(as.numeric(x$pars[x$pars$Label == "L_at_Amin_Fem_GP_1", 1:n]),2),
            round(as.numeric(x$pars[x$pars$Label == "L_at_Amax_Fem_GP_1", 1:n]),2),
            round(as.numeric(x$pars[x$pars$Label == "VonBert_K_Fem_GP_1", 1:n]),2),
            round(as.numeric(x$pars[x$pars$Label == "CV_young_Fem_GP_1", 1:n]),2),
            round(as.numeric(x$pars[x$pars$Label == "CV_old_Fem_GP_1", 1:n]),2),
            round(as.numeric(x$pars[x$pars$Label == "NatM_p_1_Fem_GP_1", 1:n]) * exp(as.numeric(x$pars[x$pars$Label == "NatM_p_1_Mal_GP_1", 1:n])),3),
            round(as.numeric(x$pars[x$pars$Label == "L_at_Amin_Fem_GP_1", 1:n])* exp(as.numeric(x$pars[x$pars$Label == "L_at_Amin_Mal_GP_1", 1:n])),2),
            round(as.numeric(x$pars[x$pars$Label == "L_at_Amax_Fem_GP_1", 1:n])* exp(as.numeric(x$pars[x$pars$Label == "L_at_Amax_Mal_GP_1", 1:n])),2),
            round(as.numeric(x$pars[x$pars$Label == "VonBert_K_Fem_GP_1", 1:n])* exp(as.numeric(x$pars[x$pars$Label == "VonBert_K_Mal_GP_1", 1:n])),2),
            round(as.numeric(x$pars[x$pars$Label == "CV_young_Fem_GP_1", 1:n])* exp(as.numeric(x$pars[x$pars$Label == "CV_young_Mal_GP_1", 1:n])),2),
            round(as.numeric(x$pars[x$pars$Label == "CV_old_Fem_GP_1", 1:n])* exp(as.numeric(x$pars[x$pars$Label == "CV_old_Mal_GP_1", 1:n])),2) )  

out = as.data.frame(out)
colnames(out) = modelnames
rownames(out) = c("Total Likelihood",
                  "Survey Likelihood",
                  "Length Likelihood",
                  "Age Likelihood",
                  "Recruitment Likelihood",
                  "Forecast Recruitment Likelihood",
                  "Parameter Priors Likelihood",
                  "log(R0)",
                  "SB Virgin",
                  "SB 2020",
                  "Fraction Unfished 2021",
                  "Total Yield - SPR 30",
                  "Steepness",
                  "Natural Mortality - Female",
                  "Length at Amin - Female",
                  "Length at Amax - Female",
                  "Von Bert. k - Female",
                  "CV young - Female",
                  "CV old - Female",
                  "Natural Mortality - Male",
                  "Length at Amin - Male",
                  "Length at Amax - Male",
                  "Von Bert. k - Male",
                  "CV young - Male",
                  "CV old - Male")

write.csv(out, file = file.path(savedir, "CA_Block_Day_1_Request_3.csv"))

############################################################################################
# Create selectivity plots

# Do 2003 block first
model = selex_2003
fleets = model$FleetNames
test <- SSplotSelex(model, fleets=1, fleetnames=fleets[1], subplot=1, year = c(1984, 1995, 2002, 2020))
test$infotable$longname = c("CA (f): 1910-1984", "CA (m): 1910-1984", 
              "CA (f): 1985-1995", "CA (m): 1985-1995", 
              "CA (f): 1996 - 2002", "CA (m): 1996 - 2002"
              "CA (f): 2003 - 2020", "CA (m): 2003 - 2020")
test$infotable$col <- rich.colors.short(8)[c(1,1)]
test1 <- SSplotSelex(model, fleets=2, fleetnames=fleets[2], year = c(1984, 1995, 2020), subplot=1)
test1$infotable$col <- "red"
test1$infotable$longname = c("OR-WA (f): 1910-1984",   "OR-WA (m): 1910-1984", 
               "OR-WA (f): 1985-1995",   "OR-WA (m): 1985-1995", 
               "OR-WA (f): 1996 - 2020", "OR-WA (m): 1996 - 2020")


test$infotable$col = rep(c("red", "blue"), 4)
test1$infotable$col = rep(c("red", "blue"), 4)
test$infotable$lwd = 2
test1$infotable$lwd = 2

pngfun(wd = savedir, 'ca_selectivity_fishery_2003_block.png', w = 14, h = 7)
par(mfrow=c(1,2),mar=c(2,4,3,1))
#SSplotSelex(mod1, fleets = 1:3, infotable = test$infotable, subplot = 1, showmain = FALSE, legendloc= 'topleft')
SSplotSelex(model, fleets=1,  infotable=test$infotable, 
  subplot=1, legendloc='topleft', showmain=FALSE, year = c(1980, 1995, 2002, 2020))
grid()
SSplotSelex(model, fleets=2, infotable=test1$infotable, 
  subplot=1, legendloc='topleft',showmain=FALSE, year = c(1980, 1995, 2020))
grid()
dev.off()

# 2011 block 
model = selex_2011
fleets = model$FleetNames
test <- SSplotSelex(model, fleets=1, fleetnames=fleets[1], subplot=1, year = c(1984, 1995, 2010, 2020))
test$infotable$longname = c("CA (f): 1910-1984", "CA (m): 1910-1984", 
              "CA (f): 1985-1995", "CA (m): 1985-1995", 
              "CA (f): 1996 - 2010", "CA (m): 1996 - 2010"
              "CA (f): 2011 - 2020", "CA (m): 2011 - 2020")
test$infotable$col <- rich.colors.short(8)[c(1,1)]
test1 <- SSplotSelex(model, fleets=2, fleetnames=fleets[2], year = c(1984, 1995, 2020), subplot=1)
test1$infotable$col <- "red"
test1$infotable$longname = c("OR-WA (f): 1910-1984",   "OR-WA (m): 1910-1984", 
               "OR-WA (f): 1985-1995",   "OR-WA (m): 1985-1995", 
               "OR-WA (f): 1996 - 2020", "OR-WA (m): 1996 - 2020")


test$infotable$col = rep(c("red", "blue"), 4)
test1$infotable$col = rep(c("red", "blue"), 4)
test$infotable$lwd = 2
test1$infotable$lwd = 2

pngfun(wd = savedir, 'ca_selectivity_fishery_2011_block.png', w = 14, h = 7)
par(mfrow=c(1,2),mar=c(2,4,3,1))
#SSplotSelex(mod1, fleets = 1:3, infotable = test$infotable, subplot = 1, showmain = FALSE, legendloc= 'topleft')
SSplotSelex(model, fleets=1,  infotable=test$infotable, 
  subplot=1, legendloc='topleft', showmain=FALSE, year = c(1980, 1995, 2010, 2020))
grid()
SSplotSelex(model, fleets=2, infotable=test1$infotable, 
  subplot=1, legendloc='topleft',showmain=FALSE, year = c(1980, 1995, 2020))
grid()
dev.off()

# 2003 & 2011 block 
model = selex_2003_2011
fleets = model$FleetNames
test <- SSplotSelex(model, fleets=1, fleetnames=fleets[1], subplot=1, year = c(1984, 1995, 2010, 2020))
test$infotable$longname = c("CA (f): 1910-1984", "CA (m): 1910-1984", 
              "CA (f): 1985-1995", "CA (m): 1985-1995", 
              "CA (f): 1996 - 2002", "CA (m): 1996 - 2002"
              "CA (f): 2003 - 2010", "CA (m): 2003 - 2010"
              "CA (f): 2011 - 2020", "CA (m): 2011 - 2020")
test$infotable$col <- rich.colors.short(8)[c(1,1)]
test1 <- SSplotSelex(model, fleets=2, fleetnames=fleets[2], year = c(1984, 1995, 2002, 2010, 2020), subplot=1)
test1$infotable$col <- "red"
test1$infotable$longname = c("OR-WA (f): 1910-1984",   "OR-WA (m): 1910-1984", 
               "OR-WA (f): 1985-1995",   "OR-WA (m): 1985-1995", 
               "OR-WA (f): 1996 - 2020", "OR-WA (m): 1996 - 2020")


test$infotable$col = rep(c("red", "blue"), 4)
test1$infotable$col = rep(c("red", "blue"), 4)
test$infotable$lwd = 2
test1$infotable$lwd = 2

pngfun(wd = savedir, 'ca_selectivity_fishery_2003_2011_block.png', w = 14, h = 7)
par(mfrow=c(1,2),mar=c(2,4,3,1))
#SSplotSelex(mod1, fleets = 1:3, infotable = test$infotable, subplot = 1, showmain = FALSE, legendloc= 'topleft')
SSplotSelex(model, fleets=1,  infotable=test$infotable, 
  subplot=1, legendloc='topleft', showmain=FALSE, year = c(1980, 1995, 2002, 2010, 2020))
grid()
SSplotSelex(model, fleets=2, infotable=test1$infotable, 
  subplot=1, legendloc='topleft',showmain=FALSE, year = c(1980, 1995, 2020))
grid()
dev.off()

#################################################################################################


# Base Model
model_base = base
fleets = model$FleetNames
test_base <- SSplotSelex(model_base, fleets=1, fleetnames=fleets[1], subplot=1, year = c(1984, 1995, 2020))
test_base$infotable$longname = c("CA (f): 1910-1984", "CA (m): 1910-1984", 
              "CA (f): 1985-1995", "CA (m): 1985-1995", 
              "CA (f): 1996 - 2020", "CA (m): 1996 - 2020")
test_base$infotable$col = rep(c("red", "blue"), 3)
test_base$infotable$lwd = 2


# Do 2003 block first
model = selex_2003
fleets = model$FleetNames
test <- SSplotSelex(model, fleets=1, fleetnames=fleets[1], subplot=1, year = c(1984, 1995, 2002, 2020))
test$infotable$longname = c("CA (f): 1910-1984", "CA (m): 1910-1984", 
              "CA (f): 1985-1995", "CA (m): 1985-1995", 
              "CA (f): 1996 - 2002", "CA (m): 1996 - 2002",
              "CA (f): 2003 - 2020", "CA (m): 2003 - 2020")
test$infotable$col = rep(c("red", "blue"), 4)
test$infotable$lwd = 2


# 2011 block 
model_2011 = selex_2011
fleets = model_2011$FleetNames
test_2011 <- SSplotSelex(model_2011, fleets=1, fleetnames=fleets[1], subplot=1, 
		year = c(1984, 1995, 2010, 2020))
test_2011$infotable$longname = c("CA (f): 1910-1984", "CA (m): 1910-1984", 
              "CA (f): 1985-1995", "CA (m): 1985-1995", 
              "CA (f): 1996 - 2010", "CA (m): 1996 - 2010",
              "CA (f): 2011 - 2020", "CA (m): 2011 - 2020")
test_2011$infotable$col = rep(c("red", "blue"), 4)
test_2011$infotable$lwd = 2

# 2003 & 2011 block 
model_both = selex_03_11
fleets = model_both$FleetNames
test_both <- SSplotSelex(model_both, fleets=1, fleetnames=fleets[1], subplot=1, 
	year = c(1984, 1995, 2002, 2010, 2020))
test_both$infotable$longname = c("CA (f): 1910-1984", "CA (m): 1910-1984", 
              "CA (f): 1985-1995", "CA (m): 1985-1995", 
              "CA (f): 1996 - 2002", "CA (m): 1996 - 2002",
              "CA (f): 2003 - 2010", "CA (m): 2003 - 2010",
              "CA (f): 2011 - 2020", "CA (m): 2011 - 2020")
test_both$infotable$col = rep(c("red", "blue"), 5)
test_both$infotable$lwd = 2


pngfun(wd = savedir, 'ca_selectivity_fishery_only.png', w = 16, h = 12)
par(mfrow=c(2,2),mar=c(2,4,3,1))

SSplotSelex(model_base, fleets=1,  infotable=test_base$infotable, 
  subplot=1, legendloc='topleft', showmain=FALSE, year = c(1980, 1995, 2020))
grid()

SSplotSelex(model, fleets=1,  infotable=test$infotable, 
  subplot=1, legendloc='topleft', showmain=FALSE, year = c(1980, 1995, 2002, 2020))
grid()

SSplotSelex(model_2011, fleets=1,  infotable=test_2011$infotable, 
  subplot=1, legendloc='topleft', showmain=FALSE, year = c(1980, 1995, 2010, 2020))
grid()

SSplotSelex(model_both, fleets=1,  infotable=test_both$infotable, 
  subplot=1, legendloc='topleft', showmain=FALSE, year = c(1980, 1995, 2002, 2010, 2020))
grid()

dev.off()


#####################################################################################
# Request #3
#####################################################################################

devtools::load_all("C:/Users/Chantel.Wetzel/Documents/GitHub/nwfscSurvey")
start_dir = "//nwcfile/FRAM/Assessments/CurrentAssessments/Dover_sole_2021"

# NWFSC WCGBTS -----------------------------------------------------------------------------
load(file.path(start_dir, "data", "survey", "wcgbts", "Bio_All_NWFSC.Combo_2020-10-15.rda"))
bio_wcgbt = Data
library(ggplot2)

pngfun(wd = file.path(start_dir, "data", "biology", "plots"), 
	file = "WCGBT_Compare_Lengths_for_Aged_Fish_by_Year.png", w = 12, h = 7, pt = 12)
bio_wcgbt$type = "length"
bio_wcgbt$type[which(!is.na(bio_wcgbt$Age))] = "age"
ggplot(bio_wcgbt, aes(Length_cm, fill = type, color = type)) +
	facet_wrap(facets = c("Year")) +
	geom_density(alpha = 0.4, bw = 1)
dev.off()


devtools::load_all("C:/Users/Chantel.Wetzel/Documents/GitHub/r4ss")
wd = "C:/Assessments/2021/dover_sole_2021/models"
savedir = file.path(wd, "_star_panel_requests/day_1_request_3")

model = "7.0.1_base"
base = SS_output(file.path(wd, model))
model = "_star_panel_requests/day_1_request_3/7.0.1_base_selex_age_based"
age_selex = SS_output(file.path(wd, model))
SS_plots(age_selex)
SS_tune_comps(replist = age_selex, option = "Francis", dir = file.path(wd, model))


modelnames <- c("Base Model", "Age Base Selectivity")
mysummary <- SSsummarize(list(base, age_selex))
SSplotComparisons(mysummary, 
				  filenameprefix = "Day_1_Request_3_Age_Selex_",
				  ylimAdj  = 1.25,
				  legendloc = 'topright', 
				  legendlabels = modelnames, 
				  plotdir = file.path(wd, "_star_panel_requests/day_1_request_3"),
				  pdf = TRUE)