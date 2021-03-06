n_platforms <- length(PLATFORMS)

duration <- length(seq(from = START_DATE, 
                       to = Sys.Date(), 
                       by = "month")) - 1

date <- seq(START_DATE, by = "month", length.out = duration)


df <- data.frame(date = rep(date, times = n_platforms),
                 platform = rep(PLATFORMS, each = duration),
                 page_views = rand_ints(4500, 6000), # n_platforms of batches of n = duration ints are generated.
                 visits = rand_ints(1500, 2500),     #   one for each platform. See 03_helpferfuntions.R 
                 visitors = rand_ints(400, 800),     #   The first platform accounts for the most traffic with ints
                 seo_entries = rand_ints(300, 600),  #   between the values in parentheses. Subsequent batches 
                 time_spent = rand_ints(300, 500)    #   consist of ints ranging within fraction of these intervals
                 # visits_desktop = a,
                 # visits_mobile = b,
                 # visits_tablets = c,
                 # time_dektop = a,
                 # time_mobile = b,
                 # time_table = c
                 )