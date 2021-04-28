wd = "C:/Assessments/2021/dover_sole_2021/models"
dir = file.path(wd, "7.0.1_base")


find_para <- function(dir, base, yr = 2021, parm = c("MGparm[1]"), quant = c(0.125, 0.875)){

for (tt in 1:length(quant)){

	dec_dir <- paste0(dir, "_decision_table_", quant[tt])
	dir.create(dec_dir, showWarnings = FALSE)
	
	# Check for existing files and delete
	if (length(list.files(dec_dir)) != 0) { 
		remove <- list.files(dec_dir) 
		file.remove(file.path(dec_dir, remove)) 
	}
	
	all_files <- list.files(dir)
	capture.output(file.copy(from = file.path(dir, all_files), 
			  to = dec_dir, overwrite = TRUE), file = "run_diag_warning.txt")
	message(paste0( "Running search for ", parm, " solved for ", quant[tt], ".") )
	
	starter <- r4ss::SS_readstarter(file.path(dec_dir, 'starter.ss'))
	starter$init_values_src <- 1 # run from the par file
	r4ss::SS_writestarter(starter, dir = dec_dir, overwrite=TRUE)
	
	# This should always read the base model in the dir folder
	base = r4ss::SS_output(dir, printstats = FALSE, verbose = FALSE, covar = FALSE, ncol = 300)	
	par.name = "ss.par"

	sb = base$derived_quants[grep(paste0('SSB_', yr), base$derived_quants$Label), "Value"]
	target = round(qnorm(quant[tt], mean = sb[,"Value"], sd = sb[,"StdDev"]),1)

	setwd(dec_dir)

	for(a in 1:100){

		if(a == 1){
			find_sb = sb
		}else{
			low = SS_output(dec_dir, printstats = FALSE, verbose = FALSE, covar = FALSE, ncol = 300)
			find_sb = low$derived_quants[grep(paste0('SSB_', yr), low$derived_quants$Label), "Value"]
		}

		print(paste0("!!!!!!!!!!!   SB = ", find_sb, " vs Target = ", target, "    !!!!!!!!!!!"))	
		if (find_sb > target - target * 0.005 & find_sb < target + target * 0.005){
			print(paste0("Found solution -- parameter value = ", temp, " matches target SB in ", yr))
			write.table(paste(parm, "=", temp), file = file.path(dec_dir, "_Solved_Param_Value.txt"))
			break()
		}

		rawpar    <- readLines(file.path(dec_dir, "ss.par"))
		which_line = grep(parm, rawpar, fixed = TRUE) + 1
		temp = as.numeric(rawpar[which_line])
	
		step.size =ifelse(find_sb > target - target * 0.05 & find_sb < target + target * 0.05, 
						  ifelse(find_sb > target - target* 0.02 & find_sb < target + target * 0.02,
						  0.0002, 0.001), 0.002)
		
		value = ifelse( find_sb > target, temp - step.size,
					 	ifelse (find_sb < target, temp + step.size, temp))
		temp = value
		rawpar[which_line] = temp
		writeLines(rawpar, con = file.path(dec_dir, "ss.par"))
		shell("ss -nohess -maxfun 0 > output.txt 2>&1")  
	} # end a loop
} # end tt loop

} # close function