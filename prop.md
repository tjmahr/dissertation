**Dissertation Proposal**

Tristan Mahr

Department of Communication Sciences and Disorder,

University of Wisconsin–Madison

March 20, 2017



\
=








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
rather than *kift*. Lastly, activation in units gradually decays over
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

$$\mathrm{P}\left( \mathrm{\text{Word}}_{\mathrm{w}} \right)\mathrm{\  = \ softmax}\left( \mathrm{\text{activation}}_{\mathrm{w}} \right)\mathrm{\  = \ }\frac{\exp\left( \mathrm{k}\mathrm{\  \times \ }\mathrm{\text{activation}}_{\mathrm{w}} \right)}{\sum_{}^{}{\exp\left( \mathrm{k}\mathrm{\  \times \ }\mathrm{\text{activation}}_{\mathrm{\lbrack}\mathrm{\text{words to choose from}}\mathrm{\rbrack}} \right)}}$$

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
