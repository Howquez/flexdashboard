# simulate a metric for n platforms
rand_ints <- function(lower, upper, 
                      times = n_platforms, 
                      size = duration){
        x <- NULL
        for(i in 1:times){
                x <- c(x, sample(as.integer(lower/i):as.integer(upper/i),
                       size = size,
                       replace = TRUE))
        }
        x
}

