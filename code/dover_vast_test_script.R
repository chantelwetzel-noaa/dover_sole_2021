
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