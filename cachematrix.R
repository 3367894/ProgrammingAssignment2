## Pair of functions for calculating inverse of matrix with caching value of calculation


## Function for creating special "cache matrix" object, containing functions to: 
## 1. set the value of the matrix
## 2. get the value of the matrix
## 3. set the value of the inverse of matrix
## 4. get the value of the inverse of matrix

makeCacheMatrix = function(x = matrix()) {
  m = NULL
  set = function(y) {
    x <<- y
    m <<- NULL
  }
  get = function() x
  setsolve = function(solve) m <<- solve
  getsolve = function() m

  list(
    set = set, 
    get = get,
    setsolve = setsolve,
    getsolve = getsolve
  )
}


## Function for calculate inverse of special "cache martix" object
## and save value of calculation to cache

cacheSolve = function(x, ...) {
  m = x$getsolve()

  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }

  m = solve(x$get(), ...)
  x$setsolve(m)
  m
}
