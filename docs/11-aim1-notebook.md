
Prepare and explore the data
===========================================================================

_Notebook status: Code is hidden. Now, the results and figures can be fleshed
out and finalized._







## Raw data visualization

First, let's plot the overall averages from each year.

<img src="11-aim1-notebook_files/figure-html/raw-aim1-1.png" width="50%" /><img src="11-aim1-notebook_files/figure-html/raw-aim1-2.png" width="50%" />

The raw data plainly confirm hypothesis 1:

> Children’s accuracy and efficiency of recognizing words will improve each year.

We can also plot a spaghetti plot to invidual lines for each participant. We see
that they tighten from year to year.

<img src="11-aim1-notebook_files/figure-html/spaghetti-aim1-1.png" width="100%" />



## Data screening



After mapping the gaze coordinates onto the onscreen images, we performed data
screening. We considered the time window from 0 to
2000 ms after target noun onset. We identified a trial
as _unreliable_ if at least 50% of the looks
were missing during the time window. We excluded an entire block of trials if it
had fewer than 12 reliable trials. 



Table \@ref(tab:screening-counts) shows the numbers of participants and trials
excluded at each time point due to unreliable data.


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



Plot the data after partial data screening. We include the curves from the
earlier plots in gray. The data-cleaning process slightly increases the average
accuracy during the plateau-ed portion of the growth curve.



<img src="11-aim1-notebook_files/figure-html/clean-aim1-1.png" width="50%" /><img src="11-aim1-notebook_files/figure-html/clean-aim1-2.png" width="50%" />

### Add a note about the bad version of the experiment

(_Skip for now._)

### Special case data screening

(_Skip for now._ This is where I review the participant notes and will remove 
children who have to be excluded for other reasons, like being diagnosed with a 
language disorder at TimePoint 3.)





### Interim summary

* Visual evidence that group averages get faster and more reliable at looking 
  to target each year. 
  
