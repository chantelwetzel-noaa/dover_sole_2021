###################################################################
#  Used to explore Petrale sole
#	  Chantel Wetzel
#     February 4, 2019
# 
###################################################################

rm(list=ls(all=TRUE))
setwd("C:/Assessments/2019/petrale_2019/Data/")

plot = T


####################################################################################
#	Read in each data source
####################################################################################
library(nwfscSurvey)
library(PacFIN.Utilities)

#nw.bio   = PullBio.fn(Name = "petrale sole", SurveyName = "NWFSC.Combo", SaveFile = TRUE, Dir = paste0(getwd(), "/Biology"))
load("C:/Assessments/2019/petrale_2019/Data/Biology/Bio_All_NWFSC.Combo_2019-02-12.rda")
nw.bio = Data
# There are no triennial ages for petrale sole

# PacFIN Data
#load("Commercial_Comps/PacFIN.PTRL.bds.17.Mar.2015.dmp") 
#allBDS = PacFIN.PTRL.bds.17.Mar.2015   
#rm(PacFIN.PTRL.bds.17.Mar.2015)

load("Commercial_Comps/PacFIN.PTRL.bds.15.Feb.2019.dmp")
allBDS = PacFIN.PTRL.bds.15.Feb.2019
rm(PacFIN.PTRL.bds.15.Feb.2019)

# CALCOM data for petrale sole - from Brenda Erwin 2011
datfileCA <- "PetraleCALCOM_Query2011.csv" #
CALCOM <- read.csv(paste0(getwd(), "/Commercial_Comps/", datfileCA), header = TRUE,sep = ",")
CALCOM$AGE_METHOD = "S"

# Use PacFIN.Utilities to combine the PacFIN and CALCOM data
MasterDat = combineCalCOM( allBDS, CALCOM )
allBDS = cleanPacFIN(MasterDat)


####################################################################################
#	NWFSC combo survey
####################################################################################

table(is.na(nw.bio$Age),is.na(nw.bio$Weight),is.na(nw.bio$Length_cm))  
# There are 21 fish that have no length
# There are 105 fish that have no weight
# There are 53806 total fish with no ages 

state = ifelse(nw.bio$Latitude_dd < 42, "South", "North")

nwfscBio   <- data.frame(Year= nw.bio$Year,
						 Lat = nw.bio$Latitude_dd,
						 Lon = nw.bio$Longitude_dd,
						 State  = state,
						 Depth  = nw.bio$Depth_m,
						 Sex    = nw.bio$Sex,
						 Length = nw.bio$Length_cm,
						 Weight = nw.bio$Weight,
						 Age    = nw.bio$Age,
						 Source = "nwfscCombo")

if(plot){
png(filename = paste0(getwd(),"/Biology/NWFSCcombo_LengthWeight.png"), width = 10, height = 8.5, units = 'in', res = 256)
plot(nw.bio$Length_cm, nw.bio$Weight, xlab = "Length (cm)", ylab = "Weight (kg)", main = "NWFS Shelf-Slope", pch=16)
dev.off()

png(filename = paste0(getwd(),"/Biology/NWFSCcombo_LengthDepth.png"), width = 10, height = 8.5, units = 'in', res = 256)
plot(nw.bio$Depth_m, nw.bio$Length_cm, xlab = "Depth (m)" , ylab =  "Length (cm)", main = "NWFS Shelf-Slope", pch=16)
dev.off()

png(filename = paste0(getwd(),"/Biology/NWFSCcombo_LengthDepth_by_Area.png"), width = 10, height = 8.5, units = 'in', res = 256)
par(mfrow=c(2,1))
temp = cbind(nw.bio, state)
fem = temp[temp$Sex == "F", ]; male = temp[temp$Sex == "M", ]
plot(fem$Depth_m[state == "North"], fem$Length_cm[state == "North"], ylim = c(0, 65), xlim = c(0, 700), xlab = "Depth (m)" , ylab =  "Length (cm)", main = "NWFSC Combo - North", pch=16, col = 'red')
points(male$Depth_m[state == "North"], male$Length_cm[state == "North"], pch=16, col = 'blue')
plot(fem$Depth_m[state == "South"], fem$Length_cm[state == "South"], ylim = c(0, 65), xlim = c(0, 700), xlab = "Depth (m)" , ylab =  "Length (cm)", main = "NWFSC Combo - South", pch=16, col = 'red')
points(male$Depth_m[state == "South"], male$Length_cm[state == "South"], pch=16, col = 'blue')

dev.off()
}


###############################################################################################
#  Commerical Composition Data: PacFIN BDS
###############################################################################################

ind = !is.na(allBDS$FISH_AGE_YEARS_FINAL)
allBDS = allBDS[ind,]

allBDS$SEX <- as.character(allBDS$SEX)
table(allBDS$SOURCE_AGID, allBDS$SEX)
#       F     M     U
#  C 11079 17688  3267
#  O 39784 31041    63
#  W 48043 48768  1278


# Compare  the final age value and age1 because not all aged fish have values in the final column
table(is.na(allBDS$FISH_AGE_CODE_FINAL), is.na(allBDS$age1) )     
#         FALSE   TRUE
#  FALSE  61695    107
#  TRUE   30243 108966

# FINAL_AGE_CODE_FINAL has 139209 missing values where age1 has 109073 missing values

# Fill in age column with either FISH AGE or AGE1
allBDS$age = ifelse(!is.na(allBDS$FISH_AGE_YEARS_FINAL), allBDS$FISH_AGE_YEARS_FINAL,
					ifelse(!is.na(allBDS$age1), allBDS$age1, allBDS$FISH_AGE_YEARS_FINAL) )

allBDS <- allBDS[!(is.na(allBDS$FISH_LENGTH)&is.na(allBDS$age)&is.na(allBDS$FISH_WEIGHT)),] 
## Removed 0 fish

allBDS <- allBDS[!(is.na(allBDS$age)&is.na(allBDS$FISH_WEIGHT)),] 
## Removed 106982 observations


## There are bad length weight combinations in the data set
## Apply the VB growth curved based on 2011 estimates to remove bad values
source("C:/Assessments/2019/petrale_2019/Rcode/Comp_Functions.R")
## Parameters are k, Lmax, L1, CV0, CV1
Par = log( c( 0.159, 47, 3, 0.072, 0.064) )

##Check for lengths based on the VonBert Growth Curve
## Fit model 
Opt = optim(fn=VbFn, par=Par, hessian=FALSE, Ages=allBDS[,'age'], Lengths=allBDS[,'lengthcm'])
Pred = VbFn(Par=Opt$par, ReturnType="Pred",  Ages=allBDS[,'age'], Lengths=allBDS[,'lengthcm']) 
allBDS = cbind(allBDS, Pred)

## Remove entries
Remove6 = which(allBDS[,'lengthcm'] > allBDS[,'Lhat_high'] || allBDS[,'lengthcm'] < allBDS[,'Lhat_low'])
print(paste("Removed because of inconsistent length age relationship:", length(Remove6)))
if(length(Remove6)>0) allBDS = allBDS[-Remove6,]



## Now need to remove all surface reads 
allBDS$agemethod = allBDS$AGE_METHOD
allBDS$agemethod[allBDS$agemethod == "1"] = "B"
allBDS$agemethod[allBDS$agemethod == "2"] = "S"
allBDS = allBDS[allBDS$agemethod == "B",]

state = ifelse(allBDS$SAMPLE_AGENCY == "OR", "North",
		ifelse(allBDS$SAMPLE_AGENCY == "W", "North", "South"))

allBds <- data.frame(Year=allBDS$SAMPLE_YEAR,
						 Lat = NA,
						 Lon = NA,
						 State = state,
						 Depth = NA,
						 Sex = allBDS$SEX,
						 Length = allBDS$FISH_LENGTH/10,
						 Weight = allBDS$FISH_WEIGHT*0.453592, # convert lb to kg
						 Age = allBDS$age,
						 Source = "bds")

######################################################################################
#  Combine and save all the data sources
######################################################################################

bioData <- rbind(nwfscBio, allBds)


######################################################################################
#  Examine the data
######################################################################################

rich.colors.short <- function(n,alpha=1){
  x <- seq(0, 1, length = n)
  r <- 1/(1 + exp(20 - 35 * x))
  g <- pmin(pmax(0, -0.8 + 6 * x - 5 * x^2), 1)
  b <- dnorm(x, 0.25, 0.15)/max(dnorm(x, 0.25, 0.15))
  rgb.m <- matrix(c(r, g, b), ncol = 3)
  rich.vector <- apply(rgb.m, 1, function(v) rgb(v[1], v[2], v[3], alpha=alpha))
}

colors = rich.colors.short(4)

##################################################################################
#
##################################################################################
# 2015 Update Assessment Values
# females
af = 2.08296E-06; bf = 3.473703
# males
am = 3.05E-06;    bm = 3.360544

bio.ests = list()

#######################################################################################
#  Explore biology by collection source
###################################################################################

table(bioData$Sex, useNA='ifany')
table(bioData$Year,useNA='ifany')


wd<-6.5;ht<-4.5
if(plot) {png(paste0(getwd(), "/Biology/weightAtLengthBySource.png"),height=ht,width=wd,pointsize=10,units="in",res=300)}
if(!plot) {windows(height=ht,width=wd)}
par(mar=c(4,4,1,1))
sources <- unique(bioData$Source)
cols <- c("blue", "orange", "green3","red","purple")
cols <- adjustcolor(cols, alpha.f<- 0.5)
plot(bioData$Length,bioData$Weight,pch=20,type="n",xlab="Length (cm)",ylab="Weight (kg)",las=1)
for(i in length(sources):1) {
	tmp <- bioData[bioData$Source==sources[i],]
	points(jitter(tmp$Length,factor=7),tmp$Weight,col=cols[i],pch=16,cex=0.7)

}
legend("topleft",c("NWFSC Shelf-Slope", "Fishery"),col=cols,pch=20, bty = 'n')
if(plot) dev.off()


bioDat2 <- bioData

logLength    <- log(bioDat2$Length)
lw.lm        <- lm(log(bioDat2$Weight) ~ logLength, na.action=na.omit) 
lw.lm.nwfsc  <- lm(log(bioDat2$Weight) ~ logLength, na.action=na.omit, subset=bioDat2$Source=="nwfscCombo")
lw.lm.bds    <- lm(log(bioDat2$Weight) ~ logLength, na.action=na.omit, subset=bioDat2$Source=="bds")


allSex <- rbind(coefficients(lw.lm),coefficients(lw.lm.nwfsc),coefficients(lw.lm.bds))
allSex[,1] <- exp(allSex[,1])
rownames(allSex) <- c("all","nwfsc","bds")
colnames(allSex) <- c('b', 'a')
c(paste("a =",format(exp(coefficients(lw.lm)[1]),digits=5)),paste("b =",round(coefficients(lw.lm)[2],4)))
# "a = 2.2051e-06" "b = 3.4532" 


wd<-6.5;ht<-3
if(plot) {png(paste0(getwd(),"/Biology/weightAtLengthPred.png"),height=ht,width=wd,pointsize=10,units="in",res=300)}
if(!plot) {windows(height=ht,width=wd)}
par(mfrow=c(1,2),mar=c(1.5,1.5,2,1.5),oma=c(2,2,0,0))
lens <- 1:65
logLength <- log(bioDat2$Length)

lw.lm       <- lm(log(bioDat2$Weight) ~ logLength, na.action=na.omit, subset=bioDat2$Sex=="F")
lw.lm.nwfsc <- lm(log(bioDat2$Weight) ~ logLength, na.action=na.omit, subset=bioDat2$Source=="nwfscCombo"&bioDat2$Sex=="F")
lw.lm.bds   <- lm(log(bioDat2$Weight) ~ logLength, na.action=na.omit, subset=bioDat2$Source=="bds"&bioDat2$Sex=="F")

fem <- rbind(coefficients(lw.lm), coefficients(lw.lm.nwfsc), coefficients(lw.lm.bds))
fem[,1] = exp(fem[,1])
rownames(fem) <- c("all","nwfsc","bds")
colnames(fem) <- c('b', 'a')


plot (lens, exp(predict(lw.lm, newdata=data.frame(logLength=log(lens)))), type="l", lwd=7,col="grey",xlab="",ylab="",
			las=1,main="Female",xlim= c(0, max(lens)), ylim=c(0, 3.1))
lines(lens, exp(predict(lw.lm.nwfsc, newdata=data.frame(logLength=log(lens)))),col=cols[1],lwd=3)
lines(lens, exp(predict(lw.lm.bds, newdata=data.frame(logLength=log(lens)))),col=cols[2],lwd=3)
# The below values are from the 2015 update assessment for female fish 
lines(lens, af*lens^bf, col="black",lty=2,lwd=3)
legend("topleft",c("All","NWFSC Combo", "Fishery", "2015 Update Assessment"),
		col=c("grey",cols[1:2],"black"), lwd=c(5,3,3,3,3,3,3),lty=c(1,1,1,2),cex=0.7,seg.len=3, bty = 'n')
legend("bottomright",c(paste("a =",format(exp(coefficients(lw.lm)[1]),digits=5)),paste("b =",round(coefficients(lw.lm)[2],4))),pch=c(NA,NA),cex=0.8,bty="n")

lw.lm       <-lm(log(bioDat2$Weight) ~ logLength,na.action=na.omit,subset=bioDat2$Sex=="M")
lw.lm.nwfsc <-lm(log(bioDat2$Weight) ~ logLength,na.action=na.omit,subset=bioDat2$Source=="nwfscCombo"&bioDat2$Sex=="M")
lw.lm.bds   <-lm(log(bioDat2$Weight) ~ logLength,na.action=na.omit,subset=bioDat2$Source=="bds"&bioDat2$Sex=="M")
male <- rbind(coefficients(lw.lm), coefficients(lw.lm.nwfsc), coefficients(lw.lm.bds))
male[,1] = exp(male[,1])
rownames(male) <- c("all","nwfsc","bds")
colnames(male) <- c('b', 'a')


plot( lens, exp(predict(lw.lm,newdata=data.frame(logLength=log(lens)))), type="l", lwd=7,col="grey",xlab="",ylab="",las=1,
		main="Male",ylim=c(0, 3.1),xlim=c(0,max(lens)))
lines(lens, exp(predict(lw.lm.nwfsc,newdata=data.frame(logLength=log(lens)))),col=cols[1],lwd=3)
lines(lens, exp(predict(lw.lm.bds,newdata=data.frame(logLength=log(lens)))),col=cols[2],lwd=3)
lines(lens, am*lens^bm, col="black",lty=2,lwd=3)
legend("topleft",c("All","NWFSC Combo","Fishery","2015 Update Assessment"), 
		col=c("grey",cols[1:2],"black"),lwd=c(5,3,3,3,3,3,3),lty=c(1,1,1,2),cex=0.7,seg.len=3, bty = 'n')
legend("bottomright",c(paste("a =",format(exp(coefficients(lw.lm)[1]),digits=5)),paste("b =",round(coefficients(lw.lm)[2],4))),pch=c(NA,NA),cex=0.8,bty="n")
mtext("Length (cm)",outer=T,side=1,line=0.8)
mtext("Weight (kg)",outer=T,side=2,line=0.8)

if(plot) dev.off()

bio.ests$unsexed = allSex
bio.ests$females = fem
bio.ests$males   = male
save(bio.ests, file = paste0(getwd(), "/Biology/alpha_beta_ests.rda"))	


######################################################################################################################
# Length Weight by state
######################################################################################################################

wd<-6.5;ht<-3
if(plot) {png(paste0(getwd(),"/Biology/weightAtLengthPred_byState.png"),height=ht,width=wd,pointsize=10,units="in",res=300)}
if(!plot) {windows(height=ht,width=wd)}
par(mfrow=c(1,2),mar=c(1.5,1.5,2,1.5),oma=c(2,2,0,0))
lens <- 1:55
logLength <- log(bioDat2$Length)

lw.lm       <- lm(log(bioDat2$Weight) ~ logLength, na.action=na.omit, subset=bioDat2$Sex=="F")
lw.lm.north <- lm(log(bioDat2$Weight) ~ logLength, na.action=na.omit, subset=bioDat2$State=="North"&bioDat2$Sex=="F")
lw.lm.south <- lm(log(bioDat2$Weight) ~ logLength, na.action=na.omit, subset=bioDat2$State=="South"&bioDat2$Sex=="F")
fem <- rbind(coefficients(lw.lm), coefficients(lw.lm.north), coefficients(lw.lm.south))
rownames(fem) <- c("all","north","south")


plot (lens, exp(predict(lw.lm, newdata=data.frame(logLength=log(lens)))), type="l", lwd=7,col="grey",xlab="",ylab="",
			las=1,main="Female",xlim= c(0, max(lens)), ylim=c(0, 3.1))
lines(lens, exp(predict(lw.lm.north, newdata=data.frame(logLength=log(lens)))),col=cols[1],lwd=3)
lines(lens, exp(predict(lw.lm.south, newdata=data.frame(logLength=log(lens)))),col=cols[2],lwd=3)

lines(lens, af*lens^bf, col="black",lty=2,lwd=3)
legend("topleft",c("All","North", "South", "2015 Update Assessment"),
		col=c("grey",cols[1:2],"black"),lwd=c(5,3,3,3),lty=c(1,1,1,2),cex=0.7,seg.len=3, bty = 'n')
legend("bottomright",c(paste("a =",format(exp(coefficients(lw.lm)[1]),digits=5)),paste("b =",round(coefficients(lw.lm)[2],4))),pch=c(NA,NA),cex=0.8,bty="n")


lw.lm       <-lm(log(bioDat2$Weight) ~ logLength,na.action=na.omit,subset=bioDat2$Sex=="M")
lw.lm.north <-lm(log(bioDat2$Weight) ~ logLength,na.action=na.omit,subset=bioDat2$State=="North"&bioDat2$Sex=="M")
lw.lm.south <-lm(log(bioDat2$Weight) ~ logLength,na.action=na.omit,subset=bioDat2$State=="South"&bioDat2$Sex=="M")

male <- rbind(coefficients(lw.lm),coefficients(lw.lm.north),coefficients(lw.lm.south))
rownames(male) <- c("all","north","south")

plot(lens, exp(predict(lw.lm, newdata=data.frame(logLength=log(lens)))), type="l", lwd=7,col="grey",xlab="",ylab="",las=1,
		main="Male",ylim=c(0, 3.1),xlim=c(0,max(lens)))
lines(lens,exp(predict(lw.lm.north, newdata=data.frame(logLength=log(lens)))),col=cols[1],lwd=3)
lines(lens,exp(predict(lw.lm.south, newdata=data.frame(logLength=log(lens)))),col=cols[2],lwd=3)

lines(lens, am*lens^bm, col="black",lty=2,lwd=3)
legend("topleft",c("All","North","South","2015 Update Assessment"),
		col=c("grey",cols[1:2],"black"),lwd=c(5,3,3,3),lty=c(1,1,1,2),cex=0.7,seg.len=3, bty = 'n')
legend("bottomright",c(paste("a =",format(exp(coefficients(lw.lm)[1]),digits=5)),paste("b =",round(coefficients(lw.lm)[2],4))),pch=c(NA,NA),cex=0.8,bty="n")
mtext("Length (cm)",outer=T,side=1,line=0.8)
mtext("Weight (kg)",outer=T,side=2,line=0.8)

if(plot) dev.off()

######################################################################################################################
# Length Weight by year for the combo survey
######################################################################################################################

plot <- T
wd<-6.5;ht<-3
if(plot) {png(paste0(getwd(),"/Biology/weightAtLengthPred_byYear_Combo.png"),height=ht,width=wd,pointsize=10,units="in",res=300)}
if(!plot) {windows(height=ht,width=wd)}
par(mfrow=c(4,4),mar=c(1.5,1.5,2,1.5),oma=c(2,2,0,0))
lens <- 1:65
logLength <- log(bioDat2$Length)

years = 2003:2018
for (y in 1:length(years)) {
	lw.lm <- lm(log(bioDat2$Weight) ~ logLength, na.action=na.omit, subset=bioDat2$Sex=="F"& bioDat2$Source=="nwfscCombo"&bioDat2$Year == years[y])
	fem <- coefficients(lw.lm)

	plot (lens, exp(predict(lw.lm, newdata=data.frame(logLength=log(lens)))), type="l", lwd=3,col="red",xlab="",ylab="",
			las=1,main=years[y],xlim= c(0, max(lens)), ylim=c(0, 3.1))
	legend("topleft",c(paste("a fem =",format(exp(coefficients(lw.lm)[1]),digits=5)),paste("b fem=",round(coefficients(lw.lm)[2],4))),pch=c(NA,NA),cex=0.8,bty="n")

	lw.lm  <-lm(log(bioDat2$Weight) ~ logLength,na.action=na.omit,subset=bioDat2$Sex=="M"& bioDat2$Source=="nwfscCombo"&bioDat2$Year == years[y])
	male <- coefficients(lw.lm)

	lines( lens,exp(predict(lw.lm,newdata=data.frame(logLength=log(lens)))), lwd=2, lty =2,col="blue")
	legend("left",c(paste("a mal=",format(exp(coefficients(lw.lm)[1]),digits=5)),paste("b mal=",round(coefficients(lw.lm)[2],4))),pch=c(NA,NA),cex=0.8,bty="n")
	mtext("Length (cm)",outer=T,side=1,line=0.8)
	mtext("Weight (kg)",outer=T,side=2,line=0.8)
}

if(plot) dev.off()



#########################################################################################################
# Length at age
#########################################################################################################

VB.fn <- function(age,Linf,k,t0) {
    out <- Linf*(1-exp(-k*(age-t0)))
    return(out)
}
VBopt.fn <- function(x,age,lengths) { sum((lengths-VB.fn(age,Linf=x[1],k=x[2],t0=x[3]))^2) }


table(bioData$Age,useNA="ifany")
table(!is.na(bioData$Length),!is.na(bioData$Age))

ageData <- bioData[!is.na(bioData$Age) & !is.na(bioData$Length),]


##############################################################################################
# Create age length plots with growth estimates==============================================
sources <- unique(bioData$Source)
sourceNames <- c("NWFSC Combo","Fishery")
cols.1 <- c("blue","orange")
cols <- adjustcolor(cols.1, alpha.f<- 1)

wd<-6.5;ht<-8.5
if(plot) {png("Biology/LengthAgeAll.png",height=ht,width=wd,pointsize=10,units="in",res=300)}
if(!plot) {windows(height=ht,width=wd)}

x.lim = c(0, 40)
y.lim = c(0, 65)
par(mfrow=c(2,1),mar=c(4,4,3,1),oma=c(2,2,2,2))
a.split <- split(ageData, ageData$Sex)
plot(a.split[["F"]]$Age,a.split[["F"]]$Length,pch=20,type="n",xlim=x.lim, ylim=y.lim,las=1,xlab="",ylab="",main="Female")
for(i in length(sources):1) {
	tmp <- a.split[["F"]][a.split[["F"]]$Source==sources[i],]
	points(jitter(tmp$Age,factor=0.8),tmp$Length,col=cols[i],pch=16)
}
xpar <- optim(c(60, 0.16, 0), VBopt.fn,age=a.split[["F"]]$Age,lengths=a.split[["F"]]$Length)$par
lines(0:40, VB.fn(0:40, Linf=xpar[1], k=xpar[2], t0=xpar[3]), col="yellow2",lwd=3)
legend("bottomright", sourceNames, col=cols.1, pch=20, bty = 'n')
legend("bottomleft",c(paste("Linf=",round(xpar[1],2)),
	                  paste("k=", round(xpar[2],3)),
	                  paste("t0=",round(xpar[3],3))),pch=NA,bty="n",cex=0.8)

plot(a.split[["M"]]$Age,a.split[["M"]]$Length,pch=20,type="n",xlim=x.lim,ylim=y.lim,las=1,xlab="",ylab="",main="Male")
for(i in length(sources):1) {
	tmp <- a.split[["M"]][a.split[["M"]]$Source==sources[i],]
	points(jitter(tmp$Age,factor=0.8),tmp$Length,col=cols[i],pch=16)
}
xpar <- optim(c(50, 0.16, 0),VBopt.fn,age=a.split[["M"]]$Age,lengths=a.split[["M"]]$Length)$par
lines(0:40, VB.fn(0:40,Linf=xpar[1],k=xpar[2],t0=xpar[3]),col="yellow2",lwd=3)
legend("bottomright", sourceNames, col=cols.1, pch=20, bty = 'n')
legend("bottomleft",c(paste("Linf=",round(xpar[1],2)),
	                  paste("k=",round(xpar[2],3)),
	                  paste("t0=",round(xpar[3],3))),pch=NA,bty="n",cex=0.8)
mtext("Age",side=1,outer=T,line=0.5)
mtext("Length (cm)",side=2,outer=T,line=0.5)
if(plot) dev.off()

##############################################################################################################################


##############################################################################################################################
# Plot each data source separately 
##############################################################################################################################
sources <- unique(ageData$Source)
sourceNames <- c("NWFSC Combo","Fishery")#

wd<-6.5;ht<-8.5
wd <- 10; ht = 6
if(plot) {png("Biology/LengthAgeEach.png",height=ht,width=wd,pointsize=10,units="in",res=300)}
if(!plot) {windows(height=ht,width=wd)}

par(mfrow=c(6,2),mar=c(4,4,3,1),oma=c(2,2,2,2))
for(i in length(sources):1) {
	tmp <- ageData[ageData$Source==sources[i] & ageData$Sex=="F",]
	plot(jitter(tmp$Age,factor=0.8),tmp$Length,col=cols[i],pch=16, xlim=x.lim, ylim=y.lim, ylab="",xlab="")
	if(i==length(sources)) title(main="Female")
	title(ylab=sourceNames[i],cex.lab=1.2)
	xpar <- optim(c(60,0.18,0),VBopt.fn,age=tmp$Age,lengths=tmp$Length)$par
    lines(0:40,VB.fn(0:40,Linf=xpar[1],k=xpar[2],t0=xpar[3]),col="yellow2",lwd=3)
    legend("bottomright",c(paste("Linf=",round(xpar[1],2)),
	                  paste("k=",round(xpar[2],2)),
	                  paste("t0=",round(xpar[3],2))),pch=NA,bty="n",cex=0.8)
#}
#for(i in length(sources):1) {
	tmp <- ageData[ageData$Source==sources[i] & ageData$Sex=="M",]
	plot(jitter(tmp$Age,factor=0.8),tmp$Length,col=cols[i],pch=16, xlim=x.lim, ylim=y.lim, ylab="",xlab="")
	if(i==length(sources)) title(main="Male")
	xpar <- optim(c(55,0.18,0),VBopt.fn,age=tmp$Age,lengths=tmp$Length)$par
    lines(0:40,VB.fn(0:40,Linf=xpar[1],k=xpar[2],t0=xpar[3]),col="yellow2",lwd=3)
    legend("bottomright",c(paste("Linf=",round(xpar[1],2)),
	                  paste("k=",round(xpar[2],2)),
	                  paste("t0=",round(xpar[3],2))),pch=NA,bty="n",cex=0.8)
}
mtext("Age",side=1,outer=T,line=0.5)
mtext("Length (cm)",side=2,outer=T,line=0.5)
if(plot) dev.off()


##############################################################################################################################
# Look at the Combo survey only by year
##############################################################################################################################
sources <- unique(ageData$Source)
sourceNames <- c("NWFSC Combo")#

wd<-6.5;ht<-8.5
if(plot) {png(paste0(getwd(), "/Biology/plots/LengthAgeEach_Combo_Year.png"),height=ht,width=wd,pointsize=10,units="in",res=300)}
if(!plot) {windows(height=ht,width=wd)}
x.lim = c(1,40); y.lim = c(0,65) 
years = 2003:2018
par(mfrow=c(4,4),mar=c(4,4,3,1),oma=c(2,2,2,2))
for(i in 1:length(years)) {
	tmp <- ageData[ageData$Source==sources[1] & ageData$Sex=="F" &ageData$Year == years[i],]
	plot(jitter(tmp$Age,factor=0.8),tmp$Length,col='red',pch=16, xlim=x.lim, ylim=y.lim, ylab="",xlab="")
	title(main= paste0("Year", years[i]))

	xpar <- optim(c(60,0.18,0),VBopt.fn,age=tmp$Age,lengths=tmp$Length)$par
    lines(0:40,VB.fn(0:40,Linf=xpar[1],k=xpar[2],t0=xpar[3]),col="yellow2",lwd=3)
    legend("topright",c(paste("Linf fem=",round(xpar[1],2)),
	                  paste("k fem=",round(xpar[2],2)),
	                  paste("t0 fem=",round(xpar[3],2))),pch=NA,bty="n",cex=0.8)

	tmp <- ageData[ageData$Source==sources[1] & ageData$Sex=="M"&ageData$Year == years[i],]
	points(jitter(tmp$Age,factor=0.8),tmp$Length,col='blue',pch=16, xlim=x.lim, ylim=y.lim, ylab="",xlab="")
	xpar <- optim(c(50,0.18,0),VBopt.fn,age=tmp$Age,lengths=tmp$Length)$par
    lines(0:40,VB.fn(0:40,Linf=xpar[1],k=xpar[2],t0=xpar[3]),col="orange",lwd=2, lty = 1)
    legend("bottomright",c(paste("Linf mal=",round(xpar[1],2)),
	                  paste("k mal=",round(xpar[2],2)),
	                  paste("t0 mal=",round(xpar[3],2))),pch=NA,bty="n",cex=0.8)
}
mtext("Age",side=1,outer=T,line=0.5)
mtext("Length (cm)",side=2,outer=T,line=0.5)
if(plot) dev.off()
##############################################################################################################################

