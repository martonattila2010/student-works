library(shiny)

options(encoding = 'UTF-8')
Sys.setlocale(category = 'LC_ALL','en_US.UTF-8')

# Define UI for application that plots something
shinyUI(fluidPage(

    #headerPanel(paste(project," species density")),
    titlePanel("OBM stats"),

    sidebarPanel(
        selectInput("state", "Choose a sevice:",
          list(`Last month` = c("All uploads", "My data", "..."),
               `This month` = c("All uploads", "My data", "..."),
               `Last year` = c("All uploads", "My data", "..."),
               `This year` = c("All uploads", "My data", "..."))
        ),

        uiOutput("gyujto"),

        textOutput("text"),
        
        uiOutput('speciesList')
    ),
    mainPanel(
        plotOutput("distPlot")
    )

    #sidebarPanel(
    #    selectInput("Hbreaks", label = "Breaks of histogram:",choices = c("days", "weeks", "months"))
    #),

    #mainPanel(
    #    plotOutput("distPlot")
    #)
))

