# latexmk configuration for the TFG memoria.
# Works with both `latexmk` and `latexmk -pdf`.

$pdf_mode = 1;            # 1 = produce a PDF with pdflatex
$bibtex_use = 2;          # use biber (auto-detected from biblatex)
$pdf_previewer = '';      # do not try to open a viewer
$pdf_update_method = 0;

# Entry point (so plain `latexmk` works too).
@default_files = ('main.tex');

# Keep the build strict so real errors surface early.
$pdflatex = 'pdflatex -interaction=nonstopmode -halt-on-error %O %S';
