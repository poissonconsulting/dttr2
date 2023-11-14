## Test environments

release 0.5.0

* OSX (local) - release
* OSX (actions) - release and devel
* Windows (actions) - 3.6, 4.1, release and devel
* Ubuntu (actions) - 3.6, 4.0, 4.1, 4.2, release and devel
* Windows (winbuilder) - devel

## R CMD check results

0 errors | 0 warnings | 0 notes

## revdepcheck results

We checked 1 reverse dependencies, comparing R CMD check results across CRAN and dev versions of this package.

 * We saw 0 new problems
 * We failed to check 0 packages
 
## Response to Emails from CRAN
 
Removed the skip tests on various operating systems. 
Removed tests that were failing due to fix of fractional seconds bug in R. 
