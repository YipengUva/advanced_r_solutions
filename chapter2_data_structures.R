### 2.13 exercises

## 1. 
# atomic vector has the following six types:
# logical, integer, double, character, complex, raw.
# atomic vector contains the elements of the same date type,
# while list can contains elements of different data types.

## 2. 
# is.vector() test if an object is a vector and don't
# have attributes other than names. Both atomic vector and
# list return true. However, is.list() only tests if an object 
# is a list. is.numeric() test if the elements in a atomic vector 
# have double or integer data types, while is.character() tests if
# it is of character (actually is string) data type.

## 3.
# c(1,FALSE) -> c(1,0), logcial data type is least flexiable data type.
# c("a",1) -> c("a", "1"), char data type is the most flexiable.
# c(list(1),"a") -> a list contains two lists
# c(TRUE, 1L) -> c(1L, 1L)

## 4.
# list data structure itself is a special vector, and is.vector(list object) 
# is true. Therefore, as.vector() doesn't work.

## 5. 
# 1 is automatically coercioned to char data type.

## 6.
# Because of a logcial data types has the lowest order in automatic coerction.
# Thus, when combined with other elements in a atomic vector, the data type can be
# automatically coercioned to the correct type.


### 2.2.2 exercises
## 1.
# the comment attribute will not be printed by default. We can test it as follows:
x <- 1:6
attr(x, "comment") <- "test"
attributes(x)

## 2.
# the elements inside a factor are represented by a different set of integers. 
f1 <- factor(letters)
levels(f1)
levels(f1) <- rev(levels(f1))
levels(f1)

## 3.
# In f2, the order of the elements are reversed and the levels don't change, while 
# in f3, it is the other way around.
f2 <- rev(factor(letters))
f2
f3 <- factor(letters, levels = rev(letters))


a <- matrix(1:6, 2,3)
b <- array(1:12, c(2,3,2))
length(a)

### 2.3.1 exercises
## 1.
# NULL. A vector doesn't have this attribute .

## 2.
# Also true. A matrix is a 2 dimensional array.

## 3.
# These three objects have an additional attribute dim compared to
# a atomic vector. And they have different values for the dim attribute.


### 2.4.5 exercises
## 1.
# names, row.names, class

## 2.
# Use aotumatic coercion to transform data to be the same data type.

## 3.
# Yes. Shown as follows, 
df <- data.frame()
str(df)

