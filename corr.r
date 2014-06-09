corr <- function(directory, threshold = 0) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'threshold' is a numeric vector of length 1 indicating the
  ## number of completely observed observations (on all
  ## variables) required to compute the correlation between
  ## nitrate and sulfate; the default is 0
  
  ## Return a numeric vector of correlations
  pollutantdf = data.frame()
  vec<-c()
  temp=list.files(path=directory,pattern="csv")
  for (j in 1:length(temp)){
    # read in data into DF
    ipf <-read.csv(paste(directory,"/",temp[j],sep=""), header=TRUE, sep=",")
    if (nrow(ipf[which(!is.na(ipf$sulfate) & !is.na(ipf$nitrate)),]) > threshold) {
      vec<-c(vec,cor(ipf$nitrate,ipf$sulfate,use="complete.obs"))
    }
  } 
  vec
}

