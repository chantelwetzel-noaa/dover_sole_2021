#################################################################
#           Joint Profile Code
#           Code from Allan Hicks
#      Adapted by Chantel Wetzel for dover 2021
#
#       Plotting Code Begins on Line 110
#
#################################################################

library(r4ss)
mydir = "C:/Assessments/2021/CAPAM_M_2021/Dover" #/_sensitivities"
base_name = "base_with_offsets" ; offset = TRUE
#base_name = "base_no_offsets"; offset = FALSE
#base_name = "base_lorenzen_m_offset"; offset = TRUE
#base_name = "7.0.1_base_no_bio_offsets_est_m"
#base_name = "base_2011_survey_select_no_offset"; offset = FALSE
#base_name = "base_w_2011_survey_select_m_offset"; offset = TRUE

para = "M"
param = c("MGparm[1]", "MGparm[13]")
# Profile range for female M
M_f <- seq(0.06, 0.14, 0.005)
M_m <- seq(0.07, 0.14, 0.005)
if (offset == TRUE) { M_m <- seq(-0.2, 0.2, 0.025) } 
# Create a grid of all possible combinations
des <- expand.grid(M_f, M_m)
names(des) <- c("M_female", "M_male")
#if(offset){
#    des$M_converted <- log(des$M_m/des$M_f)
#} else { des$M_offset = des$M_m }

# Copy base model and create folder for profile
profile_dir = file.path(mydir, paste0(base_name, "_joint_profile_", para))
dir.create(profile_dir)
all_files <- list.files(file.path(mydir, base_name))
capture.output(file.copy(from = file.path(mydir, base_name, all_files), 
              to = profile_dir, overwrite = TRUE), 
              file = "run_diag_warning.txt")
setwd(profile_dir)

# Create a matrix for output
output <- matrix(NA,
                 nrow = nrow(des) + 1, 
                 ncol = 10, 
                 dimnames = list(NULL, c("M_f", "M_m", "negLogLike", "lengthlike", "agelike", "surveylike",
                    "SB0","depletion","Bmsy","Bcurr")))

# Grab MLE values from base model
model <- r4ss::SS_output(profile_dir)
Mf.mle <- model$parameters[model$parameters$Label == "NatM_p_1_Fem_GP_1", "Value"]
Mm.mle <- model$parameters[model$parameters$Label == "NatM_p_1_Mal_GP_1", "Value"]
negloglike <- model$likelihoods_used$values[1]
lengthlike <- model$likelihoods_used$values[7]
agelike <- model$likelihoods_used$values[8]
surveylike <- model$likelihoods_used$values[4]
depletion <- model$derived_quants[model$derived_quants$Label == "Bratio_2021", "Value"] 
SB0 <- model$derived_quants[model$derived_quants$Label == "SSB_Virgin", "Value"] 
Bmsy <- model$derived_quants[model$derived_quants$Label == "SSB_Btgt", "Value"] 
SBcurr <- model$derived_quants[model$derived_quants$Label == "SSB_2021", "Value"] 
output[nrow(des) + 1,] <- unlist(c(Mf.mle, Mm.mle, negloglike, lengthlike, agelike, surveylike, SB0, depletion, Bmsy, SBcurr))
file.copy("ss.par", "ssstart.par", overwrite = TRUE)

# Turn off phase for parameters
r4ss::SS_changepars(
  dir = profile_dir, 
  ctlfile = "control.ss_new", 
  newctlfile = "control_modified.ss",
  strings = c("NatM_p_1_Fem_GP_1", "NatM_p_1_Mal_GP_1"),
  newvals = c(Mf.mle, Mm.mle), estimate = c(FALSE, FALSE))

starter <- r4ss::SS_readstarter(file.path(profile_dir, 'starter.ss'))
starter$ctlfile <- "control_modified.ss"
starter$init_values_src <- 1
# make sure the prior likelihood is calculated for non-estimated quantities
starter$prior_like <- 0
r4ss::SS_writestarter(starter, dir = profile_dir, overwrite = TRUE) 

for(i in nrow(des):1) {  #start at 113 because pretty close to MLE and ss3Base.par
    cat(i,"\n")
    flush.console()
    par = readLines("ssstart.par")
    part1 = grep(param[1], par, fixed = TRUE) + 1
    part2 = grep(param[2], par, fixed = TRUE) + 1
    par[part1] = des[i, "M_female"]
    par[part2] = des[i, "M_male"]
    writeLines(par,  paste0("ss_input_", i, ".par"))
    writeLines(par, "ss.par")
    # Run the model at the new values
    system("ss -nohess", invisible = TRUE, show.output.on.console = FALSE)
    file.copy("Report.sso", paste0("Report_", i, ".sso"), overwrite = TRUE)
    file.copy("ss.par", paste0("ss_",i,".par"), overwrite = TRUE)

    # Read profile run output
    model <- SS_output(profile_dir, printstats = FALSE, verbose = FALSE, covar = FALSE)
    negloglike <- model$likelihoods_used$values[1]
    lengthlike <- model$likelihoods_used$values[7]
    agelike <- model$likelihoods_used$values[8]
    surveylike <- model$likelihoods_used$values[4]
    depletion <- model$derived_quants[model$derived_quants$Label == "Bratio_2021", "Value"] 
    SB0 <- model$derived_quants[model$derived_quants$Label == "SSB_Virgin", "Value"] 
    Bmsy <- model$derived_quants[model$derived_quants$Label == "SSB_Btgt", "Value"] 
    SBcurr <- model$derived_quants[model$derived_quants$Label == "SSB_2021", "Value"] 
    # Add values to output matrix
    output[i,] <- unlist(c(des[i, "M_female"], des[i,"M_male"], negloglike, lengthlike, agelike, surveylike, SB0, depletion, Bmsy, SBcurr))
    #save the output at each loop so that I can analyze before it is done
    save(output, file = "output.Rdat")    
    file.copy("ss.par","ssstart.par", overwrite = TRUE)
}

###################################################################
# Plot Profile Figure using ggplot
###################################################################
library(plotly); library(stringr); library(reshape2); 
library(metR); library(ggplot2); library(HandyCode)

mydir = "C:/Assessments/2021/dover_sole_2021/models/_sensitivities"
mydir = "C:/Assessments/2021/dover_sole_2021/models"
base_name = "7.0.1_base_joint_profile_M"
base_name = "7.0.1_base_no_bio_offsets_est_m_joint_profile_M"
base_name = "7.0.1_base_2011_survey_select_joint_profile_M"
base_name = "7.0.1_base_2011_survey_select_no_offset_joint_profile_M"

setwd(file.path(mydir,base_name))
load("output.Rdat")

out.mle <- output[nrow(output),]
out <- as.data.frame(output[ -nrow(output), ])
out$diffNegLogLike <- out$negLogLike - min(out$negLogLike)#out.mle["negLogLike"]
out$diff_M <- out$M_f - out$M_m
out <- out[order(out$M_f, out$M_m),]

x <- unique(round(out$M_f, 4))
y <- unique(round(out$M_m, 4))
z <- matrix(out$diffNegLogLike, 
            ncol = length(y),
            byrow = TRUE, 
            dimnames = list(as.character(x), as.character(y)))

mtrx_melt <- melt(z, id.vars = c("M_f", "M_m"), measure.vars = 'Delta_NLL')
names(mtrx_melt) = c("M_f", "M_m", "Delta_NLL")

# Plot_ly figure
#plot_ly(mtrx_melt, x = ~M_f, y = ~M_m, z = ~Delta_NLL, type = 'contour', 
#        width = 600, height = 600)

#HandyCody::pngfun(wd = getwd(), file = "joint_m_profile_ggplot_large_range.png", w = 14, h = 12, pt = 12)
ggplot(mtrx_melt, aes(x = M_f, y = M_m)) +
    geom_contour_filled(aes(z = Delta_NLL), breaks = c(0, 2, 3, 4, 6, 10, 20, 50, seq(100, 600, 100))) +
    geom_text_contour(aes(z = Delta_NLL), 
       breaks = c(2, 4, 6, seq(10, 100, 10)), size = 7, color = 'white') +
    xlab("Natural Mortality (F)") +
    ylab("Natural Mortality (M) - Offset") +
    theme(
      axis.text.y = element_text(size = 15, color = 1),
      axis.text.x = element_text(size = 15, color = 1), 
      axis.title.x = element_text(size = 20), 
      axis.title.y = element_text(size = 20),
      legend.text = element_text(size = 15), 
      legend.title = element_text(size = 15)) +
    guides(fill = guide_legend(title = "Change in NLL"))
ggsave(file.path(getwd(), "joint_m_profile_ggsave.png"), width = 14, height = 12)
#dev.off()

# Plot as offsets if appropriate
out.mle <- output[nrow(output),]
out <- as.data.frame(output[ -nrow(output), ])
out$diffNegLogLike <- out$negLogLike - min(out$negLogLike)#out.mle["negLogLike"]
out <- out[order(out$M_f, out$M_offset),]

x <- unique(round(out$M_f, 4))
y <- unique(round(out$M_offset, 2))
z <- matrix(out$diffNegLogLike, 
            ncol = length(y),
            byrow = TRUE, 
            dimnames = list(as.character(x), as.character(y)))

mtrx_melt <- melt(z, id.vars = c("M_f", "M_m"), measure.vars = 'Delta_NLL')
names(mtrx_melt) = c("M_f", "M_m", "Delta_NLL")

ggplot(mtrx_melt, aes(x = M_f, y = M_m)) +
    geom_contour_filled(aes(z = Delta_NLL), breaks = c(0, 2, 3, 4, 6, 10, 20, 50, seq(100, 600, 100))) +
    geom_text_contour(aes(z = Delta_NLL), 
       breaks = c(2, 4, 6, seq(10, 100, 10)), size = 7, color = 'white') +
    xlab("Natural Mortality (F)") +
    ylab("Natural Mortality (M)") +
    theme(
      axis.text.y = element_text(size = 15, color = 1),
      axis.text.x = element_text(size = 15, color = 1), 
      axis.title.x = element_text(size = 20), 
      axis.title.y = element_text(size = 20),
      legend.text = element_text(size = 15), 
      legend.title = element_text(size = 15)) +
    guides(fill = guide_legend(title = "Change in NLL"))
ggsave(file.path(getwd(), "joint_m_profile_offset_ggsave.png"), width = 14, height = 12)




###############################################################################################
# Plot profile using contours
###############################################################################################

setwd(file.path(mydir, paste0(base_name, "_joint_profile_M")))
load("output.Rdat")

out.mle <- output[nrow(output),]
out <- as.data.frame(output[ -nrow(output), ])

out$diffNegLogLike <- out$negLogLike - out.mle["negLogLike"]
#out$M_m <- round(out$M_f * exp(out$M_m),3)
out$diff_M <- out$M_f - out$M_m
out <- out[order(out$M_f, out$M_m),]
x <- unique(round(out$M_f, 4))
y <- unique(round(out$M_m, 4))
z <- matrix(out$diffNegLogLike, 
            ncol = length(y),
            byrow = TRUE, 
            dimnames = list(as.character(x), as.character(y)))

# Plot NLL Differences
pngfun(wd = getwd(), file = "joint_m_profile_orig_plot.png", w = 12, h = 12, pt = 12)
contour(x, y, z, 
    levels = c(0,2,4,5,8,seq(10, 100, 10)),
    xlim = c(0.07, 0.12), ylim = c(0.07, 0.12),
    xlab = "Female M", ylab = "Male M")
#points(0.108, 0.114, pch = 16, col = 'red')
contour(x, y, z, levels = c(2), lwd = 3, add = TRUE)
dev.off()

# Plot depletion
z <- matrix(out$depletion, 
            ncol = length(y), 
            byrow = TRUE,
            dimnames = list(as.character(x),as.character(y)))
par(new = TRUE)
contour(x, y, z, 
        levels=c(0.25, 0.35, 0.45, 0.55, 0.65, 0.75, 0.85, 0.95),
        method = "edge", lwd = 2, col = 'darkorchid4')
#points(0.108, 0.108, pch = 16, col = 'red')
z <- matrix(out$diffNegLogLike,
            ncol = length(y),
            byrow = TRUE, 
            dimnames = list(as.character(x),as.character(y)))
contour(x, y, z, levels=c(0.5,1,2,3,5,10,20,30,50,100,150),
    xlab = "Female M", ylab = "Male M", add = TRUE, lwd = 1)
contour(x, y, z, levels = c(3), lwd = 3, add = TRUE)




################################################################################################
# Plot NLL Differences
z <- matrix(mtrx_melt$Delta_NLL, 
            ncol = length(y),
            byrow = TRUE, 
            dimnames = list(as.character(x), as.character(y)))
contour(x, y, z, 
    levels = -5:50,
    xlim = c(0.07, 0.12), ylim = c(0.07, 0.12),
    xlab = "Female M", ylab = "Male M")
points(0.108, 0.114, pch = 16, col = 'red')
contour(x, y, z, levels = c(2), lwd = 3, add = TRUE)

# Plot NLL Differences
z <- matrix(out$diffNegLogLike, 
            ncol = length(y),
            byrow = TRUE, 
            dimnames = list(as.character(x), as.character(y)))
contour(x, y, z, 
    levels = -5:50,
    xlim = c(0.07, 0.12), ylim = c(0.07, 0.12),
    xlab = "Female M", ylab = "Male M")
points(0.108, 0.114, pch = 16, col = 'red')
contour(x, y, z, levels = c(3), lwd = 3, add = TRUE)
# Plot depletion
z <- matrix(out$depletion, 
            ncol = length(y), 
            byrow = TRUE,
            dimnames = list(as.character(x),as.character(y)))
par(new = TRUE)
contour(x, y, z, 
        levels=c(0.25, 0.35, 0.45, 0.55, 0.65, 0.75, 0.85, 0.95),
        method = "edge", lwd = 2, col = 'darkorchid4')
#points(0.108, 0.108, pch = 16, col = 'red')
z <- matrix(out$diffNegLogLike,
            ncol = length(y),
            byrow = TRUE, 
            dimnames = list(as.character(x),as.character(y)))
contour(x, y, z, levels=c(0.5,1,2,3,5,10,20,30,50,100,150),
    xlab = "Female M", ylab = "Male M", add = TRUE, lwd = 1)
contour(x, y, z, levels = c(3), lwd = 3, add = TRUE)

##############################################
#plot Mprofile
load("C:\\NOAA2011\\Dover\\Models\\base_20110701\\profileM\\output.Rdat")
out.mle <- output[nrow(output),]
out <- as.data.frame(output[-nrow(output),])
# 2011 M values by sex
fmM <- c(0.116243,0.141)  #estimates form model (with prior)

#doPNG <- T
ht <- 4; wd<- 4
#if(doPNG) {png(paste(figDir,"Mprofile.png",sep="\\"),height=ht,width=wd,pointsize=10,units="in",res=300)}
#if(!doPNG) {windows(height=ht,width=wd)}
par(mar=c(4,4,1,1),las=1)
out$diffNegLogLike <- out$negLogLike-out.mle["negLogLike"]
out <- out[order(out$M_f, out$M_m),]
x <- unique(round(out$M_f,4))
y <- unique(round(out$M_m,4))
z <- matrix(out$diffNegLogLike,
            ncol=length(y),
            byrow=T,
            dimnames=list(as.character(x),as.character(y)))
contour(x,y,z,levels=c(0.5,1,2,3,5,10,20,30,50,100,150),xlab="Female M",ylab="Male M")
contour(x,y,z,levels=c(3),lwd=3,add=T)
points(fmM[1],fmM[2],pch=4,cex=1.2,lwd=5)
# Fixed M values for 2021
points(0.108, 0.108, pch = 4, cex = 1.2, lwd = 5, col = 'red')
#plot Bcurr
z <- matrix(out$Bcurr/1000,
            ncol=length(y),
            byrow=TRUE,
            dimnames=list(as.character(x),as.character(y)))
contour(x,y,z,levels=seq(200,1400,200),method="edge",lwd=1,labcex=0.8,col=gray(0.5),add=T)
#replot M
z <- matrix(out$diffNegLogLike,ncol=length(y),byrow=T,dimnames=list(as.character(x),as.character(y)))
contour(x,y,z,levels=c(0.5,1,2,3,5,10,20,30,50,100,150),xlab="Female M",ylab="Male M",add=T,lwd=1)
contour(x,y,z,levels=c(3),lwd=3,add=T)
if(doPNG) {dev.off()}

z <- matrix(out$Bcurr/1000,ncol=length(y),byrow=T,dimnames=list(as.character(x),as.character(y)))
contour(x,y,z,levels=c(255,630),method="edge",lwd=3,labcex=0.8,col=1,add=T)   #12.5 and 87.5% quantiles from SB_2011 for decision table

#plot depletion
z <- matrix(out$depletion,ncol=length(y),byrow=T,dimnames=list(as.character(x),as.character(y)))
contour(x,y,z,levels=c(0.25,0.35,0.45,0.55,0.65,0.75,0.85,0.95),method="edge",lwd=1,labcex=0.8,col=gray(0.5),add=T)



###################################################################
# Zoom in a bit - I can't get this figure to work
###################################################################
outZoom <- out[out$diffNegLogLike <20, ]
#outZoom <- out[out$diff_M < 0.021 & out$diff_M > -0.021,]
x <- unique(round(outZoom$M_f, 4))
y <- unique(round(outZoom$M_m, 4))
z <- matrix(outZoom$diffNegLogLike,
            ncol = length(y),
            byrow = TRUE,
            dimnames = list(as.character(x), as.character(y)))
contour(x,y,z,levels=c(0.5,1,2,3,5,10,20,30))
contour(x,y,z,levels=c(3),lwd=3,add=T)
#plot depletion
z <- matrix(outZoom$depletion,ncol=length(y),byrow=T,dimnames=list(as.character(x),as.character(y)))
par(new=T)
contour(x,y,z,levels=c(0.25,0.35,0.45,0.55,0.65,0.75,0.85,0.95),method="edge",lwd=2,labcex=0.8)
