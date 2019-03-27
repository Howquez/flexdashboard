rm(list = ls())
source("R/01_config.R")           # load packages, set constants, access credentials
source("R/03_helperFunctions.R")  # define functions you'll need later on
source("R/04_simulateData.R")     # simulate data if there is no real data to be analyzed
source("R/04_extractData.R")      # extract some google analytics data using the API
source("R/05_transformData.R")    # manipulate data
source("R/06_visualization.R")    # visualize data

# write a report/dashboard
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

# open the generated report/dashboard
browseURL(paste("html/", Sys.Date(), "_TrafficReport", ".html", sep = ""))