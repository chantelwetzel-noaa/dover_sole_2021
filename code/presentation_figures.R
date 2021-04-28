require(r4ss)
devtools::load_all("C:/Users/Chantel.Wetzel/Documents/GitHub/r4ss")

loc = "C:/Assessments/2021/dover_sole_2021/models"
base_name = "7.0.1_base"

mod1 <- SS_output(file.path(loc, base_name),
                  printstats=FALSE, verbose=FALSE)

# fleetnames for all other plots
fleetnames1 <- c("CA",
                 "OR/WA",
                 "AFSC Slope Survey",
                 "Triennial Survey",
                 "NWFSC Slope Survey",
                 "WCGBTS")

# Model 1
SS_plots(mod1,
         fleetnames = fleetnames1,
         html = TRUE,
         maxrows = 5, 
         maxcols = 5, 
         maxrows2 = 4, 
         maxcols2 = 4,
         printfolder = 'presentation_plots')

SS_plots(mod1,
         plot = 20,
         fleetnames = fleetnames1,
         html = TRUE,
         maxrows = 1, 
         maxcols = 1, 
         printfolder = 'presentation_plots')

# fix html caption for 
plot.dir <- file.path(mod1$inputs$dir, 'plots')
csv.files <- dir(plot.dir, full.names = TRUE, pattern=".csv$")
small.file <- csv.files[file.info(csv.files)$size == min(file.info(csv.files)$size)]
info <- read.csv(small.file, stringsAsFactors = FALSE)
info$caption[1] <- "Mean length at age, WCGBT Survey. These data are excluded from the likelihood and used for comparison purposes only. All age data from the survey (2009, 2010, 2016, 2017, and 2018) were aggregated and arbitrarily assigned to 2011 for comparison to the expected mean length-at-age in a single year."
write.csv(info, file=small.file, row.names = FALSE)
SS_html(mod1, plotdir=plot.dir)

SS_plots(mod1,
         fleetnames = fleetnames1,
         html = TRUE,
         pwidth = 5.2,
         pheight = 4,
         maxrows = 5, 
         maxcols = 5, 
         maxrows2 = 4, 
         maxcols2 = 4,
         printfolder = 'presentation_plots')

SS_plots(mod1,
         plot = 20,
         pwidth = 5.2,
         pheight = 4,
         fleetnames = fleetnames1,
         html = TRUE,
         maxrows = 1, 
         maxcols = 1, 
         printfolder = 'presentation_plots')

SS_plots(mod1,
         plot = 24,
         pwidth = 5.2,
         pheight = 7,
         fleetnames = fleetnames1,
         html = TRUE,
         maxrows = 1, 
         maxcols = 1, 
         printfolder = 'presentation_plots')

SS_plots(mod1,
         plot = 16,
         pwidth = 5.2,
         pheight = 5,
         fleetnames = fleetnames1,
         showsampsize = FALSE,
         showeffN = FALSE,
         html = FALSE,
         printfolder = 'presentation_plots')


SSplotComps(mod1, kind="L@A", fleets=5, sexes=1, maxcols=1, maxrows=1, add=TRUE)
SSplotComps(mod1, kind="L@A", fleets=5, sexes=2, maxcols=1, maxrows=1, add=TRUE)

SS_plots(bs82bio3,
         plot = 16,
         pwidth = 5.2,
         pheight = 5,
         fleetnames = fleetnames1,
         showsampsize = FALSE,
         showeffN = FALSE,
         html = FALSE,
         printfolder = 'plots')

source('c:/SS/skates/BigSkate_Doc/R/make_multifig2.R')
source('c:/SS/skates/BigSkate_Doc/R/SSplotComps.R')

mean_len_at_age_plots <- function(mod = bs99,
                                  filename = 'mean_length_at_age.png'){
  png(file.path('c:/SS/skates/BigSkate_Doc/Figures/', filename),
      res=300, units='in', pointsize=10, width=5.2, height=5.2)
  par(mar = c(4,4,4,4))
  plot(0, type='n', xlim=c(0,15), ylim=c(0,200),
       yaxs='i', xlab="Age (yr)", ylab="Length (cm)",
       main="Mean length at age from WCGBT Survey (all years combined)")
  scale <- .3
  grid()
  ladbaseF <- mod$ladbase[mod$ladbase$Sex == 1 & mod$ladbase$N > 0,]
  ladbaseM <- mod$ladbase[mod$ladbase$Sex == 2 & mod$ladbase$N > 0,]
  points(ladbaseM$Bin, ladbaseM$Obs, pch=21, cex=scale*sqrt(ladbaseM$N),
         bg=rgb(0,0,1,.5), type='o', lty=3)
  points(ladbaseF$Bin, ladbaseF$Obs, pch=21, cex=scale*sqrt(ladbaseF$N),
         bg=rgb(1,0,0,.5), type='o', lty=3)
  lines(ladbaseM$Bin, ladbaseM$Exp, col=rgb(0,0,1,.5), lwd=2)
  lines(ladbaseF$Bin, ladbaseF$Exp, col=rgb(1,0,0,.5), lwd=2)

  axis(4, at=106.9, col=4)
  axis(4, at=148.2, col=2)
  mtext(side=4, line=2, "Length at 50% maturity", adj=.7)
  
  legend(x = 0,
         y = 200,
         bty = 'n',
         pch=21,
         col=1,
         legend = c("      Female observation",
             "      Male observation"),
         pt.bg=c(rgb(1,0,0,.5), rgb(0,0,1,.5)),
         pt.cex=2)
  legend(x = 0,
         y = 180,
         bty = 'n',
         lty=1,
         lwd=2,
         legend = c("Female estimate",
             "Male estimate"),
         col=c(rgb(1,0,0,.5), rgb(0,0,1,.5)))
  legend(x = 0,
         y = 162,
         bty = 'n',
         fill=gray(0,0.5),
         legend = c("    Sample size"))
  scale <- 0.1
  width <- 0.4
  for(a in 0:15){
    ## rect(a-width, 0, a, scale*ladbaseF$N[ladbaseF$Bin == a], col=rgb(1,0,0,.5))
    ## rect(a+width, 0, a, scale*ladbaseM$N[ladbaseF$Bin == a], col=rgb(0,0,1,.5))
    NF <- ladbaseF$N[ladbaseF$Bin == a]
    NM <- ladbaseM$N[ladbaseF$Bin == a]
    N <- sum(NF, NM, na.rm = TRUE)
    rect(a-width, 0,
         a+width, scale*N,
         col=gray(0,.5))
    text(N, x=a, y=scale*N, pos=3)
  }
  dev.off()
}

mean_len_at_age_plots()
mean_len_at_age_plots(bs99bio3, filename='mean_length_at_age_vonB.png')

mean_len_at_age_plots2 <- function(mod=bs99, filename='mean_length_vs_growth_curve.png'){
  png(file.path('c:/SS/skates/BigSkate_Doc/Figures/', filename),
      res=300, units='in', pointsize=10, width=5.2, height=5.2)
  par(mar = c(4,4,4,4))
  SSplotBiology(mod, subplot=1)
  scale <- .3
  ladbaseF <- mod$ladbase[mod$ladbase$Sex == 1 & mod$ladbase$N > 0,]
  ladbaseM <- mod$ladbase[mod$ladbase$Sex == 2 & mod$ladbase$N > 0,]
  points(ladbaseM$Bin + 0.5, ladbaseM$Obs, pch=21, cex=scale*sqrt(ladbaseM$N),
         bg=rgb(0,0,1,.5), type='o', lty=3)
  points(ladbaseF$Bin + 0.5, ladbaseF$Obs, pch=21, cex=scale*sqrt(ladbaseF$N),
         bg=rgb(1,0,0,.5), type='o', lty=3)
  dev.off()
}
mean_len_at_age_plots2()
mean_len_at_age_plots2(bs99bio3, filename='mean_length_vs_growth_curve_vonB.png')

wd = file.path(loc, base_name, "presentation_plots")
setwd(wd)

# discards vs. dead vs. selected
fleetcols0 <- rich.colors.short(5)[-1]
fleetcols1 <- c(fleetcols0[c(1,2,1)],'purple')
fleetcols1[1] <- fleetcols1[3]
fleetcols3 <- fleetcols1
fleetcols2 <- fleetcols1
fleetcols2[1] <- fleetcols1[2]
fleetcols3[1] <- fleetcols0[1]
fleetcols = c('red', 'blue', 'darkpurple')


png('catch_w_discards.png',
    res=300, units='in', width=5.2, height=4, pointsize=10)
SSplotCatch(mod1, subplot=16, add=FALSE, fleetcols = '#646464', addmax=FALSE, labels=rep("",10), showlegend=FALSE)
SSplotCatch(mod1, subplot=2, add=TRUE, fleetcols = c('#7F7FFF','#FF4438'), addmax=FALSE, labels=rep("",10), showlegend=FALSE)
legend('topleft',
       bg='white',
       bty='n',
       fill = c('#7F7FFF','#FF4438','#646464'),
       legend = c("CA", "OR/WA", "Discards"))
title(ylab = "Landings + dead discards (mt)")
dev.off()

#################################################################################################
library(HandyCode)
library(r4ss)

savedir = "C:/Assessments/2021/dover_sole_2021/write_up/figs"
mydir = "C:/Assessments/2021/dover_sole_2021/models"

base_name = "7.0.1_base"
model = SS_output(file.path(mydir, base_name))


SSplotComps(replist = model, subplots = 21, print = TRUE,
            kind = "LEN", fleets = 1:2, fleetnames = c("CA", "OR/WA"),
            pwidth = 12, pheight = 7, plotdir = savedir,
            cex.main = 2, datonly = TRUE, showeffN = FALSE
           )

SSplotComps(replist = model, subplots = 21, print = TRUE,
            kind = "LEN", fleets = 3:6,
            pwidth = 12, pheight = 7, plotdir = savedir,
            cex.main = 2, datonly = TRUE, showeffN = FALSE
           )

SSplotComps(replist = model, subplots = 21, print = TRUE,
            kind = "AGE", fleets = 1:2, fleetnames = c("CA", "OR/WA"),
            pwidth = 12, pheight = 7, plotdir = savedir,
            cex.main = 2, datonly = TRUE, showeffN = FALSE
           )

SSplotComps(replist = model, subplots = 3, print = TRUE,
            kind = "cond", fleets = 6, maxrows = 4, maxcols = 9,
            maxrows2 = 4, maxcols2 = 9,
            pwidth = 12, pheight = 7, plotdir = savedir,
            cex.main = 2, datonly = TRUE, showeffN = FALSE
           )

no_est = SS_output("C:/Assessments/2021/dover_sole_2021/models/_sensitivities/7.0.1_base_gstage")
SSplotComps(replist = no_est, subplots = 21, print = TRUE,
            kind = "AGE", fleets = 6,
            pwidth = 12, pheight = 7, plotdir = savedir,
            cex.main = 2, datonly = TRUE, showeffN = FALSE
           )


#############################################################################################
#  Selectivity
#############################################################################################
# Create selectivity plots
fleets = model$FleetNames

test <- SSplotSelex(model, fleets=1, fleetnames=fleets[1], subplot=1, year = c(1984, 1995, 2020))
test$infotable$longname = c("CA (f): 1910-1984", "CA (m): 1910-1984", 
              "CA (f): 1985-1995", "CA (m): 1985-1995", 
              "CA (f): 1996 - 2020", "CA (m): 1996 - 2020")
test$infotable$col <- rich.colors.short(8)[c(1,1)]
test1 <- SSplotSelex(model, fleets=2, fleetnames=fleets[2], year = c(1984, 1995, 2020), subplot=1)
test1$infotable$col <- "red"
test1$infotable$longname = c("OR-WA (f): 1910-1984",   "OR-WA (m): 1910-1984", 
               "OR-WA (f): 1985-1995",   "OR-WA (m): 1985-1995", 
               "OR-WA (f): 1996 - 2020", "OR-WA (m): 1996 - 2020")
test2 <- SSplotSelex(model, fleets=3, fleetnames=fleets[3], subplot=1)
test2$infotable$col <- c("blue")#rich.colors.short(8)[c(4,6)]
test2$infotable$longname = c("AFSC Slope (f)", "AFSC Slope (m)")
test3 <- SSplotSelex(model, fleets=4, fleetnames=fleets[4], subplot=1)
test3$infotable$col <- c("purple")
test3$infotable$longname = c("Triennial (f)", "Triennial (m)")
test4 <- SSplotSelex(model, fleets=5, fleetnames=fleets[5], subplot=1)
test4$infotable$col <- c("green")
test4$infotable$longname = c("NWFSC Slope (f)", "NWFSC Slope (m)")
test5 <- SSplotSelex(model, subplot=1)
test5$infotable = test5$infotable[test5$infotable$Fleet == 6, ]
test5$infotable$col <- c("red")
test5$infotable$longname = c("NWFSC WCGBT (f)", "NWFSC WCGBT (m)")


test$infotable$col = rep(c("red", "blue"), 3)
test1$infotable$col = rep(c("red", "blue"), 3)
test$infotable$lwd = 2
test1$infotable$lwd = 2

pngfun(wd = savedir, 'selectivity_1_by_2_fishery.png', w = 14, h = 7)
par(mfrow=c(1,2),mar=c(2,4,3,1))
#SSplotSelex(mod1, fleets = 1:3, infotable = test$infotable, subplot = 1, showmain = FALSE, legendloc= 'topleft')
SSplotSelex(model, fleets=1,  infotable=test$infotable, 
  subplot=1, legendloc='topleft', showmain=FALSE, year = c(1980, 1995, 2020))
grid()
SSplotSelex(model, fleets=2, infotable=test1$infotable, 
  subplot=1, legendloc='topleft',showmain=FALSE, year = c(1980, 1995, 2020))
grid()
dev.off() 

pngfun(wd = savedir, 'selectivity_2_by_2_survey.png', w = 12, h = 7)
par(mfrow=c(2, 2),mar=c(2,4,3,1))
SSplotSelex(model, fleets=3, infotable=test2$infotable,subplot=1, 
  legendloc='topleft',showmain=FALSE)
grid()
SSplotSelex(model, fleets=4, infotable=test3$infotable,subplot=1, 
  legendloc='topleft',showmain=FALSE)
grid()
SSplotSelex(model, fleets=5, infotable=test4$infotable,subplot=1, 
  legendloc='topleft',showmain=FALSE)
grid()
SSplotSelex(model, fleets=6, infotable=test5$infotable, subplot=1, 
  legendloc='bottomright',showmain=FALSE)
grid()
dev.off()


pngfun(wd = savedir, "dover_retention_1_by_2.png", w = 12, h = 7)
par(mfrow = c(1,2))
plot(  lens, ret[ret$Fleet == 1 & ret$Sex == 1 & ret$Yr == 1947,  6:ncol(ret)], col = col.vec[1], type = 'l', 
  ylim = c(0, 1.05), ylab = "Retention", xlab = "Length (cm)", main = "California", 
  cex.lab = 1.5, cex.axis = 1.25, cex.main = 2, lwd = 2)
points(lens, ret[ret$Fleet == 1 & ret$Sex == 1 & ret$Yr == 1947,  6:ncol(ret)], col = col.vec[1], pch = 1)
lines( lens, ret[ret$Fleet == 1 & ret$Sex == 1 & ret$Yr == 1948,  6:ncol(ret)], col = col.vec[2], lty = 1, lwd = 2)
points(lens, ret[ret$Fleet == 1 & ret$Sex == 1 & ret$Yr == 1948,  6:ncol(ret)], col = col.vec[2], pch = 2)
lines( lens, ret[ret$Fleet == 1 & ret$Sex == 1 & ret$Yr == 2011,  6:ncol(ret)], col = col.vec[3], lty = 1, lwd = 2)
points(lens, ret[ret$Fleet == 1 & ret$Sex == 1 & ret$Yr == 2011,  6:ncol(ret)], col = col.vec[3], pch = 3)
lines( lens, ret[ret$Fleet == 1 & ret$Sex == 1 & ret$Yr == 2015,  6:ncol(ret)], col = col.vec[4], lty = 1, lwd = 2)
points(lens, ret[ret$Fleet == 1 & ret$Sex == 1 & ret$Yr == 2015,  6:ncol(ret)], col = col.vec[4], pch = 4)
legend ("bottomright", legend = c("1911-1947", "1948-2010", "2011-2014", "2015-2020"),
        col = col.vec[1:4], pch = 1:4,lty = 1, lwd = 2, bty = 'n', cex = 1.5)
grid()

plot(lens, ret[ret$Fleet == 2 & ret$Sex == 1 & ret$Yr == 2001,  6:ncol(ret)], col = col.vec[2], type = 'l', 
  ylim = c(0, 1.05), ylab = "Retention", xlab = "Length (cm)", main = "Oregon-Washington", 
  cex.lab = 1.5, cex.axis = 1.25, cex.main = 2, lwd = 2)
points(lens, ret[ret$Fleet == 2 & ret$Sex == 1 & ret$Yr == 2001,  6:ncol(ret)], col = col.vec[2], pch = 1)
lines( lens, ret[ret$Fleet == 2 & ret$Sex == 1 & ret$Yr == 2010,  6:ncol(ret)], col = col.vec[3], lty = 1, lwd = 2)
points(lens, ret[ret$Fleet == 2 & ret$Sex == 1 & ret$Yr == 2010,  6:ncol(ret)], col = col.vec[3], pch = 2)
lines( lens, ret[ret$Fleet == 2 & ret$Sex == 1 & ret$Yr == 2011,  6:ncol(ret)], col = col.vec[4], lty = 1, lwd = 2)
points(lens, ret[ret$Fleet == 2 & ret$Sex == 1 & ret$Yr == 2011,  6:ncol(ret)], col = col.vec[4], pch = 3)
legend ("bottomright", legend = c("1911-2001", "2002-2010", "2011-2020"),
        col = col.vec[2:4], pch = 1:3,lty = 1, lwd = 2, bty = 'n', cex = 1.5)
grid()
dev.off()

##############################################################################
# Composition Data By Year
##############################################################################
library(ggplot2)
gg_color_hue <- function(n) {
  hues <- seq(15, 375, length = n + 1)
  grDevices::hcl(h = hues, l = 65, c = 100)[1:n]
}
colors <- gg_color_hue(20)

loc = "//nwcfile/FRAM/Assessments/CurrentAssessments/Dover_sole_2021/data/commercial_comps"
len <- read.csv(file.path(loc, "forSS", "Com_Length_Samples_by_State_CALCOM.csv"))

sub_len = data.frame(Year = rep(len[,1],3), 
                     State = c(rep("CA", nrow(len)), rep("OR", nrow(len)), rep("WA", nrow(len))),
                     Number = c(len[,3], len[,5], len[,7]))

pngfun(wd = file.path(loc, "plots"), file = "Lengths_by_State.png", w = 9, h = 7, pt = 12)
ggplot(sub_len, aes(fill = State, y = Number, x = Year)) + 
    geom_bar(position="stack", stat="identity")+
    coord_cartesian(ylim = c(0, 12000)) + 
    theme(axis.text.y = element_text(size = 13, color = 1),
          axis.text.x = element_text(size = 13, color = 1), 
          legend.text.align = 0,
          axis.title.x = element_text(size = 18),
          axis.title.y = element_text(size = 18),
          legend.text = element_text(size = 18),
          legend.title = element_text(size = 18),
          panel.grid.minor = element_blank())  +
    xlab("Year") + ylab("Length Samples (#)")
dev.off()

len <- read.csv(file.path(loc, "forSS", "Com_Age_Samples_by_State_CALCOM.csv"))

sub_age = data.frame(Year = rep(len[,1],3), 
                     State = c(rep("CA", nrow(len)), rep("OR", nrow(len)), rep("WA", nrow(len))),
                     Number = c(len[,3], len[,5], len[,7]))

pngfun(wd = file.path(loc, "plots"), file = "Ages_by_State.png", w = 9, h = 7, pt = 12)
ggplot(sub_age, aes(fill = State, y = Number, x = Year)) + 
    geom_bar(position="stack", stat="identity")+
    theme(axis.text.y = element_text(size = 13, color = 1),
      axis.text.x = element_text(size = 13, color = 1), 
      legend.text.align = 0,
      axis.title.x = element_text(size = 18),
      axis.title.y = element_text(size = 18),
      legend.text = element_text(size = 18),
      legend.title = element_text(size = 18),
      panel.grid.minor = element_blank())  +
    xlab("Year") + ylab("Age Samples (#)")
dev.off()

loc = "//nwcfile/FRAM/Assessments/CurrentAssessments/Dover_sole_2021/data/survey/wcgbts"
len <- read.csv(file.path(loc, "forSS", "nwfsc_wcgbts_length_samps.csv"))
age <- read.csv(file.path(loc, "forSS", "nwfsc_wcgbts_age_samps.csv"))

sub_len = data.frame(Year = len[,1], 
                     Lengths = len[,3],
                     Ages = age[,3])

pngfun(wd = file.path(loc, "plots"), file = "WCGBTS_Lengths.png", w = 9, h = 7, pt = 12)
ggplot(sub_len, aes(y = Lengths, x = Year)) + 
    geom_bar(position="stack", stat="identity", fill = 'darkmagenta')+
    theme(axis.text.y = element_text(size = 13),
      axis.text.x = element_text(size = 13), 
      legend.text.align = 0,
      axis.title.x = element_text(size = 18),
      axis.title.y = element_text(size = 18),
      panel.grid.minor = element_blank())  +
    xlab("Year") + ylab("Length Samples (#)")
dev.off()

pngfun(wd = file.path(loc, "plots"), file = "WCGBTS_Ages.png", w = 9, h = 7, pt = 12)
ggplot(sub_len, aes(y = Ages, x = Year)) + 
    geom_bar(position="stack", stat="identity", fill = 'cyan4')+
    theme(axis.text.y = element_text(size = 13),
      axis.text.x = element_text(size = 13), 
      legend.text.align = 0,
      axis.title.x = element_text(size = 18),
      axis.title.y = element_text(size = 18),
      panel.grid.minor = element_blank())  +
    xlab("Year") + ylab("Age Samples (#)")
dev.off()
