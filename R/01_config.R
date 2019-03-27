# Setup -----
# ** Constants -----
set.seed(1234576)
PUBLISHING_DATE <- "2019-02-15"
START_DATE <- as.Date("2017-01-01")
PLATFORMS <- c("Lights", "Furniture", "Misc")
# I assume that we'll always have the data of the last full month available
last_month_1 <- floor_date(Sys.Date() - months(1), "month")
last_month_2 <- floor_date(Sys.Date() - months(2), "month")
# determines when value box is colored (and icon-ed)
V_BOX_THRESHOLD <- 0.025

# ** Packages -----
listOfPackages <- c("checkpoint",
                    "rmarkdown",
                    "knitr",
                    "flexdashboard",
                    "stringr",
                    "lubridate",
                    "ggplot2",
                    "magrittr",
                    "plotly",
                    "DT",
                    "data.table",
                    # "devtools",
                    "reshape")

newPackages <- listOfPackages[!(listOfPackages %in% installed.packages()[, "Package"])]

if(length(newPackages) > 0){
        install.packages(newPackages)
}

for(package in listOfPackages){
        require(package, character.only = TRUE)
}

# ** Specify the snapshot date
if(!dir.exists("~/.checkpoint")){
        dir.create("~/.checkpoint")
}

checkpoint(PUBLISHING_DATE)

# ** CI -----
source("R/02_corporateDesign.R")

# ** Tokens -----