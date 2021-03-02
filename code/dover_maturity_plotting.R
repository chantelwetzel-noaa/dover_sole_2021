###################################################
#	    Dover sole maturity figures
#	    	 2021 Assessment
#	    	 Chantel Wetzel
#################################################
library(HandyCode)
dir = "//nwcfile/FRAM/Assessments/CurrentAssessments/Dover_sole_2021/data"


# Maturity-at-length
# Functional
	# Coastwide
	cw_l50 = 32.84
	cw_slope = -0.278
	
	# North and South of Pt. Reyes
	north_l50 = 32.23
	north_slope = -0.304

	south_l50 = 39.84
	south_slope = -0.308

# Biological
	# Coastwide
	cw_l50_bio = 32.68
	cw_slope_bio = -0.303

	north_l50_bio = 31.34
	north_slope_bio = -0.370

	south_l50_bio = 39.62
	south_slope_bio = 0.264

len_bin = 0:60

get_mat <- function(len_bin, l50, slope){
	mat = 1 / (1 + exp(slope*(len_bin - l50)))
	return(mat)
}


pngfun(wd = file.path(dir,  "biology", "plots"), file = "Maturity_Functional_vs_Biological.png", w = 7, h = 7, pt = 12)
plot(len_bin, get_mat(len_bin, cw_l50, cw_slope), type = 'l', lwd = 2,
	col = 'red', ylab = "Proportion Mature", xlab = "Length (cm)", yaxs="i")
abline(v = cw_l50, col = 'red', lty = 2)
lines(len_bin, get_mat(len_bin, cw_l50_bio, cw_slope_bio), lwd = 2,
	lty = 3, col = 'blue')
abline(v = cw_l50_bio, col = 'blue', lty = 2)
legend('topleft', bty = 'n', legend = c("Biological Maturity", "Functional Maturity"), 
	col = c('blue', 'red'), lwd = 2, lty = c(3, 1))
dev.off()


pngfun(wd = file.path(dir,  "biology", "plots"), file = "Maturity_by_Area.png", w = 7, h = 7, pt = 12)
plot(len_bin, get_mat(len_bin, cw_l50, cw_slope), type = 'l', lwd = 2,
	col = 'black', ylab = "Proportion Mature", xlab = "Length (cm)", yaxs="i")
abline(v = cw_l50, col = 'black', lty = 2)
lines(len_bin, get_mat(len_bin, north_l50, north_slope), lwd = 3,
	lty = 3, col = 'blue')
abline(v = north_l50, col = 'blue', lty = 2)
lines(len_bin, get_mat(len_bin, south_l50, south_slope), lwd = 3,
	lty = 3, col = 'red')
abline(v = south_l50, col = 'red', lty = 2)
legend('topleft', bty = 'n', legend = c("Coastwide", "North of Point Reyes",
	"South of Point Reyes"), col = c(1, 'blue', 'red'), lwd = 2, lty = c(1,3,3))
dev.off()

pngfun(wd = file.path(dir,  "biology", "plots"), file = "Maturity_Comparison.png", w = 7, h = 7, pt = 12)
plot(len_bin, get_mat(len_bin, cw_l50, cw_slope), type = 'l', lwd = 2,
	col = 'black', ylab = "Proportion Mature", xlab = "Length (cm)", yaxs="i")
abline(v = cw_l50, col = 'black', lty = 2)
lines(len_bin, get_mat(len_bin, l50 = 35, slope = -0.775), lwd = 3,
	lty = 3, col = 'red')
abline(v = 35, col = 'red', lty = 2)
legend('topleft', bty = 'n', legend = c("New", "Old"), col = c(1, 'red'), lwd = 2, lty = c(1,3))
dev.off()

##############################################################################################
# Load the survey data to explore difference by area
##############################################################################################
devtools::load_all("C:/Users/Chantel.Wetzel/Documents/GitHub/dataModerate_2021")
devtools::load_all("C:/Users/Chantel.Wetzel/Documents/GitHub/PacFIN.Utilities")
mat_data = read.csv(file.path(dir, "biology", "maturity", "2013_2019 Dover sole maturity.csv"))
data_dir ="//nwcfile/FRAM/Assessments/CurrentAssessments/Dover_sole_2021/data/survey/wcgbts"
load(file.path(data_dir, "Catch__NWFSC.Combo_2020-10-15.rda"))
catch = Out
load(file.path(data_dir, "Bio_All_NWFSC.Combo_2020-10-15.rda"))
bio = Data

# > table(mat_data$Year[south])
# 
# 2013 2017 2018 2019 
#   19   16   38   32 
# > table(mat_data$Year[north])
# 
# 2013 2017 2018 2019 
#   84   48   41   58 
# Proportion south by year:
# 2013: 18%, 2017: 26%, 2018: 48%, 2019:36%

# bio = checkLenAge(Pdata = bio[s,], 
#    			      Par =  list( 0.15, 45, 8, 0.10, 0.10), 
#    			      len_col = "Length_cm", 
#    			      age_col = "Age", 
#    			      sex_col = "Sex",
#    			      mult = 1)



library(plyr)
bio$lat_bin = round_any(bio$Latitude_dd, 1)
table(bio$lat_bin, bio$Sex)

s = which(bio$Latitude_dd <= 38 & bio$Sex == "F")
n = which(bio$Latitude_dd > 38 & bio$Sex == "F")

south = which(mat_data$Latitude_dd <= 38)
north = which(mat_data$Latitude_dd > 38)
pngfun(wd = file.path(dir,  "biology", "plots"), file = "Maturity_Samples_North_South.png", w = 7, h = 7, pt = 12)
par(mfrow = c(3, 1), mar = c(4,4,2,2))
plot(mat_data[north, "Depth_m"], mat_data[north, "Length"],  type = 'p', col = 'blue', 
	ylab = "Length (cm)", xlab = "Depth (m)", xlim = c(83, 1240), ylim = c(0, 60))
points(mat_data[north, "Depth_m"], mat_data[north, "Length"], pch = 16, col = 'blue')
points(mat_data[south, "Depth_m"], mat_data[south, "Length"], pch = 16, col = 'red')

plot(mat_data[north, "Depth_m"], mat_data[north, "Age"],  type = 'p', col = 'blue', 
	ylab = "Age", xlab = "Depth (m)", xlim = c(83, 1240), ylim = c(0, 60))
points(mat_data[north, "Depth_m"], mat_data[north, "Age"], pch = 16, col = 'blue')
points(mat_data[south, "Depth_m"], mat_data[south, "Age"], pch = 16, col = 'red')


plot(mat_data[north, "Age"], mat_data[north, "Length"], type = 'p', col = 'blue', 
	ylab = "Length (cm)", xlab = "Age", xlim = c(0, 60), ylim = c(0, 70))
points(mat_data[north, "Age"], mat_data[north, "Length"], pch = 16, col = 'blue')
points(mat_data[south, "Age"], mat_data[south, "Length"], pch = 16, col = 'red')
legend('bottomright', bty = 'n', legend = c("South of Point Reyes", "North of Point Reyes"),
	col = c('red', 'blue'), pch = 16)
dev.off()

pngfun(wd = file.path(dir,  "biology", "plots"), file = "Females_North_South.png", w = 7, h = 7, pt = 12)

color = c(alpha('green', 0.1), alpha('purple', 0.5))
# Look across all the data:
par(mfrow = c(2, 2), mar = c(4,4,2,2))
plot(bio[n, "Depth_m"], bio[n, "Length_cm"],  type = 'p', col = color[2], 
	ylab = "Length (cm)", xlab = "Depth (m)",
	xlim = c(83, 1240), ylim = c(0, 60))
mtext(side = 3, "NWFSC WCGBT", outside = TREU)
points(bio[n, "Depth_m"], bio[n, "Length_cm"], pch = 16, col = color[2])
points(bio[s, "Depth_m"], bio[s, "Length_cm"], pch = 1, col = color[1])
points(bio[n, "Depth_m"], bio[n, "Length_cm"], pch = 16, col = alpha('purple', 0.01))


color = c(alpha('green', 0.1), alpha('purple', 0.5))
plot(bio[n, "Age"], bio[n, "Length_cm"], type = 'p', col = color[2], 
	ylab = "Length (cm)", xlab = "Age", xlim = c(0, 60), ylim = c(0, 70))
points(bio[n, "Age"], bio[n, "Length_cm"], pch = 16, col = color[2])
points(bio[s, "Age"], bio[s, "Length_cm"], pch = 16, col = color[1])

legend('bottomright', bty = 'n', legend = c("South of Point Reyes", "North of Point Reyes"),
	col = color, pch = c(16, 16))

plot(bio[n, "Depth_m"], bio[n, "Age"],  type = 'p', col = color[2], 
	ylab = "Age", xlab = "Depth (m)", xlim = c(83, 1240), ylim = c(0, 60))
points(bio[n, "Depth_m"], bio[n, "Age"], pch = 16, col = color[2])
points(bio[s, "Depth_m"], bio[s, "Age"], pch = 16, col = color[1])

plot(bio[n, "Length_cm"], bio[n, "Weight"], type = 'p', col = color[2], 
	ylab = "Weight (kg)", xlab = "Length (cm)", xlim = c(0, 70), ylim = c(0, 2.5))
points(bio[n, "Length_cm"], bio[n, "Weight"], pch = 16, col = color[2])
points(bio[s, "Length_cm"], bio[s, "Weight"], pch = 16, col = color[1])
#legend('bottomright', bty = 'n', legend = c("South of Point Reyes", "North of Point Reyes"),
#	col = color, pch = c(16, 16))
dev.off()


pngfun(wd = file.path(dir,  "biology", "plots"), file = "Maturity_Samples_by_Area.png", w = 12, h = 12, pt = 12)
color = c(alpha('black', 0.75), alpha('red', 1), alpha('green3', 1), alpha('magenta3', 1))
par(mfrow = c(3, 2), mar = c(5,5,4,2))
# North - Length at Depth
plot(bio[n, "Depth_m"], bio[n, "Length_cm"],  type = 'p', pch = 1, col = color[2], 
	ylab = "Length (cm)", xlab = "Depth (m)", main = "North of Point Reyes", 
	xlim = c(83, 1240), ylim = c(0, 70), cex.axis = 1.5, cex.lab = 1.75, cex.main = 2)
points(mat_data[north, "Depth_m"], mat_data[north, "Length"], pch = 16, col = color[1], cex = 1.5)
# South - Length at Depth
plot(bio[s, "Depth_m"], bio[s, "Length_cm"],  type = 'p', pch = 1, col = color[2], 
	ylab = "Length (cm)", xlab = "Depth (m)", main = "South of Point Reyes", 
	xlim = c(83, 1240), ylim = c(0, 70), cex.axis = 1.5, cex.lab = 1.75, cex.main = 2)
points(mat_data[south, "Depth_m"], mat_data[south, "Length"], pch = 16, col = color[1], cex = 1.5)
# North - Age at Depth
plot(bio[n, "Depth_m"], bio[n, "Age"],  type = 'p', pch = 1, col = color[2], 
	ylab = "Age", xlab = "Depth (m)", xlim = c(83, 1240), ylim = c(0, 60),
	cex.axis = 1.5, cex.lab = 1.75)
points(mat_data[north, "Depth_m"], mat_data[north, "Age"], pch = 16, col = color[1], cex = 1.5) 
# South - Age at Depth
plot(bio[s, "Depth_m"], bio[s, "Age"],  type = 'p', pch = 1, col = color[2], 
	ylab = "Age", xlab = "Depth (m)", 
	xlim = c(83, 1240), ylim = c(0, 60), cex.axis = 1.5, cex.lab = 1.75)
points(mat_data[south, "Depth_m"], mat_data[south, "Age"], pch = 16, col = color[1], cex = 1.5)
# North: Length-at-Age
plot(bio[n, "Age"], bio[n, "Length_cm"], type = 'p', pch = 1, col = color[2], 
	ylab = "Length (cm)", xlab = "Age", 
	xlim = c(0, 60), ylim = c(0, 70),cex.axis = 1.5, cex.lab = 1.75)
points(mat_data[north, "Age"], mat_data[north, "Length"], pch = 16, col = color[1], cex = 1.5)
# South: Length-at-Age
plot(bio[s, "Age"], bio[s, "Length_cm"], type = 'p', pch = 1, col = color[2], 
	ylab = "Length (cm)", xlab = "Age", 
	xlim = c(0, 60), ylim = c(0, 70), cex.axis = 1.5, cex.lab = 1.75)
points(mat_data[south, "Age"], mat_data[south, "Length"], pch = 16, col = color[1], cex = 1.5)
legend('bottomright', bty = 'n', legend = c("All Female Data", "Maturity"),
	col = color[rev(1:2)], pch = c(1, 16), cex = 2)
dev.off()

# Let's look by pass

p1s = which(bio$Latitude_dd <= 38 & bio$Sex == "F" & bio$Pass == 1)
p1n = which(bio$Latitude_dd > 38 & bio$Sex == "F" & bio$Pass == 1)
p2s = which(bio$Latitude_dd <= 38 & bio$Sex == "F" & bio$Pass == 2)
p2n = which(bio$Latitude_dd > 38 & bio$Sex == "F" & bio$Pass == 2)

par(mfrow = c(2, 2), mar = c(5,5,4,2))
# North - Length at Depth
plot(bio[p1n, "Depth_m"], bio[p1n, "Length_cm"],  type = 'p', pch = 1, col = color[2], 
	ylab = "Length (cm)", xlab = "Depth (m)", main = "Pass 1: North of Point Reyes", 
	xlim = c(83, 1240), ylim = c(0, 70), cex.axis = 1.5, cex.lab = 1.75, cex.main = 2)
# South - Length at Depth
plot(bio[p1s, "Depth_m"], bio[p1s, "Length_cm"],  type = 'p', pch = 1, col = color[2], 
	ylab = "Length (cm)", xlab = "Depth (m)", main = "Pass 1: South of Point Reyes", 
	xlim = c(83, 1240), ylim = c(0, 70), cex.axis = 1.5, cex.lab = 1.75, cex.main = 2)
# North
plot(bio[p2n, "Depth_m"], bio[p2n, "Length_cm"],  type = 'p', pch = 1, col = color[2], 
	ylab = "Length (cm)", xlab = "Depth (m)", main = "Pass 2: North of Point Reyes", 
	xlim = c(83, 1240), ylim = c(0, 70), cex.axis = 1.5, cex.lab = 1.75, cex.main = 2)
# South - Length at Depth
plot(bio[p2s, "Depth_m"], bio[p2s, "Length_cm"],  type = 'p', pch = 1, col = color[2], 
	ylab = "Length (cm)", xlab = "Depth (m)", main = "Pass 2: South of Point Reyes", 
	xlim = c(83, 1240), ylim = c(0, 70), cex.axis = 1.5, cex.lab = 1.75, cex.main = 2)



pngfun(wd = file.path(dir,  "biology", "plots"), file = "Len_Age_by_Latitude.png", w = 12, h = 12, pt = 12)
color = c(alpha('blue', 0.25), alpha('red', 0.25))
par(mfrow = c(4, 2), mar = c(4,5,2,2), oma = c(5,2,2,2))
plot(bio[bio$Sex == 'F', "Latitude_dd"], bio[bio$Sex == 'F',"Length_cm"], type = 'p', pch = 1, 
	xlab = "", ylab = "Length (cm)", cex.lab = 1.5, cex.axis = 1.25, col = color[2],
	main = "Female Lengths - All Depths", cex.main = 1.5, ylim = c(0,70))
abline(v = 38, col = 1, lty = 2)
plot(bio[bio$Sex == 'M', "Latitude_dd"], bio[bio$Sex == 'M',"Length_cm"], type = 'p', pch = 1, 
	xlab = "", ylab = "Length (cm)", cex.lab = 1.5, cex.axis = 1.25, col = color[1],
	main = "Male Lengths - All Depths", cex.main = 1.5, ylim = c(0,70))
abline(v = 38, col = 1, lty = 2)
plot(bio[bio$Sex == 'F' & bio$Depth_m < 300, "Latitude_dd"], bio[bio$Sex == 'F' & bio$Depth_m < 300,"Length_cm"], type = 'p', pch = 1, 
	xlab = "", ylab = "Length (cm)", cex.lab = 1.5, cex.axis = 1.25, col = color[2],
	main = "Female Lengths - Depth < 300 m", cex.main = 1.5, ylim = c(0,70))
abline(v = 38, col = 1, lty = 2)
plot(bio[bio$Sex == 'M' & bio$Depth_m < 300, "Latitude_dd"], bio[bio$Sex == 'M' & bio$Depth_m < 300,"Length_cm"], type = 'p', pch = 1, 
	xlab = "", ylab = "Length (cm)", cex.lab = 1.5, cex.axis = 1.25, col = color[1],
	main = "Male Lengths - Depth < 300 m", cex.main = 1.5, ylim = c(0,70))
abline(v = 38, col = 1, lty = 2)

color = c(alpha('blue', 0.35), alpha('red', 0.35))
plot(bio[bio$Sex == 'F', "Latitude_dd"], bio[bio$Sex == 'F',"Age"], type = 'p', pch = 1, 
	xlab = "", ylab = "Age", cex.lab = 1.5, cex.axis = 1.25, col = color[2],
	main = "Female Lengths - All Depths",, cex.main = 1.5, ylim = c(0, 60))
abline(v = 38, col = 1, lty = 2)
plot(bio[bio$Sex == 'M', "Latitude_dd"], bio[bio$Sex == 'M',"Age"], type = 'p', pch = 1, 
	xlab = "", ylab = "Age", cex.lab = 1.5, cex.axis = 1.25, col = color[1],
	main = "Male Lengths - All Depths", cex.main = 1.5, ylim = c(0, 60))
abline(v = 38, col = 1, lty = 2)
color = c(alpha('blue', 0.75), alpha('red', 0.75))
plot(bio[bio$Sex == 'F'  & bio$Depth_m < 300, "Latitude_dd"], bio[bio$Sex == 'F'  & bio$Depth_m < 300,"Age"], type = 'p', pch = 1, 
	xlab = "Latitude", ylab = "Age", cex.lab = 1.5, cex.axis = 1.25, col = color[2],
	main = "Female Ages - Depth < 300 m", cex.main = 1.5, ylim = c(0,60))
abline(v = 38, col = 1, lty = 2)
plot(bio[bio$Sex == 'M' & bio$Depth_m < 300, "Latitude_dd"], bio[bio$Sex == 'M'  & bio$Depth_m < 300,"Age"], type = 'p', pch = 1, 
	xlab = "Latitude", ylab = "Age", cex.lab = 1.5, cex.axis = 1.25, col = color[1],
	main = "Male Ages - Depth < 300 m", cex.main = 1.5, ylim = c(0,70))
abline(v = 38, col = 1, lty = 2)

dev.off()