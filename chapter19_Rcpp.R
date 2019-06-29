### 19.1.7
library(Rcpp)
library(microbenchmark)
sourceCpp("chapter19_Rcpp_19_1_7.cpp")

## 1.
x <- c(T, F, T)
all(x)
allC(x)

## 2.
x <- 1:1e3
all.equal(cumsum(x),
          cumprodC(x))
microbenchmark(
  cumsum(x),
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




sourceCpp("tmp.cpp")
attribs()
























