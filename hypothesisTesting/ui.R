library(shiny)

ui <- fluidPage(
  
  sidebarLayout(
    sidebarPanel(numericInput( 'mean', "Mean ", value = 0, min = -10, max = 10),
                 numericInput( 'sd', "SD ", value = 1, min = 1, max = 5),
                 numericInput( 'x' , "x Value", value = 1.644, min = -10, max = 10)),
    mainPanel(plotOutput("plot1"),
              textOutput("pvalue"))
    
))
  

  
  

