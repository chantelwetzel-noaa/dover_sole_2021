library(sa4ss)

load("00mod.Rdata")
save_loc = file.path(getwd(), "tex_tables")


# Let's create index tables

names =  unique(model$cpue[,"Fleet_name"])
survey.list = list()
for(i in 1:length(names)){
  grab = model$cpue[model$cpue$Fleet_name == names[i], c("Obs", "SE") ]
  survey.list[[i]] = grab
  rownames(survey.list[[i]]) = model$cpue[model$cpue$Fleet_name == names[i], "Yr" ]
  colnames(survey.list[[i]]) = c("Obs", "SE")
}
names(survey.list) = names
Rows = unique(unlist(lapply(survey.list, rownames)))
Rows = sort(as.numeric(Rows))
index_summary = matrix("-", nrow = length(Rows), ncol = 2*length(names),
                       dimnames=list(Rows, sapply(survey.list, colnames)))
mat.names = NULL
for(i in seq_along(survey.list)){
  if(i==1) { ind = 1:2  }
  if(i!=1) { ind = ind+2}
  index_summary[rownames(survey.list[[i]]), ind] = cbind(round(survey.list[[i]]$Obs, digits = 0), 
                                                         round(survey.list[[i]]$SE,  digits = 2)) 
  mat.names = c(mat.names, "Obs", "SE")
}
index_summary = cbind(rownames(index_summary), index_summary)
colnames(index_summary)[1] = "Year"
rownames(index_summary) = NULL

t = table_format(x = index_summary,
			 repeat_header = TRUE,
			 header_grouping = c("", "AFSC Slope" = 2, "Triennial" = 2, "NWFSC Slope" = 2, "NWFSC WCGBT" = 2),
             caption = "Summary of the fishery-independent biomass/abundance time series used in the stock assessment.
             The standard error includes the input annual standard error and model estimated added variance.",
             label = "indices",
             align = 'l')

kableExtra::save_kable(t,
					   file = file.path(save_loc, paste0('index_table.tex')))

# Let's now do the design based indices because people care for some reason
dir = '//nwcfile/FRAM/Assessments/CurrentAssessments/Dover_sole_2021/data/survey'

tab = read.csv(file.path(dir, 'wcgbts', 'forSS', 'nwfsc_wcgbts_design_based_indices.csv'))
tab = tab[,c('Year', 'Value', 'seLogB')]
tab[,3] = round(tab[,3], 3)
col_names = c('Year', 'Estimate', 'SE')
t = table_format(x = tab,
                 caption = "Design-based index of abundance for the NWFSC WCGBT survey.",
                 label = "wcgbt-db-index",
                 align = 'l',
                 col_names = col_names)
kableExtra::save_kable(t,
					   file = file.path(save_loc, paste0('wcgbt-db-index.tex')))


tab = read.csv(file.path(dir, 'triennial', 'forSS', 'triennial_early_design_based_indices.csv'))
tab = tab[,c('Year', 'Value', 'seLogB')]
tab[,3] = round(tab[,3], 3)
col_names = c('Year', 'Estimate', 'SE')
t = table_format(x = tab,
                 caption = "Design-based index of abundance for the early Triennial survey.",
                 label = "tri-early-db-index",
                 align = 'l',
                 col_names = col_names)
kableExtra::save_kable(t,
					   file = file.path(save_loc, paste0('tri-early-db-index.tex')))

tab = read.csv(file.path(dir, 'triennial', 'forSS', 'triennial_late_design_based_indices.csv'))
tab = tab[,c('Year', 'Value', 'seLogB')]
tab[,3] = round(tab[,3], 3)
col_names = c('Year', 'Estimate', 'SE')
t = table_format(x = tab,
                 caption = "Design-based index of abundance for the late Triennial survey.",
                 label = "tri-late-db-index",
                 align = 'l',
                 col_names = col_names)
kableExtra::save_kable(t,
					   file = file.path(save_loc, paste0('tri-late-db-index.tex')))

tab = read.csv(file.path(dir, 'afsc_slope', 'forSS', 'afsc_slope_design_based_indices.csv'))
tab = tab[,c('Year', 'Value', 'seLogB')]
tab[,3] = round(tab[,3], 3)
col_names = c('Year', 'Estimate', 'SE')
t = table_format(x = tab,
                 caption = "Design-based index of abundance for the AFSC Slope survey.",
                 label = "afsc-db-index",
                 align = 'l',
                 col_names = col_names)
kableExtra::save_kable(t,
					   file = file.path(save_loc, paste0('afsc-db-index.tex')))

tab = read.csv(file.path(dir, 'nwfsc_slope', 'forSS', 'nwfsc.slope_design_based_indices.csv'))
tab = tab[,c('Year', 'Value', 'seLogB')]
tab[,3] = round(tab[,3], 3)
col_names = c('Year', 'Estimate', 'SE')
t = table_format(x = tab,
                 caption = "Design-based index of abundance for the NWFSC Slope survey.",
                 label = "nwfsc-db-index",
                 align = 'l',
                 col_names = col_names)
kableExtra::save_kable(t,
					   file = file.path(save_loc, paste0('nwfsc-db-index.tex')))


