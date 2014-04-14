pollutantmean <- function(directory, pollutant, id = 1:332) {
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files
        
        ## 'pollutant' is a character vector of length 1 indicating
        ## the name of the pollutant for which we will calculate the
        ## mean; either "sulfate" or "nitrate".
        
        ## 'id' is an integer vector indicating the monitor ID numbers
        ## to be used
        
        ## Return the mean of the pollutant across all monitors list
        ## in the 'id' vector (ignoring NA values)
        
        
        # 1. create a data.frame, empty to hold values, want to try with matrix
        myDataFrame <- data.frame()
        
        for(i in seq_along(id)) { ##use seq_along when dont know length
                # 2. Fix File Name error, add leading zeros to file names when
                # needed(also could use loop here, this is easier for me) 
                myFilenameFix <- sprintf("%s/%03d.csv", directory, id[i])
                
                ## 3. Create mydatavar using read.csv to get the data
                myFileData <- read.csv(file=myFilenameFix, header=TRUE)
                
                ##populate data frame
                if(length(myDataFrame) == 0) {  #if first pass 
                        myDataFrame <- myFileData
                } else {                        #append and bind to frame                        
                        myDataFrame <- rbind(myDataFrame, myFileData)
                }
        }
        
        ## get mean, remove NA's
        myInitResults <- mean(myDataFrame[,pollutant], na.rm = TRUE)
        ## round to match assignment output examples
        myFinalResults <- round(myInitResults, digits = 3)
        print(myFinalResults)
        
}
