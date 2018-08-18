rm misc/test-apa/test-file1.md
rm misc/test-apa/test-file2.md

pandoc "misc/test-apa/test-file.Rmd" \
  -o "misc/test-apa/test-file1.md" \
  -t markdown_strict+escaped_line_breaks \
  --bibliography assets/refs.bib \
  --csl assets/apa.csl \
  --filter pandoc-citeproc \
  --filter panflute
#
# pandoc "misc/test-apa/test-file.Rmd" \
#   -o "misc/test-apa/test-file1.pdf" \
#   --variable documentclass="memoir"  \
#   --variable geometry="margin=2in" \
#   --variable fontsize=12pt \
#   --bibliography assets/refs.bib \
#   --csl assets/apa.csl \
#   --filter pandoc-citeproc \
#   --filter "assets/fix-apa-ampersands.py"

pandoc "misc/test-apa/test-file.Rmd" \
  -o "misc/test-apa/test-file1.pdf" \
  --template "misc/test-apa/test-header.tex" \
  --bibliography assets/refs.bib \
  --csl assets/apa.csl \
  --filter pandoc-citeproc \
  --filter "assets/fix-apa-ampersands.py" \
  --filter "assets/fix-tables.py"

pandoc "misc/test-apa/test-file.Rmd" \
  -o "misc/test-apa/test-file2.md" \
  -t markdown_strict+escaped_line_breaks \
  --bibliography assets/refs.bib \
  --filter pandoc-citeproc \
  --filter "./assets/fix-apa-ampersands.py"

pandoc "misc/test-apa/test-file.Rmd" \
  -o "misc/test-apa/test-file2.json" \
  --bibliography assets/refs.bib \
  --filter pandoc-citeproc \
  --filter "./assets/fix-apa-ampersands.py"
