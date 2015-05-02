#' Import nexus file
#' 
#' @param align String of .nexus file
#' @return Loaded nexus file as dataframe
#' @export
load.nex <- function(align){
  return (aligned <- read.nexus.data(align))
}