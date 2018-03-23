
(PART\*) Miscellany {#part-misc .unnumbered}
========================================================================

Scratch paper
========================================================================

This book is made with bookdown, an R package/tool-chain for creating a
books in multiple formats. This chapter is just a placeholder section
and some scratch-paper so that I have some examples on-hand of how to
use bookdown's syntax and features.

***

This is *a book* written in **Markdown**. You can use anything that
Pandoc's Markdown supports, e.g., a math equation $a^2 + b^2 = c^2$.

For now, you have to install the development versions of **bookdown**
from Github:



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

Bookdown cheatsheet
------------------------------------------------------------------------

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



The caption for Figure \@ref(fig:happy-cat) is defined as a *text
reference* below and passed to the `fig.cap` chunk option.

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




Custom blocks
------------------------------------------------------------------------

\Begin{infobox}
<div class = "infobox">

**Okay**. This book is made with bookdown, an R package/tool-chain for
creating a books in multiple formats. This chapter is just a placeholder
section and some scratch-paper so that I have some examples on-hand of
how to use bookdown's syntax and features.

Some text for this block.

  - a list item
  - another item
  - end the list with a blank line

</div>
\End{infobox}
