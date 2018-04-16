library(shiny)

shinyUI(fluidPage(
  
  headerPanel("OpenRingMaps Species Density"),

  sidebarPanel(
    selectInput("species",
                "Species:", c(df$species))),
   
  sidebarPanel(
    selectInput("breaks","Breaks of histogram:",c("days", "weeks", "months"))
  ),

  mainPanel(
    plotOutput("distPlot")
  )
))

