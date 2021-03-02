library(HandyCode)
library(dplyr)
options(stringsAsFactors = FALSE)
devtools::load_all("C:/Users/Chantel.Wetzel/Documents/GitHub/PacFIN.Utilities")

comp_dir = "N://Assessments/CurrentAssessments/Dover_sole_2021/data"
catch_dir = "//nwcfile/FRAM/Assessments/CurrentAssessments/Dover_sole_2021/data/catches"

#-----------------------------------------------------------------------------------
# Load the Commercial Comps
#-----------------------------------------------------------------------------------
bds_file = "PacFIN.DOVR.bds.12.Feb.2021.RData"
load(file.path(comp_dir, "commercial_comps", "pacfin", bds_file))
out = bds.pacfin 

# Example code below from the updated PacFIN.Utilities package
Pdata <- cleanPacFIN(Pdata = out,
					 keep_age_method = c("B", "BB", 1),
  					 CLEAN = TRUE, 
  					 verbose = TRUE)
table(Pdata$PACFIN_PORT_NAME, Pdata$SOURCE_AGID, exclude = F) 
south_port = c("AVILA", "MONTEREY", "MORRO BAY", "MOSS LNDG", "NEWPORT B.", "S. BARBARA",
	"SF", "TERMINAL I")
Pdata$area = "north"
Pdata$area[Pdata$PACFIN_PORT_NAME %in% south_port] = "south"
# table(Pdata$area)
#  north  south 
# 202427  24899 

par(mfrow = c(1,1))
boxplot(Pdata$lengthcm ~ Pdata$area)
par(mfrow = c(2,1))
plot(Pdata[Pdata$area == "north", "lengthcm"], ylim = c(0, 70))
plot(Pdata[Pdata$area == "south", "lengthcm"], ylim = c(0, 70))

#-----------------------------------------------------------------------------------
# Load the PacFIN Commercial Data
#-----------------------------------------------------------------------------------
load(file.path(catch_dir, "pacfin", 'PacFIN.DOVR.Catch.INPFC.28.Jan.2021.RData'))
pacfin = PacFIN.DOVR.Catch.INPFC.28.Jan.2021[[1]]
pacfin$round_mt = pacfin$ROUND_WEIGHT_MTONS #/ pound_conv

table(sort(pacfin$PACFIN_PORT_CODE), pacfin$AGENCY_CODE)
south_port = c("AVL", "SF", "PRN", "CRZ", "HNM", "LAC", "LGB", "MNT", "MOS", "MRO", 
	"NWB", "OAK", "OBV", "OSF", "OSD", "OXN", "SB", "WLM", 'VEN')

south_psmfc = c("1A", "1B")
pacfin$area = 'north'
pacfin$area[pacfin$PACFIN_CATCH_AREA_CODE %in% south_psmfc] = 'south'
pacfin$area_by_port = 'north'
pacfin$area_by_port[pacfin$PACFIN_PORT_CODE %in% south_port] = 'south'

cat = aggregate(round_mt~YEAR + area, pacfin, sum)
catch = cbind(cat[cat$area == "south", c(1,3)], cat[cat$area == "north", 3])
colnames(catch) = c('year', 'south', 'north')

# Stacked barplot of catches by state
pngfun(wd = file.path(catch_dir, "plots"), file = "Commercial_Catch_by_North_South.png", w = 7, h = 7, pt = 12)
barplot(as.vector(apply(catch[,2:3], 1, sum)), border = TRUE, col="Red", xlab = "Years", ylab = "Catch (mt)", 
	axes = TRUE, names.arg = seq(1981, 2021, 1), angle = 45)
barplot(as.vector(catch[,3]),border = TRUE, col = "Purple", add = TRUE)
legend("topright", bty = 'n', legend = c("South", "North"),
	lwd = 6, lty = 1, col = c('red', 'purple'))
dev.off()

pngfun(wd = file.path(catch_dir, "plots"), file = "Percent_Catch_South.png", w = 7, h = 7, pt = 12)
plot(1981:2021, catch[,2] / (catch[,2] + catch[,3]), type = 'l', lwd = 2,
	ylab = "Percent of South Catch", xlab = "Year")
abline(h = mean(catch[,2] / (catch[,2] + catch[,3])), lty = 2, col = 'grey')
dev.off()