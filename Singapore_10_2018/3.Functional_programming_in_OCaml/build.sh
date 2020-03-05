#!/bin/sh

latex fun_tree.tex
dvips -o fun_tree.ps fun_tree.dvi
ps2eps -f fun_tree.ps
latex app_tree.tex
dvips -o app_tree.ps app_tree.dvi
ps2eps -f app_tree.ps
latex arith_tree1.tex
dvips -o arith_tree1.ps arith_tree1.dvi
ps2eps -f arith_tree1.ps
latex arith_tree2.tex
dvips -o arith_tree2.ps arith_tree2.dvi
ps2eps -f arith_tree2.ps
latex arith_tree3.tex
dvips -o arith_tree3.ps arith_tree3.dvi
ps2eps -f arith_tree3.ps
latex free_var1.tex
dvips -o free_var1.ps free_var1.dvi
ps2eps -f free_var1.ps
latex free_var2.tex
dvips -o free_var2.ps free_var2.dvi
ps2eps -f free_var2.ps
latex bt_ex1.tex
dvips -o bt_ex1.ps bt_ex1.dvi
ps2eps -f bt_ex1.ps
latex bt_ex2.tex
dvips -o bt_ex2.ps bt_ex2.dvi
ps2eps -f bt_ex2.ps
latex bt_shape.tex
dvips -o bt_shape.ps bt_shape.dvi
ps2eps -f bt_shape.ps
xelatex pre_tree.tex
xelatex in_tree.tex
xelatex post_tree.tex
xelatex bst_ex.tex
xelatex rotr.tex
xelatex rotl.tex
xelatex insr_ex.tex

xelatex ocaml.tex
xelatex ocaml.tex
