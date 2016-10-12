project(Thesis)
cmake_minimum_required(VERSION 2.8)

set(CMAKE_MODULE_PATH "${PROJECT_SOURCE_DIR}/cmake")
set(LATEX_OUTPUT_PATH "${CMAKE_SOURCE_DIR}/build/")
include("${CMAKE_MODULE_PATH}/UseLATEX.cmake")

set(IMAGE_FILES
	images/konigsberg.jpg
	images/deg_dist_poisson_er.pdf
	images/er_graphs.pdf
	images/configuration_model_six_stubs.pdf
	images/configuration_model_three_stubs.pdf
	standalonetikz/configurationmodel.pdf
)

set(INPUT_FILES
	include/chapterdecoration.tex
	include/preamblearsclassica.tex
	include/preamblesimple.tex
	include/surpriseproperties.tex
	include/misc/choleskybenchmark.tex
	include/misc/paco.tex
	include/misc/ring_clique_5_24.tex
	include/misc/marginal_surprise.tex
	include/misc/pacofagso.tex
	include/misc/subgraphconditionalprobability.tex
	include/misc/noise_simulation.tex
	include/misc/powerlaw_ring_clique.tex
	include/misc/subgraphprobability.tex
	chapters/acknowledgment.tex
	chapters/conclusions.tex
	chapters/introduction.tex
	chapters/preface.tex
	chapters/appendix_surprise.tex
	chapters/discussions.tex
	chapters/notation.tex
	chapters/results.tex
)

set(TIKZ_INPUTS
	standalonetikz/tikz_simple_graph.tikz
	standalonetikz/tikz_loopy_multigraph.tikz
	standalonetikz/tikz_weighted_graph.tikz
	standalonetikz/tikz_degree_strength.tikz.tex
	standalonetikz/configurationmodel.tex
)


ADD_LATEX_DOCUMENT(
    main.tex
    INPUTS ${INPUT_FILES} ${TIKZ_INPUTS}
    IMAGES ${IMAGE_FILES}
    BIBFILES biblio.bib
    FILTER_OUTPUT
    )

# Targets to generate the corresponding word file based on the expanded latex file
# PANDOC is used to make the conversion
# add_custom_command(
#     OUTPUT generate_word
#     COMMAND latexpand ${CMAKE_SOURCE_DIR}/main.tex > ${LATEX_OUTPUT_PATH}/mainexpand.tex
#     COMMAND latex2rtf -b ${LATEX_OUTPUT_PATH}/main.bbl ${LATEX_OUTPUT_PATH}/mainexpand.tex 
#     #COMMAND pandoc -s --mathjax ${LATEX_OUTPUT_PATH}/mainexpand.tex -o ${LATEX_OUTPUT_PATH}/mainexpand.docx
#     #COMMAND open ${LATEX_OUTPUT_PATH}/mainexpand.docx
#     )
# add_custom_target(
#     word ALL DEPENDS generate_word
#     )
