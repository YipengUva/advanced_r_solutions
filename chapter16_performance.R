### 16.2.1 exercises
## 2.
# exp(log(x) / 2) will be the slowest, because of the exp(), log() operations
# sqrt() is a primitive function, which is writtern in C
library(microbenchmark)
microbenchmark(
  x ^ (1 / 2),
  exp(log(x) / 2),
  sqrt(x),
  x ^ (0.5)
)


## 3.
x_int <- as.integer(1:1e3)
y_int <- as.integer(1:1e3)
x_dou <- x_int + 0.01
y_dou <- y_int + 0.01

times <- microbenchmark(
  `+`(x_int, y_int),
  `+`(x_dou, y_dou),
  `-`(x_int, y_int),
  `-`(x_dou, y_dou),
  `*`(x_int, y_int),
  `*`(x_dou, y_dou),
  `/`(x_int, y_int),
  `/`(x_dou, y_dou),
  `^`(x_int, y_int),
  `^`(x_dou, y_dou)
)

plot(times)


### 4.
eps_es <- microbenchmark(
  `+`(x_int, y_int),
  `+`(x_dou, y_dou),
  `-`(x_int, y_int),
  `-`(x_dou, y_dou),
  `*`(x_int, y_int),
  `*`(x_dou, y_dou),
  `/`(x_int, y_int),
  `/`(x_dou, y_dou),
  `^`(x_int, y_int),
  `^`(x_dou, y_dou),
  unit = "eps"
)

plot(eps_es)

