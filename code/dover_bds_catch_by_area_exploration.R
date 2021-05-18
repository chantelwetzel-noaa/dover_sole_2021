library(HandyCode)
library(dplyr)
options(stringsAsFactors = FALSE)
devtools::load_all("C:/Users/Chantel.Wetzel/Documents/GitHub/PacFIN.Utilities")

comp_dir = "N://Assessments/CurrentAssessments/Dover_sole_2021/data/commercial_comps"
catch_dir = "//nwcfile/FRAM/Assessments/CurrentAssessments/Dover_sole_2021/data/catches"

#-----------------------------------------------------------------------------------
# Load the Commercial Comps
#-----------------------------------------------------------------------------------
bds_file = "PacFIN.DOVR.bds.12.Feb.2021.RData"
load(file.path(comp_dir, "pacfin", bds_file))
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

unique(Pdata[Pdata$SOURCE_AGID == "C","PACFIN_PORT_NAME"])

ca_area = aggregate(lengthcm~fishyr+area, Pdata[Pdata$SOURCE_AGID == "C",], function(x) length(x))
ca_dat = aggregate(lengthcm~fishyr+PACFIN_PORT_NAME,  Pdata[Pdata$SOURCE_AGID == "C",], function(x) length(x))
library(ggplot2)

pngfun(wd = file.path(comp_dir, "plots"), file = "Length_by_CA_port.png", w = 10, h = 7, pt = 12)
ggplot(ca_dat[ca_dat$fishyr>1988,], aes(fill=PACFIN_PORT_NAME, y=lengthcm, x=fishyr)) + 
    geom_bar(position="stack", stat="identity") + 
    xlab("Year") + ylab("Number of Length Samples")
dev.off()

pngfun(wd = file.path(comp_dir, "plots"), file = "Length_by_CA_n_s_sf.png", w = 10, h = 7, pt = 12)
ggplot(ca_area[ca_area$fishyr>1988,], aes(fill=area, y=lengthcm, x=fishyr)) + 
    geom_bar(position="stack", stat="identity") + 
    xlab("Year") + ylab("Number of Length Samples")
dev.off()

ca_area = aggregate(age~fishyr+area, Pdata[Pdata$SOURCE_AGID == "C",], function(x) length(x))
ca_dat  = aggregate(age~fishyr+PACFIN_PORT_NAME,  Pdata[Pdata$SOURCE_AGID == "C",], function(x) length(x))

pngfun(wd = file.path(comp_dir, "plots"), file = "Age_by_CA_port.png", w = 10, h = 7, pt = 12)
ggplot(ca_dat[ca_dat$fishyr>1988,], aes(fill=PACFIN_PORT_NAME, y=age, x=fishyr)) + 
    geom_bar(position="stack", stat="identity") +
    xlab("Year") + ylab("Number of Age Samples")
dev.off()

pngfun(wd = file.path(comp_dir, "plots"), file = "Age_by_CA_n_s_sf.png", w = 10, h = 7, pt = 12)
ggplot(ca_area[ca_area$fishyr>1988,], aes(fill=area, y=age, x=fishyr)) + 
    geom_bar(position="stack", stat="identity") +
    xlab("Year") + ylab("Number of Age Samples")
dev.off()

or_dat  = aggregate(age~fishyr+PACFIN_PORT_NAME,  Pdata[Pdata$SOURCE_AGID == "O",], function(x) length(x))
pngfun(wd = file.path(comp_dir, "plots"), file = "Age_by_OR_port.png", w = 10, h = 7, pt = 12)
ggplot(or_dat, aes(fill=PACFIN_PORT_NAME, y=age, x=fishyr)) + 
    geom_bar(position="stack", stat="identity")+
    xlab("Year") + ylab("Number of Age Samples")
dev.off()

or_dat  = aggregate(lengthcm~fishyr+PACFIN_PORT_NAME,  Pdata[Pdata$SOURCE_AGID == "O",], function(x) length(x))
pngfun(wd = file.path(comp_dir, "plots"), file = "Length_by_OR_port.png", w = 10, h = 7, pt = 12)
ggplot(or_dat, aes(fill=PACFIN_PORT_NAME, y=lengthcm, x=fishyr)) + 
    geom_bar(position="stack", stat="identity")+
    xlab("Year") + ylab("Number of Length Samples")
dev.off()

wa_dat  = aggregate(age~fishyr+PACFIN_PORT_NAME,  Pdata[Pdata$SOURCE_AGID == "W",], function(x) length(x))
pngfun(wd = file.path(comp_dir, "plots"), file = "Age_by_WA_port.png", w = 10, h = 7, pt = 12)
ggplot(wa_dat, aes(fill=PACFIN_PORT_NAME, y=age, x=fishyr)) + 
    geom_bar(position="stack", stat="identity")+
    xlab("Year") + ylab("Number of Age Samples")
dev.off()

wa_dat  = aggregate(lengthcm~fishyr+PACFIN_PORT_NAME,  Pdata[Pdata$SOURCE_AGID == "W",], function(x) length(x))
pngfun(wd = file.path(comp_dir, "plots"), file = "Length_by_WA_port.png", w = 10, h = 7, pt = 12)
ggplot(wa_dat, aes(fill=PACFIN_PORT_NAME, y=lengthcm, x=fishyr)) + 
    geom_bar(position="stack", stat="identity") + 
    xlab("Year") + ylab("Number of Length Samples")
dev.off()

all  = aggregate(lengthcm~fishyr+area,  Pdata, function(x) length(x))
pngfun(wd = file.path(comp_dir, "plots"), file = "Length_by_area.png", w = 10, h = 7, pt = 12)
ggplot(all, aes(fill=area, y=lengthcm, x=fishyr)) + 
    geom_bar(position="stack", stat="identity") + 
    xlab("Year") + ylab("Number of Length Samples")
dev.off()

all  = aggregate(age~fishyr+area,  Pdata, function(x) length(x))
pngfun(wd = file.path(comp_dir, "plots"), file = "Age_by_area.png", w = 10, h = 7, pt = 12)
ggplot(all, aes(fill=area, y=age, x=fishyr)) + 
    geom_bar(position="stack", stat="identity") +
    xlab("Year") + ylab("Number of Age Samples")
dev.off()

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


ca_catch  = aggregate(round_mt~YEAR+PACFIN_PORT_CODE, pacfin[pacfin$AGENCY_CODE == "C",], sum)
pngfun(wd = file.path(catch_dir, "plots"), file = "Catch_by_CA_Port.png", w = 10, h = 7, pt = 12)
ggplot(ca_catch, aes(fill=PACFIN_PORT_CODE, y=round_mt, x=YEAR)) + 
    geom_bar(position="stack", stat="identity") + 
    xlab("Year") + ylab("Catch (mt)")
dev.off()

ca_catch  = aggregate(round_mt~YEAR+area, pacfin[pacfin$AGENCY_CODE == "C",], sum)
pngfun(wd = file.path(catch_dir, "plots"), file = "Catch_by_CA_s=1A1B.png", w = 10, h = 7, pt = 12)
ggplot(ca_catch, aes(fill=area, y=round_mt, x=YEAR)) + 
    geom_bar(position="stack", stat="identity")+
    xlab("Year") + ylab("Catch (mt)")
dev.off()

port  = aggregate(round_mt~YEAR+PACFIN_PORT_CODE+AGENCY_CODE, pacfin, sum)
pngfun(wd = file.path(catch_dir, "plots"), file = "Catch_by_OR_Port.png", w = 10, h = 7, pt = 12)
ggplot(port[port$AGENCY_CODE == "O",], aes(fill=PACFIN_PORT_CODE, y=round_mt, x=YEAR)) + 
    geom_bar(position="stack", stat="identity") + 
    xlab("Year") + ylab("Catch (mt)")
dev.off()

pngfun(wd = file.path(catch_dir, "plots"), file = "Catch_by_WA_Port.png", w = 10, h = 7, pt = 12)
ggplot(port[port$AGENCY_CODE == "W",], aes(fill=PACFIN_PORT_CODE, y=round_mt, x=YEAR)) + 
    geom_bar(position="stack", stat="identity") +
    xlab("Year") + ylab("Catch (mt)")
dev.off()

area  = aggregate(round_mt~YEAR+area, pacfin, sum)
pngfun(wd = file.path(catch_dir, "plots"), file = "Catch_by_Area.png", w = 10, h = 7, pt = 12)
ggplot(area, aes(fill=area, y=round_mt, x=YEAR)) + 
    geom_bar(position="stack", stat="identity")+
    xlab("Year") + ylab("Catch (mt)")
dev.off()

#################################################################################
library(gridExtra)

catch_port = aggregate(round_mt~YEAR+PACFIN_PORT_CODE+AGENCY_CODE, pacfin, sum)
catch_PMFSC = aggregate(round_mt~YEAR+PACFIN_CATCH_AREA_CODE+AGENCY_CODE, pacfin, sum)

write.csv(catch_port, file = file.path(catch_dir, "Catch_by_Port.csv"))
len_port  = aggregate(lengthcm~fishyr+PACFIN_PORT_NAME+SOURCE_AGID,  Pdata, function(x) length(x))
age_port  = aggregate(age~fishyr+PACFIN_PORT_NAME+SOURCE_AGID,  Pdata, function(x) length(x))

catch_area = aggregate(round_mt~YEAR+area+AGENCY_CODE, pacfin, sum)
len_area  = aggregate(lengthcm~fishyr+area+SOURCE_AGID,  Pdata, function(x) length(x))
age_area  = aggregate(age~fishyr+area+SOURCE_AGID,  Pdata, function(x) length(x))

pngfun(wd = file.path(catch_dir, "plots"), file = "CA_by_port_3_panel.png", w = 10, h = 7, pt = 12)
ggplot(catch_PMFSC[catch_PMFSC$AGENCY_CODE == "C",], aes(fill=PACFIN_CATCH_AREA_CODE, y=round_mt, x=YEAR)) + 
    geom_bar(position="stack", stat="identity") +
    xlab("Year") + ylab("Catches (mt)")
dev.off()


pngfun(wd = file.path(catch_dir, "plots"), file = "CA_by_port_3_panel.png", w = 17, h = 20, pt = 12)
plot1 <- ggplot(catch_port[catch_port$AGENCY_CODE == "C",], aes(fill=PACFIN_PORT_CODE, y=round_mt, x=YEAR)) + 
    geom_bar(position="stack", stat="identity") +
    xlab("Year") + ylab("Catches (mt)")
plot2 <- ggplot(len_port[len_port$SOURCE_AGID == "C",], aes(fill=PACFIN_PORT_NAME, y=lengthcm, x=fishyr)) + 
    geom_bar(position="stack", stat="identity") +
    xlab("Year") + ylab("Number of Length Samples")
plot3 <- ggplot(age_port[age_port$SOURCE_AGID == "C",], aes(fill=PACFIN_PORT_NAME, y=age, x=fishyr)) + 
    geom_bar(position="stack", stat="identity") +
    xlab("Year") + ylab("Number of Age Samples")
grid.arrange(plot1, plot2, plot3, nrow = 3, ncol = 1)
dev.off()

pngfun(wd = file.path(comp_dir, "plots"), file = "CA_by_port_2_panel.png", w = 17, h = 20, pt = 12)
grid.arrange(plot2, plot3, nrow = 2, ncol = 1)
dev.off()

pngfun(wd = file.path(catch_dir, "plots"), file = "CA_by_area_3_panel.png", w = 17, h = 20, pt = 12)
plot1 <- ggplot(catch_area[catch_area$AGENCY_CODE == "C",], aes(fill=area, y=round_mt, x=YEAR)) + 
    geom_bar(position="stack", stat="identity") +
    xlab("Year") + ylab("Catches (mt)")
plot2 <- ggplot(len_area[len_area$SOURCE_AGID == "C",], aes(fill=area, y=lengthcm, x=fishyr)) + 
    geom_bar(position="stack", stat="identity") +
    xlab("Year") + ylab("Number of Length Samples")
plot3 <- ggplot(age_area[age_area$SOURCE_AGID == "C",], aes(fill=area, y=age, x=fishyr)) + 
    geom_bar(position="stack", stat="identity") +
    xlab("Year") + ylab("Number of Age Samples")
grid.arrange(plot1, plot2, plot3, nrow = 3, ncol = 1)
dev.off()

pngfun(wd = file.path(comp_dir, "plots"), file = "CA_by_area_2_panel.png", w = 17, h = 20, pt = 12)
grid.arrange(plot2, plot3, nrow = 2, ncol = 1)
dev.off()

###################################################################################################################

data = Pdata 
data$length_count = ifelse(!is.na(data$lengthcm),1,0)
data$age_count = ifelse(!is.na(data$Age),1,0)
data$Port = data$PACFIN_PORT_NAME
data$Port[is.na(data$Port)] = "UNKNOWN"
sub_data_ca = data[data$SOURCE_AGID == "C", ]

sub_data_ca$Port = factor(sub_data_ca$Port, levels = c("NEWPORT B.",
                        "TERMINAL I",
                        "OXNARD",
                        "S. BARBARA",
                        "MORRO BAY","AVILA", 
                        "BIG CREEK",
                        "MOSS LNDG",
                        "MONTEREY", 
                        "SANTA CRUZ", 
                        "PRINCETON",
                        "SF",
                        "BODEGA BAY",                        
                        "FORT BRAGG", 
                        "FIELDS LDG",
                        "EUREKA",
                        "CRESCENT") )

sub_data_or = data[data$SOURCE_AGID == "O", ]
sub_data_or$Port = factor(sub_data_or$Port, levels = c(
                        "BROOKINGS",
                        "ORFORD",
                        "COOS BAY",
                        "NEWPORT",
                        "TLMK/GRBLD", 
                        "ASTORIA") )

sub_data_wa = data[data$SOURCE_AGID == "W", ]
sub_data_wa$Port = factor(sub_data_wa$Port, levels = c(
                        "WESTPORT",
                        "ILWCO/CHNK",
                        "LA PUSH",
                        "NEAH BAY",
                        "PT ANGELES", 
                        "BELLINGHAM",
                        "BLAINE",
                        "UNKNOWN") )

gg_color_hue <- function(n) {
  hues <- seq(15, 375, length = n + 1)
  grDevices::hcl(h = hues, l = 65, c = 100)[1:n]
}
four.colors <- gg_color_hue(20)

#ca_data <- tibble(fishyr = sub_data_ca$fishyr,
#               Port=sub_data_ca$Port,
#               lengthcm=ifelse(!is.na(sub_data_ca$lengthcm),1,0),
#               Age=ifelse(!is.na(sub_data_ca$Age),1,0)) %>%
#               mutate(Port=as.factor(Port))
#ggplot(ca_data, aes(fill=Port,x=fishyr,weight=lengthcm))+
#  geom_bar(position="stack") + 
#  ggtitle("Number of stems per stream over time")


pngfun(wd = file.path(comp_dir, "plots"), file = "CA_length_port_ordered.png", w = 10, h = 7, pt = 12)
ggplot(sub_data_ca, aes(weight = length_count, x = fishyr, fill = Port)) + 
    geom_bar(position="stack", stat="count") + 
    #geom_col() +
    scale_fill_manual(values = four.colors[1:17]) +
    xlab("Year") + ylab("Number of Length Samples")
dev.off()

pngfun(wd = file.path(comp_dir, "plots"), file = "CA_age_port_ordered.png", w = 10, h = 7, pt = 12)
ggplot(sub_data_ca, aes(weight=age_count, x=fishyr, fill = Port)) + 
    geom_bar(position="stack", stat="count") + 
    scale_fill_manual(values = four.colors[1:17]) +
    xlab("Year") + ylab("Number of Age Samples")
dev.off()


pngfun(wd = file.path(comp_dir, "plots"), file = "OR_length_port_ordered.png", w = 10, h = 7, pt = 12)
ggplot(sub_data_or, aes(weight=length_count, x=fishyr, fill = Port)) + 
    geom_bar(position="stack", stat="count") + 
    #geom_col() +
    scale_fill_manual(values = four.colors) +
    xlab("Year") + ylab("Number of Length Samples")
dev.off()

pngfun(wd = file.path(comp_dir, "plots"), file = "OR_age_port_ordered.png", w = 10, h = 7, pt = 12)
ggplot(sub_data_or, aes(weight=age_count, x=fishyr, fill = Port)) + 
    geom_bar(position="stack", stat="count") + 
    #geom_col() +
    scale_fill_manual(values = four.colors) +
    xlab("Year") + ylab("Number of Age Samples")
dev.off()


pngfun(wd = file.path(comp_dir, "plots"), file = "WA_length_port_ordered.png", w = 10, h = 7, pt = 12)
ggplot(sub_data_wa[sub_data_wa$Port != "UNKNOWN",], aes(weight=length_count, x=fishyr, group = interaction(Port, fishyr),fill = Port)) + 
    geom_bar(position="stack", stat="count") + 
    #geom_col() +
    scale_fill_manual(values = four.colors) +
    xlab("Year") + ylab("Number of Length Samples")
dev.off()

pngfun(wd = file.path(comp_dir, "plots"), file = "WA_age_port_ordered.png", w = 10, h = 7, pt = 12)
ggplot(sub_data_wa[sub_data_wa$Port != "UNKNOWN",], aes(weight = age_count, x=fishyr,  group = interaction(Port, fishyr), fill = Port)) + 
    geom_bar(position="stack", stat="count") + 
    #geom_col() +
    scale_fill_manual(values = four.colors) +
    xlab("Year") + ylab("Number of Age Samples")
dev.off()
