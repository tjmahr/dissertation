






# Quick testing sandbox

_This is a chapter for quickly previewing and testing how content appears_

We fit a generalized additive model with fast restricted maximum likelihood
estimation [@Wood2017; @Soskuthy2017 for a tutorial for linguists; see Box 1].
We included main effects of study year. These *parametric* terms work like
conventional regression effects and determined the growth curve's average
values. We used age-4 as the reference year, so the model's intercept
represented the average looking probability at age 4. The model's year effects
therefore represented differences between age 4 vs. age 3 and age 4 vs. age 5.

We included a *smooth* term for time. We included a smooth term for trial time
to represent a general effect of time following noun onset across all studies,
and we also included smooth terms for time for each study. These study-specific
smooths estimate how the shape of the data differs in each individual study. As
an equation, our model estimated: [@Barr2008;]
[vers. 2.3; @itsadug]





\Begin{infobox}
<div class = "infobox">
**Box 1: The Intuition Behind Generalized Additive Models**.

In these analyses, the outcome of interest is a value that changes over time in
a nonlinear way. We model these time series by building a set of features to
represent time values. In the growth curve analyses of familiar word
recognition, we used a set of polynomial features which expressed time as the
weighted sum of a linear trend, a quadratic trend and cubic trend. That is:

$$
\text{log-odds}(\mathit{looking}) = 
  \alpha + \beta_1 * \textit{Time}^1 +
           \beta_2 * \textit{Time}^2 +
           \beta_3 * \textit{Time}^3
$$

But another way to think about the polynomial terms is as *basis functions*: A
set of features that combine to approximate some nonlinear function of
time. Under this framework, the model can be expressed as:

$$
\text{log-odds}(\mathit{looking}) = 
  \alpha + f(\textit{Time})
$$
  
This is the idea behind generalized additive models and their *smooth terms*.
These smooths fit nonlinear functions of data by weighting and adding 
simple functions together. The figures below show 9 basis functions from a
"thin-plate spline" and how they can be weighted and summed to fit a growth
curve.

<img src="81-test_files/figure-html/infobox-1-figs-1.png" width="66%" style="display: block; margin: auto;" />

Each of these basis functions is weighted by a model coefficient, but the
individual basis functions are not a priori meaningful. Rather, it is the whole
set of functions that approximate the curvature of the data---i.e.,
*f*(Time))---so we statistically evaluate the whole batch of coefficients
simultaneously. This joint testing is similar to how one might test a batch of
effects in an ANOVA. If the batch of effects jointly improve model fit, we infer
that there is a significant smooth or shape effect. (Not quite sure this is 100%
accurate yet.)

Smooth terms come with an estimated degrees of freedom (EDF). These values
provide a sense of how many degrees of freedom the smooth consumed. An EDF of 1
is a perfectly straight line, indicating no smoothing. Higher EDF values
indicate that the smooth term captured more curvature from the data.

<!-- The other important thing to know about generalized additive models is that -->
<!-- wigglyness is penalized. With so many functions, one might worry about -->
<!-- overfitting the data and including incidental wiggliness into *f*(Time). These -->
<!-- models, however, include a smoothing parameter that -->
</div>
\End{infobox}
