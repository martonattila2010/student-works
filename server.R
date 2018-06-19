
library(shiny)



options(encoding = 'UTF-8')

Sys.setlocale(category = 'LC_ALL','en_US.UTF-8')



# Database connection

library(RPostgreSQL)

dbport <- 5432

# variables from run_server.R (OpenBioMaps Rscript exec())

# sql user name:

#   puser

# sql user password:

#   ppass

# sql project table:

#   project

# sql database name:

#   database

# sql server:

#   localhost

# sql server port:

#   dbport

drv <- dbDriver("PostgreSQL")

con <-dbConnect(drv, dbname = database,
                
                host = server, port = dbport,
                
                user = puser, password = ppass)



shinyServer(function(input, output) {
  
  
  
  mydb <- reactive({
    
    if (length(input$gyujto)) {
      
      # returning
      
      paste(" AND gyujto='",input$gyujto,"'",sep='')
      
    }
    
  })
  
  output$text <- renderText({  
    
    # returning
    
    paste("You have selected:",input$gyujto)
    
  })  
  
  
  
  sp <- reactive({
    
    cmd <- paste("SELECT obm_id,obm_datum as datum,faj as species FROM",project,"WHERE obm_datum > '2010-07-11' AND obm_datum < '2018-10-31' ",mydb())
    
    MyDf <- dbGetQuery(con, cmd)
    
    # returning
    
    MyDf$species
    
  })
  
  
  
  output$speciesList <- renderUI({
    
    selectInput('species', label='Fajok', choices=sp())
    
  })
  
  
  
  output$gyujto <- renderUI({
    
    cmd <- paste("SELECT DISTINCT uploader_name FROM uploadings")
    
    MyDf <- dbGetQuery(con, cmd)
    
    # returning
    
    selectInput('gyujto', label='Gyűjtők', choices=MyDf$uploader_name)
    
  })
  
  
  
  
  
  output$distPlot <- renderPlot({
    
    
    
    cmd <- paste("SELECT TO_CHAR(obm_datum,'YYYY-MM-DD') as datum FROM ",project," WHERE faj='",input$species,"'",sep='')
    
    MyDf <- dbGetQuery(con, cmd)
    
    
    
    #hist(MyDf$datum[MyDf$species == c(input$species)], c(input$breaks))
    
    hist(MyDf$datum)
    
    
    
    
    
  })
  
  
  
})





#on.exit(dbDisconnect(con), add = TRUE)