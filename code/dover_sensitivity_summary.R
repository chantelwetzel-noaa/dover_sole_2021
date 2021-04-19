########################################################
# Create Sensitivity table for Dover sole 2021
#   written by : Chantel Wetzel

#Add aggregated sensitivity summary plots for data and
#model sensitivities (following Cope and Gertseva 2020)

#note that teh sourced file (sensi_plot_Dover) is a slight
#adaptation of r4ss SS_Sensi_plot for use with Dover
########################################################

library(r4ss)
library(sa4ss)
#devtools::load_all("C:/Users/Chantel.Wetzel/Documents/GitHub/r4ss")
source("sensi_plot_Dover.R")

base_model = "7.0.1_base"

wd = file.path("C:/Assessments/2021/dover_sole_2021/models", "_sensitivities")
wd = "//nwcfile/FRAM/Assessments/CurrentAssessments/Dover_sole_2021/models/_sensitivities"
#wd = file.path("C:\\Users\\Aaron.Berger\\Documents\\AMB\\Groundfish\\Assessments\\Dover Sole\\2021\\Models\\Base\\_sensitivities")

setwd(wd)
out.dir = wd
base.loc = file.path("C:/Assessments/2021/dover_sole_2021/models", base_model)
base.loc = file.path("//nwcfile/FRAM/Assessments/CurrentAssessments/Dover_sole_2021/models", base_model)
#base.loc=file.path("C:\\Users\\Aaron.Berger\\Documents\\AMB\\Groundfish\\Assessments\\Dover Sole\\2021\\Models\\Base", base_model)

model.list <- c(paste0(base_model, "_remove_CA_length"), #1
                paste0(base_model, "_remove_ORWA_length"), #2
                paste0(base_model, "_remove_AFSCslope_length"), #3
                paste0(base_model, "_remove_Triennial_length"), #4
                paste0(base_model, "_remove_NWFSCslope_length"), #5
                paste0(base_model, "_remove_NWFSCwcgbt_length"), #6
                paste0(base_model, "_remove_CA_ages"), #7
                paste0(base_model, "_remove_ORWA_ages"), #8
                paste0(base_model, "_remove_NWFSCslope_ages"),  #9
                paste0(base_model, "_remove_NWFSCwcgbt_ages"), #10
                paste0(base_model, "_remove_AFSCslope_index"), # 11
                paste0(base_model, "_remove_Triennial_index"), #12
                paste0(base_model, "_remove_NWFSCslope_index"), #13
                paste0(base_model, "_remove_NWFSCwcgbt_index"), #14
                paste0(base_model, "_est_m"), #15
                paste0(base_model, "_est_Lorenz_m"), #16
                paste0(base_model, "_median_prior_m"), #17
                paste0(base_model, "_2011_m"), #18
                paste0(base_model, "_2011_fishery_select"), #19
                paste0(base_model, "_2011_survey_select"), #20
                paste0(base_model, "_mirror_commercial_select"), #21
                paste0(base_model, "_NWFSCslope_female_select_1"), #22
                paste0(base_model, "_2011_maturity"), #23
                paste0(base_model, "_no_recdev"), #24
                paste0(base_model, "_fix_extraSD_tiny"), #25
                paste0(base_model, "_MI_weighting")) #26
                

out.list = NULL   
base   = SS_output( base.loc, printstats = FALSE, verbose = FALSE) 
sens_1  = SS_output( file.path(wd, model.list[1]), printstats = FALSE, verbose = FALSE, covar = FALSE) 
sens_2  = SS_output( file.path(wd, model.list[2]), printstats = FALSE, verbose = FALSE, covar = FALSE) 
sens_3  = SS_output( file.path(wd, model.list[3]), printstats = FALSE, verbose = FALSE, covar = FALSE)
sens_4  = SS_output( file.path(wd, model.list[4]), printstats = FALSE, verbose = FALSE, covar = FALSE)
sens_5  = SS_output( file.path(wd, model.list[5]), printstats = FALSE, verbose = FALSE, covar = FALSE)
sens_6  = SS_output( file.path(wd, model.list[6]), printstats = FALSE, verbose = FALSE, covar = FALSE)
sens_7  = SS_output( file.path(wd, model.list[7]), printstats = FALSE, verbose = FALSE, covar = FALSE)
sens_8  = SS_output( file.path(wd, model.list[8]), printstats = FALSE, verbose = FALSE, covar = FALSE)
sens_9  = SS_output( file.path(wd, model.list[9]), printstats = FALSE, verbose = FALSE, covar = FALSE)
sens_10 = SS_output( file.path(wd, model.list[10]), printstats = FALSE, verbose = FALSE, covar = FALSE)
sens_11 = SS_output( file.path(wd, model.list[11]), printstats = FALSE, verbose = FALSE, covar = FALSE)
sens_12 = SS_output( file.path(wd, model.list[12]), printstats = FALSE, verbose = FALSE, covar = FALSE)
sens_13 = SS_output( file.path(wd, model.list[13]), printstats = FALSE, verbose = FALSE, covar = FALSE)
sens_14 = SS_output( file.path(wd, model.list[14]), printstats = FALSE, verbose = FALSE, covar = FALSE)
sens_15 = SS_output( file.path(wd, model.list[15]), printstats = FALSE, verbose = FALSE, covar = FALSE)
sens_16 = SS_output( file.path(wd, model.list[16]), printstats = FALSE, verbose = FALSE, covar = FALSE)
sens_17 = SS_output( file.path(wd, model.list[17]), printstats = FALSE, verbose = FALSE, covar = FALSE)
sens_18 = SS_output( file.path(wd, model.list[18]), printstats = FALSE, verbose = FALSE, covar = FALSE)
sens_19 = SS_output( file.path(wd, model.list[19]), printstats = FALSE, verbose = FALSE, covar = FALSE)
sens_20 = SS_output( file.path(wd, model.list[20]), printstats = FALSE, verbose = FALSE, covar = FALSE)
sens_21 = SS_output( file.path(wd, model.list[21]), printstats = FALSE, verbose = FALSE, covar = FALSE)
sens_22 = SS_output( file.path(wd, model.list[22]), printstats = FALSE, verbose = FALSE, covar = FALSE)
sens_23 = SS_output( file.path(wd, model.list[23]), printstats = FALSE, verbose = FALSE, covar = FALSE)
sens_24 = SS_output( file.path(wd, model.list[24]), printstats = FALSE, verbose = FALSE, covar = FALSE)
sens_25 = SS_output( file.path(wd, model.list[25]), printstats = FALSE, verbose = FALSE, covar = FALSE)
sens_26 = SS_output( file.path(wd, model.list[26]), printstats = FALSE, verbose = FALSE, covar = FALSE)


modelnames1 <- c("Base Model",
                "- CA Lengths",
                "- OR/WA Lengths",
                "- AFSC Slope Lengths",
                "- Triennial Lengths",
                "- NWFSC Slope Lengths",
                "- NWFSC WCGBT Lengths")

modelnames2 <- c("Base Model",
                "- CA Ages", 
                "- OR/WA Ages",
                "- NWFSC Slope Ages",
                "- NWFSC WCGBT Ages")

modelnames3 <- c("Base Model",
                 "- AFSC Slope Index",
                 "- Trienniel Index",
                 "- NWFSC Slope Index",
                 "- NWFSC WCGBT Index")

modelnames4 <- c("Base Model",
                 "Est. Fem. M",
                 "Est. Lorenz. M",
                 "Fix M median prior",
                 "Fix M 2011 est.")

modelnames5 <- c("Base Model",
                 "2011 Fish. Sel.",
                 "2011 Surv. Sel.",
                 "Mirror Com. Sel.",
                 "NWFSC Alope Asympt. Sel.")

modelnames6 <- c("Base Model",
                 "2011 Maturity",
                 "No RecDevs",
                 "No Add Surv. SD",
                 "MI Data Weight")

x1 <- SSsummarize(list(base, sens_1, sens_2, sens_3, sens_4, sens_5, sens_6)) #remove lengths
x2 <- SSsummarize(list(base, sens_7, sens_8, sens_9, sens_10)) #remove ages
x3 <- SSsummarize(list(base, sens_11, sens_12, sens_13, sens_14)) #remove indices
x4 <- SSsummarize(list(base, sens_15, sens_16, sens_17, sens_18)) #natural mortality
x5 <- SSsummarize(list(base, sens_19, sens_20, sens_21, sens_22)) #selectivity
x6 <- SSsummarize(list(base, sens_23, sens_24, sens_25, sens_26)) #Biology and data weighting

SSplotComparisons(x1, endyrvec = 2021, 
                  legendlabels = modelnames1, 
                  plotdir = file.path(getwd(), '_plots'), 
                  legendloc = "topright", 
                  filenameprefix = paste0(base_model, "_1_"),
                  subplot = c(2,4,10,12), 
                  print = TRUE, 
                  pdf = FALSE)

SSplotComparisons(x2, endyrvec = 2021, 
                  legendlabels = modelnames2, 
                  plotdir = file.path(getwd(), '_plots'), 
                  legendloc = "topright", 
                  filenameprefix = paste0(base_model, "_2_"),
                  subplot = c(2,4,10,12), 
                  print = TRUE, 
                  pdf = FALSE)

SSplotComparisons(x3, endyrvec = 2021, 
                  legendlabels = modelnames3, 
                  plotdir = file.path(getwd(), '_plots'), 
                  legendloc = "topright", 
                  filenameprefix = paste0(base_model, "_3_"),
                  subplot = c(2,4,10,12), 
                  print = TRUE, 
                  pdf = FALSE)

SSplotComparisons(x4, endyrvec = 2021, 
                  legendlabels = modelnames4, 
                  plotdir = file.path(getwd(), '_plots'), 
                  legendloc = "topright", 
                  filenameprefix = paste0(base_model, "_4_"),
                  subplot = c(2,4,10,12), 
                  print = TRUE, 
                  pdf = FALSE)

SSplotComparisons(x5, endyrvec = 2021, 
                  legendlabels = modelnames5, 
                  plotdir = file.path(getwd(), '_plots'), 
                  legendloc = "topright", 
                  filenameprefix = paste0(base_model, "_5_"),
                  subplot = c(2,4,10,12), 
                  print = TRUE, 
                  pdf = FALSE)

SSplotComparisons(x6, endyrvec = 2021, 
                  legendlabels = modelnames6, 
                  plotdir = file.path(getwd(), '_plots'), 
                  legendloc = "topright", 
                  filenameprefix = paste0(base_model, "_6_"),
                  subplot = c(2,4,10,12), 
                  print = TRUE, 
                  pdf = FALSE)

###################################################################################
# Create a Table of Results and a Figure
###################################################################################
#data sensitivities
x <- SSsummarize(list(base, sens_1, sens_2, sens_3, sens_4, sens_5, sens_6, 
          sens_7, sens_8, sens_9, sens_10, sens_11, sens_12, sens_13, sens_14))


modelnames <- c("Base Model",
                  "CA lengths",
                  "OR/WA lengths",
                  "AFSC slope lengths",
                  "Triennial lengths",
                  "NWFSC slope lengths",
                  "NWFSC WCGBT lengths",
                  "CA ages", 
                  "OR/WA ages",
                  "NWFSC slope ages",
                  "NWFSC WCGBT ages",
                  "AFSC slope index",
                  "Trienniel index",
                  "NWFSC slope index",
                  "NWFSC WCGBT index")

ii = 1:length(modelnames)
n = length(modelnames)
out<- matrix(NA, 24, max(ii))

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
                  "Total Yield - SPR 50",
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

write.csv(out, file = file.path(out.dir, paste0(base_model, "_sensitivities.csv")))

library(sa4ss)
t = table_format(x = out,
      caption = 'Sensitivities to changes in input data relative to the base model. The 
      data source listed has been removed for the sensitivity run.',
      label = 'sensitivities1',
      longtable = TRUE,
      font_size = 9,
      #digits = 2,
      landscape = TRUE,
      col_names = modelnames)

kableExtra::save_kable(t,
file = file.path(out.dir, "sensitivities_crw.tex"))


kableExtra::save_kable(t,
file = file.path("C:/Users/Aaron.Berger/Documents/GitHub/dover_sole_2021/write_up/tables/sensitivities.tex"))

#--------------------------------------------------
#data sensitivity aggregate figures
dir.create(paste0(wd,"/Data_figures"))
wd_dat <- file.path(paste0(wd,"/Data_figures")) 
Sensi_plot_dover(model.summaries=x,
              dir = wd_dat,
              current.year=2020,
              mod.names=modelnames, #List the names of the sensitivity runs
              likelihood.out = c(1, 1, 1),
              Sensi.RE.out="Sensi_RE_out.DMP", #Saved file of relative errors
              CI=0.95, #Confidence interval box based on the reference model
              TRP.in=0.25, #Target relative abundance value
              LRP.in=0.125, #Limit relative abundance value
              sensi_xlab="Sensitivity scenarios", #X-axis label
              ylims.in=c(-1,2,-1,2,-1,2,-1,2,-1,2,-1,2), #Y-axis label
              plot.figs=c(1,1,1,1,1,1), #Which plots to make/save? 
              sensi.type.breaks=c(7.5,11.5), #vertical breaks that can separate out types of sensitivities
              anno.x=c(4.5,9.5,13.5), # Vertical positioning of the sensitivity types labels
              anno.y=c(2,2,2), # Horizontal positioning of the sensitivity types labels
              anno.lab=c("Lengths","Ages","Index")) #Sensitivity types labels

###################################################################################
# Create a Second Table of Results and a Figure
###################################################################################
#model sensitivities
x <- SSsummarize(list(base, sens_15, sens_16, sens_17, sens_18, sens_19, 
                      sens_20, sens_21, sens_22, sens_23, sens_24, sens_25, sens_26))

modelnames2 <- c("Base Model",
                 "Est. Fem M",
                 "Est. Lorenz. M",
                 "Fix M median prior",
                 "Fix M 2011 est.",
                 "2011 Fish. Sel.",
                 "2011 Surv. Sel.",
                 "Mirror Com. Sel.",
                 "NWFSC slope Asympt. Sel.",
                 "2011 Maturity",
                 "No recdevs",
                 "No add Surv. SD",
                 "MI Data Weight")


ii = 1:length(modelnames2)
n = length(modelnames2)
out<- matrix(NA, 24, max(ii))

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

colnames(out) = modelnames2
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
                  "Total Yield - SPR 50",
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

write.csv(out, file = file.path(out.dir, paste0(base_model, "_sensitivities2.csv")))

library(sa4ss)
t = table_format(x = out,
                 caption = 'Sensitivities to changes in structural assumptions relative to the base model.',
                 label = 'sensitivities2',
                 longtable = TRUE,
                 font_size = 8,
                 digits = 3,
                 landscape = TRUE,
                 col_names = modelnames2)

kableExtra::save_kable(t,
                       file = file.path("C:/Users/Aaron.Berger/Documents/GitHub/dover_sole_2021/write_up/tables/sensitivities2.tex"))

kableExtra::save_kable(t,
file = file.path(out.dir, "sensitivities2_crw.tex"))

#--------------------------------------------------
#model sensitivity aggregate figures
dir.create(paste0(wd,"/Model_figures"))
wd_mod <- file.path(paste0(wd,"/Model_figures")) 
Sensi_plot_dover(model.summaries=x,
              dir = wd_mod,
              current.year=2020,
              mod.names=modelnames2, #List the names of the sensitivity runs
              likelihood.out = c(1, 1, 1),
              Sensi.RE.out="Sensi_RE_out.DMP", #Saved file of relative errors
              CI=0.95, #Confidence interval box based on the reference model
              TRP.in=0.25, #Target relative abundance value
              LRP.in=0.125, #Limit relative abundance value
              sensi_xlab="Sensitivity scenarios", #X-axis label
              ylims.in=c(-1,2,-1,2,-1,2,-1,2,-1,2,-1,2), #Y-axis label
              plot.figs=c(1,1,1,1,1,1), #Which plots to make/save? 
              sensi.type.breaks=c(5.5,9.5), #vertical breaks that can separate out types of sensitivities
              anno.x=c(3.5,7.5,11.5), # Vertical positioning of the sensitivity types labels
              anno.y=c(2,2,2), # Horizontal positioning of the sensitivity types labels
              anno.lab=c("Natural Mortality","Selectivity","Biology/Data")) #Sensitivity types labels



###################################################################################
# Cut down sensitivity list for presentation
###################################################################################
x <- SSsummarize(list(base, sens_1, sens_2, sens_3, sens_4, sens_5, sens_6, 
          sens_7, sens_8, sens_9, sens_10))#, sens_11, sens_12, sens_13, sens_14))

modelnames <- c("Base Model",
                  "CA lengths", #1
                  "OR/WA lengths",
                  "AFSC slope lengths",
                  "Triennial lengths",
                  "NWFSC slope lengths",
                  "NWFSC WCGBT lengths",
                  "CA ages", #7
                  "OR/WA ages",
                  "NWFSC slope ages",
                  "NWFSC WCGBT ages")#,
                  #"AFSC slope index", #11
                  #"Trienniel index",
                  #"NWFSC slope index",
                  #"NWFSC WCGBT index")

#dir.create(paste0(wd,"/Model_figures"))
wd_mod <- file.path(paste0(wd,"/_Data_figures")) 
Sensi_plot_dover(model.summaries=x,
              dir = wd_mod,
              current.year=2021,
              mod.names=modelnames, #List the names of the sensitivity runs
              likelihood.out = c(1, 1, 1),
              Sensi.RE.out="Sensi_RE_out.DMP", #Saved file of relative errors
              CI=0.95, #Confidence interval box based on the reference model
              TRP.in=0.25, #Target relative abundance value
              LRP.in=0.125, #Limit relative abundance value
              sensi_xlab="Sensitivity scenarios", #X-axis label
              ylims.in=c(-1,1,-1,1,-1,1,-1,1,-1,1,-1,1), #Y-axis label
              plot.figs= 1, #Which plots to make/save? 
              sensi.type.breaks=c(7.5), #vertical breaks that can separate out types of sensitivities
              anno.x=c(12, 6.5), # Vertical positioning of the sensitivity types labels
              anno.y=c(0.75, 0.75), # Horizontal positioning of the sensitivity types labels
              anno.lab=c("Ages", "Lengths"), #Sensitivity types labels
              horizontal = TRUE)

###########################################################################################
x <- SSsummarize(list(base, sens_15, sens_16, sens_17, sens_18, sens_19, 
                      sens_20, sens_21, sens_22, sens_23, sens_24, sens_25, sens_26))

modelnames2 <- c("Base Model",
                 "Est. Fem M",
                 "Est. Lorenz. M",
                 "Fix M median prior",
                 "Fix M 2011 est.",
                 "2011 Fish. Sel.",
                 "2011 Surv. Sel.",
                 "Mirror Com. Sel.",
                 "NWFSC slope Asympt. Sel.",
                 "2011 Maturity",
                 "No recdevs",
                 "No add Surv. SD",
                 "MI Data Weight")

#dir.create(paste0(wd,"/Model_figures"))
wd_mod <- file.path(paste0(wd,"/_Model_figures")) 
Sensi_plot_dover(model.summaries=x,
              dir = wd_mod,
              current.year=2021,
              mod.names=modelnames2, #List the names of the sensitivity runs
              likelihood.out = c(1, 1, 1),
              Sensi.RE.out="Sensi_RE_out.DMP", #Saved file of relative errors
              CI=0.95, #Confidence interval box based on the reference model
              TRP.in=0.25, #Target relative abundance value
              LRP.in=0.125, #Limit relative abundance value
              sensi_xlab="Sensitivity scenarios", #X-axis label
              ylims.in=c(-1,2,-1,2,-1,2,-1,2,-1,2,-1,2), #Y-axis label
              plot.figs=c(1,1,1,1,1,1), #Which plots to make/save? 
              sensi.type.breaks=c(5.5,9.5), #vertical breaks that can separate out types of sensitivities
              anno.x=c(3.5,7.5,11.5), # Vertical positioning of the sensitivity types labels
              anno.y=c(1.5,1.5,1.5), # Horizontal positioning of the sensitivity types labels
              anno.lab=c("Natural Mortality","Selectivity","Biology/Data"),
              horizontal = TRUE)

Sensi_plot_dover(model.summaries=x,
              dir = wd_mod,
              current.year=2021,
              mod.names=modelnames2, #List the names of the sensitivity runs
              likelihood.out = c(1, 1, 1),
              Sensi.RE.out="Sensi_RE_out.DMP", #Saved file of relative errors
              CI=0.95, #Confidence interval box based on the reference model
              TRP.in=0.25, #Target relative abundance value
              LRP.in=0.125, #Limit relative abundance value
              sensi_xlab="Sensitivity scenarios", #X-axis label
              ylims.in=c(-1,2,-1,2,-1,2,-1,2,-1,2,-1,2), #Y-axis label
              plot.figs=c(1,1,1,1,1,1), #Which plots to make/save? 
              sensi.type.breaks=c(5.5,9.5), #vertical breaks that can separate out types of sensitivities
              anno.x=c(3.5,7.5,11.5), # Vertical positioning of the sensitivity types labels
              anno.y=c(2,2,2), # Horizontal positioning of the sensitivity types labels
              anno.lab=c("Natural Mortality","Selectivity","Biology/Data")) #Sensitivity types labels

