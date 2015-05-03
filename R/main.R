#' Import nexus file
#' 
#' @param align String of Nexus file.
#' @return Loaded nexus file as matrix of base pairs/amino acids/codons for each taxa.
#' @examples data <- load.nex("primates.nex")
#' @export
load.nex <- function(align){
  library(ape)
  aligned <- read.nexus.data(align)
  aligned <- t(sapply(aligned, unlist))
  return(aligned)
}

#' Set the evolutionary model parameters and pass out a list of 3 lists
#' @param type String codon, amino, dna
#' @param sub String gtr, jc are the two implmentations right now
#' @return List of parameters to be incorporated into model priors
#' @examples data <- evo.model("dna","jc")
#' @export
evo.model <- function(type,sub){
  if (type == "dna"){
    if(sub == "gtr"){
      alpha = 6
      alpha.freq = rep(1/6, 6)
    }
    else{
      alpha = 4
      alpha.freq = rep(1/4, 4)
      return(c(alpha,alpha.freq))
    }
    
  }
  #These two would be implemented in the futre the same way 
#  else if(type == "codon"){
#    
#  }
#  else if(type == "amino"){
#  }
}

#' Run Bayesian Inference
#' @param aligned Imported Nexus file matrix
#' @param evo.par Output of the evo.model
#' @return Shiny stan and stan output of the posterior distributions for the different parameters
#' @export
phylo.run <- function(aligned, evo.par){
  library(rstan)
  library(shinyStan)
  N <- nrow(aligned)
  K <- ncol(aligned)
  aligned <- as.numeric(aligned)
  #This is the command to run HMC algorithm, lambda refers to the prior put on branch length
  fit <- stan("juke_cantor.stan", data=list(N=N, K=K, alpha=evo.par[1], beta=evo.par[2:length(evo.par)], lambda=10),  iter=1000, chains=4)
  launch_shinystan(my_stanfit)
}

