loadHelpContent <- function(helpDir="help"){

  helpFiles <- dir(helpDir,"csv")
  
  helpNames <- lapply(helpFiles,function(x){substr(x,0,nchar(x)-4)})
  
  helpData <- list()
  
  nHelpFiles <- length(helpFiles)
  
  if(nHelpFiles==0)
    return(list())
  
  for(i in 1:nHelpFiles){
    helpFile <- paste0("help/",helpFiles[i])
    
    tmpHelpData <- read.csv(helpFile,1,stringsAsFactors=FALSE)
    
    helpData[[helpNames[[i]]]] <- tmpHelpData
  }
  
  return(helpData)
}