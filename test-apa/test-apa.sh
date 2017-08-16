rm test-apa/test-file.md
rm test-apa/test-file2.md

pandoc "test-apa/test-file.Rmd" \
  -o "test-apa/test-file.md" \
  -t markdown_strict+escaped_line_breaks \
  --bibliography assets/refs.bib \
  --filter pandoc-citeproc \
  --filter panflute


pandoc "test-apa/test-file.Rmd" \
  -o "test-apa/test-file2.md" \
  -t markdown_strict+escaped_line_breaks \
  --bibliography assets/refs.bib \
  --filter pandoc-citeproc \
  --filter "fix-apa-ampersands.py"
