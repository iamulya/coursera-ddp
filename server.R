#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggplot2)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
   
  pdf.data <- reactive({
      data.frame(x=seq(-50, 50, length=200),
                 y=dnorm(seq(-50, 50, length=200), input$u, input$s))
  })
  
  cdf.data <- reactive({
      data.frame(x=seq(-50, 50, length=200),
                 y=pnorm(seq(-50, 50, length=200), input$u, input$s))
  })
  
  output$distPlot <- renderPlot({
    
    ggplot(pdf.data(), aes(x, y)) + geom_line(size=1.2) + theme_bw() + xlab('x') + ylab('') + ggtitle('Probability Density/Mass Function') 
    
  })
  
  output$cdfPlot <- renderPlot({
      
      ggplot(cdf.data(), aes(x, y)) + geom_line(size=1.2) + theme_bw() + xlab('x') + ylab('') + ggtitle('Cumulative Distibution Function') 
      
  })
  
})
