#code to create sensitivity figures for fleet selectivity patterns across alternative M sensitivity models
#
library(devtools)
#install_github("chantelwetzel-noaa/HandyCode")
library(HandyCode)
library(r4ss)

#savedir = "C:\\Users\\Aaron.Berger\\Documents\\AMB\\Groundfish\\Assessments\\Dover Sole\\2021\\Rcode"
savedir = "C:/Assessments/2021/dover_sole_2021/write_up/figs"
#mydir = "N:\\Assessments\\CurrentAssessments\\Dover_sole_2021\\models"
mydir = "C:/Assessments/2021/dover_sole_2021/models"

base_name = "7.0.1_base"
#load base model
base = SS_output(file.path(mydir, base_name))
#load(file.path("C:/Assessments/2021/dover_sole_2021/write_up", "00mod.Rdata"))

#load fix M at 2011 values
fixM_2011 = SS_output(file.path(mydir,"_sensitivities", "7.0.1_base_2011_m"))

#load estimate Female M
femM_est = SS_output(file.path(mydir,"_sensitivities", "7.0.1_base_est_m"))

#Get fleet information for plotting legend
info1 <- SSplotSelex(base, fleets=1, fleetnames=fleets[1], subplot=1, year = c(1984, 1995, 2020))
info1$infotable$longname = c("CA (f): 1910-1984", "CA (m): 1910-1984", 
                            "CA (f): 1985-1995", "CA (m): 1985-1995", 
                            "CA (f): 1996 - 2020", "CA (m): 1996 - 2020")
info1$infotable$col <- rich.colors.short(8)[c(1,1)]
#
info2 <- SSplotSelex(base, fleets=2, fleetnames=fleets[2], year = c(1984, 1995, 2020), subplot=1)
info2$infotable$col <- "red"
info2$infotable$longname = c("OR-WA (f): 1910-1984",   "OR-WA (m): 1910-1984", 
                             "OR-WA (f): 1985-1995",   "OR-WA (m): 1985-1995", 
                             "OR-WA (f): 1996 - 2020", "OR-WA (m): 1996 - 2020")
#
info3 <- SSplotSelex(base, fleets=3, fleetnames=fleets[3], subplot=1)
info3$infotable$col <- c("blue")#rich.colors.short(8)[c(4,6)]
info3$infotable$longname = c("AFSC Slope (f)", "AFSC Slope (m)")
#
info4 <- SSplotSelex(base, fleets=4, fleetnames=fleets[4], subplot=1)
info4$infotable$col <- c("purple")
info4$infotable$longname = c("Triennial (f)", "Triennial (m)")
#
info5 <- SSplotSelex(base, fleets=5, fleetnames=fleets[5], subplot=1)
info5$infotable$col <- c("green")
info5$infotable$longname = c("NWFSC Slope (f)", "NWFSC Slope (m)")
#
info6 <- SSplotSelex(base, subplot=1)
info6$infotable = info6$infotable[info6$infotable$Fleet == 6, ]
info6$infotable$col <- c("red")
info6$infotable$longname = c("NWFSC WCGBT (f)", "NWFSC WCGBT (m)")

info_all <- list(info1$infotable,info2$infotable,info3$infotable,info4$infotable,info5$infotable,info6$infotable)

#Create 3x1 (by model) Sensitivity plot for each fleet
fleets = base$FleetNames
fleet_num <- length(fleets)

for (i in 1:fleet_num) { 
pngfun(wd = savedir, paste0('Selectivity_M_Sensitivity_Fleet_',fleets[i],'.png'), w = 14, h = 6)
par(mfrow=c(1,3),mar=c(2,4,3,1))

if (i < 3) {   # fleets with time varying selectivity parameters
SSplotSelex(fixM_2011, fleets=i,  infotable=info_all[[i]], 
            subplot=1, legendloc='topleft',showmain=FALSE, year = c(1980, 1995, 2020))
mtext("Fix M at 2011 Estimate", side=3,line=1, cex = 1.5)
grid()
SSplotSelex(base, fleets=i, infotable=info_all[[i]], 
            subplot=1, legendloc='topleft', showmain=FALSE, year = c(1980, 1995, 2020))
mtext("Base model", side=3,line=1, cex = 1.5)
grid()
SSplotSelex(femM_est, fleets=i, infotable=info_all[[i]],
            subplot=1, legendloc='topleft', showmain=FALSE, year = c(1980, 1995, 2020))
mtext("Estimate Female M", side=3,line=1, cex = 1.5)
grid()
dev.off()
}
if (i >= 3) {   # fleets with no time varying selectivity parameters
  SSplotSelex(fixM_2011, fleets=i,  infotable=info_all[[i]], 
              subplot=1, legendloc='topleft',showmain=FALSE)
  mtext("Fix M at 2011 Estimate", side=3,line=1, cex = 1.5)
  grid()
  SSplotSelex(base, fleets=i, infotable=info_all[[i]], 
              subplot=1, legendloc='topleft', showmain=FALSE)
  mtext("Base model", side=3,line=1, cex = 1.5)
  grid()
  SSplotSelex(femM_est, fleets=i, infotable=info_all[[i]],
              subplot=1, legendloc='topleft', showmain=FALSE)
  mtext("Estimate Female M", side=3,line=1, cex = 1.5)
  grid()
  dev.off()
}
}