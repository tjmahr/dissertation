
# Visualize looks to each image type

We continue our exploration of the raw data by aggregating looks to each image 
type. 





Earlier we cleaned the data to remove trials with excessive missing data 
and blocks of trials with too few trials. Read in that data.



Plot growth curves to each AOI.

<img src="15-aim1-notebook_files/figure-html/by-aoi-prop-1.png" width="100%" />

The looks to target increase year over year which decreases the remaining
proportion of looks for the other three images each year. To study the relative
propensity of looking to each image, we instead can use the log-odds of looking
to each AOI versus the unrelated image.


```
#> Warning: Removed 10559 rows containing non-finite values (stat_smooth).
```

<img src="15-aim1-notebook_files/figure-html/by-aoi-logit-1.png" width="100%" />

Each curve is the log odds of looking to the target, phonological foil, and
semantic foil versus the unrelated word. Positive values mean more looks to an
image type than the unrelated. If you think of the _y_ axis as the image's
_relatedness_ to the target, you can see a time course of relatedness in each
panel: Here early phonological effects meaning early relatedness and later,
flatter semantic effects meaning late relatedness. (These effects make even more
sense sense if phonological representations affect processing before semantic
ones.)

This plot suggests an important finding: Children becoming more sensitive to the
phonological and semantic foils as they grow older. (I use the verb *suggest*
because this is still a preliminary, unmodeled finding.) Jan and I had made
opposite predictions about whether this would happen. Her argument, I think, was
that children become better at word recognition by becoming better able to
inhibit interference from competing words. This plot would suggest that they
show increased sensitive to the target and foils words by looking less to the
unrelated word as they age and reapportioning those looks to the other three
lexically relevant words.

## Comparing strong versus weak foils

In @RWLPaper, we ignored trials for certain items where we didn't think the
phonological or semantic similarity was strong enough. The two sets of
phonological foils are shown below.


Table: (\#tab:print-phon-foil-tables)Trials with strong phonological foils.

Target   PhonologicalFoil   SemanticFoil   Unrelated 
-------  -----------------  -------------  ----------
bear     bell               horse          ring      
bee      bear               fly            heart     
bell     bee                drum           swing     
dress    drum               shirt          swing     
drum     dress              bell           sword     
flag     fly                kite           pear      
fly      flag               bee            pen       
heart    horse              ring           bread     
heart    horse              ring           pan       
horse    heart              bear           pan       
pan      pear               spoon          vase      
pan      pear               spoon          bell      
pear     pen                cheese         ring      
pear     pen                cheese         vase      
pen      pear               sword          van       
vase     van                gift           swan      



Table: (\#tab:print-phon-foil-tables)Trials with weak phonological foils.

Target   PhonologicalFoil   SemanticFoil   Unrelated 
-------  -----------------  -------------  ----------
bread    bear               cheese         vase      
cheese   shirt              bread          van       
gift     kite               vase           bread     
kite     gift               flag           shirt     
ring     swing              dress          flag      
shirt    cheese             dress          fly       
spoon    swan               pan            drum      
swan     spoon              bee            bell      
swan     spoon              bee            ring      
swing    spoon              kite           heart     
sword    swan               pen            gift      
van      pan                horse          sword     

The stronger phonological foils are pairs where the syllable onsets are the
same. The weaker foils include rime pairs, pairs where the words have
different syllable onsets, and pairs where the onsets differ by a phonetic
feature.


Table: (\#tab:print-semy-foil-tables)Trials with strong semantic foils.

Target   PhonologicalFoil   SemanticFoil   Unrelated 
-------  -----------------  -------------  ----------
bear     bell               horse          ring      
bee      bear               fly            heart     
bell     bee                drum           swing     
bread    bear               cheese         vase      
cheese   shirt              bread          van       
dress    drum               shirt          swing     
drum     dress              bell           sword     
fly      flag               bee            pen       
horse    heart              bear           pan       
pan      pear               spoon          vase      
pan      pear               spoon          bell      
pear     pen                cheese         ring      
pear     pen                cheese         vase      
shirt    cheese             dress          fly       
spoon    swan               pan            drum      



Table: (\#tab:print-semy-foil-tables)Trials with weak semantic foils.

Target   PhonologicalFoil   SemanticFoil   Unrelated 
-------  -----------------  -------------  ----------
flag     fly                kite           pear      
gift     kite               vase           bread     
heart    horse              ring           bread     
heart    horse              ring           pan       
kite     gift               flag           shirt     
pen      pear               sword          van       
ring     swing              dress          flag      
swan     spoon              bee            bell      
swan     spoon              bee            ring      
swing    spoon              kite           heart     
sword    swan               pen            gift      
van      pan                horse          sword     
vase     van                gift           swan      

The strong semantic foils belong to the same category and the weaker ones have a
less obvious relationship (*ring* and *dress*).

We visually confirm that the strong versus weak foils behave differently.


```
#> Warning: Removed 48304 rows containing non-finite values (stat_smooth).
```

<img src="15-aim1-notebook_files/figure-html/by-aoi-logit-foils-1.png" width="100%" />

```
#> Warning: Removed 43071 rows containing non-finite values (stat_smooth).
```

<img src="15-aim1-notebook_files/figure-html/by-aoi-logit-foils-2.png" width="100%" />

What's going on here:

- The weak phonological foils are indeed weaker than the strong foils.
- The strong semantic foils appear stronger than the weak ones. The strong
  foils show a growth curve pattern of increasing looks away from baseline and
  there a developmental difference among the growth curves for each time
  point.
- Children have a lower advantage for the target (vs unrelated) in weak foil
  trials because... why? My reading is that if the semantic or phonological
  foil is effective, children will look at it instead of the unrelated image.
  Conversely, if the semantic or phonological foil are less effective,
  children will look more to the unrelated image, which pulls down the ratio
  of looks to target versus the unrelated image.

In the above plots, we fixed the denominator to be the number of looks to the
unrelated image and varied the numerator. In the plots below, we fix the
numerator to be the looks to the target and vary the denominator to looks to
target versus looks to each foil.


```
#> Warning: Removed 37498 rows containing non-finite values (stat_smooth).
```

<img src="15-aim1-notebook_files/figure-html/by-aoi-logit-target-phon-1.png" width="100%" />

Curves in both panels attain the same height, so phonological and unrelated foils 
affect processing equally later in the trial. The strong phonological foils 
curves in the Target vs Phonological comparison rise later than the weak foils, 
reflecting early looks to the phonological foils.


```
#> Warning: Removed 29775 rows containing non-finite values (stat_smooth).
```

<img src="15-aim1-notebook_files/figure-html/by-aoi-logit-target-semi-1.png" width="100%" />

Curves in the two panels do not attain the same height, so the semantic foil
reduces odds of fixating to the target later on in a trial. There appears to be
no difference in strong and weak foils in Year 2 and Year 3, so I might be able
to collapse to remove this distinction and include more items in the analysis.


## Preparing data for the model


```
#> Modelling options:
#> List of 4
#>  $ bin_width : num 3
#>  $ start_time: num 250
#>  $ end_time  : num 1500
#>  $ bin_length: num 50
#> 
```

As in the earlier models, we downsampled the data into
50-ms (3-frame) bins in order to
smooth the data. We modeled the looks from 250 to
1500 ms. Lastly, we aggregated looks by child, study and
time, and created orthogonal polynomials to use as time features for the model



```
#> Warning: Removed 1 rows containing missing values (geom_path).
```

<img src="15-aim1-notebook_files/figure-html/unnamed-chunk-5-1.png" width="80" />


```r
# library(lme4)
# m <- glmer(
#  cbind(Primary, Unrelated) ~
#         Study * (ot1 + ot2 + ot3) +
#         (ot1 + ot2 + ot3 | ResearchID) +
#         (ot1 + ot2 + ot3 | Study:ResearchID),
#   family = binomial,
#   data = phon_d %>% filter(Focus == "PhonologicalFoil"))

```

The final model should looks like this. I'll have to run this for a few days.


```r
phon_d <- phon_d %>% 
  filter(Focus == "PhonologicalFoil")
```



```r
library(rstanarm)
options(mc.cores = parallel::detectCores())

m <- stan_glmer(
 cbind(Primary, Unrelated) ~ 
        Study * (ot1 + ot2 + ot3) + 
        (ot1 + ot2 + ot3 | ResearchID) + 
        (ot1 + ot2 + ot3 | Study:ResearchID),
  family = binomial,
  prior = normal(0, 1, autoscale = FALSE),
  prior_intercept = normal(0, 2),
  prior_covariance = decov(2, 1, 1),
  control = list(adapt_delta = .99),
  data = phon_d)
readr::write_rds(m, "./data/stan_aim1_phon_model2.rds.gz")
```

For this model structure, we estimate two growth curves simultaneously for each
year of the study. Each growth curve is the log-odds of fixating on a certain
image relative to the unrelated image. We use an indicator variable *focus* to
record whether the image is the target or the phonological foil. 

Actually, I am not sure I need to estimate two growth curves simulataneously
yet. I could just estimate log-odds of looking to Phonological vs Unrelated
directly. This would let me estimate year over year changes, the time course of
the effects and maybe some individual differences in looks to the phonological
foil. I could posterior-predict looks at each time bin and see how the 
intervals compare to zero.


Hmmm, this is not working quite right yet.


```r
library(rstanarm)
#> Loading required package: Rcpp
#> rstanarm (Version 2.15.3, packaged: 2017-04-29 06:18:44 UTC)
#> - Do not expect the default priors to remain the same in future rstanarm versions.
#> Thus, R scripts should specify priors explicitly, even if they are just the defaults.
#> - For execution on a local, multicore CPU with excess RAM we recommend calling
#> options(mc.cores = parallel::detectCores())
okay <- readr::read_rds("./data/stan_aim1_phon_model2.rds.gz")
summary(okay, pars = names(fixef(okay)))
#> 
#> Model Info:
#> 
#>  function:  stan_glmer
#>  family:    binomial [logit]
#>  formula:   cbind(Primary, Unrelated) ~ Study * (ot1 + ot2 + ot3) + (ot1 + 
#> 	   ot2 + ot3 | ResearchID) + (ot1 + ot2 + ot3 | Study:ResearchID)
#>  algorithm: sampling
#>  priors:    see help('prior_summary')
#>  sample:    4000 (posterior sample size)
#>  num obs:   12584
#>  groups:    Study:ResearchID (484), ResearchID (195)
#> 
#> Estimates:
#>                       mean   sd   2.5%   25%   50%   75%   97.5%
#> (Intercept)          0.2    0.1  0.0    0.1   0.2   0.2   0.3   
#> StudyTimePoint2      0.0    0.1 -0.2   -0.1   0.0   0.0   0.1   
#> StudyTimePoint3      0.2    0.1  0.0    0.1   0.2   0.2   0.3   
#> ot1                 -0.3    0.2 -0.7   -0.4  -0.3  -0.2   0.1   
#> ot2                 -0.2    0.1 -0.5   -0.3  -0.2  -0.1   0.1   
#> ot3                  0.1    0.1 -0.1    0.0   0.1   0.1   0.3   
#> StudyTimePoint2:ot1 -0.3    0.3 -0.8   -0.4  -0.3  -0.1   0.3   
#> StudyTimePoint3:ot1  0.2    0.3 -0.4    0.0   0.2   0.4   0.8   
#> StudyTimePoint2:ot2 -0.4    0.2 -0.8   -0.6  -0.4  -0.3   0.0   
#> StudyTimePoint3:ot2 -0.3    0.2 -0.7   -0.4  -0.3  -0.2   0.1   
#> StudyTimePoint2:ot3  0.0    0.1 -0.3   -0.1   0.0   0.1   0.2   
#> StudyTimePoint3:ot3 -0.1    0.1 -0.4   -0.2  -0.1   0.0   0.2   
#> 
#> Diagnostics:
#>                     mcse Rhat n_eff
#> (Intercept)         0.0  1.0  175  
#> StudyTimePoint2     0.0  1.0  272  
#> StudyTimePoint3     0.0  1.0  200  
#> ot1                 0.0  1.0  230  
#> ot2                 0.0  1.0  318  
#> ot3                 0.0  1.0  481  
#> StudyTimePoint2:ot1 0.0  1.0  328  
#> StudyTimePoint3:ot1 0.0  1.0  269  
#> StudyTimePoint2:ot2 0.0  1.0  385  
#> StudyTimePoint3:ot2 0.0  1.0  483  
#> StudyTimePoint2:ot3 0.0  1.0  468  
#> StudyTimePoint3:ot3 0.0  1.0  661  
#> 
#> For each parameter, mcse is Monte Carlo standard error, n_eff is a crude measure of effective sample size, and Rhat is the potential scale reduction factor on split chains (at convergence Rhat=1).

sims <- rstanarm::posterior_predict(okay, draws = 200, seed = "09272017")
n_trials <- data_frame(y_id = seq_along(okay$y[, 1]), n_trials = rowSums(okay$y))

length(phon_d$Study)
#> [1] 12584
length(okay$y[, 1])
#> [1] 12584

bayesplot:::ppc_data(okay$y[, 1], sims, group = phon_d$Study) %>% 
  left_join(n_trials, by = "y_id") %>% 
  mutate(prop = value / n_trials) %>% 
  ggplot() +
    aes(x = prop) +
    stat_density(
      aes_(group = ~ rep_id),
      data = function(x) dplyr::filter(x, !.data$is_y),
      geom = "line", position = "identity", size = .25, alpha = .1, 
      color = "#0074D9") +
    stat_density(
      data = function(x) dplyr::filter(x, .data$is_y),
      geom = "line", position = "identity", size = 1) + 
    labs(x = "Proportion of looks", 
         title = "Observed data and 200 posterior simulations") + 
    coord_cartesian(xlim = c(0, 1), expand = FALSE) + 
    facet_wrap("group")
#> Warning: Removed 50400 rows containing non-finite values (stat_density).
#> Warning: Removed 252 rows containing non-finite values (stat_density).
```

<img src="15-aim1-notebook_files/figure-html/unnamed-chunk-9-1.png" width="80" />




## Look for individual differences in competitor sensitivity

[...put this on hold for a while...]

<!-- Let's just run with all the foils. There's a trade-off here about sparsity and -->
<!-- strength of the stimuli. -->





## Interim summary

* Visual evidence that the semantic foil and phonological foil become more 
  relevant (compared to unrelated foil) each year. 
* Our previous distinction between strong and weak foils still applies, 
  although it might be better to exclude only the (a priori) weakest foils, 
  like the rime phonological foils.
