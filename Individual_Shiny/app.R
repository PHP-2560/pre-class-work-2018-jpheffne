#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
ui <- fluidPage(
   
   # Application title
   titlePanel("Individual Shiny App"),
   
   # Sidebar with a slider input for number of bins 
   sliderInput(inputId = "z_score",
                     "Choose z-score:",
                     min = -10,
                     max = 10,
                     value = 0, 
                     step = 0.1),
   
   textOutput("p_value")
)

# Define server logic required to draw a histogram
server <- function(input, output) {

   output$p_value <- renderPrint({
     # calculate the p-value given the z-score
     calculate_p_value <- function(z_score) {
       p_value <- 2*pnorm(-abs(input$z_score))
       return(p_value)
     }
     
     cat(calculate_p_value(input$z_score))
     
     
   })
}

# Run the application 
shinyApp(ui = ui, server = server)

