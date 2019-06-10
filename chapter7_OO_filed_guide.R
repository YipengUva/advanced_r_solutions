library(pryr)

f <- function(){}
typeof(f)

typeof(sum)

is.object(f)

df <- data.frame(x=1:10, y = letters[1:10])
df
otype(df)
otype(df$x)
otype(df$y)

mean
ftype(mean)

mean.

exp_list <- list(x = 1:10, y = letters[1:10])
exp_list

foo <- structure(list(), class = "foo")
foo

foo <- list()
class(foo) <- "foo"
foo

foo <- function(x){
  if(!is.numeric(x)) stop("X must be numeric")
  structure(list(x), class = "foo")
}

list(1:10)

methods("mean")
methods("t.test")

exp_list
foo <- structure(exp_list, class = "foo")
foo
is.object(foo)

library(pryr)
ftype(foo)
ftype(foo)
pryr::ftype(foo)
otype(foo)

class(foo)
inherits(foo, "foo")

foo <- function(x){
  structure(list(x), class = "foo")
}

exp_let <- letters[1:5]
exp_fac <- factor(exp_let)
exp_fac
otype(exp_fac)

f.a <- function(x) "Class a"
f.a

a <- structure(list(), class = "a")
class(a)

f.a(a)

mean.a <- function(x) "a"
mean(a)


library(stats4)
y <- c(26, 17, 13, 12, 20, 5, 9, 8, 5, 4, 8)
nLL <- function(lambda) -sum(dpois(y,lambda, log=TRUE))
fit <- mle(nLL, start = list(lambda=5), nobs=length(y))

isS4(fit)
fit

setClass("Person",
         slots = list(name = "character",age = "numeric"))
setClass("Employee",
         slots = list(boss = "Person"),
         contains = "Person")
alice <- new("Person", name = "Alice", age = 40)
john <- new("Employee", name = "Johan", age = 20, boss = alice)
alice@name

setGeneric("union")
setMethod("union",
          c(x = "data.frame", y = "data.frame"),
          function(x,y){
            unique(rbind(x,y))
          })

Account <- setRefClass("Account",
                       fields = list(balance = "numeric"))
a <- Account$new(balance = 100)
a$balance

c <- a$copy()
c$balance











