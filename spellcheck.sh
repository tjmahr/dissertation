# # Install
# npm install markdown-spellcheck

# Set location for mdspell
PATH=$PATH:node_modules/.bin

# # interactive check ignoring numbers, without suggestions, using U.S. English
# node_modules/markdown-spellcheck/bin/mdspell -n -x --en-us README.md

# # report (non-interactive) check ignoring numbers using U.S. English
# mdspell -r -n --en-us 15-aim1-notebook.Rmd

mdspell -r -n --en-us README.md
mdspell -r -n --en-us index.Rmd
mdspell -r -n --en-us 01-prospectus.Rmd
mdspell -r -n --en-us 02-specific-aims.Rmd
mdspell -r -n --en-us 03-significance.Rmd
mdspell -r -n --en-us 04-hypotheses.Rmd
mdspell -r -n --en-us 05-methods.Rmd
mdspell -r -n --en-us 06-outcomes.Rmd
mdspell -r -n --en-us 07-analysis.Rmd
mdspell -r -n --en-us 10-aim1-part.Rmd
mdspell -r -n --en-us 11-aim1-notebook.Rmd
mdspell -r -n --en-us 12-aim1-notebook.Rmd
mdspell -r -n --en-us 15-aim1-notebook.Rmd
mdspell -r -n --en-us 20-aim2-part.Rmd
mdspell -r -n --en-us 90-appendix.Rmd
mdspell -r -n --en-us 99-references.Rmd
