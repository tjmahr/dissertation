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
mdspell -r -n --en-us 04-hypotheses.Rmd
mdspell -r -n --en-us 10-part-aim1.Rmd
mdspell -r -n --en-us 11-aim1-introduction.Rmd
mdspell -r -n --en-us 12-aim1-methods.Rmd
mdspell -r -n --en-us 14-aim1-familiar-word-recognition.Rmd
mdspell -r -n --en-us 16-aim1-lexical-competitors.Rmd
mdspell -r -n --en-us 18-aim1-general-discussion.Rmd
mdspell -r -n --en-us 20-part-aim2.Rmd
mdspell -r -n --en-us 90-part-appendices.Rmd
mdspell -r -n --en-us 91-app-aim1-items.Rmd
mdspell -r -n --en-us 92-app-aim1-models.Rmd
mdspell -r -n --en-us 95-app-aim2-items.Rmd
mdspell -r -n --en-us 97-app-related-work.Rmd
mdspell -r -n --en-us 99-references.Rmd
