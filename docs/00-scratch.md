
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
#>  version  R version 3.4.2 (2017-09-28)
#>  system   x86_64, mingw32             
#>  ui       RTerm                       
#>  language (EN)                        
#>  collate  English_United States.1252  
#>  tz       America/Chicago             
#>  date     2017-11-20
#> Packages ----------------------------------------------------------------------
#>  package   * version date       source        
#>  backports   1.1.1   2017-09-25 CRAN (R 3.4.1)
#>  base      * 3.4.2   2017-09-28 local         
#>  bookdown    0.5     2017-08-20 CRAN (R 3.4.1)
#>  compiler    3.4.2   2017-09-28 local         
#>  datasets  * 3.4.2   2017-09-28 local         
#>  devtools    1.13.4  2017-11-09 CRAN (R 3.4.2)
#>  digest      0.6.12  2017-01-27 CRAN (R 3.3.2)
#>  evaluate    0.10.1  2017-06-24 CRAN (R 3.4.1)
#>  graphics  * 3.4.2   2017-09-28 local         
#>  grDevices * 3.4.2   2017-09-28 local         
#>  highr       0.6     2016-05-09 CRAN (R 3.2.5)
#>  htmltools   0.3.6   2017-04-28 CRAN (R 3.4.0)
#>  knitr       1.17    2017-08-10 CRAN (R 3.4.1)
#>  magrittr    1.5     2014-11-22 CRAN (R 3.2.2)
#>  memoise     1.1.0   2017-04-21 CRAN (R 3.4.0)
#>  methods   * 3.4.2   2017-09-28 local         
#>  parallel    3.4.2   2017-09-28 local         
#>  Rcpp        0.12.13 2017-09-28 CRAN (R 3.4.2)
#>  rmarkdown   1.7     2017-11-10 CRAN (R 3.4.2)
#>  rprojroot   1.2     2017-01-16 CRAN (R 3.3.2)
#>  stats     * 3.4.2   2017-09-28 local         
#>  stringi     1.1.5   2017-04-07 CRAN (R 3.3.3)
#>  stringr     1.2.0   2017-02-18 CRAN (R 3.3.3)
#>  tools       3.4.2   2017-09-28 local         
#>  utils     * 3.4.2   2017-09-28 local         
#>  withr       2.1.0   2017-11-01 CRAN (R 3.4.2)
#>  yaml        2.1.14  2016-11-12 CRAN (R 3.3.2)

last_four_commits <- git2r::commits(git2r::repository("."), n = 4)
msgs <- lapply(last_four_commits, methods::show)
#> [5ddd2ce] 2017-11-17: word count
#> [2f516e9] 2017-11-17: add more words
#> [82c3565] 2017-11-17: add package citations
#> [74ecf92] 2017-11-16: write about predictions
```





Built with love using R [3.4.2, @R-base] and the R-packages *bayesplot* [1.4.0.9000, @R-bayesplot], *bookdown* [0.5, @R-bookdown], *dplyr* [0.7.4, @R-dplyr], *ggplot2* [2.2.1, @R-ggplot2], *knitr* [1.17, @R-knitr], *littlelisteners* [0.0.0.9000, @R-littlelisteners], *lme4* [1.1.14, @R-lme4], *rlang* [0.1.4.9000, @R-rlang], *rmarkdown* [1.7, @R-rmarkdown], *rstanarm* [2.15.3, @R-rstanarm], *tjmisc* [0.0.0.9000, @R-tjmisc], and *tristan* [0.0.0.9000, @R-tristan].
