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

#' Set the evolutionary model parameters and pass out a list of 3 lists
#' @return List of 3 lists with prior distributions parameters
evo.model <- function(type,sub){
  
}

#' Run Bayesian Inference
#' @param aligned Imported Nexus file matrix
#' @param evo.par Output of the evo.model
#' @param N number of taxa
#' @param K the length of the sequences
#' @return Shiny stan output of the posterior distributions for the different parameters
#' @export
phylo.run <- function(aligned, evo.par, N, K){
  fit <- rstan("jukes-cantor.stan", data=list(N=N, K=K, alpha=evo.par[1], beta=evo.par[2]))
  launch_shinystan(my_stanfit)
}

