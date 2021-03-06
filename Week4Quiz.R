### Week 4 Quiz

# Q1: What is produced at the end of this snipped of R code?
set.seed(1)
rpois(5,2)
# A1: A vector with the numbers 1, 1, 2, 4, 1

# Q2: What R function can be used to generate standard Normal random variables?
# A2: rnorm

# Q3: When simulating data, why is using the set.seed() function important? Select all that apply.
# A3: It ensures that the sequence of random numbers starts in a specific place and is therefore reproducible.

# Q4: Which function can be used to evaluate the inverse cumulative distribution function for the Poisson distribution?
# A4: qpois

# Q5: What does the following code do?
set.seed(10)
x <- rep(0:1, each = 5)
e <- rnorm(10, 0, 20)
y <- 0.5 + 2 * x + e
# A5: Generate data from a Normal linear model

# Q6: What does the following code do?
# A6: rbinom

# Q7: What aspect of the R runtime does the profiler keep track of when an R expression is evaluated?
# A7: the function call stack

# Q8: Consider the following R code. (Assume that y, x1, and x2 are present in the workspace.) Without running the code, 
#       what percentage of the run time is spent in the 'lm' function, based on the 'by.total' method of normalization shown 
#       in 'summaryRprof()'?
library(datasets)
Rprof()
fit <- lm(y ~ x1 + x2)
Rprof(NULL)
# A8: 100%

# Q9: When using 'system.time()', what is the user time?
# A9: It is the time spent by the CPU evaluating an expression

# Q10: If a computer has more than one available processor and R is able to take advantage of that, then which of the 
#       following is true when using 'system.time()'?
# A10: elapsed time may be smaller than user time





