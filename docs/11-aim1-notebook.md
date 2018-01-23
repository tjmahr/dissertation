
Method {#aim1-method}
===========================================================================







## Participants


### Special case data screening

(_Skip for now._ This is where I review the participant notes and will remove 
children who have to be excluded for other reasons, like being diagnosed with a 
language disorder at TimePoint 3.)


## Procedure

This experiment used a version of the Visual World Paradigm for word recognition
experiments. In eyetracking studies with toddlers, two familiar images are
usually presented: a target and a distractor. This experiment is a four-image
eyetracking task that was designed to provide a more demanding word recognition
task for preschoolers. In this procedure, four familiar images are presented
onscreen followed by a prompt to view one of the images (e.g., *find the
bell!*). The four images include the target word (e.g., *bell*), a semantically
related word (*drum*), a phonologically similar word (*bee*), and an unrelated
word (*swing*). Figure \@ref(fig:sample-vw-screen) shows an example of a trial's
items. This procedure measures a child’s real-time comprehension of
words by capturing how the child’s gaze location changes over time in
response to speech.

(ref:sample-vw-screen-cap2) Example display for the target *bell* with
the semantic foil *drum*, the phonological foil *bee*, and the unrelated
*swing*.

<div class="figure">
<img src="./misc/rwl-screens/TimePoint1/actual/Block2_17_swing2_bell2_bee2_drum2_UpperRightImage_bell.png" alt="(ref:sample-vw-screen-cap2)" width="100%" />
<p class="caption">(\#fig:sample-vw-screen)(ref:sample-vw-screen-cap2)</p>
</div>

## Experiment Administration

Children participating in the study were tested over two lab visits
(i.e., on different dates). The first portion of each visit involved
“watching movies”—that is, performing two blocks of eyetracking
experiments. A play break or hearing screening occurred between the two
eyetracking blocks, depending on the visit.

Each eyetracking experiment was administered as a block of trials (24 for this
experiment and 38 for a two-image task---see chapter X). Children received two
different blocks of each experiment. The blocks for an experiment differed in
trial ordering and other features. Experiment order and block selection were
counterbalanced over children and visits. For example, a child might have
received Exp. 1 Block A and Exp. 2 Block B on Visit 1 and next received Exp. 2
Block A and Exp. 1 Block B on Visit 2. The purpose of this presentation was to
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
centers of four screen quadrants). The examiners repeated this
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

## Stimuli

_A few sentences to reiterate what the four kinds of images represented_. A complete list of the items used in the experiment in [Appendix \@ref(vw-experiment-items)](#vw-experiment-items).


Recorded “stimuli were presented in children’s home
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

The images used in the experiment consisted of color photographs on
gray backgrounds. These images were piloted in a preschool classroom to
ensure that children consistently used the same label for familiar
objects.



## Data screening





“We mapped the gaze *x*-*y* coordinates onto the images onscreen. We
performed *deblinking* by interpolating short windows of missing data
(up to 150 ms) if the child fixated on the same image before and after a
missing data window. In other words, if the gaze did not shift to
another image, and if the missing data window was short enough, that
window was classified as a blink and interpolated, using the fixated
image as the imputed value” (Mahr & Edwards, in revision).

After mapping the gaze coordinates onto the onscreen images, we performed data
screening. We considered the time window from 0 to
2000 ms after target noun onset. We identified a trial
as _unreliable_ if at least 50% of the looks
were missing during the time window. We excluded an entire block of trials if it
had fewer than 12 reliable trials. 





Table \@ref(tab:screening-counts) shows the numbers of participants and trials
excluded at each time point due to unreliable data. There were more children in
the second timepoint than the first timepoint due to a timing error in the
initial version of this experiment, leading to the exclusion of
27 participants from the first timepoint.


Table: (\#tab:screening-counts)Eyetracking data before and after data screening.

Dataset                Study         N Children   N Blocks   N Trials
---------------------  -----------  -----------  ---------  ---------
Raw                    TimePoint1           178        332       7967
                       TimePoint2           180        347       8327
                       TimePoint3           163        322       7724
Screened               TimePoint1           163        291       5951
                       TimePoint2           165        305       6421
                       TimePoint3           156        295       6483
Raw &minus; Screened   TimePoint1            15         41       2016
                       TimePoint2            15         42       1906
                       TimePoint3             7         27       1241












## Prepare the dataset for modeling



To prepare the data for modeling, we downsampled the data into
50-ms (3-frame) bins, “reducing
the eyetracking sampling rate from 60 Hz to 20 Hz. This procedure smoothed out
high-frequency noise in the data by pooling together data from adjacent frames”
(Mahr & Edwards, in revision). We modeled the looks from
250 to 1500 ms. Lastly, we aggregated
looks by child, study and time, and created orthogonal polynomials to use as
time features for the model.





<img src="11-aim1-notebook_files/figure-html/spaghetti-elogit-1.png" width="100%" />











