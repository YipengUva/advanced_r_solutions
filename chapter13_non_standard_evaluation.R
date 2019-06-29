### 13.1.1 exercises
## 1.
# The function changes unevaluated expression into string form. When reach the 
# predefined length in bytes (width.cutoff), the string will begin a new line.

deparse2 <- function(x){
  y <- deparse(x)
  
  out <- character()
  for(i in seq_along(y)){
    out <- paste0(out, y[i])
  }
  out
}

g <- function(x){
  deparse2(substitute(x))
}

g(a + b + c + d + e + f + g + h + i + j + k + l + m +
    n + o + p + q + r + s + t + u + v + w + x + y + z)


### 13.2.1 exercises
## 2.
subset2 <- function(x, condition){
  condition_call <- substitute(condition)
  r <- eval(condition_call, x)
  x[r, , drop = FALSE]
}
sample_df2 <- data.frame(x = 1:10)
subset2(sample_df2, x > 8)

## 3.
subset2 <- function(x, condition){
  condition_call <- substitute(condition)
  r <- eval(condition_call, x)
  r[is.na(r)] <- FALSE
  x[r, , drop = FALSE]
}
sample_df2 <- data.frame(x = c(1:5, rep(NA,3), 6:9))
subset2(sample_df2, x > 8)

## 4.
# Noting weill happend
subset2 <- function(x, condition){
  condition_call <- quote(condition)
  r <- eval(condition_call, x)
  r[is.na(r)] <- FALSE
  x[r, , drop = FALSE]
}
sample_df2 <- data.frame(x = c(1:5, rep(NA,3), 6:9))
subset2(sample_df2, x > 8)


### 13.3.1 exercises
## 1.
library(plyr)
arrange(mtcars, cyl)

# substitute(order(...)) will keep the expression ... not evaluated
g <- function(...) substitute(order(...))
g(mtcars$cyl)
g(mtcars, cyl)

## 2.
# transform(obj) will try to transform obj to a data frame.
# substitute(list(...)) works on the inputed arguments, save them as an evaluated argument list.

## 3.
# mutate(df, x2 = x * x, x3 = x2 * x)) makes changes to the data frame df.
# Because the argument is evaluated sequencely, x2 is first evaluated with the environment df,
# and then x3. After than they are added to df data frame.

## 4.
# with(env, expr) will evalute the expr within the enrironment of env.

# eval(quote(expr), env)

