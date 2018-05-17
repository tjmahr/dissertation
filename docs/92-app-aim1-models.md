
Computational details for Specific Aim 1 {#aim1-gca-models}
========================================================================

Growth curve analyses
------------------------------------------------------------------------

These models were fit in R [vers. 3.4.3; @R-base] with the RStanARM package
[vers. 2.16.3; @R-rstanarm].

When I computed the orthogonal polynomial features for Time, they were
scaled so that the linear feature ranged from −.5 to .5. Under this
scaling a unit change in Time^1^ was equal to change from the start to
the end of the analysis window. Table \@ref(tab:poly-feature-range) shows
the ranges of the time features.


Table: (\#tab:poly-feature-range)Ranges of the polynomial time features.

Feature                      Min       Max     Range
------------------  ------------  --------  --------
Time^1^              &minus;0.50      0.50      1.00
Time^2^              &minus;0.33      0.60      0.93
Time^3^              &minus;0.63      0.63      1.26
Trial window (ms)         250.00   1500.00   1250.00

It took approximately 24 hours to run the model on four Monte Carlo
sampling chains with 1000 warm-up iterations and 1000 sampling
iterations. Warm-up iterations are discarded, so the model
comprises 4000 samples from the posterior distribution.

The code used to fit the model with RStanARM is printed below. The
variables `ot1`, `ot2`, and `ot3` are the polynomial time features,
`ResearchID` identifies children, and `Study` identifies the age/year of
the study. `Primary` counts the number of looks to the target image at
each time bin; `Others` counts looks to the other three images.
`cbind(Primary, Others)` is used to package both counts together for a
logistic regression.


```r
library(rstanarm)

# Run chains on different cores
options(mc.cores = parallel::detectCores())

m <- stan_glmer(
  cbind(Primary, Others) ~
    (ot1 + ot2 + ot3) * Study +
    (ot1 + ot2 + ot3 | ResearchID/Study),
  family = binomial,
  prior = normal(0, 1),
  prior_intercept = normal(0, 5),
  prior_covariance = decov(1, 1, 1),
  data = d_m)

# Save the output
readr::write_rds(m, "./data/stan_aim1_cubic_model.rds.gz")
```

The code `cbind(Primary, Others) ~ (ot1 + ot2 + ot3) * Study` fits a
cubic growth curve for each year of the study. It uses R's
formula syntax to regress the looking counts onto an intercept term
(implicitly included by default), `ot1`, `ot2`, `ot3` along with the
interactions of the `Study` variable with the intercept, `ot1`, `ot2`,
and `ot3`. 

The line `(ot1 + ot2 + ot3 | ResearchID/Study)` describes the
random-effect structure of the model with the `/` indicating that data
from each `Study` is nested within each `ResearchID`. Thus, for each
child, we have a general intercept and general effects for Time^1^,
Time^2^, and Time^3^. These child-level effects are further adjusted
using `Study:ResearchID` effects. The effects in each level are allowed
to correlate. For example, I would expect that participants with low
average looking probabilities (low intercepts) to have flatter growth
curves (low Time^1^ effects), and this relationship would be captured by
one of the random-effect correlation terms. All told, the random effect
structure and point estimates for these effects were:




```
#> Error terms:
#>  Groups           Name        Std.Dev. Corr             
#>  Study:ResearchID (Intercept) 0.305                     
#>                   ot1         0.691     0.20            
#>                   ot2         0.437    -0.11  0.02      
#>                   ot3         0.294    -0.11 -0.44 -0.06
#>  ResearchID       (Intercept) 0.264                     
#>                   ot1         0.423     0.78            
#>                   ot2         0.125    -0.75 -0.56      
#>                   ot3         0.058    -0.23 -0.31  0.19
#> Num. levels: Study:ResearchID 484, ResearchID 195
```

The model used the following priors:


```r
prior_summary(m)
#> Priors for model 'm' 
#> ------
#> Intercept (after predictors centered)
#>  ~ normal(location = 0, scale = 5)
#> 
#> Coefficients
#>  ~ normal(location = [0,0,0,...], scale = [1,1,1,...])
#>      **adjusted scale = [3.33,3.33,3.33,...]
#> 
#> Covariance
#>  ~ decov(reg. = 2, conc. = 1, shape = 1, scale = 1)
#> ------
#> See help('prior_summary.stanreg') for more details
```

The priors for the intercept and regression coefficients are wide, very
weakly informative normal distributions. These distributions are
centered at 0, so negative and positive effects are equally likely. The
intercept distribution as a standard deviation of 5, and the
coefficients have a distribution around 3. On the log-odds scale, 95%
looking to target would be 2.94, so effects of this magnitude are easily
accommodated by distributions like Normal(0 [mean], 3 [SD]) and
Normal(0, 5).

For the random-effect part of the model, I used RStanARM's `decov()`
prior which simultaneously sets a prior on the variances and
correlations of the model's random effect terms. I used the default
prior for the variance terms and applied a weakly informative LKJ(2)
prior on the random-effect correlations. Figure \@ref(fig:lkj-prior)
shows samples from the prior distribution of two dummy models fit with
the default LKJ(1) prior and the weakly informative LKJ(2) prior used
here. Under LKJ(2), extreme correlations are less plausible; the prior
shifts the probability mass away from the ±1 boundaries towards the
center. The motivation for this kind of prior was *regularization*: I
give the model a small amount of information to nudge it away from
extreme, degenerate values.

(ref:lkj-prior) Samples of correlation effects drawn from LKJ(1) and
LKJ(2) priors. 

<div class="figure" style="text-align: center">
<img src="92-app-aim1-models_files/figure-html/lkj-prior-1.png" alt="(ref:lkj-prior)" width="50%" />
<p class="caption">(\#fig:lkj-prior)(ref:lkj-prior)</p>
</div>






Generalized additive models
------------------------------------------------------------------------

To model the looks to the competitor images, I used generalized additive
(mixed) models. The models were fit in R (vers. 3.4.3) using the mgcv R
package [vers. 1.8.23; @Wood2017] with support from tools in the
itsadug R package [vers. 2.3; @itsadug].

I will briefly walk through the code used to fit one of these models in
order to articulate the modeling decisions at play. I first convert
the categorical variables into the right types, so that the model can 
fit difference smooths.


```r
# Create a Study dummy variabe with Age 4 as the reference level
phon_d$S <- factor(phon_d$Study, c("TimePoint2", "TimePoint1", "TimePoint3"))

# Convert the ResearchID into a factor
phon_d$R <- as.factor(phon_d$ResearchID)

# Convert the Study factor (phon_d$S) into an ordered factor.
# This step is needed for the ti model estimate difference smooths.
phon_d$S2 <- as.ordered(phon_d$S)
contrasts(phon_d$S2) <- "contr.treatment"
contrasts(phon_d$S2)
```

I fit the generalized additive model with the code below. The outcome
`elog` is the empirical log-odds of looking to the phonological
competitor relative to the unrelated word.


```r
phon_gam <- bam(
  elog ~ S2 +
    s(Time) + s(Time, by = S2) +
    s(Time, R, bs = "fs", m = 1, k = 5),
  data = phon_d)

# Save the output
readr::write_rds(phon_gam, "./data/aim1-phon-random-smooths.rds.gz")
```

There is just one parametric term: `S2`. The term computes the average
effect of each study with Age 4 serving as the reference condition (and
as the model intercept).

Next come the smooth terms. `s(Time)` fits the shape of Time for the
reference condition (Age 4). `s(Time, by = S2)` fits the difference
smooths for Age 3 versus Age 4 and Age 5 versus Age 4. 
`s(Time, R, bs = "fs", m = 1, k = 5)` fits a smooth for each participant
(`R`). `bs = "fs"` means that the model should use a factor smooth
(`fs`) basis (`bs`)---that is, a "random effect" smooth for each
participant. `m = 1` changes the smoothness penalty so that the
random effects are pulled towards the group average; @Winter2016 and
@Baayen2016 suggest using this option. `k = 5` means to use 5 knots (`k`)
for the basis function. The other smooths use the default number of
knots (10). I used fewer knots for the by-child smooths because of
limited data. As a result, these smooths capture by-child variation by
making coarse adjustments to study-level growth curves. 
