START_DATE <- as.Date("2017-01-01")
PLATFORMS <- c("Lights", "Furniture", "Misc")
n_platforms <- length(PLATFORMS)

duration <- length(seq(from = START_DATE, 
                       to = Sys.Date(), 
                       by = "month")) - 1

date <- seq(START_DATE, by = "month", length.out = duration)


df <- data.frame(date = rep(date, times = n_platforms),
                 platform = rep(PLATFORMS, each = duration),
                 page_views = rand_ints(4500, 6000),
                 visits = rand_ints(1500, 2500),
                 visitors = rand_ints(400, 800),
                 seo_entries = rand_ints(300, 600),
                 time_spent = rand_ints(300, 500) # ,
                 # visits_desktop = a,
                 # visits_mobile = b,
                 # visits_tablets = c,
                 # time_dektop = a,
                 # time_mobile = b,
                 # time_table = c
                 )