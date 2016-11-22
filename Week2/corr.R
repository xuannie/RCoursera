corr  <- function(directory, threshold = 0) {
      ## Import files into list, retain full directory path
      files <- list.files(directory, full.names=TRUE)
  
      ## Create data frame
      dat <- data.frame()
  
      ## For loop reads csv file and adds to data frame
      for (i in 1:332){
        dat <- rbind(dat, read.csv(files[i]))
      }
  
      ## Get Number of observations for each case
      cnobs <- complete(directory)
      ## Get NOBS that fulfill threshold
      ids   <- cnobs[cnobs$nobs > threshold, ]$id
      cr    <- data.frame()
      for (x in ids){
          cr <- rbind(cr, dat[dat$ID == x, ])
      }
      cr      
}