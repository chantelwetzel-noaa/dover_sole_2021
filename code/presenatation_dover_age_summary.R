###############################################################################
###############################################################################
#### title: "POP catch comparison"
#### author: Kelli Faye Johnson
###############################################################################
###############################################################################
#Adapted for use in Dover sole 2021 assessment - Wetzel and Berger

setwd("N:\\Assessments\\CurrentAssessments\\Dover_sole_2021\\data\\biology")
load(file = "dover_all_ages.Rdat")

wd <- "C:\\Users\\Aaron.Berger\\Documents\\AMB\\Groundfish\\Assessments\\Dover Sole\\2021\\Rcode\\BioData"
setwd(wd)

y <- all_ages[!is.na(all_ages$Age),]
yy <- y[-which(y$Year==1991 & y$Source=="CALCOM"),]
table(yy$Year,yy$Source)

#### load packages
library(ggplot2)
library(grid)

#### Set parameters
alpha <- 0.6
width <- 1
xlab <- "Age"

yy$Type <- factor(yy$Source, levels = c("CALCOM","NWFSC_Slope","NWFSC_WCGBTS","PacFIN"),
  labels = c("CA fishery","NWFSC slope survey","NWFSC_WCGBTS","OR/WA fishery"))

a <- ggplot(data = yy,
  aes(x = Age)) +
  # facet_grid(Source ~ .) +
  geom_density(
    aes(col = Type, fill = Type),
    # aes(as.factor(Sex)),
    alpha = alpha, position = "identity") +
  xlab("Age") +
  ylab("Count") +
  theme_bw() +
  theme(
    legend.position = "none")

aa <- ggplot(data = yy, aes(x = Age)) +
  # # facet_grid(Source ~ .) +
  geom_histogram(
    aes(y = ..count.., col = Type, fill = Type),
    # aes(y = ..density.., col = Type, fill = Type),
    alpha = alpha, binwidth = width, position = "stack") +
  # geom_density(aes(col = Type, fill = Type),
  #   alpha = alpha, position = "stack") +
  xlab("Age") +
  ylab("Count") +
  theme_bw() +
  theme(legend.position = "none")

b <- ggplot(data = yy,
  aes(x = Age)) +
  # facet_grid(Type ~ .) +
  facet_wrap(facets = "Type", ncol = 1) +
  geom_density(
    aes(col = Type, fill = Type),
    # aes(as.factor(Sex)),
    alpha = alpha, position = "identity") +
  xlab(xlab) +
  ylab("Density") +
  scale_x_continuous(limits = range(yy$Age), expand = c(0, 0)) +
    theme_bw() +
    theme(
    legend.position = "none",
    strip.background = element_blank())



pngfun <- function(wd, file,w=7,h=7,pt=12){
  file <- file.path(wd, file)
  cat('writing PNG to',file,'\n')
  png(filename=file,
      width=w,height=h,
      units='in',res=300,pointsize=pt)
}

pngfun(wd, "Dover2021_agesbysource.png", w = 10, h = 7)
subvp <- grid::viewport(width = 0.6, height = 0.78, x = 0.68, y = 0.59)
aa
print(b, vp = subvp)
dev.off()
