### 10.2.1 exercises
## 1.
# 
mean_yp <- match.fun(mean)
mean_yp(c(1:10))

## 2.
lapply(mtcars, function(x) sd(x)/mean(x))

## 3.
integrate(function(x) x^2 - x, 0, 10)
integrate(function(x) sin(x) + cos(x), -pi, pi)
integrate(function(x) exp(x)/x, 10, 20)

### 10.3.3
## 1.
# Because this function also remember the environment when it is 
# created.

## 2.
# the resulted function form depends on the used value of 
# lambda. 
box_cox <- function(lambda){
  if(lambda == 0){
    function(x) log(x)
  }else{
    function(x) (x^lambda - 1)/lambda
  }
}

## 4.
x <- rnorm(1000)
ecdf_fun <- ecdf(x)
typeof(ecdf_fun)
class(ecdf_fun)
ecdf_fun(0.5)
ecdf_fun(0)

## 5.
moment <- function(ith){
  function(x){
    mu_x <- mean(x)
    mean((x - mu_x)^ith)
  }
}

m1 <- moment(1)
m2 <- moment(2)
x <- runif(100)
all.equal(m1(x), 0)
all.equal(m2(x), var(x) * 99/100)

## 6.
pick <- function(i){
  function(x){
    x[i]
  }
}

lapply(mtcars, pick(5))
lapply(mtcars, function(x) x[[5]])
all.equal(lapply(mtcars, pick(5)),
          lapply(mtcars, function(x) x[[5]]))

### 10.4.2 ecercises
x <- runif(1000)
funs <- list(
  min = function(x) min(x),
  qu_25 = function(x) sort(x)[0.25*length(x)],
  qu_50 = function(x) sort(x)[0.5*length(x)],
  qu_75 = function(x) sort(x)[0.75*length(x)],
  max = function(x) max(x)
  )

summary_yp_t <- function(fun_list){
  function(x){
    lapply(fun_list, function(f) f(x))
  }
}

summary_yp <- summary_yp_t(funs)
summary_yp(x)
