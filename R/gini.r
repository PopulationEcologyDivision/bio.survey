#' @title gini
#' @description gini index of patchniness from a stratified survey (Myers and Cadigan 1995)
#' @param \code{x} : within strata mean per tow 
#' @param \code{y} : strata areas in trawlable units
#' @return estimate of gini
#' @examples
#' y=c(2454,	656,	2374,	230,	1221,	619,	172,	2980,	360,	3245,	1016,	2569,	424,	390,	454)
#' x=c(0,	0,	0,	0,	0,	0.25,	1.81,	2.52,	2.6,	3.68,	7.58,	10.07,	13.33,	13.33,	24.99)
#' gini(x,y)
#' #0.453 same as example in http://www.nefsc.noaa.gov/publications/crd/pdfs/crd9605f.pdf
#' @author  Adam Cook, \email{Adam.Cook@@dfo-mpo.gc.ca}
#' @export


gini <- function(x,y){
			Xi <- data.frame(yh=x,Ah=y)
		    Xi$P = Xi$yh * Xi$Ah
		    Xi = Xi[order(Xi$P),]
		    Xi$cP = cumsum(Xi$P) / sum(Xi$P)
		    Xi$cA = cumsum(Xi$Ah) / sum(Xi$Ah)
		    gI = 1-(2*sum(rowMeans(embed(Xi$cP,2)) * diff(Xi$cA)))
		    return(gI)
			}