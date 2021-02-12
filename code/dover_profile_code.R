
devtools::load_all("C:/Users/Chantel.Wetzel/Documents/GitHub/nwfscDiag")
#library(nwfscDiag)

#######################################################################################################
# Dover sole Profiling Script
#######################################################################################################

mydir = "C:/Assessments/2021/dover_sole_2021/models"
base_name = "1.8_selex_dome_m"

get = get_settings_profile( parameters =  c("NatM_p_1_Fem_GP_1", "SR_BH_steep", "SR_LN(R0)", "L_at_Amax_Fem_GP_1"),
							low =  c(0.09, 0.30, -1.0, 45),
							high = c(0.13, 1.0,  2, 55),
							step_size = c(0.005, 0.10, 0.25, 1),
							param_space = c('real', 'real', 'relative', 'real'))

get = get_settings_profile( parameters =  c("NatM_p_1_Fem_GP_1", "NatM_p_1_Mal_GP_1"),
							low =  c(0.07, -0.35),
							high = c(0.15, 0.35),
							step_size = c(0.01, 0.10),
							param_space = c('real', 'real'))

model_settings = get_settings(settings = list(base_name = base_name,
											  run = "profile",
											  profile_details = get))

run_diagnostics(mydir = mydir, model_settings = model_settings)

model_settings = get_settings(settings = list(base_name = base_name,
											  run ="jitter",
											  jitter_fraction = 0.10))

run_diagnostics(mydir = mydir, model_settings = model_settings)
