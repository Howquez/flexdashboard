# Using RGA or similar packages, one could, for instance, retrieve google
# analytics (GA) data using the API. This would require an authentification/ a
# Token stored in the config folder. In addition one would load the devtools
# package to install RGA. See some example code below

# # Extract GA data -----
# 
# # load or install package
# if(!("rga" %in% installed.packages()[, "Package"])){
#         install_github("rga", "skardhamar")
# }
# library(rga)
# 
# # authentification
# rga.open(instance = "ga", where = "token/ga.rga")
# 
# # define Filter to differentiate between different platforms
# FILTER_LIGHTS    <- "ga:dimension8=~Lights"
# FILTER_FURNITURE <- "ga:dimension8=~Furniture"
# FILTER_MISC      <- "ga:dimension8=~Misc"
# 
# filter <- c(FILTER_LIGHTS, FILTER_FURNITURE, FILTER_MISC)
# 
# # get Data by looping through filter
# for(i in filter){
#         platform <- str_extract(string  = i,
#                                 pattern = "(?<=~).*")
#         ga <- ga$getData(12345678,
#                                   batch      = TRUE,
#                                   walk       = TRUE,
#                                   start.date = START_DATE,
#                                   end.date   = Sys.Date(),
#                                   metrics    = "ga:pageviews,ga:visits,ga:users",
#                                   dimensions = "ga:month",
#                                   filter     = i)
#         # create platform identifier
#         ga$platform <- platform
#         assign(x = paste("df_", platform), value = ga)
# }
# 
# # r-bind data -----
