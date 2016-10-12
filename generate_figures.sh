# Compile with latexrun
latexrun -Wall main.tex
# Generate the pdf of all figures (must enable 
# \usetikzlibrary{external}
# \tikzexternalize[prefix=figures/]
# at the beginning of the main.tex after the input{preamble}
rm -rf figures
mkdir figures
pdflatex --shell-escape main.tex
rm figures/*.md5 figures/*.log figures/*.dpth
