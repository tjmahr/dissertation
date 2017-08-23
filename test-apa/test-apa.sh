rm test-apa/test-file1.md
rm test-apa/test-file2.md
rm test-apa/test-file3.md

pandoc "test-apa/test-file.Rmd" \
  -o "test-apa/test-file1.md" \
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

pandoc "test-apa/test-file.Rmd" \
  -o "test-apa/test-file3.md" \
  -t markdown_strict+escaped_line_breaks \
  --bibliography assets/refs.bib \
  --filter pandoc-citeproc \
  --filter "./fix-apa-ampersands.py"
