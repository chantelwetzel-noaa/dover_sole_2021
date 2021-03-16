
devtools::load_all("C:/Users/Chantel.Wetzel/Documents/GitHub/nwfscDiag")
#library(nwfscDiag)

#######################################################################################################
# Dover sole Profiling Script
#######################################################################################################

mydir = "C:/Assessments/2021/dover_sole_2021/models"
base_name = "1.8_selex_dome_m"
base_name = "0.0_updated_data_model_structure"
base_name = "4.0.4_bio_rm_tri"
base_name = "5.1.4_dw_mi_orwa_disc"
base_name = "5.2.2_selex_survey_2011"
base_name = "3.2.5_dw_mi"
base_name = "5.1.0_dw_mi"
base_name = "5.2.4_selex_survey_2011_update_afslope"
base_name = "5.2.3_selex_survey_2011_update_wcgbt"
base_name = "5.2.7_selex_splines_wcgbt_asym"
base_name = "5.1.0_dw_mi_jitter_best"
base_name = "3.0.4_data_ages"

get = get_settings_profile( parameters =  c("NatM_p_1_Fem_GP_1", "SR_BH_steep", "SR_LN(R0)"),
							low =  c(0.09,  0.30, -2.0),
							high = c(0.13, 1.0,  3),
							step_size = c(0.005, 0.10, 0.25),
							param_space = c('real', 'real', 'relative'))

get = get_settings_profile( parameters =  c("NatM_p_1_Fem_GP_1", "NatM_p_1_Mal_GP_1"),
							low =  c(0.07, -0.35),
							high = c(0.15, 0.35),
							step_size = c(0.01, 0.10),
							param_space = c('real', 'real'))

get = get_settings_profile( parameters =  c("NatM_p_1_Fem_GP_1", "SR_LN(R0)"),
							low =  c(0.08, -1.0),
							high = c(0.14, 2.5),
							step_size = c(0.05, 0.25),
							param_space = c('real', 'relative'))


model_settings = get_settings(settings = list(base_name = base_name,
											  run = "jitter",
											  Njitter = 50,
											  profile_details = get))

model_settings = get_settings(settings = list(base_name = base_name,
											  run = "profile",
											  profile_details = get))

run_diagnostics(mydir = mydir, model_settings = model_settings)



#######################################################################

mydir = "C:/Assessments/2021/dover_sole_2021/models"
base_name = "4.0.4_bio_update_m_prior"

#offset
get = get_settings_profile( parameters =  c("NatM_p_1_Fem_GP_1", "NatM_p_1_Mal_GP_1",
							"SR_BH_steep", "SR_LN(R0)"),
							low =  c(0.06, -0.35, 0.3, -2),
							high = c(0.14,  0.35, 1.0,  2),
							step_size = c(0.01, 0.05, 0.05, 0.25),
							param_space = c('real', 'real', 'real', 'relative'))


# independent sex estimates
# get = get_settings_profile( parameters =  c("NatM_p_1_Fem_GP_1", "NatM_p_1_Mal_GP_1"),
# 							low =  c(0.07, 0.07),
# 							high = c(0.15, 0.15),
# 							step_size = c(0.01, 0.01),
# 							param_space = c('real', 'real'))

model_settings = get_settings(settings = list(base_name = base_name,
											  run = c("profile", 'retro'),
											  profile_details = get))

run_diagnostics(mydir = mydir, model_settings = model_settings)

