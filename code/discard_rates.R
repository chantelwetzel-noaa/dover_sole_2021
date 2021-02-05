#########################################################
#		Create a combined discard rate
#		 Blending CS, NCS, and EM data
#			Code by: Maia Kapur
#			    Dover sole 2021
#########################################################

library(dplyr)
dir = "//nwcfile/FRAM/Assessments/CurrentAssessments/Dover_sole_2021/data/discard_data"

# load the 3 data files:
disrate_cs = read.csv(file.path(dir, "dover_OB_DisRatios_boot_cs_Gear_North_South_2021-01-19.csv"))
disrate_ncs = read.csv(file.path(dir, "dover_OB_DisRatios_boot_ncs_Gear_North_South_2021-01-19.csv"))
disrate_em = read.csv(file.path(dir, "dover_DisRatios_noboot_cs_EM_Gears_North_South_2021-01-19.csv"))

disrate_cs = disrate_cs[disrate_cs$gear2 == "Trawl", ]
disrate_ncs= disrate_ncs[disrate_ncs$gear2 == "Trawl", ]
disrate_em = disrate_em[disrate_em$gear2 == "Trawl", ]

## disrate_cs and disrate_ncs are the boot csvs; disrate_cs only has years 2011+ accordingly

discard_late <- merge(disrate_cs %>% select(ryear,'CS_MTS' = Observed_RETAINED.MTS, 
                                            "CS_RATIO" = Observed_Ratio, State = State, GEAR = gear2 ) ,
                      disrate_ncs  %>% 
                      select(ryear,'NCS_MTS' = Median.Boot_RETAINED.MTS , 
                               "NCS_RATIO" = Observed_Ratio, State = State, GEAR = gear2 ) , by = c('State', 'GEAR','ryear')) %>%
  					  mutate(tot = CS_MTS+ NCS_MTS) %>%
  					  group_by(ryear, State, GEAR) %>%
  					  summarise(cs_prop = CS_MTS/tot,
  					            ncs_prop = NCS_MTS/tot,
  					            cs_propxrate  = cs_prop*CS_RATIO,
  					            ncs_propxrate  = ncs_prop*NCS_RATIO,
  					            total_disrate = cs_propxrate+ncs_propxrate)	

write.csv(discard_late, file = file.path(dir, "obs_trawl_weighted_rates.csv"))	

# There are some years where there are ncs observations 
# 2011, 2012, 2014, and 2013 for OR_WA - so these should be 
# cs rates only			  

discard_late = read.csv(file.path(dir, "obs_trawl_weighted_rates.csv"))
discard_late = as.data.frame(discard_late)
colnames(discard_late)[ncol(discard_lat)] = "Observed_Ratio"
tmp = rbind(disrate_cs[disrate_cs$ryear %in% c(2011:2014),c("ryear", "State", "Observed_Ratio")],
            discard_late[-1,c("ryear", "State", "Observed_Ratio")])

out = data.frame(Yr = tmp$ryear, 
                 Month = 1, 
                 Flt = tmp$State, 
                 Discard = round(tmp$Observed_Ratio, 3), 
                 CV = 0.05)

out$Flt = ifelse(out$Flt == "CA", 1, 2)
#out = out[sort(out$Flt, index.return = TRUE)$ix, ]

pre = read.csv(file.path(dir, "forSS", "discard_rates_forSS.csv"))
all = rbind(pre[pre$Yr < min(out$Yr), ], out)
write.csv(all[sort(all$Flt, index.return = TRUE)$ix, ], file = file.path(dir, "forSS", "discard_wghted_forSS.csv"))
