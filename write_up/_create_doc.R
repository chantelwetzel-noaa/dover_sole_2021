
detach("package:sa4ss", unload = TRUE)
remotes::install_github("nwfsc-assess/sa4ss")
library(sa4ss)


# Specify the directory for the document
setwd("C:/Assessments/2021/dover_sole_2021/write_up")

# Create the needed items to generate the "right" template that would be based on the inputs here:
sa4ss::draft(authors = c("Chantel R. Wetzel", "Aaron M. Berger"),
  			 species = "Dover sole",
  			 latin = "Microstomus pacificus",
  			 coast = "US West",
  			 type = c("sa"),
  			 create_dir = FALSE,
  			 edit = FALSE)

# Create a model Rdata object
read_model(mod_loc = "C:/Assessments/2021/squarespot_rockfish_2021/models/0.01_init_model_updated_catches")

if(file.exists("_00.Rmd")){
	file.remove("_00.Rmd")
}

# Render the pdf
bookdown::render_book("00a.Rmd", clean = FALSE)


# Use to only render a specific section which can be quicker
bookdown::preview_chapter("01executive.Rmd", preview = TRUE, clean = FALSE)