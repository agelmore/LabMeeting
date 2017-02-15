#Functions required for Lab meeting 2_16_17


load_Libraries <- function(libraries){
  for (x in libraries){
    if (x %in% installed.packages()[,"Package"] == FALSE){
      install.packages(as.character(x), quiet=TRUE);
    }
    library(x, verbose=FALSE, character.only=TRUE)
  }
}



get_endpoints <- function(eartags, metadata) {
  load_Libraries("gtools")
  end.eartag <- c() #vector of endpoint samples for each cage
  for (et in eartags){
    endpoint.day <- tail(mixedsort(unique(metadata$day[metadata$eartag_un==et])), n=1)
    endpoint.id <- metadata$id[metadata$eartag_un==et & metadata$day==endpoint.day]
    end.eartag <- append(end.eartag, endpoint.id)
  }
  return(end.eartag)
}


get_day1 <- function(eartags, metadata) {
  load_Libraries("gtools")
  d1.eartag <- c() #vector of endpoint samples for each cage
  for (et in eartags){
    d1.day <- head(mixedsort(unique(metadata$day[metadata$eartag_un==et])), n=1)
    d1.id <- metadata$id[metadata$eartag_un==et & metadata$day==d1.day]
    d1.eartag <- append(d1.eartag, d1.id)
  }
  return(d1.eartag)
}
