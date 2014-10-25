### Reading the functions

* Save the code in your working directory and enter source("cachematrix.R")
* Source the code from my Github repository by entering source("https://github.com/pshivhare88/ProgrammingAssignment2/cachematrix.R") 

### Example: Executing makeCacheMatrix function

Since the Solve function calculates inverse of only an invertible matrix we will be
using only a n by n invertible matrix in the examples.

You can store a matrix in makeCacheMatrix function in two ways

* During the calling of the makeCacheMatrix function
* Later using the setmatrix function

Store the list of functions returned by makeCacheMatrix function in object z

z <- makeCacheMatrix( matrix( c(1,2,3,4), ncol=2, nrow=2) )

The summary of object Z should look like this:

> summary(z)
#>          Length Class  Mode    
#> setmatrix 1      -none- function
#> getmatrix 1      -none- function
#> setinv    1      -none- function
#> getinv    1      -none- function

To see the matrix stored in makeCacheMatrix use getmatrix element of z

> z$getmatrix()
#>      [,1] [,2]
#> [1,]    1    3
#> [2,]    2    4

Since initially there is no inverse stored in Cache getinv element of z 
will return NULL

>  z$getinv()
#> NULL

 

### Example: Executing CacheSolve function

If you are calling the Cachesolve function on z for the first time it
will calculate the inverse of matrix stored in z and store it in z's Cache.

> cacheSolve(z)
#>      [,1] [,2]
#> [1,]   -2  1.5
#> [2,]    1 -0.5


In this case z contained matrix

#>      [,1] [,2]
#> [1,]    1    3
#> [2,]    2    4

but NULL inverse so the inverse was calculated for the first time and stored in Cache of z.


Calling cacheSolve on z for the second time will not calculate the inverse matrix again it will
simply retrieve the value of the inverse from the Cache and return it with a message
"getting cached data"

> cacheSolve(z)
#>getting cached data
#>      [,1] [,2]
#> [1,]   -2  1.5
#> [2,]    1 -0.5


### Notes:

setmatrix element of z can be used to change the value of the stored matrix
or define the value of the matrix if you didnt while calling the makeCacheMatrix
earlier

Try:

z$setmatrix( matrix( c(5,6,7,8), ncol=2, nrow=2) )

Since the value of matrix in z has now changed the value of inverse matrix will again
be set to NULL

> z$getmatrix()
#>      [,1] [,2]
#> [1,]    5    7
#> [2,]    6    8

>  z$getinv()
#> NULL

You can again call cacheSolve on z to calculate the inverse and store it in the Cache
