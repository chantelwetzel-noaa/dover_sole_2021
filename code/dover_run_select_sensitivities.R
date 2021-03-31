######################################################################
#
#     Code to Modify Files for Select Sensitivities
#		               Dover Sole 2021
#
######################################################################

library(r4ss)
wd = "//nwcfile/FRAM/Assessments/CurrentAssessments/Dover_sole_2021/models"
wd = "C:/Assessments/2021/dover_sole_2021/models"

base.model = "5.9.9_selex_pin_slope_wcgbt_params"
sens.folder = "_sensitivities"
indir = file.path(wd, sens.folder)

runs = c("est_m", "2011_m", "2011_maturity", "south_maturity", "mi")

m_2011 = c(0.1165, 0.1417)
m_2011 = c(m_2011[1], round(log(m_2011[2]/m_2011[1]), 4))

exist.files = dir(indir, pattern = base.model)
day = Sys.Date()

# If there are sensitivity runs with the same base model, copy and move these folders
if(length(exist.files) > 0){
	archive = paste0(wd, sens.folder, "/_", day)
	dir.create(archive)
	for(i in 1:length(exist.files)) { 
		old.loc = paste0(wd, sens.folder, "/", exist.files[i])
		new.loc = paste0(archive, "/")
		file.copy(old.loc, new.loc, recursive = TRUE)
	}

	for(i in 1:length(exist.files)) {
		old.loc = paste0(wd, sens.folder, "/", exist.files[i])
		unlink(old.loc, recursive=TRUE)
	}
}

removevarpars <- function(file.in, file.out = NULL, removefactor) {
  reg <- paste(paste0("^\\s*", removefactor), collapse = "|")
  ctl <- readLines(file.in)
  ii <- grep("Variance", ctl, ignore.case = TRUE)
  while (grepl("\\s*#", ctl[ii])) ii <- ii + 1
  while (!grepl("\\s*-999", ctl[ii])) {
    if (grepl(reg, ctl[ii])) {
      ctl <- ctl[-ii]
    } else {ii <- ii + 1}
  }
  if (!is.null(file.out)) writeLines(ctl, file.out)
  invisible(ctl)
}

###############################################################################################
# Estimate natural mortality sensitivity
###############################################################################################
if("est_m" %in% runs){
  sens.name = file.path(indir, paste0(base.model,"_est_m"))
  newctl = paste0("2021_dover_est_m.ctl")
  
  file.copy(file.path(wd, base.model), indir, recursive = TRUE)
  file.rename(file.path(indir, base.model),  sens.name)
  
  #Change the m value
  setwd(sens.name)
  SS_changepars(ctlfile = paste0("2021_dover.ctl"), 
                newctlfile = newctl, 
                strings = c("NatM_p_1_Fem_GP_1","NatM_p_1_Mal_GP_1"),  
                estimate = c(TRUE, TRUE)
                )

  starter = SS_readstarter("starter.ss")
  starter$ctlfile = newctl
  starter$init_values_src = 1
  SS_writestarter(starter, overwrite = TRUE)
  system("ss -nohess")
}

###############################################################################################
# 2011 natural mortality sensitivity
###############################################################################################
if("2011_m" %in% runs){
  sens.name = file.path(indir, paste0(base.model,"_2011_m"))
  newctl = paste0("2021_dover_2011_m.ctl")
  
  file.copy(file.path(wd, base.model), indir, recursive = TRUE)
  file.rename(file.path(indir, base.model),  sens.name)
  
  #Change the female m value
  setwd(sens.name)
  SS_changepars(ctlfile = paste0("2021_dover.ctl"), 
                newctlfile = newctl, 
  			        strings = c("NatM_p_1_Fem_GP_1","NatM_p_1_Mal_GP_1"), 
                newvals = m_2011, 
                estimate = c(FALSE, FALSE)
                )
  
  starter = SS_readstarter("starter.ss")
  starter$ctlfile = newctl
  starter$init_values_src = 0
  SS_writestarter(starter, overwrite = TRUE)
  system("ss -nohess")
}

###############################################################################################
# 2011 Maturity Estimates
###############################################################################################
if("2011_maturity" %in% runs){
  sens.name = file.path(indir, paste0(base.model,"_2011_maturity"))
  newctl = paste0("2021_dover_2011_mat.ctl")
  
  file.copy(file.path(wd, base.model), indir, recursive = TRUE)
  file.rename(file.path(indir, base.model),  sens.name)
  
  setwd(sens.name)
  SS_changepars(ctlfile = paste0("2021_dover.ctl"), 
          newctlfile = newctl, 
  			  strings = c("Mat50%_Fem", "Mat_slope_Fem"), 
  			  newvals = c(35, -0.775), 
          estimate = c(FALSE, FALSE)
          )

  starter = SS_readstarter("starter.ss")
  starter$ctlfile = newctl
  starter$init_values_src = 0
  SS_writestarter(starter, overwrite = TRUE)
  system("ss -nohess")
}


###############################################################################################
# South Maturity
###############################################################################################
if("south_maturity" %in% runs){
  sens.name = file.path(indir, paste0(base.model,"_south_maturity"))
  newctl = paste0("2021_dover_south_mat.ctl")
  
  file.copy(file.path(wd, base.model), indir, recursive = TRUE)
  file.rename(file.path(indir, base.model),  sens.name)
  
  setwd(sens.name)
  SS_changepars(ctlfile = paste0("2021_dover.ctl"), 
          newctlfile = newctl, 
          strings = c("Mat50%_Fem", "Mat_slope_Fem"), 
          newvals = c(39.84, -0.308), 
          estimate = c(FALSE, FALSE)
          )

  starter = SS_readstarter("starter.ss")
  starter$ctlfile = newctl
  starter$init_values_src = 0
  SS_writestarter(starter, overwrite = TRUE)
  system("ss -nohess")
}


###############################################################################################
# Dirichlet Weights
###############################################################################################
if("dm" %in% runs){
  sens.name = file.path(indir, paste0(base.model,"_dm"))
  newctl = paste0("2021_dover_dm.ctl")
  newdat = paste0("2021_dover_dm.dat")
  
  file.copy(file.path(wd, base.model), indir, recursive = TRUE)
  file.rename(file.path(indir, base.model),  sens.name)
  
  setwd(sens.name)
  file.copy(paste0("2021_dover.ctl"), newctl)
  file.copy(paste0("2021_dover.dat"), newdat)
  
  starter = SS_readstarter("starter.ss")
  starter$ctlfile = newctl
  starter$datfile = newdat
  SS_writestarter(starter, overwrite = TRUE)
  message('Dirichlet run needs data file edited and to be hand run.')
}


###############################################################################################
# MI Weights
###############################################################################################
if("mi" %in% runs){
  sens.name = file.path(indir, paste0(base.model,"_mi"))
  newctl = paste0("2021_dover_mi.ctl")
  
  file.copy(file.path(wd, base.model), indir, recursive = TRUE)
  file.rename(file.path(indir, base.model),  sens.name)
  setwd(sens.name)
  file.copy(paste0("2021_dover.ctl"), newctl)

  rep = SS_output(sens.name)
  tune = SS_tune_comps(replist = rep, option = "MI", digits = 4)
  ctl <- readLines(newctl)
  
  start <- grep("Factor", ctl)
  end <- grep("-9999", ctl)
  end <- end[end > start][1]
  new.ctl.lines <- c(ctl[1:start],
                     apply(tune, 1, FUN = paste, collapse = " "),
                     ctl[end:length(ctl)])

  writeLines(new.ctl.lines, newctl)
  starter = SS_readstarter("starter.ss")
  starter$ctlfile = newctl
  SS_writestarter(starter, overwrite = TRUE)
  system("ss -nohess")
}
