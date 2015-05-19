library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  
  # Expression that generates a histogram. The expression is
  # wrapped in a call to renderPlot to indicate that:
  #
  #  1) It is "reactive" and therefore should be automatically
  #     re-executed when inputs change
  #  2) Its output type is a plot
  
  output$distPlot <- renderPlot({
    # Generate the random normal distribution with 100 points and the input mean and sd
    z = rnorm(100, mean=input$average, sd=input$spread)
    
    # Generate a normalized Gaussian with 200 points and  the input mean and sd
    x=seq(from=-50, to=50, length=200)
    gauss=1/(sqrt(2*pi)*input$spread)*exp(-((x - input$average)^2/(2*input$spread^2)))
    
    # Draw the histogram and overlay the Gaussian
    hist(z, breaks=30, xlim=c(-50,50), prob="TRUE",
         main="Histogram of a normal distribution")
    lines(x,gauss, col="red")
  })
  
})