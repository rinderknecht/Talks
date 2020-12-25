#!/bin/sh

xelatex bullets.tex
xelatex tree_for_term.tex
xelatex tree.tex
xelatex cat_dag.tex
latex cat123_push.tex
dvips -o cat123_push.ps cat123_push.dvi
ps2eps -f cat123_push.ps
latex cat123_pop0.tex
dvips -o cat123_pop0.ps cat123_pop0.dvi
ps2eps -f cat123_pop0.ps
latex cat123_pop1.tex
dvips -o cat123_pop1.ps cat123_pop1.dvi
ps2eps -f cat123_pop1.ps
latex cat123_pop2.tex
dvips -o cat123_pop2.ps cat123_pop2.dvi
ps2eps -f cat123_pop2.ps
latex sum_dag.tex
dvips -o sum_dag.ps sum_dag.dvi
ps2eps -f sum_dag.ps
latex sum375_push.tex
dvips -o sum375_push.ps sum375_push.dvi
ps2eps -f sum375_push.ps

latex sum375_pop.tex
dvips -o sum375_pop.ps sum375_pop.dvi
ps2eps -f sum375_pop.ps
latex sum375_pop1.tex
dvips -o sum375_pop1.ps sum375_pop1.dvi
ps2eps -f sum375_pop1.ps

latex sum0_375_0.tex
dvips -o sum0_375_0.ps sum0_375_0.dvi
ps2eps -f sum0_375_0.ps
latex sum0_375_1.tex
dvips -o sum0_375_1.ps sum0_375_1.dvi
ps2eps -f sum0_375_1.ps
latex sum0_375_2.tex
dvips -o sum0_375_2.ps sum0_375_2.dvi
ps2eps -f sum0_375_2.ps
latex sum0_375tco0.tex
dvips -o sum0_375tco0.ps sum0_375tco0.dvi
ps2eps -f sum0_375tco0.ps
latex sum0_375tco1.tex
dvips -o sum0_375tco1.ps sum0_375tco1.dvi
ps2eps -f sum0_375tco1.ps
latex sum0_375tco2.tex
dvips -o sum0_375tco2.ps sum0_375tco2.dvi
ps2eps -f sum0_375tco2.ps

xelatex top.tex
xelatex top.tex
