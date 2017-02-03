# using when-changed to monitor online file changing and do action
project(Thesis)
cmake_minimum_required(VERSION 2.8)

set(CMAKE_MODULE_PATH "${PROJECT_SOURCE_DIR}/cmake")
set(LATEX_OUTPUT_PATH "${CMAKE_SOURCE_DIR}/build/")
include("${CMAKE_MODULE_PATH}/UseLATEX.cmake")


INCLUDE(GetGitRevisionDescription)
GET_GIT_HEAD_REVISION(GIT_REFSPEC GIT_SHA1)
MESSAGE(STATUS "GIT SHA1 ${GIT_SHA1}")

MACRO (TODAY BUILD_TIME)
    IF(UNIX)
        EXECUTE_PROCESS(COMMAND "date" "+%b_%d_%G_%H_%M_%S" OUTPUT_VARIABLE ${BUILD_TIME})
        # Remove new line
        string(REGEX REPLACE "\n" "" ${BUILD_TIME} ${${BUILD_TIME}})
    ENDIF (UNIX)
ENDMACRO (TODAY)
TODAY(BUILD_TIME)

set(IMAGE_FILES
	images/konigsberg.jpg
	images/deg_dist_poisson_er.pdf
	images/er_graphs.pdf
	images/configuration_model_six_stubs.pdf
	images/configuration_model_three_stubs.pdf
	images/bullmore_2009_pipeline.pdf
	standalonetikz/configurationmodel.pdf
	images/plot_surprise_pareto.pdf
	images/barthelemy_surprise.pdf
	images/barthelemy_modularity.pdf
	images/ring_cliques_pareto.pdf
	images/ring_of_cliques_8_8.pdf
	images/ring_cliques_surprise.pdf
	images/traag_ring_of_cliques.pdf
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
	chapters/beyond_resolution_limit.tex
	chapters/acknowledgment.tex
	chapters/conclusions.tex
	chapters/introduction.tex
	chapters/synopsis.tex
	chapters/appendix_surprise.tex
	chapters/discussions.tex
	chapters/modularorganization.tex
	chapters/realworld.tex
	chapters/notation.tex
	chapters/results.tex
	chapters/hyphenations.tex
)

set(TIKZ_INPUTS
	standalonetikz/tikz_simple_graph.tikz
	standalonetikz/tikz_loopy_multigraph.tikz
	standalonetikz/tikz_weighted_graph.tikz
	#standalonetikz/tikz_degree_strength.tikz.tex
	#standalonetikz/configurationmodel.tex
	standalonetikz/tikz_directed_graph.tikz
)

ADD_LATEX_DOCUMENT(
    main.tex
    INPUTS ${INPUT_FILES} ${TIKZ_INPUTS}
    IMAGES ${IMAGE_FILES}
    BIBFILES biblio2.bib
    #FILTER_OUTPUT
    )
