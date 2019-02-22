rm(list = ls())
source("R/01_config.R")
source("R/03_helperFunctions.R")
source("R/04_simulateData.R")
source("R/04_extractData.R")
source("R/05_transformData.R")
source("R/06_visualzation.R")

wd <- getwd()

render(input = "R/99_flexDashboard.Rmd",
       flex_dashboard(theme = "bootstrap",
                      orientation = "rows",
                      vertical_layout = "scroll",
                      # logo = "logo",
                      highlight = "kate"),
       output_dir = wd,
       output_file = paste(Sys.Date(), "_TrafficReport", ".html",
                           sep = ""))

browseURL(paste(Sys.Date(), "_TrafficReport", ".html", sep = ""))