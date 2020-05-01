## Test environments

release 4.0.0

* OSX (local) - release
* OSX (actions) - release and devel
* Ubuntu (actions) - 3.3 to release
* Windows (winbuilder) - devel
* Windows (actions) - release

## R CMD check results

0 errors | 0 warnings | 0 note

## CRAN Package Check Results

> The errors with r-devel are from a recent change to c.Date which now
reasonably coerces all arguments to Date.

> In your case, the error is from

   seq <- dtt_seq(from, to, units = units)
   seq <- setdiff(seq, x)
   if (unique) 
       x <- unique(x)
   x <- c(x, seq)

> in dttr2:::dtt_complete.Date(): as documented, setdiff() coerces to
(here, a numeric) vector, and as.Date.numeric insists on an origin.  I
think you could do

   seq <- as.Date(setdiff(seq, x), origin = "1970-01-01")

> Can you pls fix as necessary?

