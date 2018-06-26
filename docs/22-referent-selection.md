

Development of referent selection
=======================================================================
















## Nonwords versus real words

I asked whether the recognition of familiar words differed from the
fast-selecting of referents for a nonword. I fit a Bayesian mixed
effects logistic regression model, as in Chapter X. For the real word
and nonword conditions, there is a well-defined target image. For real
words, it is the familar image, and for nonwords, it is the novel image.
Therefore, I modeled the data under these assumptions. The outcome
measures were therefore:

* P(Look to familiar image | Hear a real word)
* P(Look to unfamiliar image | Hear a nonword )

The important analytic question is whether and to what degree these two
probabilities differ. This growth curve model is similar to the one in
Chapter X with cubic polynomial and a condition effect which interacts
with time features. Thus, the basic model is:

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

I fit a separate model for each year of the study.[^bayes-fail]
[Appendix \@ref(aim2-gca-models)](#aim2-gca-models) contains the R code
used to fit these models along with a description of the specifications
represented by the model syntax. I used moderately informative
priors---see Appendix X. For these analyses, I limited my attention to
the distractor-initial.


[^bayes-fail]: A single model containing all three years with
corresponding year effects, year-by-time interactions, and
year-by-condition-by-time conditions had difficulty converging, and even
when a working model was obtained, a bug in the modeling software
prevented me from obtaining posterior predictions. I reported the bug in
an issue for the package's source code repository. 


  - I model data from 300 ms to 1500.
  - I flipped the growth curve for the nonword condition so that it
    reflects the proportion of looking to the unfamiliar object when
    presented a nonword. Both the real word and nonword conditions
    measure referent selection as the probability of fixating on the
    appropriate referent when presented with a label.

I removed any Study x Child levels if a child had fewer than 4
fixations in a single time bin. Put another way, children had to
have at least 4 looks to one of the images in every 50 ms time bin.
This screening removed 13 children from Age 3,
15 from Age 4, and 6 from Age 5.



The figure below shows group average of growth curves---that is, I
averaged the participant's individual model-estimated or empirical
growth curves together--for each condition and age. 


<img src="22-referent-selection_files/figure-html/aim2-real-nonword-means-1.png" width="80%" style="display: block; margin: auto;" />

Recall from earlier chapters that in these growth curve models, I
consider only the intercept and linear time terms to be behaviorally
meaningful parameters. The intercept measures overall the average growth
curve value so it reflects looking reliability, and the linear time term
measures the overall stepness of the growth so it reflects lexical
processing efficiency. I also derive a measure of peak looking
probability by taking the median of top five points in a growth curve,
and this peak provides a measure of uncertainty (higher peaks indicate
less uncertainty). 

I evaluated the condition effects by looking at the effect of the real
word condition on the intercept and linear time terms. The two
conditions did not reliable differ at age 3. The real-word condition
effect on the intercept was &minus;0.19 [90%&nbsp;UI: &minus;0.43--0.05] and its interaction with
the linear time term was 0.45 [&minus;0.05--0.94]. Both these 90% intervals
include 0 as a plausible estimate for the condition difference, so I
conclude that the conditions did not differ on average at age 3.

There was an advantage for the nonword condition at age 4 and age 5. The
real-word effect was negative at age 4, &minus;0.82 [&minus;1.01--&minus;0.62], so that on
average, children looked less to target on the real words than the
nonword trials. There was a suggestive effect linear time effect at
age 4, &minus;0.52 [&minus;0.96--&minus;0.04]. The curve for real words was probably less
steep at age 4 but values near 0 remain plausible. At age 5, only the
intercept difference was credible, &minus;0.48 [&minus;0.70--&minus;0.27]. In general,
children performed better in the nonword condition than the real word
condition at age 4 and age 5. This difference shows up in the growth
curve model through intercept effects, although it is plausible that
children's nonword growth curves were steeper than the real word curves
at age 4.




The growth curve peaks follow a similar pattern of results. At age 3,
the average peak value was ... for real words and ... for nonwords. The
conditions did not significantly differ at this age. The nonword peaks
were significantly higher greater than real word peaks at age 4 [blah
vs. blah, p=value.] and at age 5 although the difference was smaller
[blah vs. blah, p=value.].







<!-- To evaluate the growth curve peaks, I computed the growth curve peak for -->
<!-- each participant x study x condition in each posterior sample and -->
<!-- averaged over the posterior to get an average growth curve peak. I used -->
<!-- a linear mixed effects model to regress growth curve peak onto age group -->
<!-- and experimental condition and age x condition with randomly varying -->
<!-- intercepts for each child and each child-year. -->


Importantly, the average real word peaks was xx at age 3 which that
children were beginning to reach ceiling performance early on. This is a
task for toddlers.




### Points for discussion

The advantage of nonwords over real words was an unexpected. My
pre-analysis hypotheses were that word recognition in the real word
condition would be easier than in the nonword condition, or failing
that, the two conditions would not reliably differ. I had discounted the
possibility of an overall advantage for nonwords over real words.


As in Chapter XX, I calculated the posterior distribution of growth
curves for each child x condition x year. To measure children's
lexical processing, I used the peak value each growth curve by taking
the median of the top 5 model fits. For each child, I calculated the
difference between the peak of the real word and the nonword growth
curves. This difference in peak values conveys the *condition advantage*
for a child. The figure below visualizes the condition advantages.

<img src="22-referent-selection_files/figure-html/aim2-gca-peaks-1.png" width="50%" style="display: block; margin: auto;" />


<img src="22-referent-selection_files/figure-html/aim2-gca-diffs-1.png" width="50%" style="display: block; margin: auto;" />





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


