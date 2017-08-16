pandoc "03-significance.Rmd" -f markdown -t markdown -o "03-significance.Rmd"
pandoc "test.md" -t json -o "test.json" --bibliography assets/refs.bib --bibliography assets/book.bib --bibliography assets/packages.bib --csl assets/apa.csl --filter pandoc-citeproc
