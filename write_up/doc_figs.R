library(HandyCode)
library(r4ss)

savedir = "C:/Assessments/2021/dover_sole_2021/write_up/figs"
mydir = "C:/Assessments/2021/dover_sole_2021/models"

base_name = "1.8_selex_dome_m"
model = SS_output(file.path(mydir, base_name))


pngfun(wd = savedir, 'unavailable_biomass.png', w = 10, h = 7)
	SSunavailableSpawningOutput(model, plot=TRUE)
dev.off()

SS_fitbiasramp(model,  method="BFGS", twoplots=FALSE,
           transform = FALSE, print = TRUE, plotdir = savedir ,shownew = FALSE,
           pwidth=6.5, pheight=5.0, punits="in", ptsize=10, res=300, cex.main=1)

# Create selectivity plots
fleets = model$FleetNames

test <- SSplotSelex(model, fleets=1, fleetnames=fleets[1], subplot=1, year = c(1980, 1995, 2020))
test$infotable$longname = c("CA (f): 1910-1980", "CA (m): 1910-1980", 
							"CA (f): 1981-1995", "CA (m): 1981-1995", 
							"CA (f): 1996 - 2020", "CA (m): 1996 - 2020")
test$infotable$col <- rich.colors.short(8)[c(1,1)]
test1 <- SSplotSelex(model, fleets=2, fleetnames=fleets[2], year = c(1980, 1995, 2020), subplot=1)
test1$infotable$col <- "red"
test1$infotable$longname = c("OR-WA (f): 1910-1980",   "OR-WA (m): 1910-1980", 
							 "OR-WA (f): 1981-1995",   "OR-WA (m): 1981-1995", 
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


pngfun(wd = savedir, 'selectivity.png', w = 7, h = 10)
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
	ylab = "Retention", xlab = "Length (cm)", main = "California", lwd = 2)
points(lens, ret[ret$Fleet == 1 & ret$Sex == 1 & ret$Yr == 1947,  6:ncol(ret)], col = col.vec[1], pch = 1)
lines( lens, ret[ret$Fleet == 1 & ret$Sex == 1 & ret$Yr == 1948,  6:ncol(ret)], col = col.vec[2], lty = 1, lwd = 2)
points(lens, ret[ret$Fleet == 1 & ret$Sex == 1 & ret$Yr == 1948,  6:ncol(ret)], col = col.vec[2], pch = 2)
lines( lens, ret[ret$Fleet == 1 & ret$Sex == 1 & ret$Yr == 2004,  6:ncol(ret)], col = col.vec[3], lty = 1, lwd = 2)
points(lens, ret[ret$Fleet == 1 & ret$Sex == 1 & ret$Yr == 2004,  6:ncol(ret)], col = col.vec[3], pch = 3)
lines( lens, ret[ret$Fleet == 1 & ret$Sex == 1 & ret$Yr == 2011,  6:ncol(ret)], col = col.vec[4], lty = 1, lwd = 2)
points(lens, ret[ret$Fleet == 1 & ret$Sex == 1 & ret$Yr == 2011,  6:ncol(ret)], col = col.vec[4], pch = 4)
legend ("bottomright", legend = c("1911-1947", "1948-2003", "2004-2010", "2011-2020"),
        col = col.vec[1:4], pch = 1:4,lty = 1, lwd = 2, bty = 'n')
grid()

plot(  lens, ret[ret$Fleet == 2 & ret$Sex == 1 & ret$Yr == 1988,  6:ncol(ret)], col = col.vec[1], type = 'l', 
	ylab = "Retention", xlab = "Length (cm)", main = "Oregon-Washington", lwd = 2)
points(lens, ret[ret$Fleet == 2 & ret$Sex == 1 & ret$Yr == 1988,  6:ncol(ret)], col = col.vec[1], pch = 1)
lines( lens, ret[ret$Fleet == 2 & ret$Sex == 1 & ret$Yr == 1989,  6:ncol(ret)], col = col.vec[2], lty = 1, lwd = 2)
points(lens, ret[ret$Fleet == 2 & ret$Sex == 1 & ret$Yr == 1989,  6:ncol(ret)], col = col.vec[2], pch = 2)
lines( lens, ret[ret$Fleet == 2 & ret$Sex == 1 & ret$Yr == 2004,  6:ncol(ret)], col = col.vec[3], lty = 1, lwd = 2)
points(lens, ret[ret$Fleet == 2 & ret$Sex == 1 & ret$Yr == 2004,  6:ncol(ret)], col = col.vec[3], pch = 3)
lines( lens, ret[ret$Fleet == 2 & ret$Sex == 1 & ret$Yr == 2011,  6:ncol(ret)], col = col.vec[4], lty = 1, lwd = 2)
points(lens, ret[ret$Fleet == 2 & ret$Sex == 1 & ret$Yr == 2011,  6:ncol(ret)], col = col.vec[4], pch = 4)
legend ("bottomright", legend = c("1911-1987", "1988-2003", "2004-2010", "2011-2020"),
        col = col.vec[1:4], pch = 1:4,lty = 1, lwd = 2, bty = 'n')
grid()
dev.off()