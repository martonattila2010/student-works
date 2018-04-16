library(shiny)
#library(RPostgreSQL)

shinyServer(function(input, output) {
  output$distPlot <- renderPlot({
        #drv <- dbDriver("PostgreSQL")
        #con <-dbConnect(drv, dbname = database,
        #         host = server, port = port,
        #         user = puser, password = ppass)
        #df <- dbGetQuery(con, "SELECT * FROM ring 
        #                          WHERE datum > '2015-07-11' AND datum < '2015-10-31'
        #                          ")
        #dbDisconnect(con)

        #hist(df$datum[df$species == c(input$species)], c(input$breaks))
        dist <- rnorm(input$obs)
        hist(dist)


    })
})


