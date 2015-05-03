\name{phylostan-package}
\alias{phylostan-package}
\alias{phylostan}
\docType{package}
\title{
Using stan to inference phylogenies on small datasets.
}
\description{
Coms4761 project attempt to implement a newer algorithm to to use Bayesian inference to construct phylogentic trees. The package relies on aligned .nex files and outputs statistics and diagnostics for determining the best tree. 
}
\details{
\tabular{ll}{
Package: \tab phylostan\cr
Type: \tab Package\cr
Version: \tab 0.1.0\cr
Date: \tab 2015-05-11\cr
}
Phylostan accepts data from Nexus files and then allows the user to specify the evolutionary model parameters:
Type: DNA, Codon, Amino Acid
Substitution Model: GTR, Juke-Cantor

}
\author{
Ian Walshe
}
\references{
Huelsenbeck, J.P and Ronquist, F (2003) MrBayes 3: Bayesian phylogenetic inference under mixed models. Bioinformatics,
doi:10.1093/bioinformatics/btn180.

Huelsenbeck, J.P and Ronquist, F (2001) MRBAYES: Bayesian phylogenetic trees. Bioinformatics, vol. 17, 754-755.

Huelsenbeck, J.P, Rannala, B and Masly J.P. An Introduction to Bayesian Inference of Phylogeny. Science. 
}
\keyword{ package }
\examples{
aligned <- load.nex("primates.nex")
params <- evo.model("dna","jc")
phylo.run <- (aligned, params)
}
