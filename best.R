### Programming Assignment 3

best <- function(state = "character", outcome = "character") {
        ## Reads data
        data1 <- read.csv("outcome-of-care-measures.csv", colClasses = "character")

        ## check to see if state is valid abbreviation. invalid states stop w/error
        if(is.element(state, state.abb) == FALSE) {
                stop("invalid state")
        }
        
        ## assigns column of interest based on outcome. invalid outcomes stop w/ error
        if(outcome == "heart attack") {
                good_col <- 11
        }
        else if(outcome == "heart failure") {
                good_col <- 17
        }
        else if(outcome == "pneumonia") {
                good_col <- 23
        }
        else {
                stop("invalid outcome")
        }

        ## Return Hospital name in the state with the lowest 30-day death rate
        data1[,good_col] <- as.numeric(data1[,good_col])
        data_good <- data1[which(data1$State == state), ]
        min_rate <- min(data_good[, good_col], na.rm = TRUE)
        hos_name <- data_good[which(data_good[, good_col] == min_rate), "Hospital.Name"]
        hos_name <- sort(hos_name)
        print(hos_name[1])
}
