### 3.1.7 exercises
## 1.
mtcars[mtcars$cyl == 4, ]
mtcars[-c(1:4), ]
mtcars[mtcars$cyl <= 5, ]
mtcars[mtcars$cyl == 4 | mtcars$cyl == 6, ]

## 2.
# NA has a logical data type. When NA is used in indexing, and 
# the index sequence is not long enough, it will automatically
# recycled itself to have the same length of the vector x. Therefore,
# we will have five NA. While NA_real_ has double data type, it
# will only be coerced to an integer, and subset out the corresponding
# element NA.
x <- 1:5
x
x[NA]
x[NA_real_]

## 3.
# upper.tri() returns a logical matrix of the same size as its argument.
# Only the elments corresponding to the upper triangle are TRUE. 
# When use upper.tri() to subset a matrix, the result automatically loss one dim
# to a atomic vector. 
# There is no need additional subsetting rules.
x <- outer(1:5, 1:5, FUN="*")
x
?upper.tri
y <- x[upper.tri(x)]
length(y)

## 4.
# Because mtcars is a data frame object rather than a matrix.
# A matrix itself is a vector, thus we can select it like a atomic
# vector. While a data frame is a list of vectors of the same length,
# thus it can not be selected in same way as a atomic vector.
# mtcars[1:20, ] indicates subsetting the 1:20 rows and all 
# the columns.

## 5. 
diag_fun <- function(x){
  stopifnot(length(unique(dim(x)))==1)
  n_rows = dim(x)[1]
  
  x_diag = vector(length = n_rows)
  for(i in 1:n_rows){
    x_diag[i] <- x[i,i];
  }
  
  x_diag
}

x <- matrix(1:9, nrow=3)
x
diag_fun(x)

## 6.
# Assign all the NA elements in a df to be 0.
# is.na(df) returns a logical matrix of the same size of 
# df to test if the corresponding elements in df are NA.
# Then all the NA elements are assigned to be 0.


### 3.2.4 exercises
## 1.
mod <- lm(mpg ~ wt, data = mtcars)
str(mod)
mod$df.residual
summary(mod)

### 3.4.9 exercises
## 1.
x <- matrix(1:12, nrow = 3)
# permute the columns
x[,sample(dim(x)[2])]
# permute the rows and the columns
x[sample(dim(x)[1]), sample(dim(x)[2])]

## 2.
# select a random sample of m rows
x <- matrix(rnorm(100*10),nrow = 100, ncol = 10)
x
m <- 11
n_rows <- dim(x)[1]
x[sample(1:n_rows,m),]

# select m contiguous rows
m_num <- n_rows %/% m
index_m <- sample(1:m_num, 1)
x[((index_m-1)*m + 1):(index_m*m),]

