library("devtools")
devtools::install_github("nwfsc-assess/nwfscAgeingError")

# Load package
library(nwfscAgeingError)
SourceFile <- file.path(system.file("executables", package = "nwfscAgeingError"), .Platform$file.sep)

########################################################
# Ageing Error Analysis
########################################################

dir = "//nwcfile/FRAM/Assessments/CurrentAssessments/Dover_sole_2021/data/ageing_error"
#combo = 'patrick_natkins'
combo = 'natkins_others'
combo = 'cdfw_brenda_mike'
#reads <- read.csv(file = file.path(dir, combo, 'double_reads_patrickA1_natkinsA2.csv'),header=T)
#reads <- read.csv(file = file.path(dir, combo, 'double_reads_natkinsA1_othersA2.csv'),header=T)
reads <- read.csv(file = file.path(dir, combo, 'cdfw.csv'),header=T)


#utils::write.csv(AgeReads,file = file.path(dir, "Simulated_data_example.csv"))

#filter out the zero age fish
ind = which(reads[,1] == 0)
if(length(ind) > 0) { reads = reads[-ind,] }

Nreaders <- dim(reads)[2]

# Create a new data.frame where the first row is the number of reads by age
reads2 = data.frame(count = 1, reads[1,])
# loop over rows of original data
for(RowI in 2:nrow(reads)){
  DupRow <- NA
  # loop over all previous rows looking for duplicates of the current row
  for(PreviousRowJ in 1:nrow(reads2)){
    # if all values match, take note of previous row number
    if(all(reads[RowI,1:Nreaders] == reads2[PreviousRowJ, 1:Nreaders+1], na.rm =TRUE)){
      DupRow = PreviousRowJ
    }
  }
  # if no duplicate found, add new row
  if(is.na(DupRow)){
    # Add new row to reads2
    reads2 <- rbind(reads2, data.frame(count=1, reads[RowI,]))
  }
  # if duplicate found, increment count
  if(!is.na(DupRow)){
    # Increment number of samples for the previous duplicate
    reads2[DupRow,1] <- reads2[DupRow,1] + 1
  }
}

for(a in 1:nrow(reads2)){
  find = which(is.na(reads2[a,1:ncol(reads2)]))
  reads2[a,find] = -999
}


MinAge <- 1
MaxAge <- max(ceiling(max(reads2[, 2:ncol(reads2)], na.rm = TRUE) / 10) * 10)
KnotAges = list(NA, NA, NA, NA)#, NA, NA, NA, NA)  # Necessary for option 5 or 6


BiasOpt.mat = SigOpt.mat =matrix(0,9,4)
BiasOpt.mat[1,] =  c(0,0,0,0)
BiasOpt.mat[2,] =  c(0,0,0,0)
BiasOpt.mat[3,] =  c(0,0,0,0)
BiasOpt.mat[4,] =  c(0,1,1,1)
BiasOpt.mat[5,] =  c(0,1,1,1)
BiasOpt.mat[6,] =  c(0,1,1,1)
BiasOpt.mat[7,] =  c(0,2,2,2)
BiasOpt.mat[8,] =  c(0,2,2,2)
BiasOpt.mat[9,] =  c(0,2,2,2)

SigOpt.mat[1,] =c(1,-1,-1,-1)
SigOpt.mat[2,] =c(2,-1,-1,-1)
SigOpt.mat[3,] =c(3,-1,-1,-1)
SigOpt.mat[4,] =c(1,-1,-1,-1)
SigOpt.mat[5,] =c(2,-1,-1,-1)
SigOpt.mat[6,] =c(3,-1,-1,-1)
SigOpt.mat[7,] =c(1,-1,-1,-1)
SigOpt.mat[8,] =c(2,-1,-1,-1)
SigOpt.mat[9,] =c(3,-1,-1,-1)


model.aic <- as.data.frame(matrix(NA, 9, 4))
colnames(model.aic)<-c("Run","AIC","AICc","BIC")
model.name<-c("B0_S1","B0_S2","B0_S3","B1_S1","B1_S2","B1_S3","B2_S1","B2_S2","B2_S3","B3_S1","B3_S2","B3_S3")
rownames(model.aic) <- model.name[1:9]

#shell("agemat.exe > output.txt 2>&1")

for(i in 1:9)
{
  setwd(file.path(dir, combo))
  DateFile = paste(getwd(),"/",model.name[i],"/",sep="")
  dir.create(DateFile)
  BiasOpt =BiasOpt.mat[i,]
  SigOpt = SigOpt.mat[i,]
  RunFn(Data = reads2, SigOpt = SigOpt, KnotAges = KnotAges, BiasOpt = BiasOpt,
        NDataSets = 1, MinAge = MinAge, MaxAge = MaxAge, RefAge = 10,
        MinusAge = 2, PlusAge = 35,
        SaveFile = DateFile,
        AdmbFile = SourceFile, EffSampleSize = 0, Intern = FALSE,
        JustWrite = FALSE, CallType = "system")
  Df = as.numeric(scan(paste(DateFile,"agemat.par",sep=""),comment.char="%", what="character", quiet=TRUE)[6])
  Nll = as.numeric(scan(paste(DateFile,"agemat.par",sep=""),comment.char="%", what="character", quiet=TRUE)[11])
  n = sum(ifelse(reads2[,-1]==-999,0,1))
  Aic = 2*Nll + 2*Df
  Aicc = Aic + 2*Df*(Df+1)/(n-Df-1)
  Bic = 2*Nll + Df*log(n)
  run.name<-strsplit(DateFile,"/")[[1]][3]
  model.aic[i,]<-c(run.name, Aic, Aicc, Bic)  
  setwd(dir)
}
save(model.aic, file = file.path(dir, combo, "model_selection.dmp", sep = ""))


########################################################
# Ageing Error Analysis
########################################################

# Load package
library(nwfscAgeingError)
SourceFile <- file.path(system.file("executables", package = "nwfscAgeingError"), .Platform$file.sep)


dir = "//nwcfile/FRAM/Assessments/CurrentAssessments/Dover_sole_2021/data/ageing_error"
combo = 'patrick_all_cap'

reads2 = read.csv(file.path(dir, "patrick_all_cap", "Complete_Modified_Age_Data.csv"))

MinAge <- 1
MaxAge <- max(ceiling(max(reads2[, 2:ncol(reads2)], na.rm = TRUE) / 10) * 10)

KnotAges = list(NA,NA,NA,NA,NA,NA,NA,NA,NA,NA,NA,NA,NA,NA,NA,NA,NA,NA)  # Necessary for option 5 or 6

BiasOpt.mat = SigOpt.mat =matrix(0,9,18)
BiasOpt.mat[1,] =  c(0,rep(0, 17))
BiasOpt.mat[2,] =  c(0,rep(0,17))
BiasOpt.mat[3,] =  c(0,rep(0,17))
BiasOpt.mat[4,] =  c(0,rep(1,17))
BiasOpt.mat[5,] =  c(0,rep(1,17))
BiasOpt.mat[6,] =  c(0,rep(1,17))
BiasOpt.mat[7,] =  c(0,rep(2, 17))
BiasOpt.mat[8,] =  c(0,rep(2, 17))
BiasOpt.mat[9,] =  c(0,rep(2, 17))

SigOpt.mat[1,] =c(1,rep(-1, 17))
SigOpt.mat[2,] =c(2,rep(-1, 17))
SigOpt.mat[3,] =c(3,rep(-1, 17))
SigOpt.mat[4,] =c(1,rep(-1, 17))
SigOpt.mat[5,] =c(2,rep(-1, 17))
SigOpt.mat[6,] =c(3,rep(-1, 17))
SigOpt.mat[7,] =c(1,rep(-1, 17))
SigOpt.mat[8,] =c(2,rep(-1, 17))
SigOpt.mat[9,] =c(3,rep(-1, 17))

model.aic <- as.data.frame(matrix(NA, 9, 4))
colnames(model.aic)<-c("Run","AIC","AICc","BIC")
model.name<-c("B0_S1","B0_S2","B0_S3","B1_S1","B1_S2","B1_S3","B2_S1","B2_S2","B2_S3","B3_S1","B3_S2","B3_S3")
rownames(model.aic) <- model.name[1:9]

#shell("agemat.exe > output.txt 2>&1")

for(i in 1:9)
{
  setwd(file.path(dir, combo))
  DateFile = paste(getwd(),"/",model.name[i],"/",sep="")
  dir.create(DateFile)
  BiasOpt =BiasOpt.mat[i,]
  SigOpt = SigOpt.mat[i,]
  RunFn(Data = reads2, SigOpt = SigOpt, KnotAges = KnotAges, BiasOpt = BiasOpt,
        NDataSets = 1, MinAge = MinAge, MaxAge = MaxAge, RefAge = 10,
        MinusAge = 2, PlusAge = 35,
        SaveFile = DateFile,
        AdmbFile = SourceFile, EffSampleSize = 0, Intern = FALSE,
        JustWrite = FALSE, CallType = "system")
  Df = as.numeric(scan(paste(DateFile,"agemat.par",sep=""),comment.char="%", what="character", quiet=TRUE)[6])
  Nll = as.numeric(scan(paste(DateFile,"agemat.par",sep=""),comment.char="%", what="character", quiet=TRUE)[11])
  n = sum(ifelse(reads2[,-1]==-999,0,1))
  Aic = 2*Nll + 2*Df
  Aicc = Aic + 2*Df*(Df+1)/(n-Df-1)
  Bic = 2*Nll + Df*log(n)
  run.name<-strsplit(DateFile,"/")[[1]][3]
  model.aic[i,]<-c(run.name, Aic, Aicc, Bic)  
  setwd(dir)
}
save(model.aic, file = file.path(dir, combo, "model_selection.dmp", sep = ""))
