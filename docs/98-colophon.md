
\backmatter

# Colophon {-}

## Debug info


```r
str(list(html = is_html_output(), latex = is_latex_output(),
         word = is_word_output(), width = options("width")[[1]]))
#> List of 4
#>  $ html : logi FALSE
#>  $ latex: logi TRUE
#>  $ word : logi FALSE
#>  $ width: int 80

devtools::session_info()
#> Session info ------------------------------------------------------------------
#>  setting  value                       
#>  version  R version 3.4.3 (2017-11-30)
#>  system   x86_64, mingw32             
#>  ui       RTerm                       
#>  language (EN)                        
#>  collate  English_United States.1252  
#>  tz       America/Chicago             
#>  date     2018-04-13
#> Packages ----------------------------------------------------------------------
#>  package    * version date       source        
#>  assertthat   0.2.0   2017-04-11 CRAN (R 3.3.2)
#>  backports    1.1.2   2017-12-13 CRAN (R 3.4.3)
#>  base       * 3.4.3   2017-11-30 local         
#>  bindr        0.1.1   2018-03-13 CRAN (R 3.4.3)
#>  bindrcpp     0.2.2   2018-03-29 CRAN (R 3.4.4)
#>  bookdown     0.7     2018-02-18 CRAN (R 3.4.3)
#>  colorspace   1.3-2   2016-12-14 CRAN (R 3.3.2)
#>  compiler     3.4.3   2017-11-30 local         
#>  datasets   * 3.4.3   2017-11-30 local         
#>  devtools     1.13.5  2018-02-18 CRAN (R 3.4.3)
#>  digest       0.6.15  2018-01-28 CRAN (R 3.4.3)
#>  dplyr        0.7.4   2017-09-28 CRAN (R 3.4.2)
#>  evaluate     0.10.1  2017-06-24 CRAN (R 3.4.1)
#>  ggplot2      2.2.1   2016-12-30 CRAN (R 3.4.1)
#>  glue         1.2.0   2017-10-29 CRAN (R 3.4.2)
#>  graphics   * 3.4.3   2017-11-30 local         
#>  grDevices  * 3.4.3   2017-11-30 local         
#>  grid         3.4.3   2017-11-30 local         
#>  gtable       0.2.0   2016-02-26 CRAN (R 3.2.3)
#>  htmltools    0.3.6   2017-04-28 CRAN (R 3.4.0)
#>  huskydown    0.0.4   2018-04-13 local         
#>  knitr        1.20    2018-02-20 CRAN (R 3.4.3)
#>  lazyeval     0.2.1   2017-10-29 CRAN (R 3.4.2)
#>  magrittr     1.5     2014-11-22 CRAN (R 3.1.2)
#>  memoise      1.1.0   2017-04-21 CRAN (R 3.3.2)
#>  methods    * 3.4.3   2017-11-30 local         
#>  munsell      0.4.3   2016-02-13 CRAN (R 3.2.3)
#>  parallel     3.4.3   2017-11-30 local         
#>  pillar       1.2.1   2018-02-27 CRAN (R 3.4.3)
#>  pkgconfig    2.0.1   2017-03-21 CRAN (R 3.3.3)
#>  plyr         1.8.4   2016-06-08 CRAN (R 3.3.0)
#>  R6           2.2.2   2017-06-17 CRAN (R 3.4.0)
#>  Rcpp         0.12.16 2018-03-13 CRAN (R 3.4.4)
#>  rlang        0.2.0   2018-02-20 CRAN (R 3.4.3)
#>  rmarkdown    1.9     2018-03-01 CRAN (R 3.4.3)
#>  rprojroot    1.3-2   2018-01-03 CRAN (R 3.4.3)
#>  scales       0.5.0   2017-08-24 CRAN (R 3.4.1)
#>  stats      * 3.4.3   2017-11-30 local         
#>  stringi      1.1.7   2018-03-12 CRAN (R 3.4.4)
#>  stringr      1.3.0   2018-02-19 CRAN (R 3.4.3)
#>  tibble       1.4.2   2018-01-22 CRAN (R 3.4.3)
#>  tools        3.4.3   2017-11-30 local         
#>  utils      * 3.4.3   2017-11-30 local         
#>  withr        2.1.2   2018-03-15 CRAN (R 3.4.4)
#>  xfun         0.1     2018-01-22 CRAN (R 3.4.3)
#>  yaml         2.1.18  2018-03-08 CRAN (R 3.4.3)

last_four_commits <- git2r::commits(git2r::repository("."), n = 4)
msgs <- lapply(last_four_commits, methods::show)
#> [348d182] 2018-04-13: rename aim1 chapter files
#> [e90d795] 2018-04-12: work on discussion
#> [7b11b40] 2018-04-12: start general discussion
#> [d951535] 2018-04-12: packages updated
```





Built with love using R [Version 3.4.3; @R-base] and the R-packages *bayesplot* [Version 1.5.0; @R-bayesplot], *bookdown* [Version 0.7; @R-bookdown], *dplyr* [Version 0.7.4; @R-dplyr], *ggplot2* [Version 2.2.1; @R-ggplot2], *knitr* [Version 1.20; @R-knitr], *littlelisteners* [Version 0.0.0.9000; @R-littlelisteners], *lme4* [Version 1.1.17; @R-lme4], *rlang* [Version 0.2.0; @R-rlang], *rmarkdown* [Version 1.9; @R-rmarkdown], *rstanarm* [Version 2.17.3; @R-rstanarm], *tjmisc* [Version 0.0.0.9000; @R-tjmisc], and *tristan* [Version 0.0.0.9000; @R-tristan].


***

This is the original colophon from the huskydown package. I need to
reword and note my modifications.

> This document is set in [EB
> Garamond](https://github.com/georgd/EB-Garamond), [Source Code
> Pro](https://github.com/adobe-fonts/source-code-pro/) and
> [Lato](http://www.latofonts.com/lato-free-fonts/). The body text is
> set at 11pt with $\familydefault$.

> It was written in R Markdown and $\LaTeX$, and rendered into PDF
> using [huskydown](https://github.com/benmarwick/huskydown) and
> [bookdown](https://github.com/rstudio/bookdown).

> This document was typeset using the XeTeX typesetting system, and the
> [University of Washington Thesis
> class](http://staff.washington.edu/fox/tex/) class created by Jim Fox.
> Under the hood, the [University of Washington Thesis LaTeX
> template](https://github.com/UWIT-IAM/UWThesis) is used to ensure that
> documents conform precisely to submission standards. Other elements of
> the document formatting source code have been taken from the [Latex,
> Knitr, and RMarkdown templates for UC Berkeley's graduate
> thesis](https://github.com/stevenpollack/ucbthesis), and [Dissertate:
> a LaTeX dissertation template to support the production and
> typesetting of a PhD dissertation at Harvard, Princeton, and
> NYU](https://github.com/suchow/Dissertate)

> The source files for this thesis, along with all the data files, have
> been organised into an R package, xxx, which is available at
> <https://github.com/xxx/xxx>. A hard copy of the thesis can be found
> in the University of Washington library.
