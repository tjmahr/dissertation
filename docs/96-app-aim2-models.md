
Computational details for Specific Aim 2 {#aim2-gca-models}
========================================================================

Growth curve analyses
------------------------------------------------------------------------

These models were fit in R [vers. 3.5.0; @R-base] with the brms package
[vers. 2.3.1; @brms].

The orthogonal polynomial features for Time, they were scaled as in
Specific Aim 1, so that the linear feature ranged from −.5 to .5. Under
this scaling a unit change in Time^1^ was equal to change from the start
to the end of the analysis window.

The model formula used to specify the model with brms is printed below.
The variables `ot1`, `ot2`, and `ot3` are the polynomial time features,
`ResearchID` identifies children, and `Condition` identifies the
experimental condition (either, the nonword or real word condition).
`Target` counts the number of looks to the target image at each time
bin; `trials()` is a flag that tells brms the number of trials for the
binomial process. Here, it is the variable `Trials`, which is equal to
the number of looks to target and distractor in each bin. 
The syntax `(1 + ot1 + ot2 + ot3) * Condition` specifies a Time x
Condition interaction; it says to estimate an intercept and the three
time feature effects for each condition.
The line `(ot1 + ot2 + ot3 | ResearchID/Condition)` describes the
random-effect structure of the model with the `/` indicating that data
from each `Condition` is nested within each `ResearchID`.


```r
library(brms)

# Fit a hierarchical logistic regression model
formula <- bf(
  Target | trials(Trials) ~ 
    (1 + ot1 + ot2 + ot3) * Condition + 
    (1 + ot1 + ot2 + ot3 | ResearchID/Condition), 
  family = binomial)
```

The priors for the model are described below. The regression effects
(`class = "b"`) have a moderately informative prior of Normal(0, 1).
Because most of the action in the growth curves is a sharp rise, the
linear time effect `ot1` has a slightly wider prior of Normal(0, 2). A
weakly informative LKJ(2) prior is put on the random effect
correlations. I review the role of the LKJ prior in  
[Appendix \@ref(aim1-gca-models)](#aim1-gca-models). A weakly informative
prior is put on the random effect standard deviations
Student-t([df] 7, [mean] 0, [sd] 3). The Student-t distribution
with is like the normal distribution but it provides slightly thicker
tails which allow extreme or outlying values.


```r
priors <- c(
  set_prior(class = "Intercept", "normal(0, 1)"),
  set_prior(class = "b", "normal(0, 1)"),
  set_prior(class = "b", coef = "ot1", "normal(0, 2)"),
  set_prior(class = "cor", "lkj(2)"),
  set_prior(class = "sd", "student_t(7, 0, 3)"))
```

I fit a separate model for each year of the study using syntax like the
following. This fits the model using four sampling `chains` in parallel
over four processing `cores`. Early attempts at the model produced
warnings, so I increased the `adapt_delta` control option to make the
sampling more robust and eliminate the warnings.


```r
m_age3 <- brm(
  formula = formula,
  data = d_age3,
  prior = priors,
  chains = 4,
  cores = 4,
  control = list(adapt_delta = .99))

# Save the output
readr::write_rds(m_age3, "age3_mp.rds.gz")
```

I originally tried a single model containing all three years with
corresponding year effects, year-by-time interactions, and
year-by-condition-by-time conditions. But this model had difficulty
converging, and even when a passable model was obtained, a bug in the
modeling software prevented me from obtaining posterior predictions. I
reported the bug in an issue for the package's source code repository. 

### Model summaries

### Real words versus nonwords at age 3


```r
m1 <- readr::read_rds("./data/aim2-real-vs-nw-tp1.rds.gz")
summary(m1, priors = TRUE)
#>  Family: binomial 
#>   Links: mu = logit 
#> Formula: Target | trials(Trials) ~ (ot1 + ot2 + ot3) * Condition + (ot1 + ot2 + ot3 | ResearchID/Condition) 
#>    Data: test_data_1 (Number of observations: 7450) 
#> Samples: 4 chains, each with iter = 2000; warmup = 1000; thin = 1;
#>          total post-warmup samples = 4000
#> 
#> Priors: 
#> b ~ normal(0, 1)
#> b_ot1 ~ normal(0, 2)
#> Intercept ~ normal(0, 1)
#> L ~ lkj_corr_cholesky(2)
#> sd ~ student_t(7, 0, 3)
#> 
#> Group-Level Effects: 
#> ~ResearchID (Number of levels: 149) 
#>                    Estimate Est.Error l-95% CI u-95% CI Eff.Sample Rhat
#> sd(Intercept)          0.73      0.13     0.45     0.96        290 1.00
#> sd(ot1)                0.64      0.40     0.03     1.42         68 1.03
#> sd(ot2)                0.34      0.19     0.02     0.71        130 1.02
#> sd(ot3)                0.14      0.10     0.01     0.36        233 1.01
#> cor(Intercept,ot1)     0.25      0.33    -0.50     0.78        176 1.02
#> cor(Intercept,ot2)    -0.26      0.32    -0.79     0.44        838 1.00
#> cor(ot1,ot2)          -0.08      0.37    -0.72     0.66        380 1.01
#> cor(Intercept,ot3)     0.12      0.34    -0.58     0.74       1338 1.00
#> cor(ot1,ot3)           0.06      0.38    -0.67     0.74        740 1.00
#> cor(ot2,ot3)          -0.01      0.37    -0.68     0.70       1226 1.00
#> 
#> ~ResearchID:Condition (Number of levels: 298) 
#>                    Estimate Est.Error l-95% CI u-95% CI Eff.Sample Rhat
#> sd(Intercept)          1.24      0.08     1.10     1.40        611 1.00
#> sd(ot1)                2.66      0.16     2.35     2.98        320 1.01
#> sd(ot2)                1.40      0.09     1.23     1.57        572 1.00
#> sd(ot3)                0.83      0.05     0.72     0.94        923 1.00
#> cor(Intercept,ot1)     0.29      0.08     0.12     0.44        407 1.01
#> cor(Intercept,ot2)     0.06      0.10    -0.13     0.24        694 1.00
#> cor(ot1,ot2)           0.01      0.09    -0.16     0.18        631 1.00
#> cor(Intercept,ot3)    -0.10      0.09    -0.28     0.09        945 1.00
#> cor(ot1,ot3)          -0.06      0.09    -0.24     0.12       1202 1.00
#> cor(ot2,ot3)          -0.06      0.08    -0.23     0.10       1128 1.00
#> 
#> Population-Level Effects: 
#>                   Estimate Est.Error l-95% CI u-95% CI Eff.Sample Rhat
#> Intercept             0.41      0.12     0.18     0.66       1392 1.00
#> ot1                   4.59      0.24     4.13     5.06        744 1.01
#> ot2                  -1.36      0.13    -1.61    -1.11       1167 1.00
#> ot3                   0.39      0.08     0.23     0.55       1828 1.00
#> Conditionreal        -0.19      0.15    -0.48     0.10       1550 1.00
#> ot1:Conditionreal     0.45      0.31    -0.16     1.03        673 1.01
#> ot2:Conditionreal    -0.02      0.17    -0.37     0.31       1077 1.00
#> ot3:Conditionreal    -0.07      0.11    -0.29     0.15       1674 1.00
#> 
#> Samples were drawn using sampling(NUTS). For each parameter, Eff.Sample 
#> is a crude measure of effective sample size, and Rhat is the potential 
#> scale reduction factor on split chains (at convergence, Rhat = 1).
```

