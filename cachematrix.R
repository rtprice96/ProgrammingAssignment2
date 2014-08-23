## This set of functions serves to provide tools to find the inverse
## of a matrix and cache it in a list object.

## This function creates a list of getter and setter functions

makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  ## Setter function.
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  ## Getter function. Retrieves the original matrix.
  get <- function() {x}
  
  ## Getter and setter functions for the matrix inverse.
  setSolution <- function(solution) {m <<- solution}
  getSolution <- function() {m}
  list(set = set, get = get, setSolution = setSolution, getSolution = getSolution)
}


## If the matrix passed to this function has already been solved, it returns the cached solution.  Otherwise, finds the inverse.

cacheSolve <- function(x, ...) {
  
        m <- x$getSolution()
        
        ## If the solution has already been found, return it.
        if(!is.null(m)) {
          message("retrieving cached data")
          return(m)
        }
        
        ## If not, calculate it, set it, and then return that value.
        mat <- x$get()
        m <- solve(mat, ...)
        x$setSolution(m)
        m
}
