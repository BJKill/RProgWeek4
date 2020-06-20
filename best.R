### Programming Assignment 3

best <- function(state = "character", outcome = "character") {
        ## Read outcome data
        data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
        data_split <- split(data, data$State)
        if(is.element(state, state.abb) == FALSE) {
                stop("invalid state")
        }
        data_state <- data_split[[state]]
        #str(data_state)
        if(outcome == "heart attack") {
                data_good <- as.numeric(data_split[[state]][[11]])
                min_rate <- min(data_good)
        }
        else if(outcome == "heart failure") {
                data_good <- as.numeric(data_split[[state]][[17]])
                min_rate <- min(data_good)
        }
        else if(outcome == "pneumonia") {
                data_good <- as.numeric(data_split[[state]][[23]])
                min_rate <- min(data_good)
        }
        else {
                stop("invalid outcome")
        }
        ## Check that state and outcome are valid
        #str(data_good)
        ## Return Hospital name in the state with the lowest 30-day death rate
        min_rate <- min(data_good)
        #hos_name <- data_state[which(data_state]
        
}
