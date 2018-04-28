
(APPENDIX) Appendix {#appendix-appendix .unnumbered}
========================================================================

Computational Details for Specific Aim 1 {#aim1-gca-models}
========================================================================

Growth Curve Analysis Models
------------------------------------------------------------------------

The models were fit in R (version) with RStanARM (version).

When I computed the orthogonal polynomial features for Time, they were
rescaled so that the linear feature ranged from −.5 to .5. Under this
scaling a unit change in Time^1^ was equal to change from the start to
the end of the analysis window. The polynomial features for the Time had
the following ranges:


Feature            Min    Max   Range
--------  ------------  -----  ------
Time^1^    &minus;0.50   0.50    1.00
Time^2^    &minus;0.33   0.60    0.93
Time^3^    &minus;0.63   0.63    1.26

Below is the code used to fit the model with RStanARM. It took
about 24 hours to run the model. `ot1`, `ot2`, and `ot3` are the
polynomial time features, `ResearchID` identifies children, and `Study`
identifies the age/year of the study. `Primary` counts the number of
looks to the target image at each time bin; `Others` counts looks to the
other three images.


```r
library(rstanarm)
options(mc.cores = parallel::detectCores())

m <- stan_glmer(
  cbind(Primary, Others) ~
    (ot1 + ot2 + ot3) * Study +
    (ot1 + ot2 + ot3 | ResearchID/Study),
  family = binomial,
  prior = normal(0, 1, autoscale = FALSE),
  prior_intercept = normal(0, 2),
  prior_covariance = decov(2, 1, 1),
  data = d_m)

readr::write_rds(m, "./data/stan_aim1_cubic_model.rds.gz")
```

We used moderately informative priors for the main regression effects.
Under the Normal(0 [mean], 1 [sd]) prior, before seeing any data, we
expect 95% of plausible effects to fall in the range ±1.96, which is an
adequate range for these growth curve models.

<!-- For example, consider just the effect of Time^1^. If a -->
<!-- listener starts at chance performance, 25% or -1.1 -->
<!-- logits, and increases to, say, 65% or 0.62, the effect -->
<!-- of a unit change in Time^1^ would be a change of -->
<!-- 1.72 logits. This magnitude of effect is -->
<!-- accommodated by our Normal(0, 1) prior.  -->

_Here I would have to also describe the random effects structure._

For the hierarchical part of the model, I used RStanARM's `decov()`
prior which simultaneously sets a prior of the variances and
correlations of the model's random effect terms. Practically speaking,
variances capture the variation in by-subject and
by-subject-by-age effects, and correlations allow
correlations between the by-subject effects and between the
by-subject-by-age effects. For example, I would expect that participants
with average looking probabilities (low intercepts) to have flatter
growth curves (low Time^1^ effects), and this relationship would be
captured by one of the random-effect correlation terms.

I used the default prior for the variance terms and applied a weakly
informative LKJ(2) prior on the random effect correlations.
Figure \@ref(fig:lkj-prior) shows samples from the prior distribution of
models fit with the default LKJ(1) prior and a weakly informative LKJ(2)
prior. Under LKJ(2), extreme correlations are less plausible. The prior
shifts the probability mass away from the ±1 edges towards the center.
The motivation for this kind of prior was *regularization*: We give the
model a small amount of information to nudge it away from extreme,
degenerate values.

(ref:lkj-prior) Samples of correlation effects drawn from the LKJ(1) and
LKJ(2) priors.

<div class="figure" style="text-align: center">
<img src="90-appendix_files/figure-html/lkj-prior-1.png" alt="(ref:lkj-prior)" width="50%" />
<p class="caption">(\#fig:lkj-prior)(ref:lkj-prior)</p>
</div>











<div class = "infobox">

**Box 1: A brief comment about priors.**

Bayesian models require prior information (“priors”). Priors are also
commonly referred to as "prior beliefs", and Bayesian techniques are
criticized or dismissed for smuggling subjectivity into the scientific
enterprise. I find this unfortunate on two grounds. First, *belief*
overstates things. As George Box said, "all models are wrong, but some
are useful" [cite], so no part of a statistical model should be called
a "belief" when the whole thing is a convenient fiction. That's why I
prefer the term *prior information*. [Hat tip Gelman?] Second, other
parts of the statistical model are also subjective: likelihood
functions, what kind of ANOVA, what to covary, whether to transform
measurements, whether a *p* = .07 is a "marginal" effect or no effect at
all, and so on. This subjectivity seems reasonable, provided that we
scientists are open about modeling decisions.

For these models, I will use weakly to moderately informative priors.
For example, suppose *x* and *y* are scaled to mean 0 and standard
deviation 1. A weakly informative prior for the effect of *x* on *y*
might be Normal(0, 5)—a normal distribution with mean 0 and standard
deviation 5. If we fit a regression model and observed an effect size
of 12 SD units, our first assumption would be that something went wrong
with our software. The weakly informative prior captures this level of
prior information. A moderately informative prior would be Normal(0, 1).
This prior information captures our disciplinary experience that effect
sizes greater than ±1 relatively uncommon in child language research. A
strongly informative prior for this effect might be something like
Normal(.4, .1) which says that our model should be very skeptical of
negative effects and of effects larger than .8. For this project, I will
default to the first two levels of prior information.

</div>





## Additional model results

The output below contains the model quick view, a summary of the fixed effect
terms, and a summary of the priors used.


```r
b

summary(b, pars = names(fixef(b)))

prior_summary(b)
```

### Plot the intervals for the random effect parameters

These are the parameters governing the random effect distributions. First, we
plot the standard deviations. Recall that in our hierarchical model we suppose 
that each growth curve is drawn from a population of related curves. The 
model's fixed effects estimate the means of the distribution. These terms
estimate the variability around that mean. We did not have any a priori 
hypotheses about the values of these scales, so do not discuss them any further.



Then the correlations.




### Posterior predictive checks

<!-- Bayesian models are generative; they describe how the data could have been -->
<!-- generated. One way to evaluate the model is to have it simulate new -->
<!-- observations. If the simulated data closely resembles the observed data, then we -->
<!-- have some confidence that our model has learned an approximation of how the data -->
<!-- could have been generated. Figure \@ref(fig:post-pred) depicts the density of -->
<!-- the observed data from each year of the study versus 200 posterior simulations. -->
<!-- Because the simulations closely track the density of the observed data, we can -->
<!-- infer that the model has learned how to generate data from each year of the -->
<!-- study. -->

<!-- (ref:post-pred) Posterior predictive density for the observed data from each -->
<!-- year of the study. The _x_-axis represents the outcome measure---the proportion -->
<!-- of looks to the target image---and the _y_-axis is the density of those values -->
<!-- at year. At age 3, there is a large density of looks around chance performance -->
<!-- (.25) with a rightward skew (above-chance looks are common). At age 4 and age 5, -->
<!-- a bimodal distribution emerges, reflecting how looks start at chance and -->
<!-- reliably increase to above-chance performance. Each light line is a simulation -->
<!-- of the observed data from the model, and the thick lines are the observed data. -->
<!-- Because the thick line is surrounded by light lines, we visually infer that the -->
<!-- the model faithfully approximates the observed data. -->




We can ask the model make even more specific posterior predictions. Below we
plot the posterior predictions for random participants. This is the model
simulating new data for these participants.


```r
set.seed(09272017)

ppred <- d_m %>% 
  sample_n_of(8, ResearchID) %>% 
  tristan::augment_posterior_predict(b, newdata = ., nsamples = 100) %>% 
  mutate(trials = Primary + Others)

ggplot(ppred) + 
  aes(x = Time, y = Prop, color = Study, group = Study) + 
  geom_line(aes(y = .posterior_value / trials, 
                group = interaction(.draw, Study)), 
            alpha = .20) + 
  geom_line(size = 1, color = "grey50") + 
  facet_wrap("ResearchID") + 
  theme(
    legend.position = c(.95, 0), 
    legend.justification = c(1, 0),
    legend.margin = margin(0)) +
  guides(color = guide_legend(title = NULL, override.aes = list(alpha = 1))) +
  labs(
    title = "Observed means and 100 simulations of new data",
    x = "Time after target onset [ms]",
    y = "Proportion looks to target") 
```

Or we can plot the linear predictions. These are posterior predictions of the
log-odds of looking to target before adding binomial noise.


```r
lpred <- d_m %>% 
  sample_n_of(8, ResearchID) %>% 
  tristan::augment_posterior_linpred(b, newdata = ., nsamples = 100)

ggplot(lpred) + 
  aes(x = Time, y = .posterior_value, color = Study) +
  geom_line(aes(group = interaction(Study, ResearchID, .draw)), 
            alpha = .1) +
  facet_wrap("ResearchID") + 
  geom_point(aes(y = qlogis(Prop)), shape = 1) + 
  theme(
    legend.position = c(.95, 0), 
    legend.justification = c(1, 0),
    legend.margin = margin(0)) +
  guides(color = guide_legend(title = NULL, override.aes = list(alpha = 1))) +
  labs(
    title = "Observed data and 100 posterior predictions",
    x = "Time after target onset [ms]",
    y = "Posterior log-odds")
```






























Items used in the visual world experiment {#vw-experiment-items}
========================================================================

Each row of the table represents a set of four images used in a trial
for the experiment. There were two blocks of trials with different
images and trial orderings. For the two unrelated foils with more than
one word listed, the first word was used in block one and the second in
block two.

  **Target**   **Phonological**   **Semantic**   **Unrelated**
  ------------ ------------------ -------------- ---------------
  bear         bell               horse          ring
  bee          bear               fly            heart
  bell         bee                drum           swing
  bread        bear               cheese         vase
  cheese       shirt              bread          van
  dress        drum               shirt          swing
  drum         dress              bell           sword
  flag         fly                kite           pear
  fly          flag               bee            pen
  gift         kite               vase           bread
  heart        horse              ring           bread/pan
  horse        heart              bear           pan
  kite         gift               flag           shirt
  pan          pear               spoon          vase
  pear         pen                cheese         ring/vase
  pen          pear               sword          van
  ring         swing              dress          flag
  shirt        cheese             dress          fly
  spoon        swan               pan            drum
  swan         spoon              bee            bell
  swing        spoon              kite           heart
  sword        swan               pen            gift
  van          pan                horse          sword
  vase         van                gift           swan


<!-- Add tables for the listing the strong phon foils and the strong semy foils -->






















Items used in the mispronunciation experiment {#mp-experiment-items}
========================================================================

The stimuli changed between Year 1 and Year 2 so that dog/tog was
replaced with rice/wice.

  **Time Points**   **Word Group**   **Condition**        **Audio (IPA)**   **Familiar Object**   **Unfamiliar Object**
  ----------------- ---------------- -------------------- ----------------- --------------------- -----------------------
  1                 dog              Correct Production   /dɔg/             dog                   wombat
                                     Mispronunciation     /tɔg/             dog                   wombat
                                     Nonword              /vef/             ball                  sextant
  1, 2, 3           cake             Correct Production   /kek/             cake                  horned melon
                                     Mispronunciation     /gek/             cake                  horned melon
                                     Nonword              /pʌm/             book                  churn
  1, 2, 3           duck             Correct Production   /dʌk/             duck                  toy creature
                                     Mispronunciation     /gʌk/             duck                  toy creature
                                     Nonword              /ʃæn/             cup                   reed
  1, 2, 3           girl             Correct Production   /gɜ˞l/            girl                  marmoset
                                     Mispronunciation     /dɜ˞l/            girl                  marmoset
                                     Nonword              /nedʒ/            car                   work holder
  1, 2, 3           shoes            Correct Production   /ʃuz/             shoes                 flasks
                                     Mispronunciation     /suz/             shoes                 flasks
                                     Nonword              /giv/             sock                  trolley
  1, 2, 3           soup             Correct Production   /sup/             soup                  steamer
                                     Mispronunciation     /ʃup/             soup                  steamer
                                     Nonword              /tʃim/            bed                   pastry mixer
  2, 3              rice             Correct Production   /ɹaɪs/            rice                  anise
                                     Mispronunciation     /waɪs/            rice                  anise
                                     Nonword              /bep/             ball                  sextant

Related Work {#related-work}
========================================================================

In this section, I clarify relationships between this project and other
word recognition research reported from our lab. In short, our lab has
reported results about the two-image and four-image experiments from
cross-sectional samples, describing child-level measures that predict
performance in these tasks. In contrast, my dissertation 1) focuses on
the longitudinal development of word recognition and 2) engages with the
fine-grained details of lexical processing.

@MPPaper analyzed a different version of the mispronunciation experiment
on a different sample of children (*n* = 34, 30–46 months old). This
earlier version included both real word and the mispronunciation of the
real word in the same block of trial. For example, a child would hear
“dog” and “tog” during the same session of the experiment. This design
might subtly temper the effect of mispronounced stimuli by allowing the
listener to compare the mispronunciation to its correctly produced
counterpart. The version of the experiment in Specific Aim 2 separates
the real words and mispronunciations so that a child never hears a
familiar word and its mispronunciation during the same block of trials.
With this design, there is no explicit point of comparison for the
mispronunciation, and the child has to rely on his or her own lexical
representations when processing these words.

@RWLPaper analyzed data from the four-image experiment in Specific
Aim 1. This study featured a diverse cross-sectional sample of 60
children, half of whom received the experiment in African American
English and half received it in Mainstream American English. The sample
ranged in age from 28 to 60 months. The study “borrowed” data from 23
participants from Year 1 of the longitudinal study to enrich parts of
the samples demographics. For this manuscript, we analyzed how
vocabulary and maternal education predicted looking patterns, including
relative looks to the semantic and phonological foils.

Mahr and Edwards (in press) was the manuscript I originally authored for
my preliminary examinations. The paper analyzes the same kinds of
relations as @Weisleder2013 which showed that lexical processing
efficiency mediated the effect of language input on future vocabulary
size. In particular, I asked whether word recognition performance on the
four-image task of Specific Aim 1, vocabulary size, and home language
input data from Year 1 predicted vocabulary size at Year 2. The paper
only examined looks to the familiar image from one year of the study, so
it did not analyze any lexical competition effects or the development of
word recognition within children.
