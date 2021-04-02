
library(dplyr)
library(reshape2)
library(ggplot2)
library(r4ss)

# Source Maia's function
source("C:/Assessments/2021/dover_sole_2021/code/dover_mean_weight_plot_maia.R")

#Load the survey data: WCGBTS
dat_dir = "//nwcfile/FRAM/Assessments/CurrentAssessments/Dover_sole_2021/data/survey/wcgbts"
load(file.path(dat_dir, "Catch__NWFSC.Combo_2020-10-15.rda"))
catch = Out
load(file.path(dat_dir, "Bio_All_NWFSC.Combo_2020-10-15.rda"))
bio = Data

# Load up model
mod_dir = "C:/Assessments/2021/dover_sole_2021/models"
base_model = "6.3.0_data_humboldt_disc_rate"
model = SS_output(file.path(mod_dir, base_model))

save_dir = file.path(dat_dir, "plots")

fulldat = plotMnwtMatrix(summaryoutput = model, 
               			 surveydata = bio, 
               			 fleet = 6, 
               			 maxage = 60, 
               			 fillNA = FALSE, 
               			 png = TRUE, 
               			 printfolder = save_dir)


aggregate(surv_minus_SS~Sex + Year, fulldat, sum) 


summaryoutput = model 
surveydata = bio
fleet = 6
maxage = 60

surveydata = bio[bio$Sex != "U", ]
survey_summary <- surveydata %>%
  filter(!is.na(Sex) & !is.na(Length_cm) & !is.na(Weight)) %>%
  group_by(Sex, Year, Length_cm, Project) %>%
  dplyr::summarise(survey_meanwt = mean(Weight))

#model_summary <- summaryoutput$wtatage %>%
#  filter(Fleet == fleet) %>%
#  mutate(Year = Yr) %>%
#  select(-Yr, -Seas, -Bio_Pattern, -BirthSeas, -Fleet) %>%
#  melt(id = c("Year","Sex")) %>%
#  mutate(Length = variable, SS_meanwt = as.numeric(value),
#         Sex = ifelse(Sex == 1, 'F','M')) %>%
#  select(-variable, - value) #%>% head()

all = NULL
for(a in 2003:2019){
	fem = cbind(a, as.numeric(model$biology$Low), as.numeric(model$biology$Wt_len_F), "F")
	mal = cbind(a, as.numeric(model$biology$Low), as.numeric(model$biology$Wt_len_M), "M")
	all = rbind(all, fem, mal)
}
all = data.frame(all)

colnames(all) = c("Year", "Length_cm", "SS_meanwt", "Sex")
storage.mode(all) <- 'numeric'
all$SS_meanwt = as.numeric(all$SS_meanwt)
model_summary = all


maxlen = 60
fulldat <-  merge(survey_summary, model_summary,
                  by = c("Year","Sex","Length_cm")) %>%
  mutate(surv_minus_SS = survey_meanwt - SS_meanwt) %>%
  filter(Length_cm <= maxlen)

fulldat$Sex <- as.character(factor(fulldat$Sex,
                                     levels = c("F", "M", "U"), labels = c("Female", "Male", "Unsexed")))

sub_fem= fulldat[fulldat$Sex == "M",]
a = which(sub_fem$Year == 2003)
plot(sub_fem$Length_cm[a], sub_fem$surv_minus_SS[a], type = 'l', ylim = c(-0.5,0.5))
for(y in 2004:2019){
	a = which(sub_fem$Year == y)
	print(sub_fem$Length_cm[a])
	lines(sub_fem$Length_cm[a], sub_fem$surv_minus_SS[a])
}

tmp = aggregate(surv_minus_SS~Year, fulldat, sum) 

plot(tmp)
