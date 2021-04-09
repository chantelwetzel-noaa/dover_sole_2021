##############################################################################################################
# Compare Indices
#############################################################################################################
library(HandyCode)
library(r4ss)

dat_loc = "//nwcfile/FRAM/Assessments/CurrentAssessments/Dover_sole_2021/data/survey"
mod_loc = "C:/Assessments/2021/dover_sole_2021/models"

base_name = "5.7.1_dw_francis"

# Grab the design-based index
wcgbt_db = read.csv(file.path(dat_loc, "wcgbts", "forSS", "nwfsc_wcgbts_design_based_indices.csv"), header = TRUE)
wcgbt_db$Fleet = 6
tri_e_db = read.csv(file.path(dat_loc, "triennial", "forSS", "triennial_early_design_based_indices.csv"), header = TRUE)
tri_e_db$Fleet = 4
tri_l_db = read.csv(file.path(dat_loc, "triennial", "forSS", "triennial_late_design_based_indices.csv"), header = TRUE)
tri_l_db$Fleet = 4
afsc_db  = read.csv(file.path(dat_loc, "afsc_slope", "forSS", "afsc_slope_design_based_indices.csv"), header = TRUE)
afsc_db$Fleet = 3
nwfsc_db = read.csv(file.path(dat_loc, "nwfsc_slope", "forSS", "nwfsc_slope_design_based_indices.csv"), header = TRUE)
nwfsc_db$Fleet = 5

db_mat = rbind(afsc_db, tri_e_db, tri_l_db, nwfsc_db, wcgbt_db)

# Grab the 2011 indices
mod_2011 = SS_output(file.path(mod_loc, "_2011_model"))$cpue 

# Grab the 2021 vast indices
mod_2021 = SS_output(file.path(mod_loc, base_name))$cpue

name = c("AFSC Slope", "Triennial", "NWFSC Slope", "NWFSC WCGBT")
add = c(0.10, 0.50, 0.10, 0.2)

png(file.path(dat_loc, 'plots', 'db_index_comparison.png'),
    width = 12, height = 12, units='in', res=300, pointsize=10)
par(mfrow=c(2,2))
for(ind in c(2, 1, 3, 4)){
	a = 2 + ind
	x = db_mat[db_mat$Fleet == a, ]
	db_hi = qlnorm(0.975, meanlog = log(x$Value / 1000), sdlog = x$seLogB)
	db_lo = qlnorm(0.025, meanlog = log(x$Value / 1000), sdlog = x$seLogB)

	y = mod_2011[mod_2011$Fleet == (3 + ind), ]
	hi = qlnorm(0.975, meanlog = log(y$Obs), sdlog = y$SE )
	lo = qlnorm(0.025, meanlog = log(y$Obs), sdlog = y$SE )
	years_y = y$Yr

	z = mod_2021[mod_2021$Fleet == (2 + ind), ]
	hi2 = qlnorm(0.975, meanlog = log(z$Obs), sdlog = z$SE )
	lo2 = qlnorm(0.025, meanlog = log(z$Obs), sdlog = z$SE )
	years = z$Yr
		
	plot(0, type = 'n', xlim = range(years), ylim = c(0, 1.1 * max(c(hi2, db_hi))), 
		xlab = "Year", ylab = "Index", yaxs = 'i', main = name[ind])
	arrows(x0 = years, y0 = lo2, x1 = years, y1 = hi2, angle = 90, code = 3, length = 0.01, lwd = 2)
	points(years, z$Obs, pch = 21, bg = 'white', cex = 1.2)

	#arrows(x0 = years_y + 0.20, y0 = lo, x1 = years_y + 0.20, y1 = hi, angle = 90, 
	#	code = 3, length = 0.01, col = 2, lwd = 2)
	#points(years_y + 0.20, y$Obs, pch = 21, bg = 'white', cex = 1.2)

	arrows(x0 = years + add[ind], y0 = db_lo, x1 = years + add[ind], y1 = db_hi, angle = 90, 
		code = 3, length = 0.01, col = 2, lwd = 2)
	points(years + add[ind], x$Value / 1000, pch = 21, bg = 'white', cex = 1.2, col = 2)
	if (ind == 2){
		legend("topleft", legend=c( "VAST",  "Design-Based"), col = c(1, 2), 
			lty = 1, bty='n', lwd = 2)
	}
}
dev.off()


###########################################################################################################
# Compare with indices from 2011
############################################################################################################

dat_loc = "//nwcfile/FRAM/Assessments/CurrentAssessments/Dover_sole_2021/data/survey"
mod_loc = "C:/Assessments/2021/dover_sole_2021/models"

base_name = "7.0.1_base"

# Grab the 2011 indices
mod_2011 = SS_output(file.path(mod_loc, "_2011_model"))$cpue 

# Grab the 2021 vast indices
mod_2021 = SS_output(file.path(mod_loc, base_name))$cpue

name = c("AFSC Slope", "Triennial", "NWFSC Slope", "NWFSC WCGBT")
add = c(0.10, 0.50, 0.10, 0.2)

png(file.path(dat_loc, 'plots', '2011_index_comparison.png'),
    width = 12, height = 12, units='in', res=300, pointsize=10)

par(mfrow=c(2,2))
for(ind in c(2, 1, 3, 4)){
	a = 2 + ind

	y = mod_2011[mod_2011$Fleet == (3 + ind), ]
	hi = qlnorm(0.975, meanlog = log(y$Obs), sdlog = y$SE )
	lo = qlnorm(0.025, meanlog = log(y$Obs), sdlog = y$SE )
	years_y = y$Yr

	z = mod_2021[mod_2021$Fleet == (2 + ind), ]
	hi2 = qlnorm(0.975, meanlog = log(z$Obs), sdlog = z$SE )
	lo2 = qlnorm(0.025, meanlog = log(z$Obs), sdlog = z$SE )
	years = z$Yr
		
	plot(0, type = 'n', xlim = range(years), ylim = c(0, 1.1 * max(c(hi2, hi))), 
		xlab = "Year", ylab = "Index", yaxs = 'i', main = name[ind])
	arrows(x0 = years, y0 = lo2, x1 = years, y1 = hi2, angle = 90, code = 3, length = 0.01, lwd = 2)
	points(years, z$Obs, pch = 21, bg = 'white', cex = 1.2)

	arrows(x0 = years_y + add[ind], y0 = lo, x1 = years_y + add[ind], y1 = hi, angle = 90, 
		code = 3, length = 0.01, col = 2, lwd = 2)
	points(years_y + add[ind], y$Obs, pch = 21, bg = 'white', cex = 1.2)

	if (ind == 2){
		legend("topleft", legend=c( "2021",  "2011"), col = c(1, 2), 
			lty = 1, bty='n', lwd = 2)
	}
}
dev.off()


