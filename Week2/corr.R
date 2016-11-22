corr  <- function(directory, threshold = 0) {
      ## Import files into list, retain full directory path
      files <- list.files(directory, full.names=TRUE)
      ## Create data frame
      dat <- data.frame()

      ## Get Number of observations for each case
      cnobs <- complete(directory)
      
      ## Get ids that fulfill threshold
      ids   <- cnobs[cnobs$nobs > threshold, ]$id
      
      ##create data frame, numeric vector to return
      crdat <- data.frame()
      cr <- numeric()
      
      for (x in ids){
          ##read file that fulfills threshold
          crdat <- read.csv(files[x])
          
          ##get only complete cases
          valid_crdat <- crdat[complete.cases(crdat), ]
          
          ##calculate correlation
          cr = c(cr, cor(valid_crdat$sulfate, valid_crdat$nitrate))
      }
      
      cr
}