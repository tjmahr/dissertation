# Fixing APA citations

This folder contains test scripts for my Pandoc filter that fixes APA
citations created by Pandoc.

***

I used [panflute](http://scorreia.com/software/panflute/index.html) to
write a Pandoc filter
[`fix-apa-ampersands.py`](../../assets/fix-apa-ampersands.py) to convert
ampersands into "and"s for inline citations. Here's an example usage
from my tester file
[`test-apa/test-apa.sh`](./test-apa.sh):

```
pandoc "misc/test-apa/test-file.Rmd" \
  -o "misc/test-apa/test-file2.md" \
  -t markdown_strict+escaped_line_breaks \
  --bibliography assets/refs.bib \
  --filter pandoc-citeproc \
  --filter "./assets/fix-apa-ampersands.py"
```

(One quirk: citations are not generated when the target format (after
`-t`) is `markdown`, so I had to use something a little different, like
`markdown_strict` or `markdown_github`.)

This filter needs to run *after* the `pandoc-citeproc` filter because it
is manipulating the citations created by pandoc. But I think RMarkdown
makes `pandoc-citeproc` run last by default, so I had to manually
specify the order of the Pandoc filters in the `pandoc_args` setting in
[`_output.yml`](../../_output.yml). This also meant, for some reason, that I
could no longer put the bibliography and csl file locations in the
[`index.Rmd`](../../index.Rmd) YAML header, but instead, I had to manually
write those out in the pandoc args as well. Here's what my gitbook (the
web version of the book) pandoc settings look like at the time of writing:

```
bookdown::gitbook:
  # [...some settings...]
  pandoc_args: [
    "--csl", "./assets/apa.csl",
    "--bibliography", "./assets/refs.bib",
    "--filter", "pandoc-citeproc",
    "--filter", "./assets/fix-apa-ampersands.py"
  ]
  # [...some other settings...]
```

Note that the filter to a file works best when it has "./" at the
beginning. <https://github.com/jgm/pandoc/issues/3543>
