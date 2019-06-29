## 18.1.1
## 1.
library(pryr)
vec_num <- vector(mode = "numeric", length = 1e6)
object_size(vec_num)

vec_logi <- vector(mode = "logical", length = 1e6)
object_size(vec_logi)

vec_comp <- vector(mode = "complex", length = 1e6)
object_size(vec_comp)

list_vecs <- list(vec_num, vec_logi, vec_comp)
object_size(list_vecs)
object_size(vec_num, vec_logi, vec_comp, list_vecs)

## 2.
a = 1:1e6 + 0.01
b = 1:1e6 + 0.02
c = 1:1e6
df <- data.frame(a = a, 
                 b = b,
                 c = c)
object_size(df)
object_size(a)
object_size(c)

## 3.
vec <- lapply(0:50, function(i) c("ba", rep("na", i)) )
str <- lapply(vec, paste0, collapse = "")
object_size(vec)
object_size(str)

## 4.
x <- sample(c("a", "b", "c", "d"), 1e6, replace = TRUE)
x <- as.factor(x)
object_size(x)
object_size(as.character(x))

## 5.
# 1:5 are hold in a vector, the metainformation of this vector is shared
object_size(1:5)

# list(1:5) pointed to 5 vectors, the metainformation is not shared
object_size(list(1:5))









