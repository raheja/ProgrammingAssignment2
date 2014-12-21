## Put comments here that give an overall description of what your
## functions do


## Write a short comment describing this function

# makeCacheMatric function creates a list containing a function to
# set the values of matrix and its inverse (assuming that the matrix is invertible)
# and get them when called

makeCacheMatrix <- function(x = matrix()) {
m <- NULL           # assigning defualt value when nothing is computed
set <- function(y) {
  x <<- y
  m <<- NULL
}
get <- function()x
setinverse <- function(inverse) m <<- inverse
getinverse <- function() m
list(set =set, get=get, setinverse = setinverse, getinverse = getinverse)
}


## Write a short comment describing this function
# This function first checks if inverse of the matrix created by the CacheMatrix function
# in cache, exists. If not, then it calculates the inverse of the matrix and sets the result in the 
# cache via the setinverse function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  m <- x$getinverse()
  if(!is.null(m)){      # checking if the inverse of matrix already exists in cache
    message("getting cached data")    
    return(m)           # returns cache value
  }
  data <- x$get()
  m <- solve(data)   # solve calculates the inverse
  x$setinverse(m)    # x$setinverse sets the value of m in cache (I think)
  m                  # outputs the value
    
}
