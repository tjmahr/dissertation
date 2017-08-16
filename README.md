This is a minimal example of a book based on R Markdown and **bookdown**
(https://github.com/rstudio/bookdown). Please see the page "Get Started" at
https://bookdown.org/ for how to compile this example.

You can find the preview of this example at
https://bookdown.org/yihui/bookdown-demo/

## My notes

(Once I get the repository to my liking, I'll do a hard-fork with a fresh commit
history. Therefore, I'm taking some notes here of how I changed the original
demo. This is like a commit history, but with a more big picture description.)

Some things I had to change from the original version:

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

### Fixing APA citations

I used [panflute](http://scorreia.com/software/panflute/index.html) to write a
Pandoc filter [`fix-apa-ampersands.py`](./fix-apa-ampersands.py) to convert
ampersands into "and"s for inline citations. Here's an example usage from my
tester file [`test-apa/test-apa.sh`](./test-apa/test-apa.sh):

```
pandoc "test-apa/test-file.Rmd" \
  -o "test-apa/test-file2.md" \
  -t markdown_strict+escaped_line_breaks \
  --bibliography assets/refs.bib \
  --filter pandoc-citeproc \
  --filter "fix-apa-ampersands.py"
```

(One quirk: citations are not generated when the target format (after `-t`) is
`markdown`, so I had to use something a little different, like `markdown_strict`
or `markdown_github`.)

This filter needs to run _after_ the `pandoc-citeproc` filter because it is
manipulating the citations created by pandoc. But I think RMarkdown makes
`pandoc-citeproc` run last by default, so I had to manually specify the order of
the Pandoc filters in the pandoc_args setting in [`_output.yml`](./_output.yml).
This also meant, for some reason, that I could no longer put the bibliography
and csl file locations in the [`index.Rmd`](./index.Rmd) YAML header, but instead,
I had to manually write those out in the pandoc args as well. Here's what my
gitbook (the web version of the book) pandoc settings look like now:

```
bookdown::gitbook:
  # [...some settings...]
  pandoc_args: [
    "--csl", "./assets/apa.csl",
    "--bibliography", "./assets/refs.bib",
    "--filter", "pandoc-citeproc",
    "--filter", "fix-apa-ampersands.py"
  ]
  # [...some other settings...]
```

