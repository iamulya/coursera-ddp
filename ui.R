
library(shiny)

shinyUI(fluidPage(
  
  # Application title
  titlePanel("Normal distribution calculator"),
  helpText("This app allows you to experiment with different shapes of the normal distribution.",
           "Both parameters, mean and standard deviation, can be manipulated using the slider.",
           "One can also use the animation button to automatically change the values of both the parameters."),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
        # Input normal parameter "u"
        sliderInput("u", 
                    "Mean:", 
                    min = -50,
                    max = 50,
                    step = 1,
                    value = 0),
        # input normal parameter "s"
        sliderInput("s", 
                    "Standard deviation:", 
                    min = 0,
                    max = 10, 
                    value = 5)
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
        plotOutput("distPlot"),
        plotOutput("cdfPlot")
    )
  )
))
