rm(list = ls())
source("R/01_config.R")
source("R/03_helperFunctions.R")
source("R/04_simulateData.R")
source("R/04_extractData.R")
source("R/05_transformData.R")
source("R/06_visualzation.R")

render(input = "R/99_flexDashboard.Rmd",
       flex_dashboard(theme = "bootstrap",
                      orientation = "rows",
                      vertical_layout = "scroll",
                      # logo = "logo",
                      source_code = "embed",
                      social = "twitter",
                      highlight = "kate"),
       output_dir = "html",
       output_file = paste(Sys.Date(), "_TrafficReport", ".html",
                           sep = ""))

browseURL(paste(Sys.Date(), "_TrafficReport", ".html", sep = ""))