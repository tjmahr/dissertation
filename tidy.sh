pandoc "01-prospectus.Rmd" -f markdown -t markdown -o "01-prospectus.Rmd"
pandoc "02-specific-aims.Rmd" -f markdown -t markdown -o "02-specific-aims.Rmd"
pandoc "03-significance.Rmd" -f markdown -t markdown -o "03-significance.Rmd"
pandoc "04-hypotheses.Rmd" -f markdown -t markdown -o "04-hypotheses.Rmd"
# pandoc "05-methods.Rmd" -f markdown -t markdown -o "05-methods.Rmd"
pandoc "90-appendix.Rmd" -f markdown -t markdown -o "90-appendix.Rmd"

# pandoc "test.md" -t json -o "test.json" --bibliography assets/refs.bib --bibliography assets/book.bib --bibliography assets/packages.bib --csl assets/apa.csl --filter pandoc-citeproc

