pollutantmean <- function(directory, pollutant, id = 1:332){
      ## Import files into list, retain full directory path
      files <- list.files(directory, full.names=TRUE)
      
      ## Create data frame
      dat <- data.frame()
      
      ## For loop reads csv file and adds to data frame
      for (i in id){
        dat <- rbind(dat, read.csv(files[i]))
      }
      
      ## Calculate mean of data frame, remove NA values, return
      mean(dat[, pollutant], na.rm=TRUE)
}