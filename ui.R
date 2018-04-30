library(shiny)

shinyUI(fluidPage(
  
  headerPanel("OpenRingMaps Species Density"),
  sliderInput("obs", 
              "Number of observations:", 
              min = 1,
              max = 1000, 
              value = 500),
  
# sidebarPanel(
  # selectInput("species",
 #  "Species:", c(df$species)),

#sidebarPanel(
 # selectInput("breaks","Breaks of histogram:",c("days", "weeks", "months"))
#),

mainPanel(
  plotOutput("distPlot")
)
))
#gyakorlasképpen koment