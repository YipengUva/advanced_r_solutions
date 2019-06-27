
### 12.1.4
## 1.
g <- function(f){
  force(f)
  function(...){
    cat(Sys.time()[[1]], " function is called \n", sep = " ")
    f(...)
  }
}

g(mean)(1:10)

## 2.



f <- function(g) {
  force(g)
  result <- NULL
  function(...) {
    if (is.null(result)) {
      result <<- g(...)
    }
    result
  }
}

## 3.
delay_by <- function(delay, f){
  force(f)
  
  time <- Sys.time()
  
  function(...){
    if(Sys.time() - time < delay){
      Sys.sleep(delay)
      
      time <<- Sys.time()
      f(...)
    }else{
      time <<- Sys.time()
      f(...)
    }
  }
}

## 4.
wait_until <- function(time, f){
  force(f)
  
  function(...){
    Sys.sleep(time - Sys.time())
    f(...)
  }
}

time <- Sys.time() + 5
system.time(wait_until(time, mean)(1:10))
system.time(mean(1:10))

## 5.
# First, there is no need to memoise the behavior of adding dot for every 10 times runing,
# since there is not repetition here.
# Second, if we only memoise the download_file, the delay behavoir is repeated.

## 7.
# it works correctly.
f <- function(a, b) function(x) a * x + b
# create a list of functions with different parameters.
fs <- Map(f, a = c(0, 1), b = c(0, 1))
fs[[1]](3)
lapply(fs, function(f) as.list(environment(f)))

### 12.2.3
## 1.
negative <- function(f){
  function(...){
    !(f(...))
  }
}
x <- sample(c(1:10, rep(NA, 10)), 10, replace = TRUE)
x
is.na(x)
negative(is.na)(x)

### 12.3.3
download_file <- function(url, ...){
  download.file(url, basename(url), ...)
}

delay_by <- function(delay, f){
  force(f)
  function(...){
    Sys.sleep(delay)
    f(...)
  }
}

dot_every <- function(iters, f){
  i <- 1
  function(...){
    if (i %% iters == 0) cat(".")
    i <<- i + 1
    f(...)
  }
}

download <- function(iters, delay, download_file){
  dot_every(iters, memoise(delay_by(delay, download_file)))
}

lapply(urls, pryr::partial(download, iters = 10, delay = 1))


## 3.
as.data.frame.function <- function(f){
  function(...){
    as.data.frame(f(...))
  }
}

as.matrix.function <- function(f){
  function(...){
    as.matrix(f(...))
  }
}

### 12.4.3
## 1.
`%o%` <- pryr::compose

square <- function(x) x^2
deviation <- function(x) x - mean(x)

f_list <- list(
  sqrt = sqrt,
  mean = mean,
  square = square,
  deviation = deviation
)
Reduce(`%o%`, f_list)(1:10)

sd2 <- sqrt %o% mean %o% square %o% deviation
sd2(1:10)

