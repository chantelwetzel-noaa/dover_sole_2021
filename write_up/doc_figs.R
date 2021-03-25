library(HandyCode)
library(r4ss)

savedir = "C:/Assessments/2021/dover_sole_2021/write_up/figs"
mydir = "C:/Assessments/2021/dover_sole_2021/models"

#base_name = "1.8_selex_dome_m"
#model = SS_output(file.path(mydir, base_name))
load(file.path("C:/Assessments/2021/dover_sole_2021/write_up", "00mod.Rdata"))

pngfun(wd = savedir, 'unavailable_biomass.png', w = 10, h = 7)
	SSunavailableSpawningOutput(model, plot=TRUE)
dev.off()

fleets = c("AFSC Slope", "Triennial", "NWFSC Slope", "NWFSC WCGBT")

# index fits
pngfun(wd = savedir, 'index_fits.png', h = 10, w = 10)
par(mfrow=c(2,2),mar=c(2,2,2,1),oma=c(2,2,0,0)+.1)
for(a in 1:4){
  f = c(3:6)[a]
  SSplotIndices(model, fleets = f, subplot = 2, fleetnames = fleets)
  mtext(side = 3, fleets[a])
}
mtext(side=1,line=1,outer=TRUE,'Year')
mtext(side=2,line=1,outer=TRUE,'Index')
dev.off()


# discard fits
fleets = c("CA", "OR/WA")
pngfun(wd = savedir, 'discard_fits.png')
par(mfcol=c(2,1),mar=c(2,2,2,1),oma=c(2,2,0,0)+.1)
for(f in 1:2){
  SSplotDiscard(model, fleets=f,subplot=2,fleetnames=fleets, datplot = TRUE, ymax = 0.4)
}
mtext(side=1,line=1,outer=TRUE,'Year')
mtext(side=2,line=1,outer=TRUE,'Discard fraction')
dev.off()

# discard without fits
pngfun(wd = savedir, 'discard_data.png')
par(mfcol=c(2,1),mar=c(2,2,2,1),oma=c(2,2,0,0)+.1)
for(f in 1:2){
  SSplotDiscard(model, fleets=f,subplot=1,fleetnames=fleets, datplot = TRUE, ymax = 0.40)
}
mtext(side=1,line=1,outer=TRUE,'Year')
mtext(side=2,line=1,outer=TRUE,'Discard fraction')
dev.off()


 SSplotData(
          replist = model, print = TRUE,
          pwidth = 7, pheight = 7, punits = 'in',
          ptsize = 10, res = 300, mainTitle = FALSE, cex.main = 1,
          plotdir = savedir, margins = c(5.1, 2.1, 4.1, 10),
          fleetnames = model$FleetNames, maxsize = 1.0
        )


SS_fitbiasramp(model,  method="BFGS", twoplots=FALSE,
           transform = FALSE, print = TRUE, plotdir = savedir ,shownew = FALSE,
           pwidth=6.5, pheight=5.0, punits="in", ptsize=10, res=300, cex.main=1)

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
test2$infotable$longname = "AFSC Slope"
test3 <- SSplotSelex(model, fleets=4, fleetnames=fleets[4], subplot=1)
test3$infotable$col <- c("purple")
test3$infotable$longname = "Triennial"
test4 <- SSplotSelex(model, fleets=5, fleetnames=fleets[5], subplot=1)
test4$infotable$col <- c("green")
test4$infotable$longname = "NWFSC Slope"
test5 <- SSplotSelex(model, subplot=1)
test5$infotable = test5$infotable[test5$infotable$Fleet == 6, ]
test5$infotable$col <- c("red")
test5$infotable$longname = "NWFSC WCGBT"


pngfun(wd = savedir, 'selectivity.png', w = 10, h = 12)
par(mfrow=c(3,2),mar=c(2,4,3,1))
#SSplotSelex(mod1, fleets = 1:3, infotable = test$infotable, subplot = 1, showmain = FALSE, legendloc= 'topleft')
SSplotSelex(model, fleets=1,  infotable=test$infotable, 
	subplot=1, legendloc='topleft', showmain=FALSE, year = c(1980, 1995, 2020))
grid()
SSplotSelex(model, fleets=2, infotable=test1$infotable, 
	subplot=1, legendloc='topleft',showmain=FALSE, year = c(1980, 1995, 2020))
grid()
SSplotSelex(model, fleets=3, infotable=test2$infotable,subplot=1, 
	legendloc='bottomright',showmain=FALSE)
grid()
SSplotSelex(model, fleets=4, infotable=test3$infotable,subplot=1, 
	legendloc='topleft',showmain=FALSE)
grid()
SSplotSelex(model, fleets=5, infotable=test4$infotable,subplot=1, 
	legendloc='bottomright',showmain=FALSE)
grid()
SSplotSelex(model, fleets=6, infotable=test5$infotable, subplot=1, 
	legendloc='bottomright',showmain=FALSE)
grid()
dev.off()

lens = 5.5:65.5

ret = model$sizeselex[model$sizeselex$Fleet %in% c(1,2), ]
ret = ret[ret$Factor == "Ret", ]
col.vec = c("red", "blue", "orange2", "green", "purple", "darkgrey")

pngfun(wd = savedir, "dover_retention.png", w = 7, h = 7)
par(mfrow = c(2,1))
plot(  lens, ret[ret$Fleet == 1 & ret$Sex == 1 & ret$Yr == 1947,  6:ncol(ret)], col = col.vec[1], type = 'l', 
	ylim = c(0, 1.05), ylab = "Retention", xlab = "Length (cm)", main = "California", lwd = 2)
points(lens, ret[ret$Fleet == 1 & ret$Sex == 1 & ret$Yr == 1947,  6:ncol(ret)], col = col.vec[1], pch = 1)
lines( lens, ret[ret$Fleet == 1 & ret$Sex == 1 & ret$Yr == 1948,  6:ncol(ret)], col = col.vec[2], lty = 1, lwd = 2)
points(lens, ret[ret$Fleet == 1 & ret$Sex == 1 & ret$Yr == 1948,  6:ncol(ret)], col = col.vec[2], pch = 2)
lines( lens, ret[ret$Fleet == 1 & ret$Sex == 1 & ret$Yr == 2011,  6:ncol(ret)], col = col.vec[3], lty = 1, lwd = 2)
points(lens, ret[ret$Fleet == 1 & ret$Sex == 1 & ret$Yr == 2011,  6:ncol(ret)], col = col.vec[3], pch = 3)
lines( lens, ret[ret$Fleet == 1 & ret$Sex == 1 & ret$Yr == 2015,  6:ncol(ret)], col = col.vec[4], lty = 1, lwd = 2)
points(lens, ret[ret$Fleet == 1 & ret$Sex == 1 & ret$Yr == 2015,  6:ncol(ret)], col = col.vec[4], pch = 4)
legend ("bottomright", legend = c("1911-1947", "1948-2010", "2011-2014", "2015-2020"),
        col = col.vec[1:4], pch = 1:4,lty = 1, lwd = 2, bty = 'n')
grid()

plot(  lens, ret[ret$Fleet == 2 & ret$Sex == 1 & ret$Yr == 1979,  6:ncol(ret)], col = col.vec[1], type = 'l', 
	ylim = c(0, 1.05), ylab = "Retention", xlab = "Length (cm)", main = "Oregon-Washington", lwd = 2)
points(lens, ret[ret$Fleet == 2 & ret$Sex == 1 & ret$Yr == 1979,  6:ncol(ret)], col = col.vec[1], pch = 1)
lines( lens, ret[ret$Fleet == 2 & ret$Sex == 1 & ret$Yr == 2001,  6:ncol(ret)], col = col.vec[2], lty = 1, lwd = 2)
points(lens, ret[ret$Fleet == 2 & ret$Sex == 1 & ret$Yr == 2001,  6:ncol(ret)], col = col.vec[2], pch = 2)
lines( lens, ret[ret$Fleet == 2 & ret$Sex == 1 & ret$Yr == 2010,  6:ncol(ret)], col = col.vec[3], lty = 1, lwd = 2)
points(lens, ret[ret$Fleet == 2 & ret$Sex == 1 & ret$Yr == 2010,  6:ncol(ret)], col = col.vec[3], pch = 3)
lines( lens, ret[ret$Fleet == 2 & ret$Sex == 1 & ret$Yr == 2011,  6:ncol(ret)], col = col.vec[4], lty = 1, lwd = 2)
points(lens, ret[ret$Fleet == 2 & ret$Sex == 1 & ret$Yr == 2011,  6:ncol(ret)], col = col.vec[4], pch = 4)
legend ("bottomright", legend = c("1911-1979", "1980-2001", "2002-2010", "2011-2020"),
        col = col.vec[1:4], pch = 1:4,lty = 1, lwd = 2, bty = 'n')
grid()
dev.off()


#################################################################################################################
# Assessment History
#################################################################################################################
dat = read.csv("//nwcfile/FRAM/Assessments/CurrentAssessments/Dover_sole_2021/models/past_assessments.csv")

base.yr  = model$timeseries[,"Yr"]
yr = base.yr[base.yr <= 2021]
base_ssb = model$timeseries[1:length(yr),"SpawnBio"]
base_depl = base_ssb / base_ssb[1]

colors = c("black", "red", "blue", "darkorange")

pngfun(wd =  savedir, file = 'assessment_history.png', w = 7, h = 10)
par(mfrow = c(2, 1), mar = c(4, 4, 2, 2))
plot(yr, base_ssb, type = 'l', lwd = 2, col = colors[1], ylim=c(0, 500000), 
	ylab = "Spawning output (mt)", xlab = "Year")
ssb = dat$X2011
lines(dat$Year[1:length(ssb)], ssb, lty = 2, col = colors[2], lwd = 2)
ssb = dat$X2005
lines(dat$Year[1:length(ssb)], ssb, lty = 2, col = colors[3], lwd = 2)
ssb = dat$X2001
lines(dat$Year[1:length(ssb)], ssb, lty = 2, col = colors[4], lwd = 2)

plot(yr, base_depl, type = 'l', lwd = 2, col = colors[1], 
	ylab = "Relative Biomass", xlab = "Year", ylim = c(0, 1.05))
depl = dat$X2011 / dat$X2011[1]
lines(dat$Year[1:length(depl)], depl, lty = 2, col = colors[2], lwd = 2)
depl = dat$X2005 / dat$X2005[1]
lines(dat$Year[1:length(depl)], depl, lty = 2, col = colors[3], lwd = 2)
depl = dat$X2001 / dat$X2001[which(!is.na(dat$X2001))[1]]
lines(dat$Year[1:length(depl)], depl, lty = 2, col = colors[4], lwd = 2)

legend("bottomleft", bty = 'n', legend = c(2021, 2011, 2005, 2001), col = colors, 
       lty = c(1,2,2,2), lwd = 2, cex = 1.1)
dev.off()


###################################################################
# Map
###################################################################

# define names and colors for each area
mod.names <- c("Management  Range", "Assessment Range")
mod.cols  <- c("blue", "red")
# load packages
require(maps)
require(mapdata)

# open PNGfile
pngfun(wd =  savedir, file = 'map.png', w = 7, h = 10)
# map with Canada and Mexico (not sure how to add states on this one)
map('worldHires', regions=c("Canada","Mexico"),
    xlim=c(-130, -114), ylim=c(31, 51),
    col='grey', fill=TRUE, interior=TRUE, , lwd=1)
# horizontal line at 40-10
#abline(h=c(40+10/60), lty=3)
# map with US states
map('state', regions=c("Wash","Oreg","Calif","Idaho",
                 "Montana","Nevada","Arizona","Utah"),
    add=TRUE,
    col='grey', fill=TRUE, interior=TRUE, lwd=1)
axis(2, at=seq(32,50,2), lab=paste0(seq(32,50,2), "°N"), las=1)
axis(1, at=seq(-130,-114,4), lab=paste0(abs(seq(-130,-114,4)), "°W"))
#map.axes()

## add vertical lines indicating range for each stock
latrange <- c(32.5, 48.5) + c(.2, -.2)
lines(rep(-128,2), latrange, lwd=10, col=mod.cols[1])
text(-128-.8, mean(latrange), mod.names[1], srt=90)
latrange <- c(32.5, 48.5) + c(.2, -.2)
lines(rep(-126,2), latrange, lwd=10, col=mod.cols[2])
text(-126-.8, mean(latrange), mod.names[2], srt=90)
#
text(-120, 50, "Canada")
text(-120, 47, "Washington")
text(-121, 44, "Oregon")
text(-119.5, 37, "California")
text(-115.5, 32.1, "Mexico")
#
box()
dev.off()