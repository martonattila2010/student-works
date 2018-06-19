#!/usr/bin/env Rscript

# run R-shiny server in OpenBioMaps



# Rscript --vanilla run_server.R 7287 sscript_path



args = commandArgs(trailingOnly=TRUE)

if (length(args)==0) {
  
  stop("Missing arguments: Port number, Shiny path, [Project,...]!", call.=FALSE)
  
}

port <- '5432'

script_path <- ''

project <- 'ring'

puser <- 'ring_admin'

ppass <- 's8uwdm4scqg'

database <- 'gisdata'

server <- 'localhost'



for (i in 1:length(args)) {
  
  if (args[i]=='-p' || args[i]=='--port') {
    
    port <-  as.numeric(args[i+1])
    
    if (is.numeric(port)) {
      
      if (! (port<8000 && port > 7200)) {
        
        stop("Port number should be between 7200 and 8000", call.=FALSE);
        
      }
      
    } else {
      
      stop("Port should be numeric", call.=FALSE);
      
    }
    
  }
  
  else if (args[i]=='-s' || args[i]=='--path') {
    
    script_path <- as.character(args[i+1])
    
    if(!dir.exists(script_path)) {
      
      stop("Script path does not exists or not accessible", call.=FALSE);
      
    }
    
  }
  
  else if (args[i]=='-j' || args[i]=='--project') {
    
    project <- args[i+1]
    
  }
  
  else if (args[i]=='-u' || args[i]=='--puser') {
    
    puser <- args[i+1]
    
  }
  
  else if (args[i]=='-w' || args[i]=='--ppass') {
    
    ppass <- args[i+1]
    
  }
  
  else if (args[i]=='-d' || args[i]=='--database') {
    
    database <- args[i+1]
    
  }
  
} 



if (port=='' || script_path==''){
  
  stop("Run this script example: Rscript --vanilla run_server.R --port 7287 --path /var/www/hrml/biomaps/projects/sandbox/shiny --project sandbox", call.=FALSE);
  
}



setwd(script_path);

handle = file('../local_vars.php.inc', "r")

while ( TRUE ) {
  
  line = readLines(handle, n = 1)
  
  if ( length(line) == 0 ) {
    
    break
    
  }
  
  if (length(grep("^define\\('gisdb_user",line))) {
    
    puser <- sub(".*'gisdb_user','(\\w+)'.*", "\\1", line,perl=TRUE)
    
  }
  
  else if (length(grep("^define\\('gisdb_pass",line))) {
    
    ppass <- sub(".*'gisdb_pass','(\\w+)'.*", "\\1", line,perl=TRUE)
    
  }
  
  else if (length(grep("^define\\('gisdb_name",line))) {
    
    database <- sub(".*'gisdb_name','(\\w+)'.*", "\\1", line,perl=TRUE)
    
  }
  
}





options(encoding = 'UTF-8')

Sys.setlocale(category = 'LC_ALL','en_US.UTF-8')



# load shiny lib

library(shiny)



# run shiny server on the given port at http://localhost/.../shiny/

# from ./shiny directory

runApp(script_path,port)

