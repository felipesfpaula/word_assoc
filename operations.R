library(RColorBrewer)

retreivePairs <- function(cuesVector) {
  acc <- data.frame(cue=character(),target=character(),fsg=numeric(), stringsAsFactors = FALSE)
  notfound <- NULL
  for(i in 1:(length(cuesVector)-1) )
  {
    query <- subset(df.assoc, CUE==cuesVector[i] & TARGET==cuesVector[i+1])
    #not found
    if(nrow(query) < 1){
      acc <- rbind(acc,data.frame(cue=cuesVector[i],target=cuesVector[i+1],fsg=0, stringsAsFactors = FALSE))
      cat("not found: ",cuesVector[i],cuesVector[i+1], "\n")
    }
    acc <- rbind(acc,data.frame(cue=query$CUE,target=query$TARGET,fsg=as.numeric(query$FSG), stringsAsFactors = FALSE))
  }
    return(acc)
}

makeStringPairs <- function(cuesVec,targetVec){
  return(paste(cuesVec,targetVec))
}
