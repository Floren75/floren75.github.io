library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel(h1("Plotting a Random Normal Distribution",align="center")),
  
  # Sidebar with a slider input for the number of bins
  sidebarLayout(
    sidebarPanel(h3("Input data here"),
                 
      sliderInput("average",
                  "Center of the Distribution:",
                  min = -30,
                  max = 30,
                  value = 0),
      
      sliderInput("spread",
                  "Standard Deviation:",
                  min = 1,
                  max = 25,
                  value = 5),
      
      helpText("Help: use the sliders above to choose the normal distribution",
               "average value and its standard deviation.",
               "A histogram of the data with a Gaussian fit is shown in the Main Panel.")
    ),


    # Show a plot of the generated distribution
    mainPanel(
        plotOutput("distPlot"),
        br(),
        p("For more details please check out my ",
          a("presentation.", 
            href = "http://rpubs.com/Floren75/80753"))
    )
  )
))