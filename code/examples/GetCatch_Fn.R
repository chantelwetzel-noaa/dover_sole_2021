
rm(list=ls(all=TRUE))

setwd("C:/Assessments/POP2017/Data/")

#Load in each of the data files
#load("CommercialCatch/PacFIN.POP.Catch.INPFC.23.Dec.2016.dmp")
#catch <- PacFIN.POP.Catch.INPFC.23.Dec.2016

load("CommercialCatch/PacFIN.POP.Catch.INPFC.2.May.2017.dmp")
catch <- PacFIN.POP.Catch.INPFC.2.May.2017

# Remove POP1 category from Oregon because this is other rockfish
remove = which(catch$SPID == "POP1")
catch = catch[-remove, ]

write.csv(catch, file = paste0(getwd(), "/CommercialCatch/PacFIN_catch.csv"))

#load("CommercialCatch/PacFIN.POP.Catch.PSMFC.23.Dec.2016.dmp")
#ps.catch = PacFIN.POP.Catch.PSMFC.23.Dec.2016

# table(catch$PCID, catch$SPID)
#
#       POP POP1 POP2 UPOP
#  ACA 1258    0    0  193
#  AOR 1712  908 1021    0
#  AWA 1235    0    0  236

# table(catch$PCID, catch$ARID)
#      
#         CL   CP   EK   MT   OC   UI   VN
#   ACA    0  117  804  526    0    4    0
#   AOR 1860    0  913   10    0  125  733
#   AWA  583    0    3    0   61    6  818

# CL = Columbia, CP = Conception, EK= Eureka, MT = Monterey, OC = Oregon Coast, UI = Unknown, VN = Vancouver

#ps = aggregate( CATCH.KG ~ YEAR + PCID, FUN = sum, ps.catch)
#inp = aggregate( CATCH.KG ~ YEAR + PCID, FUN = sum, catch)
#out = cbind( ps$CATCH.KG [ ps$PCID == "ACA" ] / inp$CATCH.KG[inp$PCID == "ACA"], 
#	   		 ps$CATCH.KG [ ps$PCID == "AOR" ] / inp$CATCH.KG[inp$PCID == "AOR"],
#	   		 ps$CATCH.KG [ ps$PCID == "AWA" ] / inp$CATCH.KG[inp$PCID == "AWA"])
#
#out = round(out, 5)
#colnames(out) = c("CA_PFMC/CA_INPFC", "OR_PFMC/OR_INPFC", "WA_PFMC/WA_INPFC")
#rownames(out) = unique(catch$YEAR)
##write.csv(out, file = "CommercialCatch/PSMC_vs_INPFC.csv")
#
#out = cbind( ps$CATCH.KG [ ps$PCID == "AWA" ] , 
#	   		 inp$CATCH.KG[inp$PCID == "AWA"],
#	   		 ps$CATCH.KG [ ps$PCID == "AWA" ] / inp$CATCH.KG[inp$PCID == "AWA"])
#out = round(out, 5)
#colnames(out) = c("WA_PFMC", "WA_INPFC", "WA_PFMC/WA_INPFC")
#rownames(out) = unique(catch$YEAR)
#write.csv(out, file = "CommercialCatch/WA_ONLY_PSMC_vs_INPFC.csv")


#Read in the historical catch files
# ca.hist = read.csv("CommercialCatch/Historical/CA_historical_pulled12.01.16.csv", header = T)
# Received guidance from John Field to use the 2011 historical catch values due to data base issues
# ca.hist = read.csv("CommercialCatch/Historical/CA_historical_2017_fromField.csv", header = T)
ca.hist = read.csv("CommercialCatch/Historical/CA_historical_2017_fromField_withLateAdd.csv", header = T)
ca.hist$metric.tonnes = ca.hist$orig.mt + ca.hist$add.mt
#or.hist = read.csv("CommercialCatch/Historical/fromVlada_POP OR historical commercial landings.csv", header = T)
# Same values as above but this is the official version as provided by ODFW
or.hist = read.csv("CommercialCatch/Historical/1889-1986 OR Commercial Landings_v1.0_POP.csv", header = T, skip = 2)
colnames(or.hist) = c("year", "metric.tonnes")
wa.hist = read.csv("CommercialCatch/Historical/WashingtonProvided_040617.csv", header = T)

# Read in the Oregon adjustments for 1987-1999
or.adjust = read.csv("C:/Assessments/POP2017/Data/CommercialCatch/Oregon/Speciated_URCK_POP1_Tickets.csv")
# Filter the data for only POP
temp = or.adjust[or.adjust$COMMON_NAM == "PACIFIC OCEAN PERCH", ]
temp$mt = temp$Species.lbs * 0.000453592 ; temp$YEAR = temp$LANDING_YEAR
or.adjust = aggregate(mt ~ YEAR, FUN = sum, temp)



# Foreign Fleet
foreign = read.csv("CommercialCatch/Foreign/Foreign_Fleet.csv", header = T)

#ASHOP catches
ashop = read.csv( "CommercialCatch/AtSeaFishery/Wetzel_A-SHOP_POP_Domestic_Catch_2011-2016_021317.csv", header = T)
ashop.hist = read.csv("CommercialCatch/AtSeaFishery/ASHOP_HistoricCatch_2011Assessment.csv", header = T)

#Survey catches
nwfsc = read.csv("SurveyComps/NWFSCcombo/HaulData_final.csv", header = TRUE, skip = 8)
#wd = "C:/Assessments/POP2017/Data/Survey"
#load(paste0(wd,"/Trienniel_AFSCslope/Tri.Shelf.and.AFSC.Slope.POP.Catch.05.Apr.11.dmp"))
load("SurveyComps/Triennial_AFSCsurvey/Tri.Shelf.and.AFSC.Slope.POP.Catch.05.Apr.11.dmp") 
tri = Tri.Shelf.and.AFSC.Slope.POP.Catch.05.Apr.11
nwfsc.slope = read.csv("SurveyIndices/deltaGLMM/NWFSCslope/NWFSC.POP.csv", header = TRUE)
pop79.catch  <- read.csv("SurveyComps/POPsurvey/Catch79_POP.csv", header=T)
pop85.catch  <- read.csv("SurveyComps/POPsurvey/Catch85_POP.csv", header=T)
pop = rbind(c(1979, sum(pop79.catch$WEIGHT)/1000),
			c(1985, sum(pop85.catch$WEIGHT)/1000) )
colnames(pop) = c("YEAR", "CATCH_MT")

# Other Research Catch
research= read.csv("CommercialCatch/Research_Catch/POP_Mortality_2005-2016.csv", header = T)


#GetCatches <- function(catch, ca.hist, or.hist, wa.hist, foreign, ashop, ashop.hist, tri, nwfsc.slope, pop, nwfsc){	
GetCatches <- function(start.year = 1918){	
	
	#or.hist$year = or.hist$YEAR
	#or.hist$metric.tonnes = or.hist$ROUND_MTONS

	wa.hist$year = wa.hist$Year
	wa.hist$metric.tonnes = wa.hist$Total
	
	endyr = 2016
	yr1 = 1892
	master.catch = matrix(NA, length(yr1:endyr), 10)
	
	# Check the INPFC area
	# UI - area unknown
	# OC - Oregon coast
	# Retaining all the records within the data file
	
	catch$state <- rep(NA, nrow(catch))                       
	catch$state[catch$PCID %in% c("ACA")] <- "CA"
	catch$state[catch$PCID %in% c("AOR")] <- "OR"
	catch$state[catch$PCID %in% c("AWA")] <- "WA"
	
	catch$fleet <- rep(NA, nrow(catch))
	catch$fleet[catch$GRID %in% c("BMT","BTT","CBF","CBJ","DNT","FFT","FTS","GFL","GFS","GFT","LFZ","MDT","MPT","OTW","PRT","RLT","SFZ",
								  "SRM","TWL")] <- "TWL"
	catch$fleet[catch$GRID %in% c("DST", "PWT","SHT","SST", "TWS")] <- "TWS" # Shrimp Trawl
	catch$fleet[catch$GRID %in% c("DRL","HDL","HLR","JIG","LGL","OHL","POL","STL","VHL","HKL")] <- "HKL"
	catch$fleet[catch$GRID %in% c("DGN","DPN","GLN","ONT","SEN","SGN","STN","TML","NET")] <- "NET"
	catch$fleet[catch$GRID %in% c("CLP","CPT","FPT","LPT","OPT","PRW","SPT","POT")] <- "POT"
	catch$fleet[catch$GRID %in% c("BTR", "DVG", "TRL")] <- "OTH"

	#Convert the catches from kg to mt
	catch$catch.mt <- catch$CATCH.KG * 0.001
	
	#aggregate(catch.mt ~ fleet + YEAR, FUN = sum, catch)
	#table(catch$state, catch$fleet)
	#      HKL  NET  OTH  POT  TWL  TWS
	#  CA  290  106    0    3 1048    4
	#  OR  568    0   23  103 2552  395
	#  WA  230    0    2   15 1159   65
	
	#table(catch$YEAR, catch$state)
	
	
	catch$fleet.comb <- rep(NA, nrow(catch))
	catch$fleet.comb[catch$fleet %in% c("HKL", "NET", "OTH", "POT", "TWS")] <- "NTWL"
	catch$fleet.comb[catch$fleet %in% c("TWL")] <- "TWL"
	
	#table(catch$state, catch$fleet.comb

	# Create state catches
	state = c("CA","OR", "WA")
	catch.list = list()
	for (s in 1:3){
		if (state[s] == "CA") { hist = ca.hist }
		if (state[s] == "OR") { hist = or.hist }
		if (state[s] == "WA") { hist = wa.hist }

		yrs = min(hist$year): max(catch$YEAR[catch$state == state[s]])		
		temp.catch = NULL
		for (y in 1:length(yrs)){

			# All state historical reconstructions
			if(yrs[y] <= 1980 )  {
				# Historical years
				xx = hist$year== yrs[y]
				cat.temp = sum(hist$metric.tonnes[xx]) }

			# This does PacFIN catches for California 1981-2016, Oregon 2000-2016
			if(yrs[y] >  1980  ) {
				# PacFIN years for California & Washington
				xx = catch$state == state[s] & catch$YEAR == yrs[y]
				cat.temp = sum(catch$catch.mt[xx]) 
			}

			# Washington catches are not coming from PacFIN this cycle
			if (yrs[y] >= 1981 & state[s] == "WA"){
				xx = hist$year[y]
				cat.temp = sum(hist$metric.tonnes[hist$year == xx]) }

			# Read the Oregon historical catches
			if(yrs[y] <= 1986 & state[s] == "OR"){
				xx = hist$year== yrs[y]
				cat.temp = sum(hist$metric.tonnes[xx])	}

			# Oregon adjustment between 1987-199
			if(yrs[y] >= 1987 &yrs[y] <= 1999 & state[s] == "OR"){
				xx = catch$state == state[s] & catch$YEAR == yrs[y]
				cat.temp = sum(catch$catch.mt[xx]) 
				cat.temp = cat.temp + or.adjust[or.adjust$YEAR == yrs[y], 'mt'] }

			if (yrs[y] == 2014 & state[s] != "CA"){
				cat.temp = ifelse(state[s] == "OR",  cat.temp + 0.34*9.63285, cat.temp + 0.651 * 9.63285) 
			}

			temp.catch = rbind(temp.catch, cat.temp)


			#} 
		} # close year loop
	    #temp.catch = cbind(yrs, temp.catch)
	    colnames(temp.catch) = state[s]
		rownames(temp.catch) = yrs
		catch.list[[s]] = temp.catch
	} # close state loop
	names(catch.list) = state

	# Discard rate being applied in the model for 2014 is 3.5% so the amount of pink shrimp added was calculated as 9.97/(1+0.035) = 9.63285
	# This was then allocated to primarily Washington based on Kayleigh's analysis OR 3.4 mt and WA 6.5 mt
	# OR 34.1% and WA 65.1%
	print("I have added 9.97 mt discarded in 2014 by Pink Shrimp Fishery!!")

	# Foreign Fleet
	foreign.cat = as.data.frame(foreign)
	

	# At-Sea-Hake Catches
	# Create a YEAR column
	temp1  = as.Date(ashop$DEPLOYMENT_DATE, "%m/%d/%Y")
	temp2  = format(temp1, "%Y")
	ashop$year= as.numeric(temp2)
	
	ashop$mt = ashop$EXPANDED_WT_KG_2SECTOR_LEVEL * 0.001
	
	yrs = min(ashop$year, ashop.hist$Year):max(ashop$year, ashop.hist$Year)
	ashop.cat = matrix(0, nrow = length(yrs), ncol = 1, dimnames=list(yrs, "ASHOP"))
	for(a in 1:length(yrs)){
		if(yrs[a] <  min(ashop$year))  { cat.temp = ashop.hist$catch.mt[a] }
		if(yrs[a] >= min(ashop$year)) { 
			ind = ashop$year == yrs[a]
			cat.temp =  sum(ashop$mt[ind])
		}

		ashop.cat[a] = cat.temp 
	}
	ashop.cat = cbind(as.numeric(rownames(ashop.cat)), ashop.cat)
	colnames(ashop.cat) = c("Year", "ASHOP")
	ashop.cat = as.data.frame(ashop.cat)
	print("ASHOP is total (discard + catch).  Need to either reduce catch numbers or mirror fleet with no discards")
	
	# Survey Catches

	# NWFSC Combo Survey
	temp1  = as.Date(nwfsc$CAPTURE_DATE, "%m/%d/%Y")
	temp2  = format(temp1, "%Y")
	nwfsc$Year = as.numeric(temp2)
	nwfsc$mt = nwfsc$HAUL_WT_KG * 0.001
	nwfsc.cat = aggregate(mt ~ Year, sum, data = nwfsc)

	
	# nwfsc slope
	temp = toupper(substr(nwfsc.slope$PROJECT_CYCLE,7,11))
	nwfsc.slope$Year = as.numeric(temp)
	nwfsc.slope$mt = nwfsc.slope$HAUL_WT_KG * 0.001
	nwfsc.slope.cat = aggregate(mt ~ Year, sum, data = nwfsc.slope)
	nwfsc.slope.cat = nwfsc.slope.cat[nwfsc.slope.cat$Year < 2003,]

	
	# Triennial Survey
	tri$Year = tri$YEAR
	tri$mt = tri$WEIGHT * 0.001
	tri.only  = tri[tri$SURVEY == "Tri.Shelf", ]
	tri.cat = aggregate(mt ~ Year, sum, data = tri.only)

	# AFSC slope survey
	afsc = tri[tri$SURVEY == "AFSC.Slope", ]
	afsc.cat = aggregate(mt ~ Year, sum, data = afsc)
	#afsc.cat = afsc.cat[afsc.cat$Year >= 1996, ]

	# POP survey catches
	pop.cat = as.data.frame(pop)
	colnames(pop.cat) = c("Year", "mt")

	# General Research catches
	y = sort(research$Year)
	res.cat = data.frame(rev(research$Year), rev(research$Total.Mortality))
	colnames(res.cat) = c("Year", "Total.Mortality")
	res.cat$Total.Mortality = res.cat$Total.Mortality - rev(research$SRP.06)


	# Get the catch.list into matrix form to use for expansion
	## Identify the unique "rownames" for all list items
	Rows <- unique(unlist(lapply(catch.list, rownames)))
	Rows <- sort(as.numeric(Rows))
	
	## Create a matrix of NA values 
	##   with appropriate dimensions and dimnames
	catch.matrix <- matrix(NA, nrow = length(Rows), ncol = length(catch.list), 
	                dimnames = list(Rows, sapply(catch.list, colnames)))
		
	## Use your `for` loop to fill it in
	##   with the appropriate values from your list
	for (i in seq_along(catch.list)) {
	  catch.matrix[rownames(catch.list[[i]]), i] <- catch.list[[i]]
	}

	catch.matrix = cbind(as.numeric(rownames(catch.matrix)), catch.matrix)
	colnames(catch.matrix) = c("Year", state)
	catch.matrix[is.na(catch.matrix)] = 0

	out = merge(catch.matrix, ashop.cat, "Year", all.x = TRUE)
	out = merge(out, foreign.cat, "Year", all.x = TRUE)
	out = merge(out, pop.cat, "Year", all.x = TRUE)
	out = merge(out, tri.cat, "Year", all.x = TRUE)
	out = merge(out, afsc.cat, "Year", all.x = TRUE)
	colnames(out) = c("Year", state, "ASHOP", "FOREIGN", "POP", "TRI", "AFSC")
	out = merge(out, nwfsc.slope.cat, "Year", all.x = TRUE)
	out = merge(out, nwfsc.cat, "Year", all.x = TRUE)
	out = merge(out, res.cat, "Year", all.x = TRUE)
	colnames(out) = c("Year", state, "ASHOP", "FOREIGN", "POP", "TRI", "AFSC", "NWFSC.SLOPE", "NWFSC.COMBO", "OTHER.RESEARCH")
	out[is.na(out)] = 0
  
	master.catch = out
	
	# Write out the broken out catches
	write.csv(master.catch, file = "CommercialCatch/POP2017_PacFIN_catch_forExpansion.csv")

	# Add other research catch into the fishery catches
	temp = merge(catch.matrix, res.cat, "Year", all.x = TRUE)
	temp[is.na(temp)] = 0
	
	collapsed.catch = rbind(cbind( catch.matrix[,1],      1, 1, round(apply(temp[,2:5], 1, sum),3), 0.05),
						    cbind( ashop.cat$Year,        1, 2, round(ashop.cat$ASHOP,          3), 0.05),
						    cbind( foreign.cat$Year,      1, 3, round(foreign.cat$Foreign,      3), 0.05),
						    cbind( pop.cat$Year,          1, 4, round(pop.cat$mt,               3), 0.05),
						    cbind( tri.cat$Year,          1, 5, round(tri.cat$mt,               3), 0.05),
						    cbind( afsc.cat$Year,         1, 6, round(afsc.cat$mt,              3), 0.05),
						    cbind( nwfsc.slope.cat$Year,  1, 7, round(nwfsc.slope.cat$mt,       3), 0.05),
						    cbind( nwfsc.cat$Year,        1, 8, round(nwfsc.cat$mt,  			3), 0.05) )

	collapsed.catch = as.data.frame(collapsed.catch)
	colnames(collapsed.catch) = c("Years", "Season", "Fleet", "Catch",  "SE")

	write.csv(collapsed.catch, file = "CommercialCatch/forSS/POP2017_PacFIN_catch_forSS.csv")

	# Add other research catch into the fishery catches
	# Start the catch data later than the first catch recorded year
	temp = merge(catch.matrix, res.cat, "Year", all.x = TRUE)
	temp[is.na(temp)] = 0

	temp = temp[temp$Year >= start.year, ]
	
	collapsed.catch = rbind(cbind( temp[,1],              1, 1, round(apply(temp[,2:5], 1, sum),3), 0.05),
						    cbind( ashop.cat$Year,        1, 2, round(ashop.cat$ASHOP,          3), 0.05),
						    cbind( foreign.cat$Year,      1, 3, round(foreign.cat$Foreign,      3), 0.05),
						    cbind( pop.cat$Year,          1, 4, round(pop.cat$mt,               3), 0.05),
						    cbind( tri.cat$Year,          1, 5, round(tri.cat$mt,               3), 0.05),
						    cbind( afsc.cat$Year,         1, 6, round(afsc.cat$mt,              3), 0.05),
						    cbind( nwfsc.slope.cat$Year,  1, 7, round(nwfsc.slope.cat$mt,       3), 0.05),
						    cbind( nwfsc.cat$Year,        1, 8, round(nwfsc.cat$mt,  			3), 0.05) )

	collapsed.catch = as.data.frame(collapsed.catch)
	colnames(collapsed.catch) = c("Years", "Season", "Fleet", "Catch",  "SE")

	write.csv(collapsed.catch, file = "CommercialCatch/forSS/POP2017_PacFIN_catch_forSS_LateStart.csv")
}

# 1918 is the first year the catch > 1 mt, the total of all previous years catch = 2.2 mt
GetCatches(start.year = 1918)

