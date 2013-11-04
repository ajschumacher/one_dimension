setwd("~/one_dimension/data/")
d <- read.csv("2013DemographicSnapshotPUBLIC.csv", na.strings=c("","-","NA"), check.names=FALSE, as.is=TRUE, strip.white=TRUE)
# clean out commas and asterisks
d[,4:38] <- lapply(d[,4:38], function(v){
  if (class(v) == "character") {
    startingNAs <- sum(is.na(v))
    v <- as.integer(gsub("[,*]","",v))
    if (sum(is.na(v)) != startingNAs) {
      stop("clobbered something")
    }
  }
  return(v)
})
