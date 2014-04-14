corr <- function(directory, threshold=0) {
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files
        
        ## 'threshold' is a numeric vector of length 1 indicating the
        ## number of completely observed observations (on all
        ## variables) required to compute the correlation between
        ## nitrate and sulfate; the default is 0
        
        ## Return a numeric vector of correlations
        ###########################################
        myDataFrame <- c(NULL)
        
        for(file in dir(directory)) {
                myFilenameFix <- paste0(directory,"/", file)
                myFileData <- read.csv(myFilenameFix)
                
                ##
                nobs=nrow(myFileData[complete.cases(myFileData),])
                if(nobs>threshold)
                        myDataFrame <- c(myDataFrame,cor(myFileData[complete.cases(myFileData),
                        "sulfate"],myFileData[complete.cases(myFileData),"nitrate"]))    
        }          
        
        #myDataFrame <- round(myDataFrame, digits=5)
        return(myDataFrame)
        #myDataFrame <- rbind(myDataFrame, data.frame(id=i, nobs=nrow(myFileData[complete.cases(myFileData),])))

}


