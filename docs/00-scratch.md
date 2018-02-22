
# Scratch paper

This book is made with bookdown, an R package/tool-chain for creating a books in
multiple formats. This chapter is just a placeholder section and some
scratch-paper so that I have some examples on-hand of how to use bookdown's
syntax and features.

***

This is _a book_ written in **Markdown**. You can use anything that
Pandoc's Markdown supports, e.g., a math equation $a^2 + b^2 = c^2$.

For now, you have to install the development versions of **bookdown** from
Github:



```r
devtools::install_github("rstudio/bookdown")
```

Code settings:




```r
library(methods)
knitr::opts_chunk$set(
  tidy = FALSE,
  collapse = TRUE,
  comment = "#>",
  out.width = 80
)

options(width = 80)
```

## Bookdown cheatsheet

### Cross-references to sections {#manual-section-label-demo}

The headings above were written with the following markdown:

```markdown
## Bookdown cheatsheet

### Cross-references to sections {#manual-section-label-demo}
```

The first one gets an implicit label. The second one has an 
explicit section label.

```markdown
I can refer to Section \@ref(bookdown-cheatsheet) and 
[link to it](#bookdown-cheatsheet) with its implicit label.

I can refer to Section \@ref(manual-section-label-demo) and 
[link to it](#manual-section-label-demo) with its explicit label.
```

I can refer to Section \@ref(bookdown-cheatsheet) and 
[link to it](#bookdown-cheatsheet) with its implicit label.

I can refer to Section \@ref(manual-section-label-demo) and 
[link to it](#manual-section-label-demo) with its explicit label.

### Cross-references to appendices

The sample principles apply to appendices.

```markdown
This is a reference to [an appendix](#mp-experiment-items)

The number of that appendix \@ref(mp-experiment-items). I hope.

Both: See [Appendix \@ref(mp-experiment-items)](#mp-experiment-items)
```

This is a reference to [an appendix](#mp-experiment-items)

The number of that appendix \@ref(mp-experiment-items). I hope.

Both: See [Appendix \@ref(mp-experiment-items)](#mp-experiment-items)

### Cross-references to tables

````markdown
The chunk label `table-single` provides an implicit label 
for Table \@ref(tab:table-single).

```{r table-single, echo = FALSE}
knitr::kable(
  head(mtcars[, 1:5], 5), booktabs = TRUE,
  caption = 'A table of the first 5 rows of the mtcars data.'
)
```
````

The chunk label `table-single` provides an implicit label 
for Table \@ref(tab:table-single).


Table: (\#tab:table-single)A table of the first 5 rows of the mtcars data.

                      mpg   cyl   disp    hp   drat
------------------  -----  ----  -----  ----  -----
Mazda RX4            21.0     6    160   110   3.90
Mazda RX4 Wag        21.0     6    160   110   3.90
Datsun 710           22.8     4    108    93   3.85
Hornet 4 Drive       21.4     6    258   110   3.08
Hornet Sportabout    18.7     8    360   175   3.15

### Figure references and using text references as captions

````markdown
The caption for Figure \@ref(fig:cat) is defined as a _text reference_
below and passed to the `fig.cap` chunk option.

(ref:cat-cap) This is a happy cat.

```{r cat, fig.cap = "(ref:cat-cap)", out.width = "30%", fig.show = "hold"}
knitr::include_graphics(
  rep("./misc/happy-cat-grooming-itself-vector-file.png", 2)
)
```
````

<!-- I actually can't use that same text-reference label here because  -->
<!-- then that text will be injected into the code block above, so I -->
<!-- add `happy-` to the labels. -->




The caption for Figure \@ref(fig:happy-cat) is defined as a _text reference_
below and passed to the `fig.cap` chunk option.

(ref:happy-cat-cap) This is a happy cat.



```r
knitr::include_graphics(
  rep("./misc/happy-cat-grooming-itself-vector-file.png", 2)
)
```

<div class="figure">
<img src="./misc/happy-cat-grooming-itself-vector-file.png" alt="(ref:happy-cat-cap)" width="30%" /><img src="./misc/happy-cat-grooming-itself-vector-file.png" alt="(ref:happy-cat-cap)" width="30%" />
<p class="caption">(\#fig:happy-cat)(ref:happy-cat-cap)</p>
</div>





## Debug info


```r
str(list(html = is_html_output(), latex = is_latex_output(),
         word = is_word_output(), width = options("width")[[1]]))
#> List of 4
#>  $ html : logi TRUE
#>  $ latex: logi FALSE
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
#>  date     2018-02-22
#> Packages ----------------------------------------------------------------------
#>  package   * version date       source        
#>  backports   1.1.2   2017-12-13 CRAN (R 3.4.3)
#>  base      * 3.4.3   2017-11-30 local         
#>  bookdown    0.7     2018-02-18 CRAN (R 3.4.3)
#>  compiler    3.4.3   2017-11-30 local         
#>  datasets  * 3.4.3   2017-11-30 local         
#>  devtools    1.13.5  2018-02-18 CRAN (R 3.4.3)
#>  digest      0.6.15  2018-01-28 CRAN (R 3.4.3)
#>  evaluate    0.10.1  2017-06-24 CRAN (R 3.4.1)
#>  graphics  * 3.4.3   2017-11-30 local         
#>  grDevices * 3.4.3   2017-11-30 local         
#>  highr       0.6     2016-05-09 CRAN (R 3.2.3)
#>  htmltools   0.3.6   2017-04-28 CRAN (R 3.4.0)
#>  knitr       1.20    2018-02-20 CRAN (R 3.4.3)
#>  magrittr    1.5     2014-11-22 CRAN (R 3.1.2)
#>  memoise     1.1.0   2017-04-21 CRAN (R 3.3.2)
#>  methods   * 3.4.3   2017-11-30 local         
#>  parallel    3.4.3   2017-11-30 local         
#>  Rcpp        0.12.15 2018-01-20 CRAN (R 3.4.3)
#>  rmarkdown   1.8     2017-11-17 CRAN (R 3.4.1)
#>  rprojroot   1.3-2   2018-01-03 CRAN (R 3.4.3)
#>  stats     * 3.4.3   2017-11-30 local         
#>  stringi     1.1.6   2017-11-17 CRAN (R 3.4.2)
#>  stringr     1.3.0   2018-02-19 CRAN (R 3.4.3)
#>  tools       3.4.3   2017-11-30 local         
#>  utils     * 3.4.3   2017-11-30 local         
#>  withr       2.1.1   2017-12-19 CRAN (R 3.4.3)
#>  xfun        0.1     2018-01-22 CRAN (R 3.4.3)
#>  yaml        2.1.16  2017-12-12 CRAN (R 3.4.3)

last_four_commits <- git2r::commits(git2r::repository("."), n = 4)
msgs <- lapply(last_four_commits, methods::show)
#> [bccb622] 2018-02-22: rebuild book
#> [07019a6] 2018-02-20: snapshot
#> [c992330] 2018-02-16: start working on gam stuf
#> [57b8bbf] 2018-02-13: plots
```





Built with love using R [Version 3.4.3; @R-base] and the R-packages *bayesplot* [Version 1.4.0.9000; @R-bayesplot], *bookdown* [Version 0.7; @R-bookdown], *dplyr* [Version 0.7.4; @R-dplyr], *ggplot2* [Version 2.2.1; @R-ggplot2], *knitr* [Version 1.20; @R-knitr], *littlelisteners* [Version 0.0.0.9000; @R-littlelisteners], *lme4* [Version 1.1.15; @R-lme4], *rlang* [Version 0.1.6; @R-rlang], *rmarkdown* [Version 1.8; @R-rmarkdown], *rstanarm* [Version 2.17.3; @R-rstanarm], *tjmisc* [Version 0.0.0.9000; @R-tjmisc], and *tristan* [Version 0.0.0.9000; @R-tristan].
