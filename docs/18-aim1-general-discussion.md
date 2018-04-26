
General Discussion
=======================================================================

This study examined the development of familiar word recognition over
the preschool years. The word recognition data came from a visual-world
eyetracking experiment which recorded children's fixations to images in
response to prompts like *see the bear*. The trials featured a target
noun along with a phonological competitor, a semantic competitor, and an
unrelated image. To describe children's word recognition ability, I
analyzed how the probability of fixating on the target image changed
over the time course of a trial. The presence of the competitor images
also allowed additional analyses about children's sensitivities to the
phonological and semantic competitors. The experiment was conducted as
part of a three-year longitudinal study; children were 28–39 months-old
at the Age 3 visit, 39–52 at Age 4, and 51–65 at Age 5. The longitudinal
design allowed me to describe developmental changes in word recognition.



How to improve word recognition
-----------------------------------------------------------------------

Children showed year-over-year improvements in word recognition, as
measured by average looking probabilities, peak looking probabilities,
and the rate of change in looking probabilities. Children became more
reliable, less uncertain, and faster at recognizing familar words. At
the same time, children also became more sensitive to the phonological
and semantic competitors, compared to the unrelated image. With each
year, children looked more to the target image, but when they erred,
they were more likely to err on a lexical relevant word.

We can interpret these developmental patterns in terms of lexical
activation and processing dynamics. In this task, children hear a stream
of speech and activate some phonetic, phonemic, lexical, and semantic
representations that match the speech input. As they hear more of a
word, the activation builds until a particular word is favored, and
children shift their gaze onto the named image. Let's imagine that we
have to engineer this system. To make word recognition more efficient,
we have to find ways to increase the relative activation of the correct
word. In particular, we can boost the strength of connections so that
activation can propagate more quickly through the system, and we can
allow inhibition among competing words so that the correct word can win
out over its competitors more quickly.

The results from these studies indicate that children become more
efficient at activating the target word *and related words* over the
preschool years. As they grew older, children were faster to look at a
named image and more likely to fixate on the phonological competitor
(compared to the unrelated image). These two findings reflect changes in
how partial acoustic information can propagate to activate
phonologically plausible words. The phonological competitors shared the
same syllable onset as the target noun (e.g., *dress*–*drum*), so the
early part of the word matched both of these words. That children became
more sensitive to the phonological competitor means that they learned
and somehow encoded the phonological similarities among words because
part of a word could activate a neighborhood of phonologically plausible
matches. This developmental change supports faster word recognition
because the listener can channel activation to relevant words more
quickly. A similar line of reasoning applies to the semantic
competitors: Relative looks to the semantic competitors increased with
age, suggesting that children had learned semantic connections among
words and activated semantically related words during word recognition.

The other mechanism we might tune to improve word recognition is
inhibition. Children's looks to the phonological or semantic competitors
were temporary: Looks increase to some peak level and then quickly
decrease. Behaviorally, the drop in looking probability reflects the
rejection of an interpretation: for example, a child hears "dr", shifts
looks to *dress*, but hears "um", revises the interpretation and jumps
to *drum*. We can read these corrections as evidence for an
inhibitory process: Corrections indicate a change in relative activation
where a different word overrides an initial interpretation. But the
evidence for *developmental changes* in lexical inhibition from these
data was scant. The rate of rejection of the phonological
competitor---that is, how quickly looks fall from their peak value---did
not change from age 4 to age 5, although the rate did increase for the
semantic competitor from age 4 to age 5. Preschoolers did demonstrate
inhibition by revising their interpretations of nouns, but there were no
clear developmental changes in inhibition.

Previous simulation work can help identify more specific mechanisms at
play. @McMurray2010 used the TRACE model of word recognition [@TRACE]
to simulate looks to a target and phonological competitors (cohorts and
rimes) in adolescents with specific language impairment. The authors
tuned a number of model parameters and examined how those changes
affected simulated looks to the target and competitors. In the current
dataset, I observed a developmental trend where the relative looks to
the phonological competitors peak higher each year. In those TRACE
simulations, looks to the cohort competitor peak higher if 1) the rate
of lexical activation increased, 2) the rate of lexical decay decreased,
or 3) strength of lexical inhibition decreased. Of these options, the
decrease in lexical inhibition best matches the current data. The
similarity does not mean that children inhibited words any less as they
grew older. That would be too simplistic: Developmental changes in
preschoolers are the result of simultaneous changes in many mechanisms.
But those simulation results suggest that an *increase* in lexical
inhibition is *not* one of the developmental changes in preschoolers'
word recognition.



Learn words and learn connections between words
-----------------------------------------------------------------------

Preschoolers showed increased activation of the target noun
and semantically and phonologically related words but little
developmental change in lexical inhibition. Paired with the findings
from older children, these results lead to a compelling developmental
story. @Rigler2015 compared 9- and 16-year-olds on a visual-world word
recognition experiment with phonologial (cohort and rime) competitors.
The younger children were slower to look to the target image and showed
more looks to the competitors. The implications are that children's word
recognition is still developing in late childhood and that in
particular, children's inhibition of lexical competitors became stronger
with age.

The current study with 3-, 4-, and 5-year-olds followed a different
pattern: Relative looks to the competitor images increased with age.
Taken together, these two studies suggest an interesting progression for the
development of lexical processing. During the preschool years, children
learn many, many words, and they establish phonological and semantic
connections between these words. These connections support the immediate
activation of neighborhoods of related words. Later childhood, based on the
@Rigler2015 findings, then is a time for refinement of those
connections so that sensitivity to the competitors decreases. This
refinement could follow from more selective activation channels,
increased lexical inhibition, changes in resting activation (to favor
more frequent words), or likely a combination of these factors.



Individual differences are most important at younger ages
-----------------------------------------------------------------------

Another dimension of this study concerned individual differences in word
recognition. Some children were faster or more accurate during word
recognition, and these children also were more likely to faster or more
accurate at later ages. The magnitude of these differences diminished
over time, so that children approached a more mature level of
performance. 

In terms of lexical processing dynamics, we might think of early
differences as reflecting early differences in the burgeoning lexicon.
Children may have different numbers of words, different degrees of
experience with some words, less established connections among words,
and at a lower level, different phonetic and speech perception
abilities, given the links between speech perception in infancy and
early vocabulary development [TODO]. Differences in word recognition are
greatest early on in development because this is when the differences
among children's lexicons are greatest. The task of learning new words,
and more importantly, of developing representations and associations to
organize words normalizes the differences among children's
lexicons.[^haystack] That pressure would make the overall variability
among children decrease over time while still preserving a relative
ordering among children.

[^haystack]: Earlier I had used a needle-in-a-haystack metaphor for
lexical access and said that the way to cope with finding a needle in an
ever-growing haystack is to sort the hay and organize the straws. (Or
better yet, make it a *self-organizing* haystack.) We might apply the
reasoning backwards in time too: Early on, with just a few straws, an ad
hoc or inefficient organization can suffice.

We can also interpret the predictive power of word recognition measures
in terms of lexical processing and lexical organization. Correlations
between word recognition performance and future vocabulary were
strongest for the age-3 growth curve features, in particular for the
peak probability of looking to the target word. The peak probability
measures the overall certainty in word recognition and how strongly the
target word is activated. Children with more efficient representations
of familiar words at age 3 have a stronger foundation for encoding and
integrating future words, and as a result, they showed larger
vocabularies at age 4 and age 5. 

Initially, I had expected processing *speed*---as approximated by growth
curve slopes---to be the most predictive measure of vocabulary growth.
Children who can more quickly recognize words, the reasoning goes, can
take in information more quickly and devote extra processing resources
towards learning.[^fernald] Indeed, processing speed was correlated
with future vocabulary size. Yet peak probability was a stronger
predictor of future vocabulary size. Granted, these two processing
measures are highly related; to hit a higher peak at time *x*, a growth
curve needs to start from higher baseline or have steeper slope. The
idea of certainty suggests an alternative explanation of the predictive
power of word recognition: Children who are more accruate (or less
uncertain) during word recognition can extract *more information* from
the speech signal. 

[^fernald]: "The infant who identifies familiar words more quickly has
more resources available for attending to subsequent words, with
advantages for learning new words later in the sentence, as well as for
tracking distributional information about relations among words... Being
slow to identify the referent of a familiar word could interfere with
lexical activation and impede success in tracking distributional
regularities and managing attentional resources in real time (Evans,
Saffran, & Robe-Torres, 2009)" [@Fernald2012, p. 217].


Limitations and implications
------------------------------------------------------------------------

The discussion of processing speed and word recognition certainty
highlights one limitation of this research: The experiment's four-image,
eyetracking-based design meant that a clean measure of processing speed
was not feasible. Other eyetracking studies with two images can use the
latency of how long it takes the child to shift between images as a
measure like reaction time. This approach does not translate to the
four-image design, as children can visit multiple images on their way to
the target. Visual world studies with older participants can obtain an
explicit reaction time measure by means of a mouse click or tap on a
touchscreen, but those additional task demands may not translate to
young children like those in this study. Thus, this study could not
address directly whether the predictive power of word recognition
performance reflects a more developed lexicon, a general
reaction-time-like speed advantage, or both.

The experimental design included semantic and phonological competitors
on every trial, so isolating out the semantic and phonological
competition effects required some subtlety. A more direct design would
compare different types of a trials: for example, a target vs. three
unrelated images condition, and a target vs. a competitor vs. two
unrelated images condition. The trials also used different kinds of
semantic and phonological competitors. For example, two of the
phonological competitors rhymed with the target, so they could not be
included the analysis of phonological competitors (which focused on just
competitors with the same onset as the target). The current design
limited the number of trials that could be used in the analyses of the
competitors and weakened the power of the analyses.

A final limitation includes the changes in the experiment procedure over
the course of the longitudinal study. From age&nbsp;3 to age&nbsp;4, we
re-recorded the stimuli (with the same original speakers) so that the
durations between the two different dialect versions of the experiment
were similar. From age 4 to age 5, we also shortened the duration of the
trials by removing attention-getting prompt (e.g, *this is fun!*) from
the ends of the trials. These small procedural changes mean that
year-to-year differences do not reflect *pure* development differences.
It is very implausible, however, that the robust year-over-changes owe
more to procedural changes than a year of learning and language
development.

The findings from this study have implications for our understanding of
word recognition and word learning. The first is the overall
developmental narrative. Preschool children become better at recognizing
words by learning similarities among words and using those similarities
to activate neighborhoods of lexically relevant words. Rather than just
measuring vocabulary size, word recognition reveals how well words have
been integrated into the lexicon. The developmental trends here show
that familiar words become more integrated and more connected over the
preschool years.

From this perspective, we can think of individual differences in word
recognition as differences in lexical development. Variability in word
recognition diminishes over time, so that differences are more
predictive and discriminating at younger ages. Thus, if we wanted to
intervene on word recognition, these results indicate that early
intervention is better and that intervention should build connections
among words and target words that build onto existing semantic and
phonological networks. The natural closing of gaps in word recognition
performance with age, however, suggests that word recognition in and of
itself may not be an important intervention target. Rather, word
recognition measures should serve to supplement other vocabulary
measures as a measure of lexical processing and lexical integration.
