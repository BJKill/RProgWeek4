### R Programming Week 4 Lecture Notes

## str function: compactly display the internal structure of an R object (alternative to summary)
## good for compactly displaying the abbreviated contents of possibly nested lists

str(str)
str(lm)
str(ls)

x <- rnorm(100, 2, 4)
summary(x)
str(x)

f <- gl(40, 10) #generates 40 factor levels of 10 elements each
str(f)
summary(f)

library(datasets)
head(airquality)
str(airquality)

m <- matrix(rnorm(100), 10, 10)
str(m)
m[,1]

s <- split(airquality, airquality$Month)
str(s)


## Simulation

# 1. rnorm: generates random normal variates with given mean/SD
# 2. dnorm: evaluate the normal prob density (with given mean/SD) at a point (or vector of points)
# 3. pnorm: evaluate the cumulative distribution function for a Normal Distribution
# 4. rpois: generate random Poisson variates with a given rate (lambda)


# All probability distribution functions have 4 functions associated with them. They are prefixed as follows:
# 1. d for density
# 2. r for random number generation
# 3. p for cumulative distribution (phi function)
# 4. q for quantile function       (phi inverse function)

x <- rnorm(10)
x

x <- rnorm(10, 20, 2)
x
summary(x)

# 'seed' is basically the counter of which set of not-so-random numbers R generates for you. resetting the seed back to 1
# resets the counter and generates the same 5 random normals as it did the first time we set the seed. This is useful
# becuase it allows us to reproduce our random data set exactly so others can check our work! 
# 
# ALWAYS SET SEED FIRST BEFORE GENERATING RANDOM DATA!!!!

set.seed(1)
rnorm(5)    # returns '-0.6264538  0.1836433 -0.8356286  1.5952808  0.3295078'
rnorm(5)    # returns '-0.8204684  0.4874291  0.7383247  0.5757814 -0.3053884'
set.seed(1) # reset the seed
rnorm(5)    # returns '-0.6264538  0.1836433 -0.8356286  1.5952808  0.3295078' <- same as the first one!

rpois(10, 1)  # returns '0  0  1  1  2  1  1  4  1  2'
rpois(10, 2)  # returns '4  1  2  0  1  1  0  1  4  1'
rpois(10, 20) # returns '19 19 24 23 22 24 23 20 11 22'

# if lambda = 2
ppois(2, 2)  # Pr(x <= 2) = 0.6766764
ppois(4, 2)  # Pr(x <= 4) = 0.947347
ppois(6, 2)  # Pr(x <= 6) = 0.9954662

## Simulate from a simple linear model y = Beta0 + Beta1*x + epsilon
## assume epsilon is normal(0, 2^2)
## assume x is normal (0, 1^2)
## assume Beta0 = 0.5 and Beta1 = 2

set.seed(20)
x <- rnorm(100)
e <- rnorm(100, 0, 2)
y <- 0.5 + 2*x + e
summary(y)
plot(x,y)

## What if x is binary instead?
set.seed(10)
x <- rbinom(100, 1, 0.5)
e <- rnorm(100, 0, 2)
y <- 0.5 + 2*x + e
summary(y)
plot(x, y)

## Generalized linear model - Poisson
## Y ~ Poisson(mu)
## log(mu) = B0 + B1*x    ergo, mu = exp(log(mu))
## B0 = 0.5   B1 = 0.3

set.seed(1)
x <- rnorm(100)
log.mu <- 0.5 + 0.3*x
y <- rpois(100, exp(log.mu))
summary(y)
plot(x,y)

## Random Sampling
# sample function draws randomply from a specified set of (scalar) objects allowing you to sample from arbitrary distributions
# sample function defaults to without replacement unless 'replace = TRUE'. No sample size means pick all.

set.seed(1)
sample(1:10, 4)               # returns '9 4 7 1'
sample(1:10, 4)               # returns '2 7 3 6'   <- different than first bc we didn't reset seed
sample(letters, 5)            # returns '"r" "s" "a" "u" "w"'
sample(1:10)                  # returns one possible permutation if sample size unspecified (aka picks all in random order)
sample(1:10, replace = TRUE)  # returns a sample size 10 selected WITH replacement








