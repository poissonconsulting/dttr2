## Test environments

release 4.1.1

* OSX (local) - release
* OSX (actions) - release
* Ubuntu (actions) - 3.4 to 3.6, oldrel, release and devel
* Windows (actions) - release
* Windows (winbuilder) - devel

## R CMD check results

0 errors | 0 warnings | 0 notes

## revdepcheck results

We checked 1 reverse dependencies, comparing R CMD check results across CRAN and dev versions of this package.

 * We saw 0 new problems
 * We failed to check 0 packages

## CRAN Package Check Results for Package dttr2

Version: 0.3.0 
Check: LazyData 
Result: NOTE 
     'LazyData' is specified without a 'data' directory 

  Fixed by removing LazyData
  
Version: 0.3.0 
Check: tests 
Result: ERROR 

  Fixed by removing names from vectors.