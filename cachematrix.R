## Put comments here that give an overall description of what your
## functions do

## This function creates a special "matrix" object that can cache its inverse.

makeCacheMatrix <- function(x = matrix()) {
    xi <- NULL
    set <- function(y) {
        x <<- y
        xi <<- NULL
    }
    get <- function() x
    setinverse <- function(inverse) xi <<- inverse
    getinverse <- function() xi
    list(set = set, get = get,
         setinverse = setinverse,
         getinverse = getinverse)

}


## This function computes the inverse of the special "matrix" returned by
## makeCacheMatrix above. If the inverse has already been calculated (and
## the matrix has not changed), then the cachesolve should retrieve the inverse
## from the cache.

cacheSolve <- function(x, ...) {
    ## Return a matrix that is the inverse of 'x'
    xi <- x$getinverse()
    if(!is.null(xi)) {
        message("getting cached data")
    }
    else {
        data <- x$get()
        xi <- solve(data, ...)
        x$setinverse(xi)
    }
    
    xi
}
