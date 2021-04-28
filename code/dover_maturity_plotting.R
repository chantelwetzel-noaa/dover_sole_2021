###################################################
#	    Dover sole maturity figures
#	    	 2021 Assessment
#	    	 Chantel Wetzel
#################################################
library(HandyCode)
library(ggplot2)
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



pngfun(wd = file.path(dir,  "biology", "plots"), file = "Maturity_Samples_by_Area_2_by_3.png",
 w = 12, h = , pt = 12)
color = c(alpha('black', 0.75), alpha('red', 1), alpha('green3', 1), alpha('magenta3', 1))
par(mfrow = c(2, 3), mar = c(5,5,4,2))
# North - Length at Depth
plot(bio[n, "Depth_m"], bio[n, "Length_cm"],  type = 'p', pch = 1, col = color[2], 
	ylab = "Length (cm)", xlab = "Depth (m)", main = "", 
	xlim = c(83, 1240), ylim = c(0, 70), cex.axis = 1.5, cex.lab = 1.75, cex.main = 2)
points(mat_data[north, "Depth_m"], mat_data[north, "Length"], pch = 16, col = color[1], cex = 1.5)
# North - Age at Depth
plot(bio[n, "Depth_m"], bio[n, "Age"],  type = 'p', pch = 1, col = color[2], 
	ylab = "Age", xlab = "Depth (m)", xlim = c(83, 1240), ylim = c(0, 60),
	main = "North of Point Reyes", cex.axis = 1.5, cex.lab = 1.75, cex.main = 2)
points(mat_data[north, "Depth_m"], mat_data[north, "Age"], pch = 16, col = color[1], cex = 1.5) 
# North: Length-at-Age
plot(bio[n, "Age"], bio[n, "Length_cm"], type = 'p', pch = 1, col = color[2], 
	ylab = "Length (cm)", xlab = "Age", 
	xlim = c(0, 60), ylim = c(0, 70),cex.axis = 1.5, cex.lab = 1.75)
points(mat_data[north, "Age"], mat_data[north, "Length"], pch = 16, col = color[1], cex = 1.5)
# South - Length at Depth
plot(bio[s, "Depth_m"], bio[s, "Length_cm"],  type = 'p', pch = 1, col = color[2], 
	ylab = "Length (cm)", xlab = "Depth (m)", main = "", 
	xlim = c(83, 1240), ylim = c(0, 70), cex.axis = 1.5, cex.lab = 1.75, cex.main = 2)
points(mat_data[south, "Depth_m"], mat_data[south, "Length"], pch = 16, col = color[1], cex = 1.5)
# South - Age at Depth
plot(bio[s, "Depth_m"], bio[s, "Age"],  type = 'p', pch = 1, col = color[2], 
	ylab = "Age", xlab = "Depth (m)", main = "South of Point Reyes",
	xlim = c(83, 1240), ylim = c(0, 60), cex.axis = 1.5, cex.lab = 1.75, cex.main = 2)
points(mat_data[south, "Depth_m"], mat_data[south, "Age"], pch = 16, col = color[1], cex = 1.5)
# South: Length-at-Age
plot(bio[s, "Age"], bio[s, "Length_cm"], type = 'p', pch = 1, col = color[2], 
	ylab = "Length (cm)", xlab = "Age", 
	xlim = c(0, 60), ylim = c(0, 70), cex.axis = 1.5, cex.lab = 1.75)
points(mat_data[south, "Age"], mat_data[south, "Length"], pch = 16, col = color[1], cex = 1.5)
legend('bottomright', bty = 'n', legend = c("All Female Data", "Maturity"),
	col = color[rev(1:2)], pch = c(1, 16), cex = 2)
dev.off()



pngfun(wd = file.path(dir,  "biology", "plots"), 
	file = "Maturity_Samples_Coastwide.png", w = 12, h = 7, pt = 12)
color = c(alpha('darkmagenta', 1), alpha('grey60', 0.5))
par(mfrow = c(1, 2), mar = c(5,5,4,2))
# North - Length at Depth
plot(bio[, "Depth_m"], bio[, "Length_cm"],  type = 'p', pch = 1, col = color[2], 
	ylab = "Length (cm)", xlab = "Depth (m)", main = "", 
	xlim = c(83, 1240), ylim = c(0, 70), cex.axis = 1.5, cex.lab = 1.75, cex.main = 2)
points(mat_data[, "Depth_m"], mat_data[, "Length"], pch = 16, col = color[1], cex = 1)
# South - Length at Depth
plot(bio[, "Latitude_dd"], bio[, "Length_cm"],  type = 'p', pch = 1, col = color[2], 
	ylab = "Length (cm)", xlab = "Latitude", main = "", 
	xlim = c(32, 48.5), ylim = c(0, 70), cex.axis = 1.5, cex.lab = 1.75, cex.main = 2)
points(mat_data[, "Latitude_dd"], mat_data[, "Length"], pch = 16, col = color[1], 
	cex = 1)
legend('topleft', bty = 'n', legend = c("All Samples", "Maturity"),
	col = c('grey60',color[1]), pch = c(1, 16), cex = 1.5)
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

mat_data$lat_bin = round_any(mat_data$Latitude_dd, 3)
mat_data$mat = mat_data$Functional_maturity
table(mat_data$lat_bin, mat_data$mat)

# Maturity GLM Example from Melissa
Dover.glm <- glm (mat ~ 1 + Length, data = mat_data[mat_data$Certainty==1, ],
                     family = binomial(link ="logit"))
A = as.numeric(Dover.glm$coefficients[1])
B = as.numeric(Dover.glm$coefficients[2])
sA = 0.9472
sB = 0.0275
r <- cor(mat_data$Length, mat_data$mat)
n <- 428
deltamethod <- ((sA^2)/(B^2))- ((2*A*sA*sB*r)/(B^3))+ (((A^2)*(sB^2))/(B^4))
1.96*(sqrt(deltamethod)/sqrt(n))
### CI: 0.5688321###
A/B

test_glm = glm(mat ~ 1 + Length + lat_bin, 
			   data = mat_data[mat_data$Certainty==1, ], # use on certain samples
			   family = binomial(link = "logit"))
summary(test_glm)
cor(mat_data$Length, mat_data$mat)

eqn1 = function(x){coef(test_glm)[2]*coef(test_glm)[1]}
eqn2 = function(x){coef(test_glm)[2]*coef(test_glm)[1]+coef(test_glm)[3]}

ggplot(mat_data, aes(y = mat, x = Length, color = lat_bin)) +
	geom_point() + 
	stat_function(fun = eqn1, geom = 'line', color = scales::hue_pal()(2)[1]) +
	stat_function(fun = eqn2, geom = 'line', color = scales::hue_pal()(2)[2])

h.alpha <- c(1, 0.75, 0.5, 0.25, 0)
colors <- heat.colors(12, alpha = 1)

ggPredict(test_glm, se = TRUE, jitter = TRUE, colorn = 5)
ggsave(file.path(dir,  "biology", "plots", "Maturity_by_Latitude_3_Degree_Bins.png"))


mat_data$Latitude_dd[mat_data$Survey.Type == "ODFW"] = 44
mat_data$lat_bin = round_any(mat_data$Latitude_dd, 2)
mat_data$lat_factor = factor(mat_data$lat_bin, 
						levels = sort(unique(mat_data$lat_bin)) )

test_glm = glm(mat ~ 1 + Length + lat_bin, 
			   data = mat_data[mat_data$Certainty==1, ], # use on certain samples
			   family = binomial(link = "logit"))
ggPredict(test_glm, se = TRUE, jitter = TRUE)
ggsave(file.path(dir,  "biology", "plots", "Maturity_by_Latitude_5_Degree_Bins.png"))

mat_data$area = ifelse(mat_data$Latitude_dd > 46, "WA",
			    ifelse(mat_data$Latitude < 46 & mat_data$Latitude > 42, "OR",
			    ifelse(mat_data$Latitude < 42 & mat_data$Latitude > 38, "N_38_CA",
			    	   "S_38_CA") ))

mat_data$area = factor(mat_data$area, levels = c(
                        "S_38_CA",
                        "N_38_CA",
                        "OR",
                        "WA") )
test_glm = glm(mat ~ 1 + Length + area, 
			   data = mat_data[mat_data$Certainty==1, ], # use on certain samples
			   family = binomial(link = "logit"))
ggPredict(test_glm, se = TRUE, jitter = TRUE, colorn = 5)
ggsave(file.path(dir,  "biology", "plots", "Maturity_by_State_Area.png"))

table(mat_data$area, mat_data$mat)
#           0  1
#  S_38_CA 74 31
#  N_38_CA 46 37
#  OR      36 179
#  WA      18 38


#  Double check the Oregon estimates
or_glm = glm(mat ~ 1 + Length, 
			 data = mat_data[mat_data$area == "OR" & mat_data$Certainty==1, ], # use on certain samples
			 family = binomial(link = "logit"))
summary(or_glm)
coef(or_glm)[1] / coef(or_glm)[2]
# 28.5 cm in Oregon alone
A = coef(or_glm)[1]
B = coef(or_glm)[2]
sA = 1.8253
sB = 0.0548
r <- cor(mat_data$Length[mat_data$area == "OR" & mat_data$Certainty==1], 
		 mat_data$mat[mat_data$area == "OR" & mat_data$Certainty==1])
n <- nrow(mat_data[mat_data$area == "OR" & mat_data$Certainty==1,])
deltamethod <- ((sA^2)/(B^2))- ((2*A*sA*sB*r)/(B^3))+ (((A^2)*(sB^2))/(B^4))
1.96*(sqrt(deltamethod)/sqrt(n))
# CI 1.37
# CI = 2.8 if only WCGBT data are used


wa_glm = glm(mat ~ 1 + Length, 
			 data = mat_data[mat_data$area == "WA" & mat_data$Certainty==1, ], # use on certain samples
			 family = binomial(link = "logit"))
summary(wa_glm)
coef(wa_glm)[1] / coef(wa_glm)[2]
# 32.5
A = coef(wa_glm)[1]
B = coef(wa_glm)[2]
sA = 2.24660
sB = 0.06325
r <- cor(mat_data$Length[mat_data$area == "WA" & mat_data$Certainty==1], 
		 mat_data$mat[mat_data$area == "WA" & mat_data$Certainty==1])
n <- nrow(mat_data[mat_data$area == "WA" & mat_data$Certainty==1,])
deltamethod <- ((sA^2)/(B^2))- ((2*A*sA*sB*r)/(B^3))+ (((A^2)*(sB^2))/(B^4))
1.96*(sqrt(deltamethod)/sqrt(n))
# CI = 4.93

n_ca_glm = glm(mat ~ 1 + Length, 
			 data = mat_data[mat_data$area == "N_38_CA" & mat_data$Certainty==1, ], # use on certain samples
			 family = binomial(link = "logit"))
summary(n_ca_glm)
coef(n_ca_glm)[1] / coef(n_ca_glm)[2]
# 35.6 cm 

A = coef(n_ca_glm)[1]
B = coef(n_ca_glm)[2]
sA = 3.36224
sB = 0.09443
r <- cor(mat_data$Length[mat_data$area == "N_38_CA" & mat_data$Certainty==1], 
		 mat_data$mat[mat_data$area == "N_38_CA" & mat_data$Certainty==1])
n <- 77
deltamethod <- ((sA^2)/(B^2))- ((2*A*sA*sB*r)/(B^3))+ (((A^2)*(sB^2))/(B^4))
1.96*(sqrt(deltamethod)/sqrt(n))
# CI = 3.43

s_ca_glm = glm(mat ~ 1 + Length, 
			 data = mat_data[mat_data$area == "S_38_CA" & mat_data$Certainty==1, ], # use on certain samples
			 family = binomial(link = "logit"))
summary(s_ca_glm)
coef(s_ca_glm)[1] / coef(s_ca_glm)[2]
# 39.8 cm
A = coef(s_ca_glm)[1]
B = coef(s_ca_glm)[2]
sA = 2.42
sB = 0.06
r <- cor(mat_data$Length[mat_data$area == "S_38_CA" & mat_data$Certainty==1], 
		 mat_data$mat[mat_data$area == "S_38_CA" & mat_data$Certainty==1])
n <- nrow(mat_data[mat_data$area == "S_38_CA" & mat_data$Certainty==1,])
deltamethod <- ((sA^2)/(B^2))- ((2*A*sA*sB*r)/(B^3))+ (((A^2)*(sB^2))/(B^4))
1.96*(sqrt(deltamethod)/sqrt(n))
# CI = 2.92

north_glm = glm(mat ~ 1 + Length, 
			 data = mat_data[mat_data$area %in% c("OR", "WA", "N_38_CA") & mat_data$Certainty==1, ], # use on certain samples
			 family = binomial(link = "logit"))
summary(north_glm)
coef(north_glm)[1] / coef(north_glm)[2]
# 31.2

df <- data.frame(date = mat_data$Trawl.Date,
				 month = as.numeric(format(mat_data$Trawl.Date, format = "%m")),
				 day = as.numeric(format(mat_data$Trawl.Date, format = "%d")),
                 year = as.numeric(format(mat_data$Trawl.Date, format = "%Y")))

mat_data$samp_date = as.Date(mat_data$Trawl.Date, format = "%m/%d/%y")
library(lubridate)
mat_data$month = month(ymd(mat_data$samp_date))           
table(mat_data$area[ mat_data$Certainty==1], mat_data$month[ mat_data$Certainty==1])
hist(mat_data$mat~mat_data$month)

mat_data$split = ifelse(mat_data$area == "S_38_CA", "South 38", "North 38")
mat_data$split_factor = factor(mat_data$split, 
						levels = sort(unique(mat_data$split)) )
test_glm = glm(mat ~ 1 + Length + split_factor, 
			   data = mat_data[mat_data$Certainty==1, ], # use on certain samples
			   family = binomial(link = "logit"))
ggPredict(test_glm, se = TRUE, jitter = TRUE)
ggsave(file.path(dir,  "biology", "plots", "Maturity_by_State_Area.png"))


len = 20:45
s_ca_ci = seq(36.9, 42.7, 0.1)
n_ca_ci = seq(32.2, 39.0, 0.1)
or = seq(27.1, 29.9, 0.1)
wa = seq(27.6, 37.4, 0.1)

pngfun(wd = file.path(dir,  "biology", "plots"), file = "Mat_by_Area_CI.png", w = 12, h = 10, pt = 12)
plot(s_ca_ci, rep(0.1, length(s_ca_ci)), type = 'l', lwd = 10, col = 'red', 
	xlim = c(20, 50), ylim = c(0, 0.7), axes = FALSE, xlab = "Length (cm)",
	ylab = "", cex.lab = 1.5)
axis(side = 1, cex.axis = 1.5)
points(39.8, 0.1, pch = 16, cex = 2)
lines(n_ca_ci, rep(0.2, length(n_ca_ci)),  lwd = 10, col = 'orange')
points(35.6, 0.2, pch = 16, cex = 2)
lines(or, rep(0.3, length(or)),  lwd = 10, col = 'darkviolet')
points(28.5, 0.3, pch = 16, cex = 2)
lines(wa, rep(0.4, length(wa)),  lwd = 10, col = 'blue')
points(32.5, 0.4, pch = 16, cex = 2)
legend('bottomleft', legend = c("South of 38 CA", "North of 38 CA", "Oregon", "Washington"),
	bty = 'n', col = c('red', 'orange', 'darkviolet', 'blue'), lwd = 10, cex = 1.5)
dev.off()


####################################
# Only look at WCGBT Samples in Oregon

sub_mat = mat_data[mat_data$area == "OR" & mat_data$Survey.Type == "WCGBT", ]
sub_glm = glm(mat ~ 1 + Length, 
			   data = sub_mat[sub_mat$Certainty==1, ], # use on certain samples
			   family = binomial(link = "logit"))
A = coef(sub_glm)[1]
B = coef(sub_glm)[2]
A/B
# 29.8 cm

sA = 2.48399
sB = 0.07738
r <- cor(sub_mat$Length[sub_mat$Certainty==1], 
		 sub_mat$mat[sub_mat$Certainty==1])
n <- nrow(sub_mat[sub_mat$Certainty==1,])
deltamethod <- ((sA^2)/(B^2))- ((2*A*sA*sB*r)/(B^3))+ (((A^2)*(sB^2))/(B^4))
1.96*(sqrt(deltamethod)/sqrt(n))