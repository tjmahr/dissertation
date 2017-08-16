**Dissertation Proposal**

Tristan Mahr

Department of Communication Sciences and Disorder,

University of Wisconsin–Madison

March 20, 2017



Research Hypotheses
===================

In this section, I outline the main hypotheses I plan to study for each
specific aim. This section is intended to preregister the main analyses
for this project, so I can cleanly separate confirmatory and exploratory
results.

Specific Aim 1 (Familiar Word Recognition and Lexical Competition)
------------------------------------------------------------------

-   Children’s accuracy and efficiency of recognizing words will improve
    each year.

-   There are stable individual differences in lexical processing of
    familiar words such that children who are relatively fast at Year 1
    remain relatively fast at Year 2 and Year 3.

-   However, the magnitude of these individual differences diminishes
    over time, as children converge on a mature level of performance for
    this paradigm.

-   As a consequence, individual differences in word recognition at age
    3, for example, will be more discriminating and predictive of age 5
    language outcomes than differences at age 4.

-   Vocabulary size and lexical processing will be tightly correlated
    such that large year-over-year gains in one measure will predict
    large year-over-years gains in the other measure.

-   Children will become more sensitive to lexical competitors as they
    age, based on the hypothesis that children discover similarities
    among words as a consequence of learning more and more words.

-   Children will differ in their sensitivity to lexical competitors,
    and these individual differences will correlate with other
    child-level measures.

Specific Aim 2 (Referent Selection and Mispronunciations)
---------------------------------------------------------

-   Children’s accuracy and efficiency of recognizing real words and
    fast-associating nonwords will improve each year.

-   Performance in real word recognition and fast association of
    nonwords will be highly correlated, based on the hypothesis that the
    same process (referent selection) operates in both situations.

-   Under the alternative hypothesis, real word recognition and fast
    referent selection reflect different skills with different
    developmental trajectories. Thus, if there is any dissociation
    between recognition of real words and nonwords, it will be observed
    in younger children.

-   Although these two measures will be correlated, I predict
    performance in the nonword condition will be a better predict of
    future vocabulary growth than performance in the real word
    condition. This hypothesis is based on the idea that fast referent
    selection is a more relevant skill for learning new words than
    recognition of known words.

-   For the mispronunciations, I predict children with larger
    vocabularies (that is, older children) will be more likely to
    tolerate a mispronunciation as a production of familiar word
    compared to children with smaller vocabularies.

-   Mispronunciations that feature later-mastered sounds (e.g.,
    *rice*/*wice*) will be more likely to be associated to novel objects
    than earlier-mastered sounds (*duck*/*guck*).

Specific Aim 3 (Computational Modeling)
---------------------------------------

The research questions for this aim are more exploratory than
confirmatory. I plan to use the well-studied TRACE model of spoken word
recognition (McClelland & Elman, 1986). The TRACE model has no built-in
semantic representations, so it will be used to model data from the
two-image mispronunciation experiment (Aim 2) and a “semantic-less”
subset of the data from the four-image experiment (Aim 1). Research
questions include:

-   What parameterizations of the TRACE model of word recognition
    account Year 1 word recognition data?

-   If the default model of TRACE represents “default” adult listeners,
    how the children are Year 1 different than adults.

-   How do these parameterizations have to change year over year to
    accommodate the data from older children at Year 2 and again at Year
    3? What is the developmental story for these changing
    parameterizations?

-   How does the model handle mispronunciations? What changes are
    required to accommodate mispronunciations and novel words? Mayor and
    Plunkett (2014) have simulated mispronunciation experiments like
    White and Morgan (2008), although it is not clear how the model can
    accommodate the current mispronunciation experiment which presents
    mispronunciations and nonwords.

-   How does the model’s vocabulary parameters (namely the size and
    composition of the lexicon used for the simulations) correlate with
    the vocabulary size of participants?

-   Can the model simulations incorporate other child-level measures?
    For example, do children who demonstrate poorer speech perception in
    a non-eyetracking speech discrimination task require lower levels of
    phoneme inhibition in their word recognition models?

\
=

Approach
========

General Research Design: Participants
-------------------------------------

Word recognition data and vocabulary data, among other measures, were
collected over a three-year longitudinal study (R01DC002932; the
Learning to Talk project). Children were 28–39 months-old at Time 1,
39–52 at Time 2, and 51–65 at Time 3. Approximately, 180 children
participated at Time 1, 170 at Time 2, and 160 at Time 3. Of these
children, approximately 20 were identified by their parents as late
talkers. Prospective families were interviewed over telephone before
participating in the study, and “children with an individualized
education program or any parent-reported visual problems, language
problems, or developmental delays were not scheduled for testing” (Law,
Mahr, Schneeberg, & Edwards, 2016).[^1] Recruitment and data collection
occurred at two Learning to Talk lab sites—one at the University of
Wisconsin–Madison and the other at the University of Minnesota.

The table below summarizes the cohort of children in each year of
testing. The numbers and summary statistics here are approximate,
describing children who participated at each year, but whose data may
still be excluded from the analyses. Some potential reasons for
exclusion include: excessive missing data during eyetracking, experiment
or technology error, developmental concerns not identified until later
in study, or a failed hearing screening. Final sample sizes will depend
on the measures needed for an analysis and the results from data
screening checks. For each project aim, I will disclose all measurements
and data exclusions following guidelines by the Center for Open Science
(Nosek et al., 2014).

                                            Year 1             Year 2             Year 3
  ----------------------------------------- ------------------ ------------------ ------------------
  N                                         184                175                160
  Boys, Girls                               94, 90             89, 86             82, 78
  Maternal education: Low, Middle, High\*   15, 98, 71         12, 92, 71         6, 90, 64
  Dialect: MAE, AAE                         171, 13            163, 12            153, 7
  Parent-identified late talkers            20                 19                 16
  Age (months): Mean (SD) \[Range\]         33 (3) \[28–39\]   45 (4) \[39–52\]   57 (4) \[51–66\]
  EVT-2 standard score: Mean (SD)           115 (18)           118 (16)           118 (14)
  PPVT-4 standard score: Mean (SD)          113 (17)           120 (16)           —
  GFTA-2 standard score: Mean (SD)          92 (13)            —                  91 (13)

\*: Education levels: Low: less than high school, or high school;
Middle: trade school, technical or associates degree, some college, or
college degree; and High: graduate degree.

General Eyetracking Procedure
-----------------------------

Two eyetracking experiments were performed each year of the longitudinal
study. These experiments followed the same essential procedure: During
each trial, photographs of images appeared on a computer screen for a
few seconds followed by a prompt to view one of the images (e.g., *find
the dog*). This procedure measures a child’s real-time comprehension of
words by capturing how the child’s gaze location changes over time in
response to speech.

### Experiment Administration

Children participating in the study were tested over two lab visits
(i.e., on different dates). The first portion of each visit involved
“watching movies”—that is, performing two blocks of the eyetracking
experiments. A play break or hearing screening occurred between the two
eyetracking blocks, depending on the visit.

Each eyetracking experiment was administered as a block of trials (24
for the four-image task and 38 for the two-image task). Children
received two different blocks of each experiment. The blocks for an
experiment differed in trial ordering and other features (see Specific
Procedures). Experiment order and block selection were counterbalanced
over children and visits. For example, a child might have received Exp.
1 Block A and Exp. 2 Block B on Visit 1 and next received Exp. 2 Block A
and Exp. 1 Block B on Visit 2. The purpose of this presentation was to
control possible ordering effects where a particular experiment or block
benefited from consistently occurring first or second.

Experiments were administered using E-Prime 2.0 and a Tobii T60XL
eyetracker which recorded gaze location at a rate of 60 Hz. The
experiments were conducted by two examiners, one “behind the scenes” who
controlled the computer running the experiment and another “onstage” who
guided the child through the experiment. At the beginning of each block,
the child was positioned so the child’s eyes were approximately 60 cm
from the screen. The examiners calibrated the eyetracker to the child’s
eyes using a five-point calibration procedure (center of screen and
centers of four screen quadrants). The examiners would repeated this
calibration procedure if one of the five calibration points for one of
the eyes did not calibrate successfully. During the experiment, the
behind-the-scenes examiner monitored the child’s distance from the
screen and whether the eyetracker was capturing the child’s gaze. The
onstage examiner coached the child to stay fixated on the screen and
repositioned the child as needed to ensure the child’s eyes were being
tracked. Every six or seven trials in a block of an experiment, the
experiment briefly paused with a reinforcing animation or activity.
During these breaks, the onstage examiner could reposition the child if
necessary before resuming the experiment.

We used a gaze-contingent stimulus presentation. “After 2 s of
familiarization time with the images in silence, the experiment paused
to verify that the child’s gaze was being tracked. After 300 ms of
continuous gaze tracking, the trial advanced. Otherwise, if the gaze
could not be verified after 10 s, the trial advanced. This step ensured
that for nearly every trial, the gaze was being tracked before playing
the carrier phrase, or in other words, that the child was ready to hear
the carrier stimuli” (Mahr & Edwards, in revision). During Year 1 and
Year 2, an attention-getter (e.g., *check it out*!) played 1 s following
the end of the target noun. These reinforcers were dropped in Year 3 to
streamline the experiment for older listeners.

### Stimuli

For both experiments, “stimuli were presented in children’s home
dialect, either Mainstream American English (MAE) or African American
English (AAE). We made an initial guess about what the home dialect was
likely to be based on a number of factors, including the recruitment
source and the child’s address. For most children, the home dialect was
MAE. If we thought the home dialect might be AAE, a native AAE speaker
who was a fluent dialect-shifter between AAE and MAE was scheduled for
the lab visit, and she confirmed the home dialect by listening to the
caregiver interact with the child during the consent procedure at the
beginning of the visit” (Mahr & Edwards, in revision). Prompts to view
the target image of a trial (e.g., *find the girl*) used the carrier
phrases “find the” and “see the”. These carriers were recording in the
frame “find/see the egg” and cross-spliced with the target nouns to
minimize coarticulatory cues on the determiner “the”.

The images used in each experiment consisted of color photographs on
gray backgrounds. These images were piloted in a preschool classroom to
ensure that children consistently used the same label for familiar
objects and did not consistently use the same label for novel/unfamiliar
objects.

### Data Preparation

Data from both experiments were prepared using the same procedure. “We
mapped the gaze *x*-*y* coordinates onto the images onscreen. We
performed *deblinking* by interpolating short windows of missing data
(up to 150 ms) if the child fixated on the same image before and after a
missing data window. In other words, if the gaze did not shift to
another image, and if the missing data window was short enough, that
window was classified as a blink and interpolated, using the fixated
image as the imputed value” (Mahr & Edwards, in revision). Next, we
performed trial-level cleaning. “We examined eyetracking data in the 2-s
window following the onset of the target word. A trial was considered
unreliable if at least 50% of the eyetracking data during the 2-s window
was missing. These trials were not reliable because the child did not
look at the display for the majority of the analysis window” (Mahr &
Edwards, in revision). If more than half of a child’s trials, combined
across blocks, were unreliable, that child was excluded from analysis.
“Finally, we downsampled our data into 50-ms bins, reducing the
eyetracking sampling rate from 60 Hz to 20 Hz. This procedure smoothed
out high-frequency noise in the data by pooling together data from
adjacent frames” (Mahr & Edwards, in revision).

Specific Procedure: Aim 1 (Familiar Word Recognition and Lexical Competition)
-----------------------------------------------------------------------------

*Visual World Paradigm Task.* In eyetracking studies with toddlers, two
familiar images are usually presented: a target and a distractor. This
experiment is a four-image eyetracking task that was designed to provide
a more demanding word recognition task for preschoolers. In this
procedure, four familiar images are presented onscreen followed by a
prompt to view one of the images (e.g., *find the bell!*). The four
images include the target word (e.g., *bell*), a semantically related
word (*drum*), a phonologically similar word (*bee*), and an unrelated
word (*swing*).

> ![C:\\Users\\mahr\\Desktop\\GitRepos\\prospectus\\misc\\rwl-screens\\TimePoint1\\actual\\Block2\_17\_swing2\_bell2\_bee2\_drum2\_UpperRightImage\_bell.png](media/image1.png){width="3.2048173665791775in"
> height="2.0in"}
>
> *\
> Figure.* Example display for the target *bell* with the semantic foil
> *drum*, the phonological foil *bee*, and the unrelated *swing*.

Specific Procedure: Aim 2 (Referent Selection and Mispronunciations)
--------------------------------------------------------------------

*Mispronunciation Task.* This experiment is an adaptation of the
mispronunciation detection task by White and Morgan (2008) and Law and
Edwards (2015). In this experiment, two images are presented onscreen—a
familiar object and an unfamiliar object—and the child hears a prompt to
view one of the images. In the *correct pronunciation* (or *real word*)
and *mispronunciation* conditions, the child hears either the familiar
word (e.g., *soup*) or a one-feature mispronunciation of the first
consonant of the target word (\[*sh*\]*oup*). Importantly, within a
block of trials, the child never hears both the correct and
mispronounced forms of the word. These conditions are designed to test
whether children map mispronunciations to novel words. To encourage fast
referent selection, there were also trials in a *nonword* condition
where the label was an unambiguous novel word (e.g., *cheem* presented
with images of a bed and a novel-looking pastry mixer). Each nonword was
constructed to match the phonotactic probability of one of the
mispronunciations.

> ![C:\\Users\\mahr\\Desktop\\GitRepos\\mispronunciation\\misc\\mp-screens\\actual-screens\\Block1\_03\_MP\_bull2\_duck2\_ImageR\_guk.png](media/image2.png){width="3.2in"
> height="2.0in"}
>
> *\
> Figure.* Example display for a trial in which *duck* is mispronounced
> as “guck”.

In a block of trials, there were 12 trials each from the nonword
condition, correct production condition, and mispronunciation
conditions, and children received two blocks of the experiment. A
complete list of the items used in the experiment over the three years
of the study is included in Appendix A.

Outcome Measures
----------------

The primary outcome measure for this project is word recognition
performance, and I will study how it changes over time, under different
experimental conditions, across children, and so on. I will measure word
recognition performance using eyetracking growth curves. In this
technique, I aggregate looking locations across trials to compute the
proportion of looks to the target object (versus the distractor images)
at each time point after the onset of the target word. This growth curve
measures how the probability of fixating on a named object changes over
time. Thus, children who have steeper accuracy growth curves demonstrate
faster word recognition because the probability of looking at a named
object increases more quickly over time.

The other primary child-level measurements of interest for this project
are vocabulary and speech perception. Expressive vocabulary was measured
at all three years using the Expressive Vocabulary Test (EVT-2,
Williams, 2007). Receptive vocabulary was measured at Year 1 and Year 2
using the Peabody Picture Vocabulary Test (PPVT-4, L. M. Dunn & Dunn,
2007). These tests will provide child-level measures of vocabulary and
vocabulary growth. At Year 1 and Year 2, we measured speech perception
using a minimal-pair discrimination task (as in Baylis, Munson, &
Moller, 2008), and Year 2 and Year 3, we measured speech perception with
a speech sound judgment task (SAILS as in Rvachew, 2006). Performance on
these tasks will quantify individual differences in speech perception.

Two other relevant measures include an articulation test administered at
Year 1 and Year 3 (GFTA-2, Goldman & Fristoe, 2000) and phonological
awareness given at Year 2 and Year 3 (CTOPP-2, Wagner, Torgesen,
Rashotte, & Pearson, 2013). They are relevant because they draw on a
child’s phonological knowledge of words, but I limit their consideration
for only post-hoc, exploratory analyses because they measure a child’s
speech production performance.

Sample Data
-----------

The figure below shows the development of word recognition on the
four-image task over the three years of the longitudinal study for two
participants in this data set. To limit data-peeking, I only considered
at data from the first 20 participants and then selected two patterns of
development with clean individual differences.

> ![C:\\Users\\mahr\\Desktop\\GitRepos\\prospectus\\sample-data.png](media/image3.png){width="5.93043416447944in"
> height="3.810340113735783in"}

*Figure.* Data for two children on the four-image task.

The participant on the left showed substantial gains in processing
ability from year to year, whereas the child on the right showed
approximately the same level of performance each year, with some small
gains in peak accuracy and rate of change. The child with substantial
changes in word recognition also showed gains in expressive vocabulary
with improved *standard* scores on the EVT-2: 83 at Year 1, 95 at Year
2, and 103 at Year 3. In contrast, the child with consistent processing
had an above-average standard expressive vocabulary score during each
year of the study: 133 at Year 1, 138 at Year 2, and 130 at Year 3.

These two children give a glimpse of the many possible developmental
trajectories for this task and how they relate to expressive vocabulary.
The main work of this project will be describing and characterizing the
trajectories of many children on different aspects of lexical
processing.

General Analysis
----------------

### Growth Curve Analysis

Eyetracking growth curves will be analyzed using **Bayesian mixed
effects logistic regression**. I will use *logistic* regression because
the outcome measurement is a probability (the log-odds of looking to the
target image versus a distractor). I will use *mixed-effects* models
because I want to estimate a separate growth curve for each child (to
measure individual differences in word recognition) but also treat each
child's individual growth curve as a draw from a distribution of related
curves.

I plan to use *Bayesian* techniques to study a generative model of the
data. Instead of reporting and describing a single, best-fitting model
of some data, Bayesian techniques consider an entire distribution of
plausible models that are consistent with the data and any prior
information we have about the models. By using this approach, I can
explicitly quantify uncertainty about statistical effects and draw
inferences using estimates of uncertainty (instead of using statistical
significance—which is not a straightforward matter for mixed-effects
models).[^2]

 

The eyetracking growth curves will be fit using an orthogonal cubic
polynomial function of time (a now-conventional approach; see Mirman,
2014). Put differently, I will model the probability of looking to the
target during an eyetracking task as:

log­odds(*looking to target*) = *B*~0~ + *B*~1~ × Time^1^ + *B*~2~ ×
Time^2^ + *B*~3~ × Time^3^

That the time terms are *orthogonal* means that Time^1^, Time^2^ and
Time^3^ are transformed so that they are uncorrelated. Under this
formulation, the parameters *B*~0~ and *B*~1~ have a clear
interpretation in terms of lexical processing performance. The
intercept, *B*~0~, measures the area under the growth curve—or the
probability of fixating on the target word averaged over the whole
window. We can think of *B*~0~ as a measure of average accuracy or of
*word recognition reliability*. The linear time parameter, *B*~1~,
estimates the steepness of the growth curve—or how the probability of
fixating changes from frame to frame. We can think of *B*~1~ as a
measure of *processing efficiency*, because growth curves with stronger
linear features exhibit steeper frame-by-frame increases in looking
probability.[^3]

For each experimental task, I will study how word recognition changes
over time by modeling how growth curves change over developmental time.
This amounts to study how the growth curve parameters changes year over
year in the study. I can model the data for an eyetracking task by
including dummy-coded indicators for Year 1, Year 2, and Year 3 and
having these indicators interact with the growth curve parameters. In
such a model, Year 2 would be the reference year, so the Year 1
parameters would estimate how the word-recognition-curves change from
Year 2 to Year 1, and Year 3 parameters would be interpreted similarly.

log­odds(*looking to target*) = *C*~0~ + *C*~1~ × Time^1^ + *C*~2~ ×
Time^2^ + *C*~3~ × Time^3^ \[Year 2 growth curve\]

*C~i~* = *B~i~* + *B~i~*~Year1~ × Year1 + *B~i~*~Year3~ × Year3
\[Adjustments to Year 2 curve\]

Thus, the interaction effects for the intercept term describe how
overall accuracy changed between years, and interaction effects for the
linear-time terms describe changes in overall processing efficiency
between years.

[]{#_Toc477528797 .anchor}Lastly, a brief comment about priors. Bayesian
models require prior information (“priors”). For these models, I will
use weakly to moderately informative priors. For example, suppose *x*
and *y* are scaled to mean 0 and standard deviation 1. A weakly
informative prior for the effect of *x* on *y* might be Normal(0, 5)—a
normal distribution with mean 0 and standard deviation 5. If we fit a
regression model and observed an effect size of 12 SD units, our first
assumption would be that something went wrong with our software. The
weakly informative prior captures this level of prior information. A
moderately informative prior would be Normal(0, 1). This prior
information captures our disciplinary experience that effect sizes
greater than ±1 relatively uncommon in child language research. A
strongly informative prior for this effect might be something like
Normal(.4, .1) which says that our model should be very skeptical of
negative effects and of effects larger than .8. For this project, I will
default to the first two levels of prior information.

Specific Analysis: Aim 1 (Familiar Word Recognition and Lexical Competition)
----------------------------------------------------------------------------

In the four-image task, I will model the development of familiar word
recognition by studying how looks to the target image change year over
year, as described in General Analysis.

I predict that children will be more sensitive to the phonological foil
and semantic foils in this task as they age and learn more words. This
hypothesis is based on the idea that children discover similarities
among words as they learn word and integrate them into their lexicon. To
test this hypothesis, I will study how the probability of fixating on
the foils changes over trial-time and how these growth curves change
from year to year. In the conventional model of eyetracking data, the
outcome is a binomial choice—Target versus Distractor—and we can
estimate the log-odds of fixating on the target image relative to the
distractors. To study the specific effect of the Phonological foil in
this task, Law, Mahr, Schneeberg, and Edwards (2016) treated the
Unrelated foil as a reference distractor and compared two separate
binomial growth curves: Target versus Phonological, and Target versus
Unrelated. The same technique was used on the Semantic foil as well.
With this approach, shown below, we observed an early negative effect of
the phonological foil and a late negative effect of the semantic foil.

> ![](media/image4.png){width="4.7043471128608925in"
> height="3.8740485564304463in"}
>
> *Figure.* Figure 4 from Law, Mahr, Schneeberg, and Edwards (2016)
> demonstrates the strategy for examining lexical competition effects
> where the semantic foil and phonological foil are compared to the
> unrelated image.

I plan to employ this technique for studying lexical competition effects
and their development from Year 1 to Year 2 to Year 3.[^4] Increased
lexical completion would be reflected in greater interference from the
foils compared to the unrelated image.

A more comprehensive statistical model for this experiment would capture
the fact that the data are multinomial: Target versus Phonological
versus Semantic versus Unrelated. However, multinomial mixed effects
growth curves have not been used for eyetracking data. They are not
estimable with the standard classical modeling software (lme4). I plan
to examine whether such a model is feasible with Bayesian techniques,
but it may prove to be too unstable. In that case, I will fall back to
the above described strategy.

I will also examine whether individual differences in lexical processing
are stable over time. For an initial analytic step, I will identify how
frequently children change quartiles or deciles. The idea here is that
stable individual differences in processing should preserve some
relative rankings—fast-processing children should remain relatively fast
compared to their peers. If children make large swings in their
rankings, e.g., changing from the bottom 55^th^ to the 30^th^
percentile, then we have evidence that these rankings are unstable. I am
also interested in how the magnitude of individual differences change
over time. The differences among children could diminish over time so
that the rankings are unstable and reflect small variations among
children.

Another question concerns the relationship between the development of
lexical processing and the development of vocabulary size. Specifically,
I will ask how age-adjusted lexical processing measures (accuracy and
efficiency) correlate with age-adjusted vocabulary size each year.
Moreover, I will also examine whether children who make large gains in
vocabulary size also show large concurrent changes in their lexical
processing measures.

Specific Analysis: Aim 2 (Referent Selection and Mispronunciations)
-------------------------------------------------------------------

For this task, I will model how the looks to the familiar image differ
in each condition (real words, mispronunciations, nonwords) and how the
growth curves for each condition change year over year. This model will
use growth curve model described in the General Analysis section but
augmented with Condition effects.

I will examine whether and when any dissociation is observed for word
recognition in the real word and nonword conditions. McMurray, Horst,
and Samuelson (2012) argue that familiar word recognition and fast
association for novel words reflect the same cognitive process: referent
selection. Data from this task would support with this hypothesis when
the growth curves for looks to the familiar image are symmetrical for
the real word and nonword conditions. The figure below, showing data
from Law and Edward (2015; 34 children, 30-46 months old), shows some
symmetry for the real word and nonword conditions.

> ![C:\\Users\\mahr\\Desktop\\GitRepos\\prospectus\\notebooks\\le\_means.png](media/image5.png){width="5.0in"
> height="4.0in"}
>
> *Figure.* Condition averages for data described by Law and Edwards
> (2015; cf. Figure 2 in the original manuscript).

I will test whether the two measures ever dissociate by computing the
posterior predicted difference between the growth curves. This approach
is similar to the bootstrap-based divergence analyses used in some word
recognition experiments (e.g., Oleson, Cavanaugh, McMurray, & Brown,
2015; Dink & Ferguson, 2015). The essential question is when—at which
specific time points—do two growth curves differ significantly from one
another. The bootstrap approach uses resampling to get an estimate,
whereas I will use posterior predicted samples to estimate these
differences. (I have not seen my approach used yet in the literature, so
it is a small innovation.)

Specifically, I will compute the posterior-predicted looks to the
familiar object in the real word condition, P(Familiar | Real Word, Time
*t*, Child *i*) and the analogous looks to the unfamiliar object in the
nonword condition, P(Unfamiliar | Nonword, Time *t*, Child *i*). The
difference between these two probabilities estimates how the time course
of word recognition differs between these two conditions, and I can use
50% and 90% uncertainty intervals to determine during which time points
the curves credibly differ from each other. If feasible, I will also
examine whether these measures dissociate *within* children and examine
which child-level factors are associated with these kinds of listeners.

Even though performance on the real word and nonword conditions might be
highly correlated, one might intuitively hypothesize that that
performance on the nonword condition to be a better predictor of
concurrent or future vocabulary size. The rationale would be that
referent selection for novel words is a more transparent test of the
word learner’s basic task of associating new labels with objects.
Therefore, I will examine how each of these measures relates to
vocabulary growth.

I will describe how looking behavior in the mispronunciation condition
changes over time and changes for specific mispronunciation patterns.
Overall, I predict that children will be more tolerant of
mispronunciations as they age, because older children know more words
and have more implicit knowledge about the similarities among words. As
for specific mispronunciation items, let us (safely) suppose that speech
perception improves with age, especially for later mastered sounds. Then
we should expect that looking patterns for the *rice*-*wice* trials
change significantly between Year 2 and Year 3, at least compared to
looking patterns on trials with mispronunciations of earlier acquired
sounds (e.g., *girl*-*dirl* or *duck*-*guck*). Therefore, I will examine
individual mispronunciation effects and how they are associated with
child-level measures, including speech perception.

Specific Analysis: Aim 3 (Computational Modeling)
-------------------------------------------------

### TRACE Model Architecture

TRACE (McClelland & Elman, 1986) is an interactive activation model, and
it interprets an input pattern by spreading energy (activation) through
a network of processing units. The pattern of activation over the
network is its interpretation of the input signal, so that more active
units represent more likely interpretations. Over many processing
cycles, the network propagates energy among its connections until it
settles into a stable pattern of activation.

The input for TRACE is a mock-speech signal that activates perceptual
feature-detectors. These units respond to phonetic features like voicing
or vocalic resonance. The perceptual units activate phoneme units, and
the phoneme units activate lexical word units, as shown below.

> ![https://upload.wikimedia.org/wikipedia/en/e/e4/TRACE\_architecture.jpg](media/image6.jpeg){width="4.447285651793526in"
> height="4.2in"}
>
> *Figure.* TRACE model architecture (cf. Figure 1 in Strauss, Harris, &
> Magnuson, 2007). Thick arrows indicate excitatory connections between
> layers, including a top-down connections from words onto phoneme
> units. Lines with points at the end reflect inhibitory connections
> among competing units within a layer. Image source:
> <https://en.wikipedia.org/wiki/File:TRACE_architecture.jpg>

Units within a level (phonetic, phonemic, lexical) compete through
lateral inhibition, so that more active units can suppress less active
units. This inhibition allows the network to rule out possible units and
narrow its interpretations over time. There are also top-down
connections so that word units in the lexical layer can reinforce the
sound units that make up those words. One consequence of this feature is
that the network can resolve ambiguous phonemes, as in *Xift* where *X*
is a sound between /k/ and /g/ and top-down influence supports *gift*
rather than *kift­*. Lastly, activation in units gradually decays over
time, and the network will eventually “forget” it input pattern to
return to a resting state.

The model parameters that govern how activation propagates through the
network map onto psychological processing constructs. For instance, the
phoneme inhibition strength parameter controls how decisively (or
categorically) the network interprets speech sounds. Phoneme-to-word
activation strength reflects how quickly speech sounds begin to activate
words. Decay parameters control the model’s temporary memory for
different kinds of representations.

### Modeling Looking Data

To simulate behavioral data, we need a *linking hypothesis* for
translating between human behavior and network behavior (Magnuson,
Mirman, & Harris, 2012). During each network cycle, some words are
activated, some more activated than others, so that the unit with the
highest activation is the preferred interpretation of the input. We can
convert these activations into probabilities using the *softmax*
function:

$$\mathrm{P}\left( \mathrm{\text{Word}}_{\mathrm{w}} \right)\mathrm{\  = \ softmax}\left( \mathrm{\text{activation}}_{\mathrm{w}} \right)\mathrm{\  = \ }\frac{\exp\left( \mathrm{k}\mathrm{\  \times \ }\mathrm{\text{activation}}_{\mathrm{w}} \right)}{\sum_{}^{}{\exp\left( \mathrm{k}\mathrm{\  \times \ }\mathrm{\text{activation}}_{\mathrm{\lbrack}\mathrm{\text{words\ to\ choose\ from}}\mathrm{\rbrack}} \right)}}$$

In other words, scale the activation using some parameter *k*,
exponentiate the scaled activation values of all relevant choices, and
the proportion of the total exponentiated activation belonging to word w
is the probability of fixating on word *w*.[^5] The scaling value *k* is
manipulated to help the model-simulated probabilities match the observed
looking probabilities.

The next step, and this process will be rather open-ended and iterative,
is to simulate the behavioral data with the model. As a first step, I
will need to create a developmentally appropriate lexicon. I will use
developmental norms and databases to determine an appropriate set of
items. I will first try to simulate the mispronunciation experiment.
Mayor and Plunkett (2014) successfully simulated some mispronunciation
data from experiments with data, so I will borrow some of their
strategies for modeling these kinds of experiments. After I get the
model to simulate Year 1 data, I will explore which parameters need to
change to account for Year 2 and then Year 3 data. There are many
degrees of freedom (model parameters) for how to replicate these
development changes, so I will plan to systematically report the model
fitting and the development consequences of the model fit.

The four-image experiment is slightly trickier, because it incorporates
semantically related information, and TRACE has no built-in semantic
representations. Two options for modeling the experiment are 1) to
ignore looks to the semantic foil, following the Luce choice rule (1959)
and 2) to try to incorporate semantic information into the model by
modifying connections between semantically related words—although it is
unclear whether either is tractable. At any rate, part of this project
will be to explore how to reconcile these data with this apparent
limitation with the TRACE model.

Finally, I would like to account for individual differences among
children and incorporate child-level information into the simulations.
Specifically, I would like to test how vocabulary differences are
associated with large lexicons for model simulations. Moreover, I would
like to whether children’s speech perception abilities systematically
relate to the model’s phonological activation parameters. Such a
correspondence would further validate the models. These simulations
would further validate these child-level measures by describing how they
specifically affect word recognition.

For these research questions, I will following the modeling heuristics
described by Magnuson, Mirman, and Harris (2012). For example, for any
modeling failures, I will assess the failure in terms of the
computational consequences: Is the failure a problem with the theory,
implementation, parameters or link between human data and model
activity? Similarly, can the model fit specific item effects or just
condition effects? The authors provide other heuristics, and these
guidelines heuristics will help formalize the assessment and comparison
of computational models.

Works Cited
===========

Allopenna, P. D., Magnuson, J. S., & Tanenhaus, M. K. (1998). Tracking
the time course of spoken word recognition using eye movements: Evidence
for continuous mapping models. *Journal of Memory and
Language*, *38*(4), 419–439. doi:10.1006/jmla.1997.2558

Baylis, A. L., Munson, B., & Moller, K. T. (2008). Factors affecting
articulation skills in children with velocardiofacial syndrome and
children with cleft palate or velopharyngeal dysfunction: A preliminary
report. *The Cleft Palate-Craniofacial Journal*, *45*(2), 193–207.
doi:10.1597/06-012.1

Cristia, A., Seidl, A., Junge, C., Soderstrom, M., & Hagoort, P. (2014).
Predicting individual variation in language from infant speech
perception measures. *Child Development*, *85*(4), 1330–1345.
doi:10.1111/cdev.12193

Dink, J. W., & Ferguson, B. (2015). *eyetrackingR: An R Library for
Eye-tracking Data Analysis*. Retrieved from http://www.eyetrackingr.com.

Dunn, L. M., & Dunn, D. M. (2007). *Peabody Picture Vocabulary Test,
Fourth Edition*. San Antonio, TX: Pearson Education.

Ellis Weismer, S., Haebig, E., Edwards, J., Saffran, J., & Venker, C. E.
(2016). Lexical Processing in Toddlers with ASD: Does Weak Central
Coherence Play a Role? *Journal of Autism and Developmental Disorders*,
1–15. doi:10.1007/s10803-016-2926-y

Fernald, A., & Marchman, V. A. (2012). Individual differences in lexical
processing at 18 months predict vocabulary growth in typically
developing and late-talking toddlers. *Child Development*, *83*(1),
203–222. doi:10.1111/j.1467-8624.2011.01692.x

Fernald, A., Swingley, D., & Pinto, J. P. (2001). When half a word is
enough: Infants can recognize spoken words using partial phonetic
information. *Child Development*, *72*(4), 1003–15.
doi:10.1111/1467-8624.00331

Gelman, A., & Hill, J. (2007). *Data analysis using regression and
multilevel/hierarchical models*. New York, NY, USA: Cambridge University
Press.

Goldman, R., & Fristoe, M. (2000). *Goldman-Fristoe Test of
Articulation, Second Edition*. Minneapolis, MN: Pearson.

Hart, B., & Risley, T. R. (1995). *Meaningful differences in the
everyday experience of young American children*. Baltimore: P.H.
Brookes.

Hoff, E. (2003). The specificity of environmental influence:
Socioeconomic status affects early vocabulary development via maternal
speech. *Child Development*, *74*(5), 1368–1378.
doi:10.1111/1467-8624.00612

Huang, Y. T., & Snedeker, J. (2011). Cascading activation across levels
of representation in children’s lexical processing. *Journal of Child
Language*, *38*(3), 644–661. doi:10.1017/S0305000910000206

Kapnoula, E. C., Packard, S., Gupta, P., & McMurray, B. (2015).
Immediate lexical integration of novel word forms. *Cognition*, *134*,
85–99. doi:10.1016/j.cognition.2014.09.007

Kruschke, J. (2014). *Doing Bayesian data analysis: A tutorial with R,
JAGS, and Stan*. Academic Press.

Law, F., II, & Edwards, J. R. (2015). Effects of vocabulary size on
online lexical processing by preschoolers. *Language Learning and
Development*, *11*(4), 331–355. doi:10.1080/15475441.2014.961066

Law, F., II, Mahr, T., Schneeberg, A., & Edwards, J. R. (2016).
Vocabulary size and auditory word recognition in preschool
children. *Applied Psycholinguistics*. doi:10.1017/S0142716416000126

Lew-Williams, C., & Fernald, A. (2007). Young children learning Spanish
make rapid use of grammatical gender in spoken word recognition.
*Psychological Science*, *18*(3), 193–8.
doi:10.1111/j.1467-9280.2007.01871.x

Luce, R. D. (1959). *Individual Choice Behavior a Theoretical Analysis*.
John Wiley and sons.

Magnuson, J. S., Mirman, D., & Myers, E. (2013). Spoken Word
Recognition. In Daniel Reisberg (Ed.), *The Oxford Handbook of Cognitive
Psychology*. Oxford University Press.

Mahr, T., McMillan, B. T. M., Saffran, J. R., Ellis Weismer, S., &
Edwards, J. R. (2015). Anticipatory coarticulation facilitates word
recognition in toddlers. *Cognition*, *142*, 345–350.
doi:10.1016/j.cognition.2015.05.009

Mani, N., Durrant, S., & Floccia, C. (2012). Activation of phonological
and semantic codes in toddlers. *Journal of Memory and Language*,
*66*(4), 612–622. doi:10.1016/j.jml.2012.03.003

Mani, N., & Plunkett, K. (2010). In the infant’s mind’s ear: evidence
for implicit naming in 18-month-olds. *Psychological Science*, *21*(7),
908–913. doi:10.1177/0956797610373371

Marchman, V. A., & Fernald, A. (2008). Speed of word recognition and
vocabulary knowledge in infancy predict cognitive and language outcomes
in later childhood. *Developmental Science*, *11*(3), F9–16.
doi:10.1111/j.1467-7687.2008.00671.x

Marslen-Wilson, W. D., & Zwitserlood, P. (1989). Accessing spoken words:
The importance of word onsets. *Journal of Experimental Psychology:
Human Perception and Performance*, *15*(3), 576–585.
doi:10.1037/0096-1523.15.3.576

Mayor, J., & Plunkett, K. (2014). Infant word recognition: Insights from
TRACE simulations. *Journal of Memory and Language*, *71*(1), 89–123.
doi:10.1016/j.jml.2013.09.009

McClelland, J. L., & Elman, J. L. (1986). The TRACE model of speech
perception. *Cognitive Psychology*, *18*(1), 1–86.
doi:10.1016/0010-0285(86)90015-0

McElreath, R. (2016). *Statistical rethinking: A Bayesian course with
examples in R and Stan* (Vol. 122). CRC Press.

McMurray, B., Horst, J. S., & Samuelson, L. K. (2012). Word learning
emerges from the interaction of online referent selection and slow
associative learning. *Psychological Review*, *119*(4), 831–877.
doi:10.1037/a0029872

McMurray, B., Samelson, V. M., Lee, S. H., & Bruce Tomblin, J. (2010).
Individual differences in online spoken word recognition: Implications
for SLI. *Cognitive Psychology*, *60*(1), 1–39.
doi:10.1016/j.cogpsych.2009.06.003

Mirman, D., Yee, E., Blumstein, S. E., & Magnuson, J. S. (2011).
Theories of spoken word recognition deficits in Aphasia: Evidence from
eye-tracking and computational modeling. *Brain and Language*, *117*(2),
53–68. doi:10.1016/j.bandl.2011.01.004

Mirman, D. (2014). *Growth curve analysis and visualization using R*.
Boca Raton, FL: Chapman & Hall/CRC.

Morgan, P. L., Farkas, G., Hillemeier, M. M., Hammer, C. S., & Maczuga,
S. (2015). 24-Month-Old Children With Larger Oral Vocabularies Display
Greater Academic and Behavioral Functioning at Kindergarten Entry.
*Child Development*, *86*(5), 1351–1370. doi:10.1111/cdev.12398

Nosek, B. A., Simonsohn, U., Moore, D. A., Nelson, L. D., Simmons, J.
P., Sallans, A., & LeBel, E. P. (2014, Feb). Standard reviewer statement
for disclosure of sample, conditions, measures, and exclusions. Open
Science Framework. Retrieved from https://osf.io/hadz3

Oleson, J. J., Cavanaugh, J. E., McMurray, B., & Brown, G. (2015).
Detecting time-specific differences between temporal nonlinear curves:
Analyzing data from the visual world paradigm. *Statistical Methods in
Medical Research*. doi:10.1177/0962280215607411

Rvachew, S. (2006). Longitudinal predictors of implicit phonological
awareness skills. *American Journal of Speech-Language
Pathology*, *15*(2), 165–176. doi:10.1044/1058-0360(2006/016)

Strauss, T. J., Harris, H. D., & Magnuson, J. S. (2007). jTRACE: a
reimplementation and extension of the TRACE model of speech perception
and spoken word recognition. *Behavior Research Methods*, *39*(1),
19–30. doi:10.3758/BF03192840

Swingley, D., & Aslin, R. N. (2000). Spoken word recognition and lexical
representation in very young children. *Cognition*, *76*(2), 147–66.
doi:10.1016/S0010-0277(00)00081-0

Swingley, D., & Aslin, R. N. (2002). Lexical neighborhoods and the
word-form representations of 14-month-olds. *Psychological
Science*, *13*(5), 480–484. doi:10.1111/1467-9280.00485

Swingley, D., Pinto, J. P., & Fernald, A. (1999). Continuous processing
in word recognition at 24 months. *Cognition*, *71*(2), 73–108.
doi:10.1016/S0010-0277(99)00021-9

Tsao, F.-M., Liu, H.-M., & Kuhl, P. K. (2004). Speech perception in
infancy predicts language development in the second year of life: A
longitudinal study. *Child Development*, *75*(4), 1067–1084.
doi:10.1111/j.1467-8624.2004.00726.x

Wagner, R., Torgesen, J., Rashotte, C., & Pearson, N. A.
(2013). *Comprehensive Test of Phonological Processing, Second Edition*.
Austin, TX: PRO-ED.

Weisleder, A., & Fernald, A. (2013). Talking to children matters: Early
language experience strengthens processing and builds
vocabulary. *Psychological Science*, *24*(11), 2143–52.
doi:10.1177/0956797613488145

White, K. S., & Morgan, J. L. (2008). Sub-segmental detail in early
lexical representations. *Journal of Memory and Language*, *59*(1),
114–132. doi:10.1016/j.jml.2008.03.001

Williams, K. T. (2007). *Expressive Vocabulary Test, Second Edition*.
San Antonio, TX: Pearson Education.

Appendix A. Items used in the mispronunciation experiment
=========================================================

The stimuli changed between Year 1 and Year 2 so that dog/tog was
replaced with rice/wice.

  **Time Points**   **Word Group**   **Condition**        **Audio (IPA)**   **Familiar Object**   **Unfamiliar Object**
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

Appendix B. Items used in the visual world experiment
=====================================================

Each row of the table represents a set of four images used in a trial
for the experiment. There were two blocks of trials with different
images and trial orderings. For the two unrelated foils with more than
one word listed, the first word was used in block one and the second in
block 2.

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

**\
**

Appendix C. Related work
========================

In this section, I clarify relationships between this project and other
word recognition research reported from our lab. In short, our lab has
reported results about the two-image and four-image experiments from
cross-sectional samples, describing child-level measures that predict
performance in these tasks. In contrast, my dissertation 1) focuses on
the longitudinal development of word recognition and 2) engages with the
fine-grained details of lexical processing.

Law and Edwards (2015) analyzed a different version of the
mispronunciation experiment on a different sample of children (*n* = 34,
40-46 months old). This earlier version included both real word and the
mispronunciation of the real word in the same block of trial. For
example, a child would hear “dog” and “tog” during the same session of
the experiment. This design might subtly temper the effect of
mispronounced stimuli by allowing the listener to compare the
mispronunciation to its correctly produced counterpart. The version of
the experiment in Specific Aim 2 separates the real words and
mispronunciations so that a child never hears a familiar word and its
mispronunciation during the same block of trials. With this design,
there is no explicit point of comparison for the mispronunciation, and
the child has to rely on his or her own lexical representations when
processing these words.

Law, Mahr, Schneeberg, and Edwards (2016) analyzed data from the
four-image experiment in Specific Aim 1. This study featured a diverse
cross-sectional sample of 60 children, half of whom received the
experiment in African American English and half received it in
Mainstream American English. The sample ranged in age from 28 to 60
months. The study “borrowed” data from 23 participants from Year 1 of
the longitudinal study to enrich parts of the samples demographics. For
this manuscript, we analyzed how vocabulary and maternal education
predicted looking patterns, including relative looks to the semantic and
phonological foils.

Mahr and Edwards (under review) was the manuscript I originally authored
for my preliminary examinations. The paper provides a “conceptual
replication” of the work by Weisleder and Fernald (2013) which showed
that lexical processing efficiency mediated the effect of language input
on future vocabulary size. Specifically, I asked whether word
recognition performance on the four-image task of Specific Aim 1,
vocabulary size, and home language input data from Year 1 predicted
vocabulary size at Year 2. The paper only examined looks to the familiar
image from one year of the study, so it did not analyze any lexical
competition effects or the development of word recognition within
children.

[^1]: Appendix C (Related Work) describes how this dissertation relates
    to other work from our lab.

[^2]: It is tempting to further justify this approach by comparing
    Bayesian versus classical/frequentist statistics, but my goals in
    using this method are simple: To estimate statistical effects and
    quantify uncertainty about those effects. This pragmatic brand of
    Bayesian statistics is illustrated in texts by Gelman and Hill
    (2007) and McElreath (2015).

[^3]: The polynomial other terms are less important—or rather, they have
    do not map as neatly onto behavioral descriptions as the accuracy
    and efficiency parameters. The primary purpose of quadratic and
    cubic terms is to ensure that the estimated growth curve adequately
    fits the data. In this kind of data, there is a steady baseline at
    chance probability before the child hears the word, followed a
    window of increasing probability of fixating on the target as the
    child recognizes the word, followed by a period of plateauing and
    then diminishing looks to target. The cubic polynomial allows the
    growth curve to be fit with two inflection points: the point when
    the looks to target start to increase from baseline and the point
    when the looks to target stops increasing.

[^4]: Most of the phonological foils for this task are cohorts or words
    that shared onset consonants (*bear-bell*, *flag-fly*). Only trials
    with this type of phonological foil will be used to measure
    phonological interference effects. The other phonological foils
    included some rhymes (like *ring*-*swing*) and some words with
    onsets that differed by a phonetic feature (*kite-gift*). Effects
    from those foils will be considered separately.

[^5]: Some terminology trivia: This linking function is usually ascribed
    to Luce (1959): “The Luce choice rule is the standard method of
    linking model activations to behavioral responses (e.g., McClelland
    & Elman, 1986), including fixation behavior measured in human
    participants” (Mirman, Yee, Blumstein, & Magnuson, 2011, p. 62).
    From my reading, it seems that the mathematical function is the
    softmax, but the Luce rule is a trick that let us ignore irrelevant
    choices: “An important property of the softmax function \[…\] is
    known as independence from irrelevant attributes (Luce, 1959, 2008).
    The model implies that the ratio of probabilities of two outcomes is
    the same regardless of what other possible outcomes are included in
    the set” (Kruschke, 2014, p. 654). In other words, to model a
    4-alternative force choice task, we only need to consider the
    activation of the four relevant alternatives.
