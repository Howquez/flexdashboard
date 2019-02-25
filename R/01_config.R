# Setup -----
# ** Packages -----
listOfPackages <- c("rmarkdown",
                    "knitr",
                    "flexdashboard",
                    "stringr",
                    "lubridate",
                    "ggplot2",
                    "magrittr",
                    "plotly",
                    "DT",
                    "data.table",
                    "reshape",
                    "devtools")

newPackages <- listOfPackages[!(listOfPackages %in% installed.packages()[, "Package"])]

if(length(newPackages) > 0){
        install.packages(newPackages)
}

for(package in listOfPackages){
        require(package, character.only = TRUE)
}

# ** CI -----
source("R/02_corporateDesign.R")

# ** Global or Useful Variables -----
set.seed(1234576)
START_DATE <- as.Date("2017-01-01")
PLATFORMS <- c("Lights", "Furniture", "Misc")
# I assume that we'll always have the data of the last full month available
last_month_1 <- floor_date(Sys.Date() - months(1), "month")
last_month_2 <- floor_date(Sys.Date() - months(2), "month")
# determines when value box is colored (and icon-ed)
V_BOX_THRESHOLD <- 0.025

# ** Tokens -----