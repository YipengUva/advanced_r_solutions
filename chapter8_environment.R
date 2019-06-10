### 8.1.1 exercises
## 1.
# 1) objects are refered to an environment, which means
# they are not saved inside an environment.
# 2) there are inheritence relationship. An environment 
# can have a parent environment. It is related to lexital scoping.
# 3) since an environment doesn't save an object, it referes to an
# object. We have to use rm() to delete an object. In list structure,
# we simply set an element to NULL.

## 2.
# global environment.

## 3.
# 
env_test <- globalenv()
while(!identical(env_test, emptyenv())){
  env_test <- parent.env(env_test)
  if(identical(env_test, baseenv()))
    print("baseenv() is found")
  if(identical(env_test,emptyenv()))
    print("emptyenv() is found")
}


### 8.2.1 exercises
## 1.
where <- function(name, env = parent.frame()){
  if(identical(env, emptyenv())){
    stop("Can't find ", name, call. = FALSE)
  }else if(exists(name, envir = env)){
    print(env)
    
    if(!exists(name, envir = env, inherits = FALSE))
      where(name, parent.env(env))
  }
  else{
    
    where(name, parent.env(env))
  }
}

where("mean", parent.frame())

## 2.
# 
get <- function(name, env = parent.frame()){
  if (identical(env, emptyenv())){
    stop("Error in get function: object not found")
  } else if(exists(name, envir = env, inherits = FALSE)){
    env[[name]]
  } else{
    get(name, parent.env(env))
  }
}
get("mean", env = globalenv())
get("mean")

## 3.
fget <- function(name, env = parent.frame()){
  if (identical(env, emptyenv())){
    stop("Error in get function: object not found")
  } else if(exists(name, envir = env, inherits = FALSE) &&
            is.function(env[[name]])){
    env[[name]]
  } else{
    get(name, parent.env(env))
  }
}
fget("mean", env = globalenv())
fget("a")

## 4.
exists_self <- function(name, envir = parent.frame(), inherits = FALSE){
  if(!inherits){
    return( name %in% ls(envir) )
  }else{
    while(!identical(envir, emptyenv())){
      tmp <- name %in% ls(envir)
      if(tmp){
        return(tmp)
      }else{
        envir <- parent.env(envir)
      }
    }
  }
}

exists_self("mean", envir=parent.frame(), inherits = FALSE)
exists_self("mean", envir=parent.frame(), inherits = TRUE)


### 8.3.5 exercises
## 1.
# Enclosing environment: the environment inside which the 
# function is defined.
# Binding environments: the environments where a function object
# is refered.
# Excution environment: when a function is excuted, a temptory 
# environment is created to hold the objects generated during the 
# excution of the function.
# Call environment: the environment where the function is called.
# 
# Take R package as an example. R package has two environments, 
# package environment and namespace environment. namespace environment
# is the enclosing environment, and package environment is a binding
# environment. Enclosing environment is where we define all our functions,
# they can get access to each other; binding environment is the interface
# for the communacation. The details had encapsulated, only the interface
# can be get accessed by other people.

## 5.
str_self <- function(f){
  stopifnot(is.function(f))
  
  print("The function was found in: ")
  print(environment(f))
  print("The function was defined in: ")
  print(enclosing_env(f))
}
str_self(mean)


