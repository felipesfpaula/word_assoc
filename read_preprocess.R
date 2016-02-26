
openFiletrimAndMakeDF <- function(filename) {
  print(filename)
  finput <- readLines(filename)
  finput.skipped <- finput[-(1:3)]
  finput.skipped <- finput.skipped[-((length(finput.skipped)-2):length(finput.skipped))]
  dat <- read.csv(textConnection(finput.skipped), header = TRUE, stringsAsFactors = FALSE, strip.white = TRUE)
}



#Called in app.R
readAndProcess <- function(){
  filenames <- c("Cue_Target_Pairs.a-b","Cue_Target_Pairs.C","Cue_Target_Pairs.d-f","Cue_Target_Pairs.g-k","Cue_Target_Pairs.l-o","Cue_Target_Pairs.p-r","Cue_Target_Pairs.S",
                 "Cue_Target_Pairs.t-z")
  
  #in Cue_Target_Pairs.d-f theres a mistype in the TFR column
  #I corrected it by hand
  df.list <- lapply(filenames, openFiletrimAndMakeDF)
  df.assoc <- Reduce(rbind, df.list)
}
