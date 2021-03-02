setwd("T:/Maturity program/Reproductive analysis/Dover sole")
Dover <- read.csv("T:/Maturity program/Reproductive analysis/Dover sole/2013_2019 Dover sole maturity.csv",
                     header = TRUE, sep = ",") 


##########Dover all data available 2013 - 2019#######
###Biological maturity###

Dover_cert <- Dover[Dover$Certainty==1, ] ###Remove uncertain samples###

head(Dover_cert)

Dover.glm <- glm (maturity ~ 1 + length, data <-data.frame(length =Dover_cert$Length, maturity <- Dover_cert$Biological_maturity),
                     family = binomial(link ="logit"))

summary(Dover.glm)

cor(Dover_cert$Length, Dover_cert$Biological_maturity)

A <- -9.90404
B <- 0.30307
sA<- 1.02715
sB<- 0.03004
r <- 0.643851
n <- 428

deltamethod <- ((sA^2)/(B^2))- ((2*A*sA*sB*r)/(B^3))+ (((A^2)*(sB^2))/(B^4))
deltamethod
#### 36.11441###

1.96*(sqrt(deltamethod)/sqrt(n))

### CI: 0.5693436###
A/B

###L50 = 32.67905###


##########Dover all data available 2013 - 2019#######
###Functional maturity###

Dover_cert <- Dover[Dover$Certainty==1, ] ###Remove uncertain samples###

head(Dover_cert)

Dover.glm <- glm (maturity ~ 1 + length, data <-data.frame(length =Dover_cert$Length, maturity <- Dover_cert$Functional_maturity),
                  family = binomial(link ="logit"))

summary(Dover.glm)

cor(Dover_cert$Length, Dover_cert$Functional_maturity)

A <- -9.1373
B <- 0.2782
sA<- 0.9472
sB<- 0.0275
r <- 0.6294754
n <- 428

deltamethod <- ((sA^2)/(B^2))- ((2*A*sA*sB*r)/(B^3))+ (((A^2)*(sB^2))/(B^4))
deltamethod
#### 36.04955###

1.96*(sqrt(deltamethod)/sqrt(n))

### CI: 0.5688321###
A/B

###L50 = 32.84436###

##########Biological Maturity - Spatial Analysis#######

##########South of Point Reyes 38.0##############
Dover_cert <- Dover[Dover$Certainty==1, ] ###Remove uncertain samples###

South <- Dover_cert[Dover_cert$N_S=="S", ] 
South.glm <- glm (maturity ~ 1 + length, data <-data.frame(length =South$Length, maturity <- South$Biological_maturity),
                  family = binomial(link ="logit"))

summary(South.glm)

cor(South$Length, South$Biological_maturity)


A <- -10.47785
B <- 0.26447
sA<- 2.01824
sB<- 0.05191
r <- 0.6840683 
n <- 94

deltamethod <- ((sA^2)/(B^2))- ((2*A*sA*sB*r)/(B^3))+ (((A^2)*(sB^2))/(B^4))
deltamethod
####199.8951###

1.96*(sqrt(deltamethod)/sqrt(n))

### CI: 2.858204###
A/B

###L50 = 39.61829###

##########North of Point Reyes 38.0 Biological maturity##############

Dover_cert <- Dover[Dover$Certainty==1, ] ###Remove uncertain samples###

North <- Dover_cert[Dover_cert$N_S=="N", ] 
North.glm <- glm (maturity ~ 1 + length, data <-data.frame(length =North$Length, maturity <- North$Biological_maturity),
                  family = binomial(link ="logit"))

summary(North.glm)

cor(North$Length, North$Biological_maturity)


A <- -11.59948
B <- 0.37013
sA<- 1.47834
sB<- 0.04441
r <- 0.61288 
n <- 334

deltamethod <- ((sA^2)/(B^2))- ((2*A*sA*sB*r)/(B^3))+ (((A^2)*(sB^2))/(B^4))
deltamethod
####48.50126###

1.96*(sqrt(deltamethod)/sqrt(n))

### CI:0.7468947###
A/B

###L50 = 31.33893###


##########Functional Maturity - Spatial Analysis#######

##########South of Point Reyes 38.0##############
Dover_cert <- Dover[Dover$Certainty==1, ] ###Remove uncertain samples###

South <- Dover_cert[Dover_cert$N_S=="S", ] 


South.glm <- glm (maturity ~ 1 + length, data <-data.frame(length =South$Length, maturity <- South$Functional_maturity),
                  family = binomial(link ="logit"))

summary(South.glm)

cor(South$Length, South$Functional_maturity)


A <- -12.27072
B <- 0.30799 
sA<- 2.42067
sB<- 0.06145
r <- 0.7139725 
n <- 94

deltamethod <- ((sA^2)/(B^2))- ((2*A*sA*sB*r)/(B^3))+ (((A^2)*(sB^2))/(B^4))
deltamethod
#### 214.1745###

1.96*(sqrt(deltamethod)/sqrt(n))

### CI: 2.95853###
A/B

###L50 = 39.84129###

##########North of Point Reyes 38.0##############



North <- Dover_cert[Dover_cert$N_S=="N", ] 
North.glm <- glm (maturity ~ 1 + length, data <-data.frame(length =North$Length, maturity <- North$Functional_maturity),
                  family = binomial(link ="logit"))

summary(North.glm)

cor(North$Length, North$Functional_maturity)


A <- -9.48572
B <-  0.30371
sA<- 1.21876
sB<- 0.03622
r <- 0.5827322 
n <- 334

deltamethod <- ((sA^2)/(B^2))- ((2*A*sA*sB*r)/(B^3))+ (((A^2)*(sB^2))/(B^4))
deltamethod
####47.39783###

1.96*(sqrt(deltamethod)/sqrt(n))

### CI:0.7383496##
A/B

###L50 = 31.23282###


#####Age at maturity####

###Biological maturity###

Dover_cert <- Dover[Dover$Certainty==1, ] ###Remove uncertain samples###
Dover_age <- Dover_cert[!is.na(Dover_cert$Age),] #Removing N/A##



Dover.glm <- glm (maturity ~ 1 + age, data <-data.frame(age =Dover_age$Age, maturity <- Dover_age$Biological_maturity),
                  family = binomial(link ="logit"))

summary(Dover.glm)

cor(Dover_age$Age, Dover_age$Biological_maturity)

A <- -2.74741
B <- 0.26728
sA<- 0.35472
sB<- 0.03453
r <- 0.5541905
n <- 298

deltamethod <- ((sA^2)/(B^2))- ((2*A*sA*sB*r)/(B^3))+ (((A^2)*(sB^2))/(B^4))
deltamethod
####5.478235###

1.96*(sqrt(deltamethod)/sqrt(n))

### CI: 0.2657469##
A/B
##Age at maturity = 10.27915 yrs ###

###Functional maturity###

Dover_cert <- Dover[Dover$Certainty==1, ] ###Remove uncertain samples###
Dover_age <- Dover_cert[!is.na(Dover_cert$Age),] #Removing N/A##



Dover.glm <- glm (maturity ~ 1 + age, data <-data.frame(age =Dover_age$Age, maturity <- Dover_age$Functional_maturity),
                  family = binomial(link ="logit"))

summary(Dover.glm)

cor(Dover_age$Age, Dover_age$Functional_maturity)

A <- -2.4701
B <- 0.2312
sA<- 0.3264
sB<- 0.0303
r <- 0.5385919
n <- 298

deltamethod <- ((sA^2)/(B^2))- ((2*A*sA*sB*r)/(B^3))+ (((A^2)*(sB^2))/(B^4))
deltamethod
#### 6.082846###

1.96*(sqrt(deltamethod)/sqrt(n))

### CI: 0.2800279##
A/B
##Age at functional maturity = 10.68382 yrs ###

###age at Functional maturity - South of Pt.Reyes###

Dover_cert <- Dover[Dover$Certainty==1, ] ###Remove uncertain samples###
South <- Dover_cert[Dover_cert$N_S=="S", ] 
Dover_age <- South[!is.na(South$Age),] #Removing N/A##


Dover.glm <- glm (maturity ~ 1 + age, data <-data.frame(age =Dover_age$Age, maturity <- Dover_age$Functional_maturity),
                  family = binomial(link ="logit"))

summary(Dover.glm)

cor(Dover_age$Age, Dover_age$Functional_maturity)

A <- -4.93140
B <- 0.27173
sA<- 0.91964
sB<- 0.05679
r <- 0.7552591
n <- 93

deltamethod <- ((sA^2)/(B^2))- ((2*A*sA*sB*r)/(B^3))+ (((A^2)*(sB^2))/(B^4))
deltamethod
#### 45.22967###

1.96*(sqrt(deltamethod)/sqrt(n))

### CI: 1.366867##
A/B
##Age at functional maturity = 18.14816 yrs ###

####Age at functional maturity - North of pt reyes###

Dover_cert <- Dover[Dover$Certainty==1, ] ###Remove uncertain samples###
North <- Dover_cert[Dover_cert$N_S=="N", ] 
Dover_age <- North[!is.na(North$Age),] #Removing N/A##


Dover.glm <- glm (maturity ~ 1 + age, data <-data.frame(age =Dover_age$Age, maturity <- Dover_age$Functional_maturity),
                  family = binomial(link ="logit"))

summary(Dover.glm)

cor(Dover_age$Age, Dover_age$Functional_maturity)

A <- -2.55859
B <- 0.31772
sA<- 0.46237
sB<- 0.05279
r <- 0.4984334
n <- 205

deltamethod <- ((sA^2)/(B^2))- ((2*A*sA*sB*r)/(B^3))+ (((A^2)*(sB^2))/(B^4))
deltamethod
#### 5.849218###

1.96*(sqrt(deltamethod)/sqrt(n))

### CI: 0.3310763##
A/B
##Age at functional maturity North = 8.052971 yrs ###

###age at Biological maturity - South of Pt.Reyes###

Dover_cert <- Dover[Dover$Certainty==1, ] ###Remove uncertain samples###
South <- Dover_cert[Dover_cert$N_S=="S", ] 
Dover_age <- South[!is.na(South$Age),] #Removing N/A##


Dover.glm <- glm (maturity ~ 1 + age, data <-data.frame(age =Dover_age$Age, maturity <- Dover_age$Biological_maturity),
                  family = binomial(link ="logit"))

summary(Dover.glm)

cor(Dover_age$Age, Dover_age$Biological_maturity)

A <- -4.36551 
B <- 0.24155
sA<- 0.79826
sB<- 0.05006
r <- 0.7271896
n <- 93

deltamethod <- ((sA^2)/(B^2))- ((2*A*sA*sB*r)/(B^3))+ (((A^2)*(sB^2))/(B^4))
deltamethod
#### 42.95245###

1.96*(sqrt(deltamethod)/sqrt(n))

### CI: 1.332013##
A/B
##Age at Biologocal = 18.0729 rs ###

####Age at biological maturity - North of pt reyes###

Dover_cert <- Dover[Dover$Certainty==1, ] ###Remove uncertain samples###
North <- Dover_cert[Dover_cert$N_S=="N", ] 
Dover_age <- North[!is.na(North$Age),] #Removing N/A##


Dover.glm <- glm (maturity ~ 1 + age, data <-data.frame(age =Dover_age$Age, maturity <- Dover_age$Biological_maturity),
                  family = binomial(link ="logit"))

summary(Dover.glm)

cor(Dover_age$Age, Dover_age$Biological_maturity)

A <- -3.94002
B <- 0.50620
sA<- 0.64886
sB<- 0.08231
r <- 0.5353413
n <- 205

deltamethod <- ((sA^2)/(B^2))- ((2*A*sA*sB*r)/(B^3))+ (((A^2)*(sB^2))/(B^4))
deltamethod
####4.981882###

1.96*(sqrt(deltamethod)/sqrt(n))

### CI: 0.3055455##
A/B
##Age at Biological maturity North = -7.783524yrs ###