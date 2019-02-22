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
                    "reshape")

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
set.seed <- 1234576
# ** Tokens -----