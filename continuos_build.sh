#when-changed chapters/ biblio.bib standalonetikz/ -c latexrun main.tex && latexpand main.tex > main_`date '+%b_%d_%G_%H_%M_%S'`.docx 

when-changed chapters/ biblio.bib main.tex standalonetikz/ -c "say \"START!\" && cd build/ && make && cd .. && say \"FINISHED\""
