##my First Function

add2 <-function(x,y) {
        x + y
}


## take vector, return subset >10

x <- 1:20 ## create simple vector
above10 <- function(x) {
        use <- x > 10 ##retunrs logical vector of trues and falses of elements >10
        x[use]
}
above10(x)


##user defined threshold
above <-function(x,n) {
        use <- x > n
        x[use]
}

above(x,13)


##user defined threshold, default value
above <-function(x,n = 5) {
        use <- x > n
        x[use]
}
above(x)
above(x,17)


##Matrix or frame, and calc mean of each column
columnMean <-function(y) {
        nc <- ncol(y)
        means <- numeric(nc) ##all zeros initially
        for(i in 1:nc) {
                means[i] <- mean(y[,i])
        }
        means
}
columnMean(airquality)

##remove NA
columnMean <-function(y,removeNA =T) {
        nc <- ncol(y)
        means <- numeric(nc) ##all zeros initially
        for(i in 1:nc) {
                means[i] <- mean(y[,i],na.rm =removeNA)
        }
        means
}
columnMean(airquality, T)
columnMean(airquality, F)


##