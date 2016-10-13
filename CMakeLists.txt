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

message(STATUS ${BUILD_TIME})
message(STATUS ${GIT_SHA1})
set(WORD_OUTPUT_FILE "${LATEX_OUTPUT_PATH}/thesis_${BUILD_TIME}.docx")

# Targets to generate the corresponding word file based on the expanded latex file
add_custom_command(
    OUTPUT word
    COMMAND latexpand ${LATEX_OUTPUT_PATH}/main.tex > ${WORD_OUTPUT_FILE}
    )

add_custom_target(
    word ALL DEPENDS word
    )
