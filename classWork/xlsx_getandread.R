## Get data from site
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx?accessType=DOWNLOAD"
download.file(fileUrl, destfile="./Data/NGA.xlsx",mode="wb")


##read file
##ngaData <- read.xlsx("./data/NGA.xlsx", sheetIndex=1,colIndex=colIndex,rowIndex=rowIndex)
ngaData <- read.xlsx("./data/NGA.xlsx", sheetIndex=1)
ngaData

##Create Subsets
