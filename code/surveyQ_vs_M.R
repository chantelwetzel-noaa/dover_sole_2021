# Quick code to plot diffences in survey Q by approach to model natural mortality
#

myQ <- data.frame(read.csv("N:/Assessments/CurrentAssessments/Dover_sole_2021/models/SurveyQ_versus_M.csv",header=TRUE))
x_name <- myQ[,1]
myQ <- as.matrix(myQ[,-1])
rownames(myQ) <- x_name
png("N:/Assessments/CurrentAssessments/Dover_sole_2021/models/SurveyQ_vs_M.png", width = 480, height = 350)
barplot(myQ,
        xlab = "Survey",
        col = c("green","red", "yellow","orange", "blue"),
        beside = TRUE,
        cex.names = 0.75,
)
legend("topleft",
       c("Base","Lorenzen","Estimate Fem.","Fix 2011 Assessment","Fix Median Prior"),
       fill = c("green","red", "yellow","orange", "blue"),
       bty="n",
       cex = 0.7
)
abline(h=1,lty=3)
dev.off()
