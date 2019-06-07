### 6.12 exercises
## 1.
# Function is.function() can be used to tell if an object is a function object.
# is.primitive can be used to tell if a function is a primitive function.

## 2.
objs <- mget(ls("package:base"), inherits = TRUE)
objs
funs <- Filter(is.function, objs)
funs

## 3.
# body, formale and environment

## 4.
# Because the function is defined in the global environment.


### 6.2.5 exercises
## 1.
# c inside "c <- 10" indicates an R object is assigned to a value 10.
# left c inside (c=c) indicates the name of a element in a atomic vector,
# right c indicates an argument. c() indicates creating a atomic vector.


## 2.
# give priority to the local objected rather than the global one; 
# function object are searched in the same manner as variables;
# every time calls a function, create a new environment;
# the results depend on the states of the local and parient environments.


### 6.4.6 exercises
## 1.
x <- sample(x = c(1:10, NA), size = 20, replace = TRUE)
y <- runif(n = 20, min = 0, max = 1)
cor(x, y, method = "kendall", use = "pairwise.complete.obs")

## 2.
# return 3. lazy evaluation.

## 3.
# return 100. lazy evaluation.
