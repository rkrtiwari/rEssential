library(shiny)

server <- function(input, output){
  
  output$plot1 <-  renderPlot({
    x <- seq(-15,15, by = 0.1)
    y <- dnorm(x, mean = input$mean, sd = input$sd)
    xpol <- seq(input$x, 15, length=100)
    ypol <- dnorm(xpol, input$mean, input$sd)
    xpolval <- rep(0,100)
    plot(x,y, type = "l", col = "black", xlim = c(-6,6),
         ylab = "Probability Density")
    abline( v = input$x, col = "blue")
    polygon( c(xpol, rev(xpol)), c(xpolval, rev(ypol)), col = "blue")
  })
  
  

  
  output$pvalue <- renderText({
    pval <- pnorm(input$x, mean = input$mean, sd = input$sd)
    paste("p-value: ",round(pval, 3))
  })
  
}