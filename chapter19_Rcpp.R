### 19.1.7
library(Rcpp)
library(microbenchmark)
sourceCpp("chapter19_Rcpp_19_1_7.cpp")

## 1.
x <- c(T, F, T)
all(x)
allC(x)
all.equal(
  all(x),
  allC(x)
)

## 2.
x <- 1:1e2
all.equal(cumprod(x),
          cumprodC(x))
microbenchmark(
  cumprod(x),
  cumprodC(x)
)

x <- sample(1:10, 100, replace = TRUE)
all.equal(cummin(x),
          cumminC(x))

microbenchmark(
  cummin(x),
  cumminC(x)
)

x <- sample(1:10, 100, replace = TRUE)
all.equal(
  cummax(x),
  cummaxC(x)
)

microbenchmark(
  cummax(x),
  cummaxC(x)
)

## 3.
x <- sample(1:100, 1000, replace = TRUE)
all.equal(
  diff(x, lag = 3),
  diffC(x, lag = 3)
)

## 4.
x <- sample(1:100, 1000, replace = TRUE)
all.equal(range(x), rangeC(x))

## 5.
x <- 1:100
all.equal(
  var(x),
  varC(x)
)


### 19.3.5 exerises
library(Rcpp)
sourceCpp("chapter19_Rcpp_19_3_5.cpp")

## all function
x <- c(TRUE, TRUE, NA, TRUE)
allC(x, na_rm = TRUE)
allC(x, na_rm = FALSE)

## cumprod
x <- sample(c(1:8,NA,NA), 100, replace = TRUE)
cumprodC(x, na_rm = TRUE)
cumprodC(x, na_rm = FALSE)

all.equal(
  cumprodC(x, na_rm = TRUE),
  cumprod(x[!is.na(x)]))

## cumminC
x <- sample(c(1:8,NA,NA), 100, replace = TRUE)
cumminC(x, na_rm = TRUE)
cumminC(x)

all.equal(
  cumminC(x, na_rm = TRUE),
  cumminC(x[!is.na(x)])
)

## cummaxC
x <- sample(c(1:8,NA,NA), 100, replace = TRUE)
cummaxC(x, na_rm = TRUE)
cummaxC(x)

all.equal(
  cummaxC(x, na_rm = TRUE),
  cummax(x[!is.na(x)])
)

## diffC
x <- sample(c(1:8,NA,NA), 100, replace = TRUE)
diffC(x, lag = 2, na_rm = TRUE)
diffC(x, lag = 2)

all.equal(
  diffC(x, lag = 2, na_rm = TRUE),
  diff(x[!is.na(x)], lag = 2)
)

## rangeC
x <- sample(c(1:8,NA,NA), 100, replace = TRUE)
rangeC(x, na_rm = TRUE)
rangeC(x)

all.equal(
  rangeC(x, na_rm = TRUE),
  range(x[!is.na(x)])
)

## varC
x <- sample(c(1:8,NA,NA), 100, replace = TRUE)
varC(x, na_rm = TRUE)
varC(x)

all.equal(
  varC(x, na_rm = TRUE),
  var(x[!is.na(x)])
)




library(Rcpp)

pdistR <- function(x, ys) {
  sqrt((x - ys) ^ 2)
}


sourceCpp("tmp.cpp")

x <- 0.5
ys <- runif(1e6)
all.equal(
  pdistR(x, ys),
  pdistCpp(x, ys),
  pdistC2(x, ys))

microbenchmark(
  pdistR(x, ys),
  pdistCpp(x, ys),
  pdistC2(x, ys))

any_naR <- function(x) any(is.na(x))

x0 <- runif(1e5)
x1 <- c(x0, NA)
x2 <- c(NA, x0)
microbenchmark(
  any_naR(x0), any_naC(x0),
  any_naR(x1), any_naC(x1),
  any_naR(x2), any_naC(x2)
)

x <- runif(1e6)
all.equal(
  sum(x),
  sum3(x),
  sum4(x)
)

microbenchmark(
  sum(x),
  sum3(x),
  sum4(x)
)


### 19.5.7
library(Rcpp)
sourceCpp("chapter19_Rcpp_19_5_7.cpp")

## 1. medianC
x <- sample(1:10, 10, replace = TRUE)
medianC(x)
median.default(x)

x <- sample(1:10, 1e6, replace = TRUE)
all.equal(
  median.default(x),
  medianC(x)
)

## 2. inC
v <- 5
x <- 1:10
inC(v, x)

v <- 11
inC(v, x)




