#say "START!"
clear && latexrun --latex-cmd=pdflatex --latex-args="-synctex=1" main.tex
#latexrun --latex-cmd=pdflatex --latex-args="-synctex=1" latex.out/main-frn.tex
#latexrun --latex-cmd=pdflatex --latex-args="-synctex=1" main.tex
#latexpand main.tex > main_`date '+%b_%d_%G_%H_%M_%S'`.docx
latexpand main.tex | grep -v -E "^\\\[a-z]" > mainexpand.tex
cp latex.out/main.synctex.gz .
#say "FINISHED!"
