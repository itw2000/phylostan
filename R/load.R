#' Import nexus file
#' 
#' @param align String of Nexus file.
#' @return Loaded nexus file as matrix of base pairs/amino acids/codons for each taxa.
#' @examples data <- load.nex("primates.nex")
#' @export
load.nex <- function(align){
  aligned <- read.nexus.data(align)
  aligned <- t(sapply(aligned, unlist))
  return(aligned)
}

#' Set the evolutionary model parameters
evo.model <- function(type,sub,rate){
}

#' Set the parameters for the HMC simulation
bayes.model <- function(iter, chains){
}

