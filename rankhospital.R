### Ranking Hospitals By Outcome In A State

rankhospital <- function(state, outcome, num = "best") {
        ## Reads outcome data
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
        
        ## Return Hospital name in the state with the given rank 30-day death rate. Ties broken by hospital name
        data1[,good_col] <- as.numeric(data1[,good_col])
        data_good <- data1[which(data1$State == state), ]
        data_good <- data_good[order(data_good[, good_col], data_good$Hospital.Name), ]
        
        ##check validity of rank
        vect <- data_good[, good_col]
        bad <- is.na(vect)
        data_good <- data_good[!bad, ]
        val_num <- length(data_good[, good_col])
        if(num == "best") {
                return(data_good$Hospital.Name[1])
        }
        else if(num == "worst") {
                return(data_good$Hospital.Name[val_num])
        }
        
        else if(num > val_num || num < 1) {
                return(NA)
        }
        else {
                return(data_good$Hospital.Name[num])
        }
}



















