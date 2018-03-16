rm misc/test-apa/test-file1.md
rm misc/test-apa/test-file2.md

pandoc "misc/test-apa/test-file.Rmd" \
  -o "misc/test-apa/test-file1.md" \
  -t markdown_strict+escaped_line_breaks \
  --bibliography assets/refs.bib \
  --filter pandoc-citeproc \
  --filter panflute

pandoc "misc/test-apa/test-file.Rmd" \
  -o "misc/test-apa/test-file2.md" \
  -t markdown_strict+escaped_line_breaks \
  --bibliography assets/refs.bib \
  --filter pandoc-citeproc \
  --filter "./assets/fix-apa-ampersands.py"
