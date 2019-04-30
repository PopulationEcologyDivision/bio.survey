.onAttach <- function(libname, pkgname) {
  localVer = utils::packageDescription('bio.survey')$Version
  packageStartupMessage(paste0("Version: ", localVer))
}
.onLoad <- function(libname, pkgname){
  options(stringsAsFactors = FALSE)
  Mar.utils::updateCheck(gitPkg = 'PopulationEcologyDivision/bio.survey')
}