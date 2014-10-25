# See the README.md for instructions on How to run the code and get output
# from it. Though executing the code and checking the output is not part 
# of the assessment I have included the instructions and examples for 
# evaluator's ease

# The two functions makeCacheMatrix and cacheSolve help its users to store 
# a matrix and its inverse in Cache so that inverse computation of the stored
# matrix can be avoided except for the first time and the inverse matrix be
# retrieved from Cache if it has been already calculated once.

# makeCacheMatrix is a function that returns a list of functions
# Its puspose is to store a martix and a cached value of the inverse of the
# matrix. Contains the following functions:
# * setmatrix           set the value of a matrix
# * getmatrix           get the value of a matrix
# * setinv              set the cached value (inverse of the matrix)
# * getinv              get the cached value (inverse of the matrix)


# Notes:
# If no argument is passed while calling the makeCacheMatrix it will
# store a NULL matirx by default. The value of the matrix can be changed
# later using setmatrix function.

# makeCacheMatrix function Begins ..

makeCacheMatrix <- function(x = matrix()) {
        
        # holds the cached value or NULL if nothing is cached
        # initially nothing is cached so set it to NULL
        
        i <- NULL
        
        # stores the matrix 
        setmatrix <- function(newValue) {
                
        # Since the matrix is assigned a new value sets the inverse to
        # null
                x <<- newValue
                i <<- NULL
        }
        
        # Returns the value of stored matrix
        getmatrix <- function() {
                x
        }
        
        # Stores the Cache value (inverse of the matrix)
        setinv <- function(inv) {
                i <<- inv
        }
        
        # Returns the Cache value (inverse of the matix)
        getinv <- function() {
                i
        }
        
        # Returns a list in which each element is a function
        list(setmatrix = setmatrix, getmatrix = getmatrix, 
             setinv = setinv, getinv = getinv)
}

# makeCacheMatrix function Ends ..

# CacheSolve returns the inverse of the special matrix stored in the
# makeCacheMatrix. It calculates the inverse if the inverse has not been
# calculated earlier and stores it into the cache of makeCacheMatrix 
# otherwise it just returns the inverse by retrieving it from the cache

# cacheSolve function Begins ..

# y here will be the object in which you have stored return value of 
# makeCacheMatrix

cacheSolve <- function(y, ...) {
        
        # get the cached value
        i <- y$getinv()
        
        # if a cached value exists return it
        if(!is.null(i)) {
                message("getting cached data")
                return(i)
        }
        
        # otherwise get the matrix, caclulate the inverse and store it in
        # the cache
        data <- y$getmatrix()
        i <- solve(data, ...)
        y$setinv(i)
        
        # return the inverse
        i
}

# cacheSolve function Ends ..
