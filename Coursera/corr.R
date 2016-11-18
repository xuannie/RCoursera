corr  <- function(directory, threshold = 0) {
      cnobs = complete(directory)
      ids = cnobs[cnobs["nobs"] > threshold, ]$id
}