### Programming Assignment 3

outcome <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
head(outcome)
str(outcome)
names(outcome)

## raw histogram. can make it better with formatting
outcome[,11] <- as.numeric(outcome[,11])
hist(outcome[,11])


best("TX", "heart attack")
best("TX", "heart failure")
best("MD", "heart attack")
best("MD", "pneumonia")
best("BB", "heart attack")
best("NY", "hert attack")


rankhospital("TX", "heart failure", 4)
rankhospital("MD", "heart attack", "worst")
rankhospital("MN", "heart attack", 5000)


head(rankall("heart attack", 20), 10)
tail(rankall("pneumonia", "worst"), 3)
tail(rankall("heart failure"), 10)


## QUIZ FOR PROGRAMMING ASSIGNMENT 3
best("SC", "heart attack")                        # A1. "MUSC MEDICAL CENTER"
best("NY", "pneumonia")                           # A2. "MAIMONIDES MEDICAL CENTER"
best("AK", "pneumonia")                           # A3. "YUKON KUSKOKWIM DELTA REG HOSPITAL"
rankhospital("NC", "heart attack", "worst")       # A4. "WAYNE MEMORIAL HOSPITAL"
rankhospital("WA", "heart attack", 7)             # A5. "YAKIMA VALLEY MEMORIAL HOSPITAL"
rankhospital("TX", "pneumonia", 10)               # A6. "SETON SMITHVILLE REGIONAL HOSPITAL"
rankhospital("NY", "heart attack", 7)             # A7. "BELLEVUE HOSPITAL CENTER"

r <- rankall("heart attack", 4)
as.character(subset(r, state == "HI")$hospital)   # A8. "CASTLE MEDICAL CENTER"

r <- rankall("pneumonia", "worst")
as.character(subset(r, state == "NJ")$hospital)   # A9. "BERGEN REGIONAL MEDICAL CENTER"

r <- rankall("heart failure", 10)
as.character(subset(r, state == "NV")$hospital)   # A10. "RENOWN SOUTH MEADOWS MEDICAL CENTER"




