# Quick code to plot diffences in survey Q by approach to model natural mortality
#

myQ <- data.frame(read.csv("N:/Assessments/CurrentAssessments/Dover_sole_2021/models/SurveyQ_versus_M.csv",header=TRUE))
x_name <- myQ[,1]
myQ <- as.matrix(myQ[,-1])
rownames(myQ) <- x_name

#' @param wd location to save figure
#' @param file plot name
#' @param w figure width
#' @param h figure height in inches
#' @param pt point size
#' @authorwritten by Chantel Wetzel
pngfun <- function(wd, file,w=7,h=7,pt=12){
        file <- file.path(wd, file)
        cat('writing PNG to',file,'\n')
        png(filename=file,
            width=w,height=h,
            units='in',res=300,pointsize=pt)
}

pngfun(wd = savedir, 'unavailable_biomass.png', w = 10, h = 7)
SSunavailableSpawningOutput(model, plot=TRUE)
dev.off()


pngfun("N:/Assessments/CurrentAssessments/Dover_sole_2021/models","SurveyQ_vs_M.png", w = 10, h = 7)
barplot(myQ,
        xlab = "Survey",
        ylab = "Catchability",
        col = c("green","red", "yellow","orange", "blue"),
        beside = TRUE,
        cex.names = 1,
)
legend("topleft",
       c("Base","Lorenzen","Estimate Fem.","Fix 2011 Assessment","Fix Median Prior"),
       fill = c("green","red", "yellow","orange", "blue"),
       bty="n",
       cex = 1.0
)
abline(h=1,lty=3)
dev.off()
