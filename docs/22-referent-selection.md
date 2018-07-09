
Development of referent selection
=======================================================================


















## Nonwords versus familiar words

I asked whether the recognition of familiar words differed from the
fast-selecting of referents for nonwords. I fit a Bayesian mixed-effects
logistic regression growth-curve model, as in
[Chapter \@ref(fam-rec)](#fam-rec). For the real word and nonword
conditions, there is a well-defined target image: the familar image for
real words and the novel/unfamiliar image for nonwords. Under these
assumptions, the outcome measures were the probabilities of fixating to
the target image in each condition:

  - P(Look to familiar image | Hear a real word)
  - P(Look to unfamiliar image | Hear a nonword)

Both the real word and nonword conditions measure referent selection as
the probability of fixating on the appropriate referent when presented
with a label. The important analytic question is whether and to what
degree these two probabilities differ. The growth curve model is similar
to the one in [Chapter @ref(fam-rec)](#fam-rec) with cubic polynomial
but it adds a condition effect which interacts with time features. Thus,
the basic model is:

$$
\small
\begin{align*}
   \text{log-odds}(\mathit{looking\,}) =\
    &\beta_0 + 
      \beta_1\text{Time}^1 + 
      \beta_2\text{Time}^2 + 
      \beta_3\text{Time}^3\ + 
      &\text{[nonword growth curve]} \\
    (&\gamma_0 + 
      \gamma_1\text{Time}^1 + 
      \gamma_2\text{Time}^2 +
      \gamma_3\text{Time}^3)*\text{Condition} \
      &\text{[adjustments for real words]} \\
\end{align*}
$$

I fit a separate model for each year of the study.
[Appendix \@ref(aim2-gca-models)](#aim2-gca-models) contains the R code
used to fit these models along with a description of the specifications
represented by the model syntax. The mixed model included by-child and
by-child-by-condition random effects so that it captured how some of a
child's growth curve features may be similar between the conditions and
may differ between conditions.

For these analyses, I limited focus to distractor-initial trials, and
modeled the data from 300 to 1500 ms after target
onset. I removed any Age × Child levels if a child had fewer than 4
fixations in a single time bin. In other words, children had to have at
least 4 looks to one of the images in every 50 ms time bin. This
screening removed 13 children from age 3,
15 from age 4, and 6 from age 5.

Figure \@ref(fig:aim2-real-nonword-means) shows the group averages of the growth
curves. For each condition and age, I computed the empirical growth
curve for each participant, and I averaged the participants' growth
curves together to obtain group averages. I also applied this process
to 100 model-estimated growth curves.

(ref:aim2-real-nonword-means) Averages of participants' growth curves in
each condition and age. The lines represent 100 posterior predictions of
the group average. 

<div class="figure" style="text-align: center">
<img src="22-referent-selection_files/figure-html/aim2-real-nonword-means-1.png" alt="(ref:aim2-real-nonword-means)" width="80%" />
<p class="caption">(\#fig:aim2-real-nonword-means)(ref:aim2-real-nonword-means)</p>
</div>

In [Chapter \@ref(fam-rec)](#fam-rec), I claim that for these growth
curve models that only the intercept and linear time terms to be
behaviorally meaningful model parameters. The intercept measures overall
the average growth curve value so it reflects *looking reliability*, and
the linear time term measures the overall stepness of the growth so it
reflects *lexical processing efficiency*. I also derived a measure of
peak looking probability by taking the median of top five points in a
growth curve, and this peak provides a measure of *word recognition
certainty*. Higher peaks indicate less uncertainty about a word.

I evaluated the condition effects by looking at the effect of the real
word condition on the intercept and linear time terms. The two
conditions did not reliably differ at age 3. The real-word condition
effect on the intercept was &minus;0.19 [90%&nbsp;UI: &minus;0.43, 0.05] and its interaction with
the linear time term was 0.45 [&minus;0.05, 0.94]. Both these 90% intervals
include 0 as a plausible estimate for the condition difference, so there
is uncertainty about the sign of the effect. I therefore conclude
that the conditions did not credibly differ on average at age 3.

There was an advantage for the nonword condition at age 4 and age 5. The
real-word effect was negative at age 4, &minus;0.82 [&minus;1.01, &minus;0.62], so that on
average, children looked less to target for the real words than the
nonwords. There was a suggestive effect linear time effect at
age 4, &minus;0.52 [&minus;0.96, &minus;0.04]. The curve for real words was probably less
steep at age 4 but values near 0 remain plausible. At age 5, only the
intercept difference was credible, &minus;0.48 [&minus;0.70, &minus;0.27]. In general,
children performed better in the nonword condition than the real word
condition at age 4 and age 5. This difference shows up in the growth
curve model through intercept effects, although it is plausible that
children's nonword growth curves were steeper than the real word curves
at age 4.




Next, I analyzed the children's model-estimated growth curve peaks. Each
posterior sample of the model represents a plausible set of growth curve
parameters for the data, so for each of these samples, I calculated the
growth curves for each child and the peaks of the growth curves.
Figure \@ref(fig:aim2-gca-peaks) shows the the posterior averages of the
growth curves peaks for each participant.


(ref:aim2-gca-peaks) Growth curve peaks by child, condition and year of
the study. The movement of the medians conveys how the nonword peaks
effect increased from age 3 to age 4 and the real word peaks increased
from age 4 to age 5. The piling of points near the 1.0 line depicts how
children reached ceiling performance on this task.

<div class="figure" style="text-align: center">
<img src="22-referent-selection_files/figure-html/aim2-gca-peaks-1.png" alt="(ref:aim2-gca-peaks)" width="66%" />
<p class="caption">(\#fig:aim2-gca-peaks)(ref:aim2-gca-peaks)</p>
</div>




Descriptive statistics help reveal the developmental trends for this
task. At age 3, the median peak values are similar for the two
conditions, both around .83. The peaks increase for the nonword
condition in the following year with a median value of .92.
It is worth emphasizing what this statistic tells us: At age 4, half of
the children had a peak looking probability of .92 *or
greater*. In other words, children are performing near the ceiling on
this task by age 4. 

To quantify the degree of ceiling performance, I calculated the number
of children per condition with a growth curve peak greater than or equal
to .99 over the posterior distribution. For the nonword condition, there
were 23 [90%&nbsp;UI: 20, 26] children who performed at ceiling at age 3,
41 [36, 45] at age 4, 40 [36, 44] and at age 5. For
the real word condition, the number of children attaining ceiling
performance was more uneven: there were 20 [16, 24]
ceiling-performers at age 3, 13 [10, 16] at age 4, and
13 [10, 16] at age 5.




To compare peaks looking probabilities between ages, I fit a linear
mixed effects model with restricted maximum likelihood via the lme4 R
package [vers. 1.1.17; @lme4]. I regressed the
children's average growth curve peaks onto experimental condition, age
group, and the age × condition interaction. The model included randomly
varying intercepts for child and child-year. This modeling software does
not provide *p*-values for its effects estimates, so for these
comparisons, I decided that an effect was significant when the *t*
statistic for a model fixed effect has an absolute value of 2 or
greater. In practical terms, this convention interprets an effect as
"significant" when its estimate is at least 2 standard errors away
from 0. (@GelmanHill use this approach when with mixed models.)

At age 3, the two conditions did not significantly differ,
B<sub>real-nonword</sub> = .01, *t* = 0.95. At age 4,
nonword peaks were on average .09 proportion units greater
than the real word peaks, *t* = 5.79, and at age 5, the nonword
peaks were .04 proportion units greater than the real word
peaks, *t* = 2.56. For the nonword condition there was a
significant increase in the peaks from age 3 to age 4, *B*<sub>4-3</sub>
= .10, *t* = 5.99, whereas there was no improvement from
age 4 to age 5, *t* = 0.37. In the real word condition, there was
only a significant improvement from age 4 to age 5, *B*<sub>5-4</sub> =
.06, *t* = 3.25.


<!-- [pvalues]: The lme4 package does not provide *p*-values because it is -->
<!-- unclear what number to use for the degrees of freedom with hierarchical -->
<!-- or repeated measures data. One approach is the so-called "normal -->
<!-- approximation" which treats t-values like z-scores---i.e., drawn from a -->
<!-- normal distribution with mean 0 and standard deviation 1. Under this -->
<!-- approach, conventional significance obtains when is greater than or -->
<!-- equal to 1.96 in magnitude. I use 2 as the cutoff because I find significance thresholds are arbitrary. -->

<!-- > As in Chapter XX, I calculated the posterior distribution of growth -->
<!-- curves for each child x condition x year. To measure children's -->
<!-- lexical processing, I used the peak value each growth curve by taking -->
<!-- the median of the top 5 model fits. For each child, I calculated the -->
<!-- difference between the peak of the real word and the nonword growth -->
<!-- curves. This difference in peak values conveys the *condition advantage* -->
<!-- for a child. The figure below visualizes the condition advantages. -->





**Summary**. There is a decisive advantage for the nonword condition
after age 3. Performance begins to saturate at age 4 with the group
averages for peak looking probabilities over 90%. The real word
condition is more anomalous with performance only showing average
increases from age 4 to age 5.




## Does age 3 referent selection better predicts age 5 vocabulary?

I hypothesized that performance on the nonword condition would be a
better predictor of future vocabulary size than the real word condition.
This hypothesis follows from the assumption that fast referent
selection, as opposed to familiar word recognition, is a more relevant
skill for word-learning. Put another way, a child's ability to quickly
map a novel word to a referent is more closely related to the demands of
in the moment word-learning than familiar word recognition.

In [Chapter \@ref(fam-rec)](#fam-rec), I found that peak looking probability at age 3 positively
correlated with age 5 vocabulary. Pairing this finding with my
hypothesis, I predicted that the growth curve peaks in the nonword
condition at age 3 would be better predictors of vocabulary at age 5
than the real word peaks at age 3.




For these analyses, I regressed age-5 expressive vocabulary standard
scores onto the age-3 expressive vocabulary score and onto age-3 real
word peaks or age-3 nonword peaks. There were 116 children
with data available for this analysis. There was an expected strong
relationship between age 3 and age 5 vocabulary, *R*^2^ = .49.
A 1-SD (18-point) increase in vocabulary at age 3 predicted an
0.7-SD (10-point) increase at age 5. There was
no effect of age-3 peak over and above age-3 vocabulary, *p* = `p_real`.
There was a significant effect of the nonword peak, *p* =
.005, *ΔR*^2^ = .03, over and above age-3
vocabulary. A .1 increase in nonword peak probability predicted a
0.10-SD (1.4-point) increase in age-5
vocabulary. Figure \@ref(fig:age-5-from-peaks) depicts the difference
between the two conditions with a flat line for the real condition and
small slope for the nonword condition.

(ref:age-5-from-peaks) Marginal effects of age-3 referent selection
measures on age-5 expressive vocabulary standard scores. The vocabulary
scores were adjusted (residualized) to control for age-3 vocabulary, so
these regression lines show the effects of the predictors over and above
age-3 vocabulary.

<div class="figure" style="text-align: center">
<img src="22-referent-selection_files/figure-html/age-5-from-peaks-1.png" alt="(ref:age-5-from-peaks)" width="100%" />
<p class="caption">(\#fig:age-5-from-peaks)(ref:age-5-from-peaks)</p>
</div>

Finally, I tested whether the difference between nonword and real word
peaks within children predicted vocabulary growth. The differences do
not convey much information about how well the child performed: A
difference of 0 can happen if a child has peaks of .1 in both conditions
or .9 in both conditions. To control for general performance, I also
included the within-child averages of the two peaks. The model predicted
age-5 vocabulary using the within-child averages of peaks, the nonword
advantage, and age-3 vocabulary. In this case, condition-averaged
performance did not significantly predict age-5 vocabulary, *p* =
`p_both`. The condition differences did predict age-5 vocabulary: A .1
increase in the nonword condition advantage predicted a
0.08-SD (1.1-point) increase in age-5
vocabulary, *p* = `p_both`

**Summary**. A child's performance in the nonword condition at age 3
positively predicted expressive vocabulary size at age 5. This effect
held even when controlling age-3 vocabulary size, and the effect emerged
when using the absolute growth curve peak or using the relative
advantage of the nonword condition over the real word condition.
Although the effects were significant, the effect size were small. The
EVT-2 is normed to have an IQ-like scale with a mean of 100 and standard
deviation of 15. An increase of .1 in age-3 growth curve peak predicted
an increase in age-5 vocabulary of 1.4, appromately one
tenth of the test norm's standard deviations.




### Points for discussion

The advantage of nonwords over real words was an unexpected. My
pre-analysis hypotheses were that word recognition in the real word
condition would be easier than in the nonword condition, or failing
that, the two conditions would not reliably differ. I had discounted the
possibility of an overall advantage for nonwords over real words.


The results are consistent however with a novelty bias in reference selection
[@Horst2011].

Children hit ceiling performanceo on this task.

<!-- For this task, I will model how the looks to the familiar image differ -->
<!-- in each condition (real words, mispronunciations, nonwords) and how the -->
<!-- growth curves for each condition change year over year. This model will -->
<!-- use growth curve model described in [Growth Curve Analysis](#growth-curve-analysis) but -->
<!-- augmented with Condition effects. -->

<!-- I will examine whether and when any dissociation is observed for word -->
<!-- recognition in the real word and nonword conditions. @McMurray2012 argue that  -->
<!-- familiar word recognition and fast -->
<!-- association for novel words reflect the same cognitive process: referent -->
<!-- selection. Data from this task would support with this hypothesis when -->
<!-- the growth curves for looks to the familiar image are symmetrical for -->
<!-- the real word and nonword conditions. Figure \@ref(fig:le-means), showing data -->
<!-- from @MPPaper [, _n_\ =\ 34 children, 30-46 months old], shows some -->
<!-- symmetry for the real word and nonword conditions. -->

<!-- I tested whether the two measures ever dissociate by computing the -->
<!-- posterior predicted difference between the growth curves. This approach -->
<!-- is similar to the bootstrap-based divergence analyses used in some word -->
<!-- recognition experiments [e.g., @Oleson2015; @eyetrackingR]. The -->
<!-- essential question is when—at which specific time points—do two growth -->
<!-- curves differ from one another. The bootstrap approach -->
<!-- uses resampling to get an estimate, whereas I use posterior -->
<!-- predicted samples to estimate these differences. -->

<!-- Specifically, I will compute the posterior-predicted looks to the -->
<!-- familiar object in the real word condition, P(Familiar | Real Word, Time -->
<!-- *t*, Child *i*) and the analogous looks to the unfamiliar object in the -->
<!-- nonword condition, P(Unfamiliar | Nonword, Time *t*, Child *i*). The -->
<!-- difference between these two probabilities estimates how the time course -->
<!-- of word recognition differs between these two conditions, and I can use -->
<!-- 50% and 90% uncertainty intervals to determine during which time points -->
<!-- the curves credibly differ from each other. -->


