## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
        m <- NULL #this is creating an empty matrix that the rest of the function puts stuff in
        set <- function(y) {
            x <<- y  
            m <<- NULL
        }
        get <- function() x
        setinvert <- function(solve) m <<- solve #sets the inversion for the matrix
        getinvert <- function() m
        list(set = set, get = get, #create the final list of things made in the function.
             setinvert = setinvert,
             getinvert = getinvert)
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) { #setting defaults
    m <- x$getinvert() #pulls getinvert from makeCacheMatrix
    if(!is.null(m)) { #checks to make sure there is stuff in the matrix
        message("getting cached data") 
        return(m) #if there is stuff in the matrix, print the stuff
    }
    data <- x$get() #get the matrix and create an object called data
    m <- solve(data, ...) #create a matrix of the inversion of data object
    x$setinvert(m)
    m #print m
}

# x<-matrix(runif(1:4), 2,2)
# y<-makeCacheMatrix(x)

# y

# cacheSolve(y)
