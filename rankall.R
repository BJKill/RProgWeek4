### Ranking Hospitals In All States

rankall <- function(outcome, num = "best") {
        ## Read outcome data
        data1 <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
        

        ## assigns column of interest based on outcome. invalid outcomes stop w/ error. column becomes numeric
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
        
        data1[, good_col] <- as.numeric(data1[, good_col])
        
        
        ## Splits the data frame into a list of data frames by state. creates empty data frame to fill.
        split_data <- split(data1, data1$State)
        good_data <- data.frame("hospital" = character(), "state" = character())
        for(i in seq_along(split_data)) {
                ## organizes each state by outcome value then by hospital name
                split_data[[i]] <- split_data[[i]][order(split_data[[i]][, good_col], split_data[[i]]$Hospital.Name), ]
                ## isolate just the hospitals that have outcome values & verifies rank num is valid
                vect <- split_data[[i]][, good_col]
                bad <- is.na(vect)
                split_data[[i]] <- split_data[[i]][!bad, ]
                val_num <- length(split_data[[i]][, good_col])
                if(num == "best") {hos <- split_data[[i]][1, 2]}
                else if(num == "worst") {hos <- split_data[[i]][val_num, 2]}
                else if((num > 0) && (num <= val_num)) {hos <- split_data[[i]][num, 2]}
                else {hos <- NA}
                
                ## finds the hospital with given rank in 'i'th state, binds it to state name, and binds that to good_data
                new_row <- cbind(hos, names(split_data[i]))
                good_data <- rbind(good_data, new_row)
        }
        
        ## Return a data frame with the hospital names and the (abbreviated) state name
        colnames(good_data) <- c("hospital", "state")
        return(good_data)
}





















