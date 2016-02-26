library(shiny)
library(RColorBrewer)


#We use cv reader to parse through the commas
extractWords <- function(iptWords){
  str <- names(read.csv(textConnection(iptWords),strip.white = TRUE))
  str <- toupper(str)
  
  str <- gsub(x = str, pattern = "\\[:space:]", replacement = "")
  str <- gsub(x = str, pattern = "\\d+", replacement = "")
  str <- gsub(x = str, pattern = "\\s+", replacement = "")
  str <- gsub(x = str, pattern = "\\.", replacement = " ")
  str <- gsub(x = str, pattern = "\\.", replacement = " ")
  
}

shinyServer(function(input,output){
  observeEvent(input$submit,{
    word.vec <- extractWords(input$txtInput)
    
    output$plot <- renderPlot({
      ans <- retreivePairs(word.vec)
      par(pin=c(2, (length(word.vec)/2)+1), mar=c(4,8,2,4))
      blues <- brewer.pal(ans$fsg, "Blues")
      bp <- barplot(ans$fsg,names.arg = makeStringPairs(ans$cue, ans$target), col = blues ,las =2, xlim=c(0,max(ans$fsg)+.02),horiz = TRUE,cex.names = (1 - (length(word.vec)/100)))
      axis(3, at=mean(ans$fsg))
      axis(4, at=bp, lwd=2, labels = ans$fsg, las = 2)
      abline(v=mean(ans$fsg))
      dim <- par("usr")
      box(lwd = 2)
    })
    
    })
  
})