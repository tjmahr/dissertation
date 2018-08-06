
(PART\*) Afterword  {#part-end-matter .unnumbered}
=======================================================================

General discussion of both studies
=======================================================================

In this chapter, I integrate results from the two studies. First, I
describe the mechanisms underlying children's word recognition. I then
briefly discuss some clinical implications of this research, and I
outline the main contributions of the research.


Mechanisms of word recognition
-----------------------------------------------------------------------

What cognitive or word-recognition mechanisms can explain the data
observed from these two studies? These are the essential findings that
the model of word recognition needs to account for:

* Developmental improvements in familiar word recognition
* Early advantage of phonologically similar words (over unrelated words)
* Late advantage of semantically similar words (over unrelated words)
* Developmental changes in the advantage of these similar words
* Disrupted processing of onset-mispronunciations
* Effortless processing of unambiguous nonwords
* Individual differences in familiar word recognition

As a baseline for word recognition mechanisms, I will start with 1) a
continuous activation model 2) that uses different levels of
representation---in other words, TRACE [@TRACE]. In my preceding
interpretations of the data from Aim 1 and Aim 2, I assumed a
TRACE-like architecture, so it is helpful to briefly review what this
model does.

TRACE interprets an input pattern by spreading activation (energy)
through a network of processing units. The pattern of activation over
the network is its interpretation of the input signal, so that more
active units represent more likely interpretations. Over many processing
cycles, the network propagates energy among its connections until it
settles into a stable pattern of activation. (Activation also decays
over cycles so that the model can start from and return to a resting
state.)
This activation process is *continuous*; the model's interpretation
evolves continuously. We can ask at any point during (or after)
presentation of a word what the model's interpretation of that word is.
Thus, the listener does not need to hear a whole word to generate a
plausible guess for that word [e.g., @Fernald2001].

The model involves three levels of representation: perceptual/phonetic
features, phoneme units and lexical units. The input for TRACE is a
mock-speech signal that activates the perceptual feature-detectors.
These units respond to phonetic features like voicing or vocalic
resonance. The perceptual units activate phoneme units, and the phoneme
units activate lexical word units. For example, the bundle of features
representing /b/ would activate /b/ but to a lesser extent also
activate the phonetically similar /d/ (different place), /p/ (voice),
/v/ (manner), or /m/ (nasality). The initial /b/ sound activates a
neighborhood of words containing /b/, and the phonetically similar
phonemes like /d/ or /p/ also activate compatible similar words, albeit
to a weaker extent. 

The combination of continuous processing and these levels of representation
means that ambiguities can arise during word recognition. Suppose that after /b/, the
sound /i/ arrives, activating a set of phoneme units and in turn
activating words containing /i/. The sequence of /bi/ favors a
particular neighborhood of cohorts: *be*, *bee*, *beam*, *beak*, *beat*,
*beetle*, etc. At this point, however, the signal is ambiguous. Any of
the words in the cohort are plausible interpretations, and more
information is needed to refine the interpretation.
In @Swingley1999, 24-month-olds were slower to respond to trials of
*doggie* versus *doll*, compared to *doggie*--*tree* or *doll*--*truck*
trials, where the delay reflected the momentary ambiguity from the words
sharing an onset consonant and vowel.

<!-- phonological effect -->

The mechanisms described thus far can account for the advantage of the
phonological competitors over unrelated words from the first study. The
initial phoneme in a word activates a cohort of words that share that
sound, so the cohorts briefly represent more plausible
interpretations of the target than words that are not phonologically
related. A child acts on that early information and shifts their gaze
to the phonological competitor.

Words in TRACE compete with each other through lateral inhibition, so
that an active word will dampen the activation of other competitors.
Inhibition allows the model to reinforce or revise an interpretation. In
the earlier example, the arrival of /m/ after /bi/ would strongly favor
*beam* as the most plausible interpretation of the word, and *beam* will
inhibit the other candidates like *beak* or *beat* so that it can be the
decisive interpretation of the word. The transient effect of the
phonological competitor suggests lateral inhibition: The advantage of
the phonological competitor over the unrelated word is short lived
because the target word builds up activation and inhibits the
phonological competitor. 

<!-- semantic effect and cascading activation -->

To account for the effect of the semantic competitor, we need to make a
few more assumptions. Semantic information is not explicitly included as
a part of TRACE, but we can stipulate that semantic information is part
of a word's lexical representation. We also need a way for semantically
related words to coactivate, so that hearing *bee* will generate some
spurious looks to *fly*. In this case, we can assume that there are
excitatory connections between semantically related words so that
hearing a word also activates its semantic relatives. In my earlier
discussions, I used the term *cascading activation* to describe this
arrangement. For children to generate looks to the semantic competitor,
they first to need to build up activation of the word and that
activation would cascade over to semantic relatives. The time course of
cascading activation here is consistent with the late effects of the
semantic competitor. The semantic competitor exerts an advantage over
the unrelated word *after* semantic information comes online.

The relative advantage of the phonological and semantic competitors
increased each year, as did children's overall recognition of the
familiar word. In other words, children became better at activating the
target *and* the words related to the target. In
[Chapter \@ref(aim1-discussion)](#aim1-discussion), I argue that these
developmental changes in the first study reflected stronger bottom-up
phoneme--word connections (for greater activation of the target and
phonological competitors) and stronger semantic connections between
words. Alternatively, one might assume that phonologically similar words
coactivate in a similar way as the semantically related words activate
each other. The problem with this interpretation is that it would not
resolve lexical ambiguity to have similar sounding words supporting each
other. The phonological similarity between words lives not in the
connections between them but in the phonemes that the words share and
that mutually activate them. The phonologically related words compete
with each other, and they may inhibit each other so that the most
plausible interpretation can quickly suppress competing interpretations.
For these data, I did not observe any developmental changes in
inhibition, so I favored an interpretation that focused on stronger
bottom-up connections. (I discuss inhibition more below when I discuss
open questions.)


<!-- mispronunciations -->

One prediction of TRACE is that rhymes and rimes (one-syllable rhymes)
can affect word recognition. But these rhymes are at a disadvantage. Early
in the processing of a word, all the action is in the bottom-up
connections from the phonetic features to the phonological units onto
the words. Cohorts show an early advantage in word recognition because
they receive activation before lexical units start to inhibit each
other. A rhyme mismatches the input from the start of the word, so it
undergoes inhibition early on. But as the word unfolds, subsequent
phonemes can build up activation of the rhyme word, and the word can
overcome the initial disadvantage. @Allopenna1998 found a strong similarity
between TRACE's activation patterns and adult listeners' looking patterns.
Namely, adults can hear *beaker* and look to the word, but they also might
generate spurious early looks to a cohort (*beetle*) and late looks to a
rhyme (*speaker*). (Anecdotally, my name is Tristan, but in grade school,
I always snapped to attention whenever Kristen's name was called.)

The mechanisms that predict how rhymes can engage in lexical
competition also explain the disruptive mispronunciation effects observed in Aim 2. The
initial /s/ in *suze* sends the listener down a lexical garden path,
activating /s/-initial words. The arrival of the rest of the word---plus the presentation of an image shoes onscreen---supports *shoes* as an
interpretation of the word. But there is much less certainty in this
situation. At age 3, I observed 80% looking to the image of the shoes
for the real word *shoes* compared to 50% looking (to the shoes) for
*suze*.[^mispro-substance] There was a small developmental improvement
for the mispronunciation and real word conditions. For
example, at age 5, *suze* reached 60% looking to the familiar image and
*shoes* reached 87% looking. Developmentally, children became more
likely to activate the familiar word when given a mispronunciation, and this
change likely reflects general improvements in activation
efficiency. Gains in activation efficiency are consistent with the
results for familiar word recognition in Aim 1 where children showed increases in
overall looking probability and in how quickly looking probabilities
changed during a trial.


[^mispro-substance]: It should be noted that these mispronunciations
were all one-syllable words, so they did not have much phonological substance
that could overlap with the target. If the mispronunciation-target pairs
were longer, as in a *beaker*--*speaker* rhyme, more segments would
overlap, leading to greater activation of the mispronounced target.

<!-- nonwords -->

What about the effortless processing of the unambiguous nonwords?
Surely, children do not have a lexical item *geeve* to activate the
first time they hear the word. On these trials, however, the
children did know *sock* and know that *geeve* was not the name for the sock,
so they looked to the trolley instead. For @McMurray2012, the problem
facing a child is reference selection: Children have to select a visual
referent for a spoken word. In their model, all words can refer to all visual
referents initially, so the model has to prune away unnecessary
connections to build up selective word recognition. Development of the
*sock*-sock pairing pruned away other visual referents or words from
activating *sock*. Thus, _geeve_ is not likely to activate *sock* but
the viability of a *geeve*-trolley pairing allows the child to select
the correct referent for the nonword. In TRACE simulations,
@TRACE_Mispro handled this situation by treating the nonword as a
low-frequency word. In both situations, a novel nonword is recognized
despite not being well known to the child. This recognition is possible
because the new word is not affected by lexical competition from any
other plausible alternatives. 

This framework also allows us to account for the differences in
retention for the nonwords and mispronunciations at age 5. In
@McMurray2012, learning was associative. The model developed connections between
spoken words, lexical items, and visual referents when spoken words and
visual referents occurred together, and each co-occurrence built up the
connections. On the mispronunciation trials from Aim 2, a
child heard a mispronunciation of a familiar word and also saw an image
of the familiar (mispronounced) word. On average, they tended to interpret the
mispronunciation as the familiar word. Thus, the familiar word competed
with the mispronunciation, leading the child to develop a weaker
association between the novel object and the mispronunciation. The
effect of looking behavior, where children who looked more to the
familiar image on mispronunciation trials showed poorer retention, helps
explain how the familiar image could impede the association of the
mispronunciation and the novel object. In contrast, for the unambiguous
nonword trials, children could associate the novel object and novel word
more strongly. This difference in lexical competition manifested in the
retention performance where children were better able to retain nonwords
than mispronunciations. 

<!-- individual differences -->

So far, I have described a general framework of word recognition, and I
claimed children's developmental changes in word recognition reflect
more efficient representations and activation pathways. I now describe
task differences and individual differences under this framework.

Word learning is a matter of degree. I like to draw a distinction
between "shallow" receptive knowledge and "deeper" expressive knowledge,
based on the idea that recognition is easier than generation. But we can
imagine a finer continuum with degrees of recognition ability. For
example, a word can be recognized in one situation but may not be
recognized in a more challenging situation. For example, @McMurray2012
tested a word-learning model's comprehension by simulating
alternative-forced choice (AFC) tasks where a named target was displayed
and pitted against visual competitors. The model showed graded
performance, with better
comprehension on 3-AFC (2 competitor) tests than 5-AFC tests, and
better performance on 5-AFC tests than 10-AFC tests. Thus, the 4-AFC
task in my first study provided a more challenging word-recognition
environment than the 2-AFC task in the second study. For example,
children demonstrated ceiling performance on the nonword condition at
age 4, whereas children had room to develop each year in the 4-AFC task.

Individual differences in word recognition reflect differences in
children's lexicons and their lexical representations. Although all the words on
the 4-AFC were familiar to preschoolers, children differed in their peak
looking probabilities and rate of fixating on the target. In lexical
processing terms, children differed in peak activation and the
rate at which activation reached the target word. Differences in word
recognition were stable from year to year. Even though all the
children became faster, more reliable and more certain during word
recognition with age, the children who were faster and more reliable at age 3
were also faster and more reliable at age 5. The children who performed
better at age 3 had more familiarity with the words and more reliable
representations of them---thus, these children had a head start and they
built on top of that advantage as they grew older. This interpretation
can also account for how word recognition performance at age 3
correlated with vocabulary scores at later ages.


### Open questions about word recognition mechanisms

There are three immediate open questions from this research. First, how does
lexical inhibition change over this developmental window? The results
from Aim 1 show that phonologically and semantically similar
words become more relevant during word recognition as children grow
older. (The words became more active, compared to the unrelated
word.) I did not observe any clear changes in how quickly those words were
*rejected* as possible interpretations of the input, and thus, I could
not make any claims about the development of inhibition. 

In principle,
developmental changes could have been observed in this experiment.
Lexical inhibition would affect how quickly the phonological
competitor's advantage decays as the target word becomes the favored
interpretation. A developmental change in lexical inhibition would cause
the competitor's activation to decay more quickly (or more slowly) at
older ages. But the growth curves observed here were parallel; they
decayed at the same rate. Changes in lexical inhibition are detectable
by an experiment paradigm like this one (with a target, competitor and
an unrelated word), but in the present case, I did not observe these
changes. Thus, developmental change in lexical inhibition during the
preschool years remains an open question.

Based on other work, I expect older children to show greater
inhibition. @Rigler2015 showed that 9-year-old children were more
sensitive to phonological cohorts and rimes than 16-year-old listeners,
suggesting children need to develop inhibitory connections that suppress
the interference from these words. @Blomquist2017
used a cross-splicing paradigm to test lexical inhibition in 7--8-year-old
versus 12--13-year-old children. In this paradigm, a target like *cap*
is created by splicing an initial *ca* onset with a different token
(*ca(p)p*), with a cohort competitor (*ca(t)p*) and a nonword (*ca(k)p*), the
idea being that the sublexical information in the cohort splice will
favor *cat* and therefore inhibit *cap* whereas a nonword splice cannot inhibit
*cap*. This manipulation held in both groups, but the older children
were more disrupted by the cohort splice. It would be revealing to see both
paradigms applied to this age range. For the preschool years, however,
the development trajectory seems to be the strengthening of connections
so that the phonological competitors can participate in word recognition
with later childhood being a time to develop inhibitory connections. In
other words, a child has to develop sensitivity to cohorts first in
order to demonstrate the ability to quickly inhibit them.

A second open question is when does a nonword engage in lexical
competition and interfere with word recognition in children at this age.
For adults, nonwords can affect processing very quickly. @Kapnoula2015
used a cross-splicing paradigm with adults and observed that newly
learned words compete with familiar ones immediately. @Magnuson2003
trained adult participants with artificial lexicons and observed that
after one day of training, cohort and rimes effects *within the
artificial lexicon* were comparable, but after a second day, the cohort
showed an early advantage. For preschoolers, I would expect
them to show cohort and rime effects with enough training. The
prediction is based on the competitor effects observed in the first
study where age-5 children showed the early advantage of the
phonological competitor over the unrelated word. Sensitivity to lexical
inhibition via cross-splicing is an open question for preschoolers in
general, even for familiar words. If lexical inhibition develops over
later childhood, it is conceivable that preschoolers could show equal
sensitivity to cross-splicing from cohorts and nonwords. 

A third open question, given the previous discussion of models and
mechanisms, is whether a word recognition model like TRACE can replicate
the developmental changes observed here. There is no reason to assume
that it would not be able to simulate the results from each year, given
that it has been used to simulate word-recognition data from adults
[@Allopenna1998], adults with aphasia [@Mirman2011], toddlers
[@TRACE_Mispro], and adolescents with specific language impairment
[@McMurray2010]. These simulations have shed light on their respective
listener populations. For the toddler data, @TRACE_Mispro had to use
reduced lexical inhibition parameters in order to replicate graded
mispronunciation effects of @WhiteMorgan2008, suggesting that lexical
inhibition is not a crucial feature of toddler word recognition.
@McMurray2010 used TRACE simulations with different modeling parameters
to test different theories of specific language impairment. Ultimately,
they found that lexical decay—“the ability to maintain words in memory”
(p. 23)—was the most important model parameter, implying that individual
differences in word recognition for listeners with specific language
impairment are rooted in lexical processes (and not perceptual or
phonological ones). 

For the current data, the goal of the simulations would be the
developmental story: Which parameters would need to change each year to
have the model match the empirical data? I would posit that the changes
would involve some manipulation of the rate of lexical activation so
that bottom-up information can activate relevant words the more quickly.
I would also expect changes in the degree of lexical inhibition to play
a role, based on the simulations in @McMurray2010 in which cohort
effects increased as lexical inhibition decreased. Even though I did not
observe any changes in lexical inhibition in terms of how quickly the
competitor advantages decayed in the first study, it is still plausible
that lexical inhibition changes are needed to accommodate increased
bottom-up activation.



Clinical implications
----------------------------------------------------------------------

The results of Aim 1 remind us that words
are not simply acquired---they are recognized, learned, and *integrated*. In the first
study, children's recognition of highly familiar words improved each year.
Children's representations of familiar words will continue to develop,
even when they ostensibly *know* the word. One might attribute this
development change to improvements in visual processing, sensory
processing, or some other nonlinguistic factor. This study cannot rule
out those explanations. The increasing effect of the phonological and
semantic competitors, however, suggests that changes in lexical
representations are needed to explain these results.

Part of the promise of eyetracking-based research is that word
recognition can predict later outcomes. One common conclusion in
this research is that word recognition may provide an early screening
tool: "[t]ime-course measures of comprehension in very young language
learners could ultimately prove useful in improving early identification
of children at risk for persistent language disorders" [@Fernald2012,
p. 219]. The developmental results here stress that such a tool has to
be developmentally appropriate. Children's processing of real words on
the two-image task did not predict language outcomes, but the slightly
more challenging nonword condition did yield a small predictive effect.
For the more difficult four-image task, individual differences were
greatest and most predictive at age 3 and the range of variability
decreased with age. Thus, recognition of familiar words is perhaps
best understood as a lexical measure that needs to be scaled with
children's vocabulary norms.

Finally, the observed difficulty of retaining mispronunciations
emphasizes that children will err on the side of known words during
nonword referent selection when the known words are plausible
interpretations. In particular, it does not seem like a contrastive
method of teaching, say, *pear* by having it compete against a known
word *bear* would be effective because the known word would interfere
with the encoding of the nonword.








Contributions
----------------------------------------------------------------------

The most important contribution of this research is that children became
more sensitive to phonological and semantic competitors as they grew
older. When they erred, they were more likely to look to a relevant
word. This result indicates that children improve in word recognition by
being able to activate phonologically plausible words quickly, from
partial information, and activate semantically related words on the
basis of cascading activation. The developmental trend is that of more
*engagement* [@Leach2007], with children developing the connections
among related words and harnessing those similarities to their
advantage.

Another contribution is the description of individual differences in
word recognition: Namely, differences are stable over time but diminish
in magnitude, so that early differences are more predictive than later
ones. Although there has been ample evidence of how word recognition in toddlers
predicted later outcomes, it was not clear whether those differences
held over the preschool years. The results here indicate that the
differences are task-specific: A more age-appropriate four-image task
can better differentiate preschoolers than a simpler two-image one.

A final contribution comes from Aim 2. This study was limited
by how apparently easy it was for preschoolers. After all, it was
a 2-AFC task where one of the images was always a familiar object and the
other was an unfamiliar object. That limitation was revealing, showing
that this design does not scale up for preschoolers developmentally.
Children had mastered mutual-exclusivity-type referent selection on this
task by age 4. Children could effortlessly associate nonwords to novel
objects, provided that the nonword is not under competition from any
known words, as was observed for the mispronunciations.

