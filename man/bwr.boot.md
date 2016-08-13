---
title: 'R: Calculate BWR bootstrap'
---

  ---------------------- -----------------
  bwr.boot {BIOsurvey}   R Documentation
  ---------------------- -----------------

Calculate BWR bootstrap
-----------------------

### Description

Calculate BWR bootstrap as per Sitter (1992a,b). The BWR is a special
case of Sitter's Mirror-Match method.

### Usage

    bwr.boot(X, kh, ph, FUN, ... ,simplify = TRUE)

### Arguments

  ------------ ------------------------------------------------------------------------------------
  `X`          Vector of observations
  `kh`         Repeat factor for the without replacement stage
  `ph`         Probability for randomization between bracketing integers when `kh` is non-integer
  `FUN`        function for randomly sampling from `X`
  `...`        optional arguments to FUN.
  `simplify`   logical; should the result be simplified to a vector or matrix if possible?
  ------------ ------------------------------------------------------------------------------------

### Details

This is an internal function called by `boot.strata` and is not meant to
be used on it's own.

### Author(s)

Stephen J. Smith, <smithsj@mar.dfo-mpo.gc.ca>

### References

Sitter, R.R. (1992a). A resampling procedure for complex survey data.
*J. Am. Stat. Assoc.* bf{87}: 755–765.

Sitter, R.R. (1992b). Comparing three bootstrap methods for survey data.
*Can. J. Stat.* **20**: 135–154.

### See Also

`boot.strata`

------------------------------------------------------------------------

<div align="center">

\[Package *BIOsurvey* version 1.0-2 [Index\]](00Index.html)

</div>
