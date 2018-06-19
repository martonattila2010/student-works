#!/usr/bin/env Rscript

# run R-shiny server in OpenBioMaps



# Rscript --vanilla run_server.R 7287 sscript_path



args = commandArgs(trailingOnly=TRUE)

if (length(args)==0) {
  
  stop("Missing arguments: Port number, Shiny path, [Project,...]!", call.=FALSE)
  
}

source('pw.R')


ppass <- pw$ppass
database <- pw$database
puser <- pw$puser
server <- pw$server
project <- pw$project
script_path <- pw$script_path
dbport <- pw$dbport


options(encoding = 'UTF-8')

Sys.setlocale(category = 'LC_ALL','en_US.UTF-8')



# load shiny lib

library(shiny)



# run shiny server on the given port at http://localhost/.../shiny/

# from ./shiny directory

runApp(pw$script_path,pw$port)

