library(sa4ss)

setwd("C:/Assessments/2021/dover_sole_2021/write_up")

load("00mod.Rdata")
save_loc = file.path(getwd(), "tex_tables")


##########################################################################################
# Discard Data tables
##########################################################################################

ca_disc = model$discard[model$discard$Fleet_Name == "CA", c("Fleet_Name", "Yr", "Obs", "Std_in")]
ca_source = c("Humboldt State University", rep("WCGOP", dim(ca_disc)[1]-1))
ca_disc[, "Fleet_Name"] = "CA"


orwa_disc = model$discard[model$discard$Fleet_Name == "OR_WA", c("Fleet_Name", "Yr", "Obs", "Std_in")]
orwa_disc[, "Fleet_Name"] = "OR/WA"
orwa_source = c(rep("Hermann and Harry 1963", 3), "Methot et al. 1990", 
              rep("Pikitch Study", 3), rep("WCGOP",18))

out = cbind(rbind(ca_disc, orwa_disc), c(ca_source, orwa_source))
out[,3:4] = round(out[,3:4], 3)
rownames(out) = NULL
t = table_format(x = out,
                caption = "Discard rates by source used in the base model",
                label = "disc-rates",
                col_names = c("Fleet", "Year", "Observation", "Std. Dev.", "Source"),
                align = 'l')

kableExtra::save_kable(t,
             file = file.path(save_loc, paste0('discard_rate_table.tex')))



##########################################################################################
# Let's create index tables
##########################################################################################
names =  unique(model$cpue[,"Fleet_name"])
survey.list = list()
for(i in 1:length(names)){
  grab = model$cpue[model$cpue$Fleet_name == names[i], c("Obs", "SE_input") ]
  survey.list[[i]] = grab
  rownames(survey.list[[i]]) = model$cpue[model$cpue$Fleet_name == names[i], "Yr" ]
  colnames(survey.list[[i]]) = c("Obs", "SE_input")
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
rownames(index_summary) = NULL
colnames(index_summary) = c("Year", mat.names)

t = table_format(x = index_summary,
			 repeat_header = TRUE,
			 header_grouping = c("", "AFSC Slope" = 2, "Triennial" = 2, "NWFSC Slope" = 2, "NWFSC WCGBT" = 2),
       caption = "Summary of the fishery-independent biomass/abundance time series observartions (Obs.) and input standard error (SE) used in the stock assessment.",
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

#################################################################################################
# Decision Table
#################################################################################################
round_df <- function(df, digits) {
      nums <- vapply(df, is.numeric, FUN.VALUE = logical(1))
    df[,nums] <- round(df[,nums], digits = digits)
    (df)
  }

dec_dir = "C:/Assessments/2021/dover_sole_2021/models/_decision_tables"

dt = read.csv(file.path(dec_dir, "decision_table_v2.csv"), check.names = FALSE)
col_names = c(" ", "Year", "Catch", rep(c("Spawning Biomass", "Fraction Unfished"),3))

t = table_format(x = round_df(df = data.frame(dt), digits = 3),
       repeat_header = TRUE,
       header_grouping = c(" " = 3, "M = 0.084" = 2, "M = 0.108" = 2, "M = 0.126" = 2),
       caption = "Decision table summary of 10 year projections beginning in 2023 for alternative states of nature based on an axis of uncertainty around female natural mortality for the base model. Columns range over low, mid, and high states of nature and rows range over different catch level assumptions. Values in italics indicate years where the stock size prevented the full catch removals.",
       label = "dec-tab",
       col_names = col_names,
       align = 'l')

kableExtra::save_kable(t,
             file = file.path(save_loc, paste0('decision_table.tex')))
