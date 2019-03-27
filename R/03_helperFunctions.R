# simulate a metric for n platforms
rand_ints <- function(lower, upper, 
                      times = n_platforms, 
                      size = duration){
        x <- NULL
        for(i in 1:times){
                x <- c(x, sample((lower%/%i):(upper%/%i),
                       size = size,
                       replace = TRUE))
        }
        x
}

# re-format numbers for Value Boxes -----
formatK <- function(x){
        digits <- nchar(as.character(format(round(x), scientific = FALSE)))
        if(digits > 3 & digits < 7){
                paste(formatC(x = x/1000,
                              digits = 1,
                              format = "f",
                              big.mark = ".",
                              decimal.mark = ","),
                      "k", 
                      sep = " ")
                
        }else if(digits >= 7){
                paste(formatC(x = x/1000000,
                              digits = 1,
                              format = "f",
                              big.mark = ".",
                              decimal.mark = ","),
                      "mio", 
                      sep = " ")
                
        }else{
                x
        }
}

# re-format time varibles to "mm:ss min" -----
formatT <- function(seconds){
        ifelse(test = (seconds/60 - seconds%/%60) == 0,
               yes  = paste(seconds%/%60, ":00 min", sep = ""),
               no   = ifelse(test = round((seconds/60 - 
                                                   seconds%/%60)*60) < 10,
                             yes = paste(seconds%/%60, ":0", 
                                         round((seconds/60 - seconds%/%60)*60), 
                                         " min", sep = ""),
                             no = paste(seconds%/%60, ":", 
                                        round((seconds/60 - seconds%/%60)*60), 
                                        " min", sep = "")
               )
        )
}

# re-format percentages -----
formatP <- function(number){
        paste(formatC(number,
                      format = "f",
                      digits = 1,
                      big.mark = ".",
                      decimal.mark = ","),
              "%",
              sep = " ")
}

# re-format absolute numbers -----
formatA <- function(number){
        formatC(number,
                format = "f",
                digits = 0,
                big.mark = ".",
                decimal.mark = ",")
}

# re-format small absolute numbers -----
formatS <- function(number){
        formatC(number, 
                format = "f",
                digits = 1,
                big.mark = ".",
                decimal.mark = ",")
}

# write deviation from last month in valuebox title -----
formatHeader <- function(title, df, variable){
        present <- df[df$date == last_month_1, variable]
        past    <- df[df$date == last_month_2, variable]
        value   <- round((present / past - 1) * 100, 
                         digits = 1)
        ifelse(test = present >= past,
               yes  = paste("<b> <em>", title, "<br> </b> +", value, "%",
                            " to month before </em>", sep = ""),
               no   = paste("<b> <em>", title, "<br> </b> ", value, "%",
                            " to month before </em>", sep = ""))
}

formatHeaderT <- function(title, df, variable){
        present <- df[df$date == last_month_1, variable]
        past    <- df[df$date == last_month_2, variable]
        value <- formatT(abs(present - past))
        ifelse(test = present >= past,
               yes  = paste("<b> <em>", title, "<br> </b> +", value,
                            " to month before </em>", sep = ""),
               no   = paste("<b> <em>", title, "<br> </b> -", value,
                            " to month before </em>", sep = ""))
}


# customize the value box function
valueBoxes <- function(df,
                       platform, 
                       metric, 
                       type = "quantity"){ # or "small" or "time"
        
        # define the latest and the previous value of the metric
        present <- df[df$platform == platform & df$date == last_month_1, 
                      metric]
        past    <- df[df$platform == platform & df$date == last_month_2, 
                      metric]
        
        # time metrics are displayed differently than quantities
        value <- if(type == "quantity"){
                present %>% formatK()
        }else if(type == "small"){
                present %>% formatS()
        }else{
                present %>% formatT()
        }
        
        # illustrate upwards trend (present >>> past) as an upwards arrow 
        valueBoxIcon <- if(present/past - 1 > V_BOX_THRESHOLD){
                "glyphicon-menu-up"
        }else if(abs((present/past - 1)) <= V_BOX_THRESHOLD){
                " "
        }else{
                "glyphicon-menu-down"
        }
        # likewise define the color as green if there is an upwards trend
        valueBoxColor <- if(present/past - 1 > V_BOX_THRESHOLD){
                success
        }else if(abs((present/past - 1)) <= V_BOX_THRESHOLD){
                primary
        }else{
                danger
        }
        
        # finally put these pieces into the original valueBox function
        valueBox(value = value,
                 icon  = valueBoxIcon,
                 color = valueBoxColor
        )
}
