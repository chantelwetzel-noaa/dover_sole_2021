wd <- "C:\\Users\\Aaron.Berger\\Documents\\AMB\\Groundfish\\Assessments\\Dover Sole\\2021\\Data\\Catch"
setwd(wd)
c_ts <- as.data.frame(read.csv("Comparecatch_ts.csv",header=TRUE))
c_ts_melt <- as.data.frame(read.csv("Comparecatch_ts_melt.csv",header=TRUE))

c_ts$Total_2011 <- c_ts$CA_2011 + c_ts$ORWA_2011
c_ts$Total_2021 <- c_ts$CA_2021 + c_ts$ORWA_2021

library(ggplot2)

a <- ggplot(c_ts, aes(x=year)) + 
  geom_line(aes(y = Total_2021,color = "darkred"), size = 2) + 
  geom_line(aes(y = Total_2011, color="steelblue"), linetype="twodash", size = 2) +
  xlab("Year") + 
  ylab("Landings (mt)") +
  scale_color_discrete(name = "Assessment", labels = c("2021", "2011")) +
  theme_bw() +
  theme(legend.position = c(0.9, 0.90), 
        legend.background = element_rect(fill = NA))


b <- ggplot(data = c_ts_melt, aes(x=year)) +
  geom_line(aes(y=Assess_2021,color="darkred"),size=1) +
  geom_line(aes(y=Assess_2011,color="steelblue"),linetype="twodash",size=1) +
  labs(x="",y="") +
  facet_wrap(~ Type,ncol=1) +
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

pngfun(wd, "Catch_bysource.png", w = 10, h = 7)
subvp <- grid::viewport(width = 0.45, height = 0.4, x = 0.3, y = 0.75)
a
print(b, vp = subvp)
dev.off()
