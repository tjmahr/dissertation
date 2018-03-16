My dissertation is a book based on R Markdown and **bookdown**
(<https://github.com/rstudio/bookdown>, <https://bookdown.org/>).

## Notes

This bookdown project was originally a fork of the demo book
<https://github.com/rstudio/bookdown-demo>

Some things I had to change from the original version:

**Change the build tools**: I first had to change the RStudio Project
build command from package to website. The Build button became "Build
Book" as a result. I deleted the package infrastructure stuff after
that.

**Change the output to make Github publishing easier**: I added
`output_dir: "docs"` to `_bookdown.yml` so that the site would be
generated in that folder. I did that so that I could publish to Github
sites without using a gh-pages branch. (On Github, go to settings,
Github pages, find the docs folder in the dropdown box.)

I deleted Yihui's travis and deployment scripts because I didn't need a
remote computer to push updates to the gh-pages any more.

**Modularize**: I moved all the output information from yaml header to
the `_output.yml` file. I also added `bookdown::word_document2: default`
to get a Word file output too. I moved as much of the root-levels to
assets as possible and updated references to these files to use the
assets path.

**Names**: I renamed the dissertation in `_bookdown.yml`.

**APA citations**: See
[`./misc/test-apa/README.md`](./misc/test-apa/README.md).

### Etc

To fix, this LaTeX error

```
! Package inputenc Error: Unicode char ɔ (U+254)
(inputenc)                not set up for use with LaTeX.
```

add `latex_engine: xelatex` to the YAML configuration for the format in
[`_output.yml`](./_output.yml).


## Migration notes

This bookdown file was originally a fork of
<https://github.com/rstudio/bookdown-demo>

I unforked from that repository by

  - Renaming this repository
  - Using Github + (plus) button \>\> Import repository and imported the
    URL of this repository
  - Now I had a fresh copy of the repository without any forking-history
    from the from the demo book.
  - Updated the Github settings to match the old repository's.
  - Deleted the old, renamed copy of the repository.
  - Deleted all the non-master branches that were also imported.

Next, I truncated the git history to remove most of the older commits
that I didn't write, following steps like
<https://stackoverflow.com/questions/41953300/how-to-delete-the-old-git-history>
