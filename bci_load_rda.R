# function to download and unzip data in specified folder
retrieveData <- function(url, filename = "filename",  destDirectory=NULL, unzip = FALSE){
  
  if(!is.null(destDirectory)){
    # Create output folder if needed
    try(dir.create(destDirectory, showWarnings = FALSE))    
    
    # Get path of data directory and specify filename
    dataDirectory <- paste0("./", destDirectory, "/")

    filename <- paste0(dataDirectory, filename)
    }
  
  # Download and unzip files
  download.file(url = url, destfile = filename, mode="wb")
  
  if (unzip){
    unzip(paste0(dataDirectory, filename), exdir = destDirectory, overwrite = TRUE)  
    # Delete zip file
    file.remove(paste0(dataDirectory, filename))
  }
}

# give the random number generator the right setting (so that it is compatible with 
# R versions before 4.0
RNGkind(kind = "Mersenne-Twister", normal.kind = "Inversion", sample.kind = "Rejection")

# inputs for retrievedata function
url <- "http://horizon.science.uva.nl/public/VVA/BCI2012.RDa"
filename = 'BCI2012.RDa'

# download, save in current directory and load file
retrieveData(url, filename)
load(filename)
