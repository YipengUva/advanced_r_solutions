### 11.1.2 exercises
## 1.
# in lapply(trims, mean, x = x), x is a parameter for mean function

## 2.
df <- data.frame(replicate(10, rnorm(6, 5, 4)))
names(df) <- letters[1:10]
df

scale01 <- function(x) {
  rng <- range(x, na.rm = TRUE)
  (x - rng[1]) / (rng[2] - rng[1])
}

df[] <- lapply(df, scale01)
df

df <- cbind(df, letters[1:6])
names(df) <- letters[1:11]

scale01_2 <- function(x){
  if(is.numeric(x)) 
    scale01(x)
  else
    x
}

df[] <- lapply(df, scale01_2)
df


## 3.
formulas <- list(
  mpg ~ disp,
  mpg ~ I(1 / disp),
  mpg ~ disp + wt,
  mpg ~ I(1 / disp) + wt
)

results_for <- vector("list", length(formulas))
for(i in seq_along(formulas)){
  results_for[[i]] <- lm(formulas[[i]], data = mtcars)
}

results_apply <- lapply(formulas, lm, data=mtcars)

## 4.
bootstraps <- lapply(1:10, function(i) {
  rows <- sample(1:nrow(mtcars), rep = TRUE)
  mtcars[rows, ]
})

results_for <- vector("list", 10)
for(i in seq_along(bootstraps)){
  results_for[[i]] <- lm(mpg ~ disp, data = bootstraps[[i]])
}

results_apply <- vector("list", 10)

lm_mtcars <- function(data){
  lm(mpg ~ disp, data = data)
}

results_apply <- lapply(bootstraps, lm_mtcars)

## 5.
rsq <- function(mod) summary(mod)$r.squared

unlist(lapply(results_for, rsq))
unlist(lapply(results_apply, rsq))


### 11.2.5 exercises
## 1.
# a)
all(unlist(lapply(mtcars, is.numeric)))
vapply(mtcars, sd, numeric(1))

# b)
mtcars_mixed <- cbind(mtcars, letter = letters[1:dim(mtcars)[1]])
num_indexes <- vapply(mtcars_mixed, is.numeric, logical(1))
vapply(mtcars_mixed[,num_indexes], sd, numeric(1))

## 2.
# When returned outputs have different types, sapply() will
# keep the list form silently. So you don't known you have an
# error.

## 3.
trials <- replicate(
  100,
  t.test(rpois(10, 10), rpois(7, 10)),
  simplify = FALSE
)

sapply(trials, function(x) x$p.value)
sapply(seq_along(trials), function(i) trials[[i]]$p.value)

## 4.
# replicate(n, expession) will replicate the expression 
# for n times, and return the outputs into a list.

# In lapply() and its fridents, the arguments are a list 
# plus a function. In replicate(), the arguments are a integer
# and an expression. Notice a function itself is not an expression.

## 5.
# Not sure what the question means.

## 11.3.4
## 1.
apply(matrix(1:20, nrow=5), 1, mean)
apply(matrix(1:10, nrow=10), 1, mean)
apply(matrix(1:10, nrow=10), 2, mean)

## 2.
# We don't need one. Becouse split() will split a vector 
# according to the group structures defined in the index.
# Apply a function to the subsets of a vector should return 
# the same data types.
tvapply_yp <- function(x, group, f, type){
  pieces <- split(x, group)
  vapply(pieces, f, type)
}
tvapply_yp(pulse, group, mean, numeric(1))
# tvapply_yp(pulse, group, mean, logical(1)) # error

## 3.
split_R <- function(x, group){
  uniq_group <- unique(group)
  out <- lapply(as.list(uniq_group), function(y) x[group==y])
  names(out) <- uniq_group
  out
}
split_R(pulse, group)


### 11.4.3 exercises
## 1.
# is.na() donen't return a single logical value,
# for example is.na(1:10) returns a logical vector.

# anyNA

## 2.
mtcars_mixed
vapply(Filter(is.numeric, mtcars_mixed), mean, numeric(1))

## 3.
x <- c(1:5, rep(NA,5))
which(is.na(x)) # will return all the index of logical true elements
Position(is.na, x) # only return the first index for the true elements

where(is.na, x) # return the index
Filter(is.na, x) # return the elments that is true

## 4. 
Any <- function(f, l){
  anly(vapply(l, f, logical(1)))
}

All <- function(f, l){
  all(vapply(l, f, logical(1)))
}

