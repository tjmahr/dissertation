pandoc "test-apa/test-file.Rmd" -o "test-apa/test-file.md" --bibliography assets/refs.bib --filter pandoc-citeproc --filter panflute -t markdown_strict+escaped_line_breaks
pandoc "test-apa/test-file.Rmd" -o "test-apa/test-file2.md" --bibliography assets/refs.bib --filter pandoc-citeproc --filter "fix-apa-ampersands.py" -t markdown_strict+escaped_line_breaks
