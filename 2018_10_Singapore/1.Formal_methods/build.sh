#!/bin/sh

convert Airbus_A340.jpg Airbus_A340.eps
convert Ariane_5.jpg Ariane_5.eps
convert CompCert_diagram.png CompCert_diagram.eps
convert Dassault_Falcon_900.jpg Dassault_Falcon_900.eps
convert ligne-14-Chatelet.jpg ligne-14-Chatelet.eps
convert heartbleed.png heartbleed.eps
convert SecureHTTPS.png SecureHTTPS.eps
convert InsecureHTTPS.png InsecureHTTPS.eps
convert Intel_Pentium_A80501.jpg Intel_Pentium_A80501.eps
convert world_map_with_four_colours.png world_map_with_four_colours.eps

xelatex compilation_chain.tex
xelatex phases.tex
xelatex refinement.tex
latex traces.tex
dvips -o traces.ps traces.dvi
ps2eps -f traces.ps

latex traces_square.tex
dvips -o traces_square.ps traces_square.dvi
ps2eps -f traces_square.ps

latex traces_square_cropped.tex
dvips -o traces_square_cropped.ps traces_square_cropped.dvi
ps2eps -f traces_square_cropped.ps

latex traces_hexagon.tex
dvips -o traces_hexagon.ps traces_hexagon.dvi
ps2eps -f traces_hexagon.ps

xelatex fm.tex
xelatex fm.tex

xelatex misc.tex
xelatex misc.tex
