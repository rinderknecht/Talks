#!/bin/sh

# xelatex compilation_chain.tex
# latex traces.tex
# dvips -o traces.ps traces.dvi
# ps2eps -f traces.ps

xelatex jsligo.tex
xelatex jsligo.tex
