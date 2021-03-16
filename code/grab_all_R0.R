library(r4ss)
wd = "C:/Assessments/2021/dover_sole_2021/models"

all = list.files(path = wd)
out = NULL

for (a in 1:length(all)){
	if(file.exists(file.path(wd, all[a], "Report.sso"))){
		model  = SS_output(file.path(wd, all[a]), printstats = FALSE, 
			verbose = FALSE, covar = FALSE)		
		R0 = model$parameters[model$parameters$Label == 'SR_LN(R0)', 'Value']
		M = model$parameters[model$parameters$Label == 'NatM_p_1_Fem_GP_1', 'Value']
		male_M = M * exp(model$parameters[model$parameters$Label == 'NatM_p_1_Mal_GP_1', 'Value'])
		out = rbind(out, c(basename(all[a]), R0, M, male_M))
	}	
}

write.table(out, file = file.path(wd, "R0_M_values_3.14.txt"))

all = list.files(path = wd)
out = NULL
for (a in 5:length(all)){
	if(file.exists(file.path(wd, all[a], "Report.sso"))){
		model  = SS_output(file.path(wd, all[a]), printstats = FALSE, 
			verbose = FALSE, covar = FALSE)		
		AFSC_Q = round(exp(model$parameters[model$parameters$Label == 'LnQ_base_AFSC_Slope(3)', 'Value']),2)
		TRI_Q = round(exp(model$parameters[model$parameters$Label == 'LnQ_base_Triennial(4)', 'Value']),2)
		NWFSC_Q =  round(exp(model$parameters[model$parameters$Label == 'LnQ_base_NWFSC_Slope(5)', 'Value']),2)
		WCGBT_Q =  round(exp(model$parameters[model$parameters$Label == 'LnQ_base_NWFSC_WCGBT(6)', 'Value']),2)
		out = rbind(out, c(basename(all[a]), AFSC_Q, TRI_Q, NWFSC_Q, WCGBT_Q))
	}	
}

write.table(out, file = file.path(wd, "Q_values_3.14.txt"))