### Week 4 Swirl

library(swirl)
ls()
rm(list = ls())
ls()
swirl()
BJKill
1

## Section 12: Looking at Data
12
ls()                  # plants data is there
class(plants)         # its a data frame
dim(plants)           # it has 5166 rows (observations) and 10 columns (variables)
nrow(plants)
ncol(plants)
object.size(plants)   # using 745944 bytes
names(plants)         # character vector of column (variable) names
head(plants)          # shows us name and first 6 entries in each column
head(plants, 10)      # shows us name and first 10 entries in each column
tail(plants, 15)      # shows us name and last 15 entries in each column
summary(plants)       # shows us the name and summary stats for each quant variable and frequencies for each qual variable
table(plants$Active_Growth_Period) # shows us a frequency table of growth periods (e.g. Spring, Summer and Fall, Year Round)
str(plants)           # shows us a discription of each variable and a preview of its contents...start here next time!
2
1

## Section 13: Simulation
13
?sample
sample(1:6, 4, replace = TRUE)  # Simulated 4 dice rolls. Got '3 6 3 2'
sample(1:6, 4, replace = TRUE)  # Simulated 4 dice rolls. Got '6 5 1 1' <- different than first. no seed set.
sample(1:20, 10)                # drew 10 numbers w/o replacement from 1:20.
LETTERS                         # vector of 26 capital letters in English alphabet
sample(LETTERS)                 # drew 26 w/o replacement aka did a simple random permutation.
flips <- sample(c(0,1), 100, replace = TRUE, prob = c(0.3,0.7))
flips
sum(flips)                      # gave us 61 - meaning we flipped 61 heads. Not unlikely since pr(H) = 0.7
?rbinom
rbinom(1, 100, 0.7)             # gave us 68 - meaning we flipped 68 heads. Not unlikely since pr(H) = 0.7











