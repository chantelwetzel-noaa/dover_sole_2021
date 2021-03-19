
wd = "C:/Assessments/vast/dover"

sci_name = "Microstomus_pacificus"

# This is probably not necessarily needed
strata.limits = data.frame('STRATA' = c("ca", "or", "wa"), 
                          'south_border'   = c(32.0, 42.0, 46.0),
                          'north_border'   = c(42.0, 46.0, 49.0), 
                          'shallow_border' = c(  55, 55, 55), 
                          'deep_border'    = c(1280, 1280, 1280) )


obs_model = c(2,0) # do the gamma only for now
#obs_model = c(1,0) # lognormal
#cheater way is to do two calls:
#debugonce(VAST_spp)
#VAST_spp(species = "square ..")
#Q

VAST_spp(dir = wd, species = "Dover_sole")

Sim_Settings <- list( "Species" = paste0("WCGBTS_", sci_name), 
                      "ObsModelcondition" = obs_model,
                      "nknots" = 50,
                      "depth" = c("no", "linear", "squared")[1],
                      "strata" = strata.limits,
                      "version" = "VAST_v5_4_0",
                      "Passcondition" = TRUE,
                      "overdisperion" = NULL
                      )
  
test <- VAST_condition(conditiondir = wd,
                       settings = Sim_Settings, 
                       spp = Sim_Settings$Species)
                       #datadir = wd,
                       #overdispersion = NULL)

VAST_diagnostics(wd)


############################################################################################
#
# AFSC Slope Survey Index
#
############################################################################################
devtools::load_all("C:/Users/Chantel.Wetzel/Documents/GitHub/nwfscSurvey")

wd = "C:/Assessments/2021/dover_sole_2021/vast/afsc_slope"
dir = "//nwcfile/FRAM/Assessments/CurrentAssessments/Dover_sole_2021/data/survey/afsc_slope"

load(file.path(dir, "Dover.AK.28.MAr.2010.dmp"))
load(file.path(dir, "AK.Surveys.Bio.Dover.17.Mar.11.dmp"))

filter.dat = Format.AKSlope.fn(datTows = Dover.AK.28.MAr.2010, 
                 datL = AK.Surveys.Bio.Dover.17.Mar.11, 
                 start.year = 1997) 

catch = filter.dat$datTows

sci_name = "Microstomus_pacificus"
obs_model = c(2,0) # do the gamma only for now
# This is probably not necessarily needed
strata.limits = data.frame('STRATA' = c("ca_or_wa", "ca", "or", "wa"), 
                          'north_border'   = c(49.0, 42.0, 46.0, 49.0), 
                          'south_border'   = c(34.5, 34.5, 42.0, 46.0),
                          'shallow_border' = c( 183,  183, 183, 183), 
                          'deep_border'    = c(1280, 1280, 1280, 1280) )


Sim_Settings <- list( "Species" = paste0("AFSC.Slope_", sci_name), 
                      "ObsModelcondition" = obs_model,
                      "nknots" = 500,
                      "strata" = strata.limits,
                      field = c(Omega1 = 1, Epsilon1 = 0, Omega2 = 1, Epsilon2 = 1)
                      )

test <- VAST_condition(conditiondir = wd,
                       settings = Sim_Settings, 
                       spp = Sim_Settings$Species,
                       data = catch,
                       sensitivity = FALSE)

VAST_diagnostics(dir = wd)

# Error message on March 2nd, 2021
# Check bounds for the following parameters:
#        Param starting_value Lower MLE Upper final_gradient
# 2 ln_H_input              0    -5  -5     5     0.04259985
# 
# 
# Warning message:
# In nlminb(start = startpar, objective = fn, gradient = gr, control = nlminb.control,  :
#   NA/NaN function evaluation
#  



# Got the following error - Turning off the Omega1 and Omega2 fixed this and resulted in a full run
# The following parameters appear to be approaching zero:
#           Param starting_value Lower           MLE Upper final_gradient
# 13 L_epsilon1_z      -1.396701  -Inf -5.708157e-06   Inf   -4.38018e-05
# Please turn off factor-model variance parameters `L_` that are approaching zero and re-run the model
# However, the full run pulling data using nwfscSurvey had unexpected year 1984 - 1996?

############################################################################################
#
# NWFSC Slope Survey Index
#
############################################################################################
devtools::load_all("C:/Users/Chantel.Wetzel/Documents/GitHub/nwfscSurvey")

wd = "C:/Assessments/2021/dover_sole_2021/vast/kfj/gamma_state"
dir = "//nwcfile/FRAM/Assessments/CurrentAssessments/Dover_sole_2021/data/survey/nwfsc_slope"

load(file.path(dir, "Catch__NWFSC.Slope_2020-09-10.rda"))
catch = Out

sci_name = "Microstomus_pacificus"
# This is probably not necessarily needed
strata.limits = data.frame('STRATA' = c("ca_or_wa", "ca", "or", "wa"),
                          'north_border'   = c(49.0, 42.0, 46.0, 49.0),  
                          'south_border'   = c(33.0, 33.0, 42.0, 46.0),
                          'shallow_border' = c( 183,  183, 183, 183), 
                          'deep_border'    = c(1280, 1280, 1280, 1280) )


Sim_Settings <- list( "Species" = paste0("NWFSC.Slope_", sci_name), 
                      "ObsModelcondition" = obs_model,
                      "strata" = strata.limits,
                      field = c(Omega1 = 1, Epsilon1 = 0, Omega2 = 1, Epsilon2 = 1)
                      )

test <- VAST_condition(conditiondir = wd,
                       settings = Sim_Settings, 
                       spp = Sim_Settings$Species,
                       data = catch,
                       sensitivity = FALSE)
# The above is not running - just creates the knots and stops without error

settings <- get_settings(Sim_Settings)
surveyspp <- get_spp(paste0("NWFSC.Slope_", sci_name))
survey <- surveyspp["survey"]
data = get_data(survey = survey, species = surveyspp["species"])

VAST_do(conditiondir = wd,
        settings = settings, 
        Database = data,  
        compiledir = wd)


VAST_diagnostics(dir = wd)

#> out$message
#[1] "Please change model structure to avoid problems with parameter estimates and then re-try; see details in `?check_fit`\n"
 


############################################################################################
#
# NWFSC WCGBT North and South of Pt. Reyes
#
############################################################################################
devtools::load_all("C:/Users/Chantel.Wetzel/Documents/GitHub/nwfscSurvey")

wd = "C:/Assessments/2021/dover_sole_2021/vast/wcgbt"

sci_name = "Microstomus_pacificus"

strata.limits = data.frame('STRATA' = c("coastwide", "south", "north"), 
                          'north_border'   = c(49.0, 38.0, 49.0),
                          'south_border'   = c(32.0, 32.0, 38.0),                           
                          'shallow_border' = c(  55,   55,   55), 
                          'deep_border'    = c(1280, 1280, 1280) )

obs_model = c(2,0) # do the gamma only for now
Sim_Settings <- list( "Species" = paste0("NWFSC.Combo_", sci_name), 
                      "ObsModelcondition" = obs_model,
                      "strata" = strata.limits)

test <- VAST_condition(conditiondir = wd,
                       settings = Sim_Settings, 
                       spp = Sim_Settings$Species,
                       sensitivity = FALSE)

# settings <- get_settings(Sim_Settings)
# surveyspp <- get_spp(paste0("NWFSC.Combo_", sci_name))
# survey <- surveyspp["survey"]
# data = get_data(survey = survey, species = surveyspp["species"])
# 
# VAST_do(Database = data, 
#         settings = settings, 
#         conditiondir = wd, 
#         compiledir = wd)
# 
# VAST_diagnostics(dir = wd)

Check bounds for the following parameters:
       Param starting_value     Lower       MLE     Upper final_gradient
44 logkappa2     -0.1053605 -6.470808 -2.462876 -2.462876    -0.03270074
