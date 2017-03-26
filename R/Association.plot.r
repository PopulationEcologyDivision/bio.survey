#' @export
 Association.plot <- function (data, hydro, strata.group, species = NULL, subset, plot = TRUE, ...) {
    attach(data)
    if (!missing(subset)) {
        data <- data[subset, ]
    }
    detach("data")
    strata.use <- is.element(data$Strata, strata.group$Strata)
    nHy = hydro
    hydro <- (data[hydro])[strata.use, ]
    if (is.null(species)) 
        species <- rep.int(1, length(hydro))
    else species <- (data[species])[strata.use, ]
    
    Strata <- data$Strata[strata.use]
    if (is.null(species)) 
        species <- rep.int(1, length(hydro))
    tempy <- cbind(hydro, species, Strata)
    if (any(is.na(hydro))) 
        tempy <- (na.omit(as.data.frame(tempy)))
    hydro <- as.numeric(tempy[, 1])
    species <- as.numeric(as.vector(tempy[, 2]))
    Strata <- as.numeric(tempy[, 3])
    WH <- strata.group$NH
    na.strata <- match(strata.group$Strata, unique(Strata))
    WH[is.na(na.strata)] <- NA
    IWH <- cbind(strata.group$Strata, WH)
    IWH <- (na.omit(as.data.frame(IWH)))
    WH <- as.numeric(IWH$WH)
    IWH <- IWH[[1]]
    WH <- (WH/sum(WH))
    yhi <- split(species, Strata)
    nh <- as.vector(sapply(yhi, length))
    yst <- sum(WH * as.vector(sapply(yhi, mean)))
    sort.hydro <- unique(sort(hydro))
    wh <- WH/(nh * yst)
    Whi <- rep(0, length(species))
    for (i in seq(along = wh)) Whi[c(Strata == IWH[i])] <- wh[i]
    Whi <- Whi * species
    gt <- cumsum(sapply(split(Whi, hydro), sum))
    res <- list(x = sort.hydro, y = as.vector(gt))
    if (plot) {
        Association.int.plot(res, xlab=nHy)
        invisible(res)
    }
    else {
        class(res) <- "assocplot"
        res
    }
}
