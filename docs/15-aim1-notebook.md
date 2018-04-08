
Effects of phonological and semantic competitors
=======================================================================














Looks to the phonological competitor
------------------------------------------------------------------------





Next, I asked how children's sensitivity to the phonological foils
changed over developmental time. Following our approach in [@RWLPaper],
I only examined trials for which the phonological foil and the noun
shared the same syllable onset. For example, this criterion included
trials with *dress*–*drum*, *fly*–*flag*, or *horse*–*heart*, but it
excluded trials *kite*–*gift* (feature difference), *bear*–*bread*
(onset difference), and *ring*–*swing* (rimes). I kept 13 of
the 24 trials.
[Appendix \@ref(vw-experiment-items)](#vw-experiment-items) provides a
complete list of trials used.

The outcome measure for these analyses was the log-odds of fixating on
the phonological foil versus the unrelated image. Because children
looked more to the target word with each year of the study, they
necessarily looked less to the distractors each year. 
Figure \@ref(fig:declining-phon-props) illustrates how the proportions
of looks to the phonological foils declined each year. Therefore, I
examined the effect of the phonological foil in comparison to the
unrelated foil. For example, on the trials where the target is *fly*, we
can study the effect of the phonological foil *flag* by looking at when
and to what to degree the children fixate on *flag* more than the
unrelated image *pen*. If a window of time of shows a consistent
advantage for the phonological foil over the unrelated image, we can
conclude that the children were sensitive to the phonological foil. By
studying the time course of fixations to the phonological foil versus
the unrelated image, we can identify when the phonological foil affected
word recognition most significantly.

As in the previous models, I downsampled the data into
50-ms (3-frame) bins in
order to smooth the data. I modeled the looks
from  to  ms. Lastly, I
aggregated looks by child, study and time.

(ref:declining-phon-props) Because children looked more to the target as
they grew older, they numerically looked less the foils too. This effect
is why I evaluated the phonological and semantic foils by comparing them
against the unrelated image.

<div class="figure">
<img src="15-aim1-notebook_files/figure-html/declining-phon-props-1.png" alt="(ref:declining-phon-props)" width="60%" />
<p class="caption">(\#fig:declining-phon-props)(ref:declining-phon-props)</p>
</div>

To account for the sparseness of the data, I used the empirical log-odds
(or empirical logit) transformation [@Barr2008]. This transformation
adds .5 to the looking counts. For example, a time-frame with 4 looks to
the phonological foil and 1 look to the unrelated image has a
conventional log-odds of log(4/1) = 1.39 and empirical log-odds of
log(4.5/1.5) = 1.10. This transformation fills in 0 counts, and it
dampens the extremeness of some probabilities that arise in sparse count
data.



To model these data, I fit a generalized additive model with fast
restricted maximum likelihood estimation [@Wood2017; @Soskuthy2017 for
a tutorial for linguists]. Box 1 provides a brief overview of these
models. I used the mgcv R package [vers. 1.8.23;
@Wood2017] with support from the tools in the itsadug R package
[vers. 2.3; @itsadug].[^gca-fail]

[^gca-fail]: Initially, I tried to use Bayesian polynomial growth
  curve models, as in the earlier analysis of the looks to the target
  image. These models however did not converge, even when strong priors
  were placed on the parameters.





\Begin{infobox}
<div class = "infobox">

**Box 1: The Intuition Behind Generalized Additive Models**.

In these analyses, the outcome of interest is a value that changes over
time in a nonlinear way. We model these time series by building a set of
features to represent time values. In the growth curve analyses of
familiar word recognition, I used a set of polynomial features which
expressed time as the weighted sum of a linear trend, a quadratic trend
and cubic trend. That is:

$$
\text{log-odds}(\mathit{looking}) =
  \alpha + \beta_1 * \textit{Time}^1 +
           \beta_2 * \textit{Time}^2 +
           \beta_3 * \textit{Time}^3
$$

But another way to think about the polynomial terms is as *basis
functions*: A set of features that combine to approximate some nonlinear
function of time. Under this framework, the model can be expressed as:

$$
\text{log-odds}(\mathit{looking}) =
  \alpha + f(\textit{Time})
$$

This is the idea behind generalized additive models and their *smooth
terms*. These smooths fit nonlinear functions of data by weighting and
adding simple functions together. The figures below show 9 basis
functions from a "thin-plate spline" and how they can be weighted and
summed to fit a growth curve.

<img src="15-aim1-notebook_files/figure-html/infobox-1-figs-1.png" width="66%" style="display: block; margin: auto;" />

Each of these basis functions is weighted by a model coefficient, but
the individual basis functions are not a priori meaningful. Rather, it
is the whole set of functions that approximate the curvature of the
data---i.e., *f*(Time))---so we statistically evaluate the whole batch
of coefficients simultaneously. This joint testing is similar to how one
might test a batch of effects in an ANOVA. If the batch of effects
jointly improve model fit, we infer that there is a significant smooth
or shape effect.

Smooth terms come with an estimated degrees of freedom (EDF). These
values provide a sense of how many degrees of freedom the smooth
consumed. An EDF of 1 is a perfectly straight line, indicating no
smoothing. Higher EDF values indicate that the smooth term captured more
curvature from the data.

<!-- The other important thing to know about generalized additive models is that -->
<!-- wigglyness is penalized. With so many functions, one might worry about -->
<!-- overfitting the data and including incidental wiggliness into *f*(Time). These -->
<!-- models, however, include a smoothing parameter that -->
</div>
\End{infobox}




The model included main effects of study year. These *parametric* terms
work like conventional regression effects and determined the growth
curve's average values. The model used age 4 as the reference year, so
the intercept represented the average looking probability at
age 4. The model's year effects therefore represented differences
between age 4 vs. age 3 and age 4 vs. age 5.

The model also included *smooth* terms to represent the time course of
the data. As with the parametric effects, age 4 served as the reference
year. The model estimated a smooth for age 4 and it estimated
*difference smooths* to capture how the curvature at age 3 and age 5
differed from the age-4 curvature. Each of these study-level smooths
used 10 knots (9 basis functions). I also included child-level *random
smooths* to represent child-level variation in growth curve shapes.
Because there is much as less data at the child level than at the study
level, these random smooths only included 5 knots (4 basis functions).
We can think of these simpler splines as coarse adjustments in growth
curve shape to capture child-level variation from limited data.
Altogether, the model contained the following terms:

$$
\small
\begin{align*}
   \text{emp. log-odds}(\mathit{phon.\ vs.\ unrelated}) =\
   & \alpha + \beta_1\text{Age3} + \beta_2\text{Age5} +\ &\text{[growth curve averages]} \\
   & f_1(\text{Time}, \text{Age4})\ +                    &\text{[reference smooth]} \\
   & f_2(\text{Time}, \text{Age4} - \text{Age3})\ +      &\text{[difference smooths]} \\
   & f_3(\text{Time}, \text{Age4} - \text{Age5})\ +      & \\
   & f_i(\text{Time}, \text{Child}_i)                    &\text{[by-child random smooths]} \\
\end{align*}
$$



The model’s fitted values are shown in
Figure \@ref(fig:phon-vs-unre-fits). These are the average empirical
log-odds of fixating on the phonological foil versus the unrelated image
for each year of the study. The model captured the trend for increased
looks to the competitor image with each year of the study. At age 4 and
age 5, the shape rises from a baseline to the peak around 800 ms. These
curves slope downwards and eventually fall beneath the initial baseline.
The shape at age 3 does not have a steady rise from baseline and shows a
very small peak around 800 ms.

(ref:phon-vs-unre-fits) With each year of the study, children looked
more to the phonological foil, relative to unrelated image, during and
after the target noun. the target noun. Both figures show means for each
year estimated by the generalized additive model. The left compares
model estimates to observed means and standard errors, and the right
visualizes estimated means and their 95% confidence intervals.

<div class="figure">
<img src="15-aim1-notebook_files/figure-html/phon-vs-unre-fits-1.png" alt="(ref:phon-vs-unre-fits)" width="80%" />
<p class="caption">(\#fig:phon-vs-unre-fits)(ref:phon-vs-unre-fits)</p>
</div>

The average looks to the phonological foil over the unrelated for age 4
was 0.16 emp. log-odds, .54 proportion units. The averages
for age 3 and age 4 did not significantly differ, *p*&nbsp;= .85 but the
average value was significantly greater at age 5, 0.31 emp. log-odds,
.58 proportion units, *p*&nbsp;< .001. Visually, this effect shows up
in the almost constant height difference between the age-4 and the age-5
curves.

(ref:phon-diff-curves) Differences in the average looks to the
phonological foil versus the unrelated image between age 4 and the other
ages. Plotted line is estimated difference and the shaded region is
the 95% confidence interval around that difference. Blue boxes highlight
regions where the 95% interval excludes zero. From age 3 to age 4,
children become more sensitive to the phonological foil during and after
the target noun. The curves for age 3 and age 4 have largely the same
shape, but they steadily diverge over time.

<div class="figure">
<img src="15-aim1-notebook_files/figure-html/phon-diff-curves-1.png" alt="(ref:phon-diff-curves)" width="80%" />
<p class="caption">(\#fig:phon-diff-curves)(ref:phon-diff-curves)</p>
</div>

There was a significant smooth term for time at age&nbsp;4, estimated degrees
of freedom (EDF) = 7.28, *p*&nbsp;< .001.
Figure \@ref(fig:phon-diff-curves) visualizes how and when the smooths
from other studies differed from the age-4 smooth.

The age-3 and age-4 significantly differed, EDF = 5.48,
*p*&nbsp;< .001. In particular, the curves are significantly different
from 500 to 1050 ms. This result confirms that the looks to the
phonological foil increased from age 3 and age 4 during the time window
immediately following presentation of the noun. The similarity between
the phonological foil and the target occurs early in the trial. Given
the 150--300 ms time required to execute an eye movement in response to
speech, the time window for these differences indicates that children
became more sensitive to the phonological similarities between the foil
and the target from age 3 to age 4.

The age-3 and age-4 curves also differed significantly after 1250 ms.
The effect reflects how the looks to phonological foil decreased as the
trial progresses. After an incorrect look to the foil, the children on
average corrected their gaze and looked even less to the phonological
foil. We do not observe this degree of correction during age 3,
presumably because children at age 3 hardly looked to the phonological
foil early on.

The age-4 and age-5 smooths also significantly differed, EDF =
1.00, *p*&nbsp;< .001, although the low EDF values indicates that
the shape of the difference was a flat line. Thus, the difference
between the age-4 and age-5 smooths is driven primarily by the intercept
difference and a linear diverging trend---that is, the distance between
the two grows slightly over time. The same general curvature was
observed for the two studies, reflecting the same general looking
behavior at both time points. Children showed an early increase in looks
to the phonological foil relative to the unrelated image but after
receiving disqualifying information from the rest of the word, the looks
to the phonological foil rapidly decrease. The primary difference
between age-4 and age-5 is that the foil effect becomes more pronounced
at age 5.

**Summary**. Children looked more the phonological competitor than the
unrelated image early in the trials. The advantage of the phonological
competitor peaked on average around 800 ms after target onset. This peak
was very small at age 3 but increased in height with each year of the
study. Thus, children became more sensitive to the phonological cohort
competitors as they grew older.




Looks to the semantic competitor
------------------------------------------------------------------------

I asked how children's sensitivity to the semantic competitor changed
as they grew older. As in [@RWLPaper], I only examined trials for
which the semantic foil and the noun were part of the same category. For
example, I included trials with *bee*–*fly*, *shirt*–*dress*, and
*spoon*–*pan*, but I excluded trials where the similarity was perceptual
(*sword*–*pen*) or too abstract (*swan*–*bee*). This criterion kept
13 of the 24 trials.
[Appendix \@ref(vw-experiment-items)](#vw-experiment-items) provides a
complete list of trials used.

For these trials, I used the same modeling technique as the one used for
phonological competitor: Generalized additive models with study effects
and a time smooth, time-by-study difference smooths, and time-by-child
random smooths. I modeled the looks from
from 250 to 1800 ms.
This window was 300 ms longer than the one used
for the phonological competitors in order to capture late-occurring
semantic effects.





The model’s fitted values are shown in
Figure \@ref(fig:semy-vs-unre-fits). The average empirical log-odds of
fixating on the semantic foil versus the unrelated image increased with
each year of the study. All three years show the same general time
course of effects: Looks begin to increase from a baseline around 750 ms
and peak around 1300 ms. The peaks of the curves increased as children
grew older. The semantic foil shows a clear advantage over the unrelated
image at age 3, which was not the case for the phonological foil at
age 3.

(ref:semy-vs-unre-fits) With each year of the study, children looked
more to the semantic foil, relative to the unrelated image, with peak
looking occurring after the target noun. Both figures show means for
each year estimated by the generalized additive model. The left compares
model estimates to observed means and standard errors, and the right
visualizes estimated means and their 95% confidence intervals.

<div class="figure">
<img src="15-aim1-notebook_files/figure-html/semy-vs-unre-fits-1.png" alt="(ref:semy-vs-unre-fits)" width="80%" />
<p class="caption">(\#fig:semy-vs-unre-fits)(ref:semy-vs-unre-fits)</p>
</div>

The average looks to the semantic foil over the unrelated for age 4 was
0.44 emp. log-odds, .61 proportion units. Children
looked significantly less to the semantic foil on average at age 3,
0.30 emp. log-odds, .57 proportion units,
*p*&nbsp;< .001, and they looked significantly more to the semantic foil
at age 5, 0.50 emp. log-odds, .62 proportion
units, *p*&nbsp;< .001. The peaks of the growth curves, in proportion
units, were .65 at age 3,
.68 at age 4, and
.70 at age 5.

There was a significant smooth term for time at age 4, estimated degrees
of freedom (EDF) = 7.04, *p*&nbsp;< .001.
Figure \@ref(fig:semy-diff-curves) visualizes the time course of the
differences between the smooths from each study.

(ref:semy-diff-curves) Differences in the average looks to the semantic
foil versus the unrelated image between age 4 and the other ages.
Plotted line is estimated difference and the shaded region is the 95%
confidence interval around that difference. Blue boxes highlight regions
where the 95% interval excludes zero. The flat line on the left reflects
how the shape of the growth curves remained the same from age 3 to age 4
and only differed in average height. From age 4 to age 5, the lines
quickly diverge and the age-5 curve reaches a higher peak value.


```
#> Summary:
#> 	* Time : numeric predictor; with 32 values ranging from 250.000000 to 1800.000000. 
#> 	* R : factor; set to the value(s): 001L. (Might be canceled as random effect, check below.) 
#> 	* NOTE : The following random effects columns are canceled: s(Time,R)
#> 
```

<div class="figure">
<img src="15-aim1-notebook_files/figure-html/semy-diff-curves-1.png" alt="(ref:semy-diff-curves)" width="80%" />
<p class="caption">(\#fig:semy-diff-curves)(ref:semy-diff-curves)</p>
</div>

The shapes of the age-3 and age-4 curves did not significantly differ,
EDF = 1.00, *p*&nbsp;= .535. The age-3 curve begins to rise
about 100 ms later, and it reaches a shallower peak value than the age-4
curve. These two features create a nearly constant height difference
between the two curves, and thus, the two curves show the same overall
shape.

The age-4 and age-5 smooths significantly differed, EDF = 1.00,
*p*&nbsp;< .001. The differences are greatest after the end of the target
noun, in the window from 750 to 1500 ms. The two curves start from a
similar baseline but quickly diverge as the age-5 curve reaches a higher
peak value. After 1500 ms, the age-5 curve turns downwards to overlap
with the age-4 curve. Thus, children looked more to the semantic foil
relative to the unrelated image, but they were also quicker to correct
and look away from it.

**Summary.** Children became more sensitive to the semantic competitor,
compared to the unrelated image, with each year of the study. The
semantic foils clearly influenced looking patterns at age 3, in contrast
to the muted effect observed for the phonological foils. The semantic
effect also occurred when we would expect: After the end of the target
noun, following activation of the target noun and its semantic
neighbors. 




Differences in competitor sensitivity at age 3
------------------------------------------------------------------------

Next, I asked whether children differed reliably in their sensitivity to
the phonological and semantic foils based on speech perception and
vocabulary measures collected at age 3

As a measure of speech perception, I used scores from a minimal pair
discrimination experiment administered during the first year of the
study. [citations] The task is essentially an ABX discrimination task:
A picture of a familiar object is shown and labeled (e.g., "car"),
another object is shown and labeled ("jar"), and then both images are
shown and one of the two is named. The child then indicated which word
they heard by tapping on the image on a touch-screen.

I derived speech perception scores by fitting a hierarchical
item-response model. This logistic regression model estimates the
probability of child *i* correctly choosing word *j* on word-pair *k*.
The equation below provides a term-by-term description of the model. The
model's intercept term represents the average participant's probability
of correctly answering for an average item. By-child random intercepts
capture a child's deviation from the overall average, so they estimate
the child's *ability*. By-word and by-word-in-pair random intercepts
capture the relative difficulty of particular items on the experiment.
The by-word-in-pair effects were necessary because four words appeared
in more than one word pair (e.g., *juice*--*goose* and
*juice*--*moose*). The model also controlled for the children's ages and
receptive vocabulary scores (PPVT-4 growth scale values). These
predictors were transformed to have mean 0 and standard deviation 1, so
the the model's intercept reflected a child of an average age and an
average vocabulary level. Put differently, the by-child intercepts
reflect a child's ability after controlling for age and receptive
vocabulary.

$$
\small
\begin{align*}
   \text{log-odds}(\mathit{choosing\ correct\ word}) =\
   & \alpha\ +                  &\text{[average participant ability]} \\
   & \alpha_i\ +                &\text{[difference of participant}\ i
                                       \text{'s ability from average]} \\
   & \alpha_j\ +                &\text{[word}\ j\text{'s difficulty]} \\
   & \alpha_{j,k}\ +            &\text{[word}\ j
                                       \text{'s difficulty in word-pair}\ k] \\
   & \beta_{1}\text{Age}\ +     &\text{[participant-level predictors]} \\
   & \beta_{2}\text{Vocabulary} & \\
\end{align*}
$$

I tested whether phonemic discrimination ability at age-3 predicted
looks to the phonological foil over the unrelated image by modifying the
generalized additive model from earlier. In particular, I included a
smooth term for the phonemic discrimination ability score and a "smooth
interaction" between the smooth of time and phonemic ability. These
smooth interaction terms are analogous to interaction terms in linear
models. In this case, the interaction term allows the ability score to
change the shape of the time trend. The additive model was therefore:

$$
\small
\begin{align*}
   \text{emp. log-odds}(\mathit{phon.\ vs.\ unrelated}) =\
   & \alpha +\ &\text{[growth curve average]} \\
   & f_1(\text{Time})\ +                    &\text{[time smooth]} \\
   & f_2(\text{Ability})\ +                 &\text{[ability smooth]} \\
   & f_3(\text{Time} * \text{Ability})\ +   &\text{[interaction smooth]} \\
   & f_i(\text{Time}, \text{Child}_i)       &\text{[by-child random smooths]} \\
\end{align*}
$$





The model included data from 144 participants; these were
children with eyetracking data, receptive vocabulary and phonological
discrimination data at age 3. There was not a significant smooth effect
for phonological discrimination ability, EDF = 1.00,
*p*&nbsp;= .551 or for an interaction smooth between time and ability, EDF = 8.37, *p*&nbsp;= .303.



To test the role of receptive vocabulary, I also fit analogous models
using growth scale value scores from the PPVT-4, a receptive vocabulary
test. I first adjusted these scores in a regression model to control
for--that is, to partial out the effects of---age and predicted accuracy
on the phonological discrimination task. There was not a significant
smooth effect for receptive vocabulary, EDF = 1.00,
*p*&nbsp;= .868, or a significant interaction smooth between time and
receptive vocabulary, EDF = 5.57,
*p*&nbsp;= .610. Receptive vocabulary therefore was not related to
looks to the phonological foil at age 3.

I tested the same two predictors on looks to the semantic foil at age 3.
These child-level factors did not show any significant parametric
effects, smooth effects or smooth interactions with time. Thus,
children's looks to the semantic foil were not reliably related to
phonological discrimination or receptive vocabulary.

**Summary**. These models tested whether two child-level
factors---minimal-pair discrimination ability and receptive
vocabulary---predicted looks to the phonological and semantic
competitors at age 3. No significant effects were observed for 
all cases. 




Discussion
------------------------------------------------------------------------

In the preceding analyses, I examined children's fixation patterns to
the phonological and semantic competitors and how these fixation
patterns changed over developmental time. With each year of the study,
children looked more to the target overall, so they consequently looked
less to the competitor images each year. To account for this fact, these
analyses modeled the ratio of looks to the competitors versus the
unrelated image used in each trial. This ratio measured the relative
advantage of a competitor over the unrelated image. 


<!-- If we imagine a pie-chart of looks to the four images, the target piece -->
<!-- increases in size each year, overtaking area from the other three looks. -->

<!-- describe general patterns, time course and increase -->

### Immediate activation of phonological neighbors

Developmentally, children became more sensitive to the phonological
competitors with each year of the study. These words shared the same
syllable onset as the target noun---for example, the pairs
*dress*–*drum* or *fly*–*flag*. The competitors affected word
recognition early on, with relative looks to the phonological foils
peaking around 800 ms. The target nouns were approximately 800 ms long
at age 3 and 550--800 ms for later ages. Assuming an 150–300 ms overhead
for executing an eye movement in response to speed, this timing means
that children on average shifted their gaze, immediately, based on partial
information.

At ages 4 and 5, these early peaks of looks to the phonological competitor were followed by a steep decrease in looks: Children rejected their initial interpretation of the word and considered other images. (At age 3, the pattern showed more wiggliness, which suggests greater uncertainty.) _Say something about inhibition?_

_At age&nbsp;3 the effect of the phonological competitor was very small compared.
The early advantage of the phonological foil was observed to a more
limited degree in the age 3 study, but still there._

Young children used information in an incremental fashion. This fact
agrees with previous findings....

<!-- Our results showed that children's activation of the target and its phonological neighbors increased with age. Children were more able to use partial information during word recognition. I had described this earlier as children becoming "more sensitive" to the phonological competitors. -->

@Rigler2015 provides an interesting comparison. They compared 9-
and 16-year-olds on a visual-world word recognition experiment with
cohort and rime competitors. The younger children in that study were
slower to look to the target image and showed more looks to the
competitor images. The implications are that children's lexical
processing is still developing in late childhood and that in particular,
children's inhibition of lexical competitors increases with age.

The current results with 3-, 4-, and 5-year-olds followed a different
pattern: Relative looks to the competitor images increased with age.
Taken together, the results suggest an interesting progression for the
development of lexical processing. From the earliest stages, children's
word recognition demonstrates incremental processing. [cite cite]
During the preschool years, children learn many, many words, and they
establish phonological and semantic connections between words. These
connections support immediate activation of neighborhoods of words. For
these experiments, children became more sensitive to the phonological
foils because the phonological competitor achieved greater activation.
Late childhood, based on the @Rigler2015 findings, would be a time for
refinement of those connections, so that sensitivity to the competitors
decreases. This refinement could follow from more selective activation 
channels, increased lexical inhibition, or likely a combination of both.




I also asked whether child-level factors predicted sensitivity to the
phonological competitors. They did not at age 3. In particular, children
who can more reliably discriminate minimal pairs did not show increased
sensitive to the phonological foil. This finding suggests that
sensitivity to the phonological foil is somewhat removed from speech
perception. PPVT: vocabulary not a factor either. Early activation
dynamics different from speech perception or number of words.

Limitations: Change in recorded stimuli. Inclusion of two competitors on
every trial.



<!-- Talking points: -->

<!--   - There is hardly an effect of the phonological foil during timepoint 1. There -->
<!--     are a few ways to interpret this finding. The first may be artefactual. The -->
<!--     stimuli were re-recorded at timepoint 2 so the timepoint 1 stimuli were -->
<!--     somewhat longer on average (). -->
<!--     However, with slower stimuli, we would still expect an inflection in looks -->
<!--     to the foil as children have more time to activate the phonological -->
<!--     representations to the cohort. In other words, with more time to respond, -->
<!--     there could plausibly be an even greater effect of early phonological -->
<!--     information. -->
<!--   - Alternatively, the children in timepoint 1 may not be using the early -->
<!--     similarity of words during word recognition. That is, instead of immediate -->
<!--     incremental activation of lexical cohorts, the children may not be -->
<!--     activating the cohorts as reliably. This would imply that further study is -->
<!--     required on the evidence for when young children begin to show immediate -->
<!--     activation of cohorts. -->



### Late activation of semantic neighbors

The semantic competitors were from the same category as the target noun.
They showed late effects. *bee*–*fly* or *shirt*–*dress*


describe lexical dynamics for semantic foil

describe lack of individual differences at age 3




## General discussion

Children became more successful listerners. When they erred, they erred
on the side of the phonologically or semantically plausible word.


<!-- Phon looks scraps. -->





<!-- semantic scraps: -->

<!-- The looking patterns---that is, the shapes of the growth curves---were largely the same for each year. The main differences were that the age-3 curve was about 100&nbsp;ms slower to rise than the age-4 curve and that the age-5 curve -->

<!--   - That the effect of the foil increases each year indicates that the -->
<!--     semantic representations of words have strengthened. -->
<!--   - Is inhibition coming online at age 5? -->
<!--   - If children were just confused between bear/horse, fly/bee, -->
<!--     goat/sheep, etc., they should be confused more at younger ages when -->
<!--     they know much less about the world. So if it were confusion or -->
<!--     guess, the semantic foil should be stronger at age 3. But they are -->
<!--     also slower at word recognition in general at younger ages, so maybe -->
<!--     these things cancel each other out? -->


<!-- Talking points : -->

<!-- * I tested whether two child-level features predicted looks to the competitor image at age 3. -->
<!-- * One a priori expectation was that looks to the phonological foil would relate to phonological discrimination ability, because children who can reliably discriminate one-feature phonetic differences between words would have richer phonological or phonetic representations that supported word recognition. -->

<!-- * The other a prior expectation was that looks to semantic foil would relate to looks to the receptive vocabulary. However, neither predicted related to looks the semantic foil. -->





<!-- What's going on here: -->

<!--   - The weak phonological foils are indeed weaker than the strong foils. -->
<!--   - The strong semantic foils appear stronger than the weak ones. The -->
<!--     strong foils show a growth curve pattern of increasing looks away -->
<!--     from baseline and there a developmental difference among the growth -->
<!--     curves for each time point. -->
<!--   - Children have a lower advantage for the target (vs unrelated) in -->
<!--     weak foil trials because... why? My reading is that if the semantic -->
<!--     or phonological foil is effective, children will look at it instead -->
<!--     of the unrelated image. Conversely, if the semantic or phonological -->
<!--     foil are less effective, children will look more to the unrelated -->
<!--     image, which pulls down the ratio of looks to target versus the -->
<!--     unrelated image. -->





<!-- Each curve is the log odds of looking to the target, phonological foil, and -->
<!-- semantic foil versus the unrelated word. Positive values mean more looks to an -->
<!-- image type than the unrelated. If you think of the _y_ axis as the image's -->
<!-- _relatedness_ to the target, you can see a time course of relatedness in each -->
<!-- panel: Here early phonological effects meaning early relatedness and later, -->
<!-- flatter semantic effects meaning late relatedness. (These effects make even more -->
<!-- sense sense if phonological representations affect processing before semantic -->
<!-- ones.) -->

<!-- This plot suggests an important finding: Children becoming more sensitive to the -->
<!-- phonological and semantic foils as they grow older. (I use the verb *suggest* -->
<!-- because this is still a preliminary, unmodeled finding.) Jan and I had made -->
<!-- opposite predictions about whether this would happen. Her argument, I think, was -->
<!-- that children become better at word recognition by becoming better able to -->
<!-- inhibit interference from competing words. This plot would suggest that they -->
<!-- show increased sensitive to the target and foils words by looking less to the -->
<!-- unrelated word as they age and reapportioning those looks to the other three -->
<!-- lexically relevant words. -->
