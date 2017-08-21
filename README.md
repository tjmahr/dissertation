This is a minimal example of a book based on R Markdown and **bookdown**
(https://github.com/rstudio/bookdown). Please see the page "Get Started" at
https://bookdown.org/ for how to compile this example.

You can find the preview of this example at
https://bookdown.org/yihui/bookdown-demo/

## My notes

All the text here is from the 
[bookdown demo](https://github.com/rstudio/bookdown-demo) repository, except...

(Once I get the repository to my liking, I'll do a hard-fork with a fresh commit
history. Therefore, I'm taking some notes here of how I changed the original
demo. This is like a commit history, but with a more big picture description.)

**Change the build tools**: I first had to change the RStudio Project build
command from package to website. The Build button became "Build Book" as a
result. I deleted the package infrastructure stuff after that.

**Change the output to make Github publishing easier**: I added `output_dir: "docs"` 
to `_bookdown.yml` so that the site would be generated in that folder.
I did that so that I could publish to Github sites without using a gh-pages
branch. (On Github, go to settings, Github pages, find the docs folder in the
dropdown box.)

I deleted Yihui's travis and deployment scripts because I didn't need a remote
computer to push updates to the gh-pages any more.

**Modularize**: I moved all the output information from yaml header to the
_output.yml file. I also added `bookdown::word_document2: default` to get a Word
file output too. I moved as much of the root-levels to assets as possible and 
updated references to these files to use the assets path.

**Names**: I renamed the dissertation in _bookdown.yml.

