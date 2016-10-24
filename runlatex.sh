say "START!"
latexrun --latex-cmd=pdflatex --latex-args="-synctex=1" main.tex
latexpand main.tex > main_`date '+%b_%d_%G_%H_%M_%S'`.docx
cp latex.out/main.synctex.gz .
say "FINISHED"
