when-changed chapters/*.tex biblio.bib main.tex -c "./runlatex.sh"
when-changed schema_capitoli.dot -c "dot -Tpdf  schema_capitoli.dot >  schema_capitoli.pdf"
#when-changed chapters/ biblio.bib main.tex standalonetikz/ -c "say \"START!\" && cd build/ && make && cd .. && say \"FINISHED\""
