complete <- function(directory, id = 1:332) {
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files
        
        
        ## 'id' is an integer vector indicating the monitor ID numbers
        ## to be used 
        
        ## Return a data frame of the form:
        ## id nobs
        ## 1  117
        ## 2  1041
        ## ...
        ## where 'id' is the monitor ID number and 'nobs' is the
        ## number of complete cases
        
        myDataFrame <- data.frame()

        for(i in id) {
                myFilenameFix <- sprintf("%s/%03d.csv", directory, i)
                myFileData <- read.csv(file=myFilenameFix, header=TRUE)
                #nobs <- sum(!is.na(myFileData["sulfate"]) & !is.na(myFileData["nitrate"]))
                nobs <- sum(complete.cases(myFileData)) #uses complete.cases function
                #myDataFrame <- rbind(myDataFrame, data.frame(id=i, nobs=nrow(myFileData[complete.cases(myFileData),])))
                myDataFrame <- rbind(myDataFrame, c(i, nobs))        
        }
        names(myDataFrame) <- c("id", "nobs")
        myDataFrame
}
