complete <- function(directory, id = 1:332){
  files <- list.files(directory, full.names=TRUE)
  dat   <- data.frame()
  nobs  <- data.frame()
  cnobs <- data.frame()
  for (i in id){
    dat     <- read.csv(files[i])
    nobs    <- cbind(i, sum(complete.cases(dat)))
    cnobs   <- rbind(cnobs, nobs)
  }
  names(cnobs) <- c("id", "nobs")
  cnobs
}