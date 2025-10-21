# ============================================================================
# Matrix Inverse Caching Functions
# ============================================================================
# These functions provide an efficient way to cache matrix inverse calculations
# to avoid repeated computations of the same inverse matrix.
# ============================================================================

# Function: makeCacheMatrix
# Creates a special "matrix" object that can cache its inverse
# 
# Args:
#   x: invertible matrix (default: empty matrix)
#
# Returns:
#   List containing functions to:
#   - set: set the matrix value
#   - get: get the matrix value  
#   - setinverse: set the cached inverse
#   - getinverse: get the cached inverse

makeCacheMatrix <- function(x = matrix()) {
  inv <- NULL
  
  # Set the matrix and clear cached inverse
  set <- function(y) {
    x <<- y
    inv <<- NULL
  }
  
  # Get the matrix
  get <- function() x
  
  # Set the cached inverse
  setinverse <- function(inverse) inv <<- inverse
  
  # Get the cached inverse
  getinverse <- function() inv
  
  # Return list of functions
  list(set = set, 
       get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}



# Function: cacheSolve
# Computes the inverse of the special "matrix" returned by makeCacheMatrix.
# If the inverse has already been calculated and the matrix has not changed,
# then cacheSolve retrieves the inverse from the cache.
#
# Args:
#   x: special "matrix" object created by makeCacheMatrix
#   ...: additional arguments passed to solve()
#
# Returns:
#   Matrix inverse (either computed or retrieved from cache)

cacheSolve <- function(x, ...) {
  # Attempt to get cached inverse
  inv <- x$getinverse()
  
  # If cached inverse exists, return it
  if (!is.null(inv)) {
    message("getting cached data")
    return(inv)
  }
  
  # Otherwise, compute the inverse
  data <- x$get()              # Get the matrix
  inv <- solve(data, ...)      # Compute inverse using solve()
  x$setinverse(inv)            # Cache the computed inverse
  
  # Return the inverse
  inv
}
