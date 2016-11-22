complete <- function(directory, id = 1:332){
      ## Import files into list, retain full directory path
      files <- list.files(directory, full.names=TRUE)
      
      ## Data frame for data
      dat   <- data.frame()
      ## Data frame for number of observations for current data
      nobs  <- data.frame()
      ## Data frame for complete number of observations
      cnobs <- data.frame()
      for (i in id){
        ## Read file
        dat     <- read.csv(files[i])
        ## Bind case index to number of complete cases
        nobs    <- cbind(i, sum(complete.cases(dat)))
        ## Add row to complete case
        cnobs   <- rbind(cnobs, nobs)
      }
      ## Rename columns
      names(cnobs) <- c("id", "nobs")
      ## Return complete number of observations
      cnobs
}