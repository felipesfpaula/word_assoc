library(shiny)



shinyUI(fluidPage(
  titlePanel("Word association strength"),
  
  sidebarLayout(
    sidebarPanel(
      fluidRow(
        column(10,
               helpText("Please enter words separated by commas", 
                        "e.g:",
                        " cat, mouse, rat, snake "),
                textInput("txtInput", label = "words"),
                actionButton("submit", label = "submit")
        )
      ),
      
      fluidRow(
        column(10,
               h3("About"),
               p("The plot represents the pairs' forward association strength."),
               p("The original dataset and more information can be found at",
               a("this page.", href="http://w3.usf.edu/FreeAssociation/AppendixA/index.html")),
               p("The code of this Shiny page and scripts are available at my",a("github.", href="http://www.google.com")),
               
               p("Author:",strong("Felipe Paula"))
               
               
               
        )
      )
    ),
      
    mainPanel(
      # Use imageOutput to place the image on the page
      plotOutput("plot")
    )
  )
))
