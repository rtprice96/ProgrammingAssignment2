## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() {x}
  setSolution <- function(solution) {m <<- solution}
  getSolution <- function() {m}
  list(set = set, get = get, setSolution = setSolution, getSolution = getSolution)
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        m <- x$getSolution()
        if(!is.null(m)) {
          message("retrieving cached data")
          return(m)
        }
        mat <- x$get()
        m <- solve(mat, ...)
        x$setSolution(m)
        m
}
