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

