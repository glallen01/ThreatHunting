#!/bin/bash

echo "***> creating pdf <***"

rm index.tex

FILES=$(ls *.tex)

cat << EOF > index.tex
\documentclass{scrartcl}
\usepackage{hyperref}
\providecommand{\tightlist}{%
  \setlength{\itemsep}{0pt}\setlength{\parskip}{0pt}}
\newcommand{\INPUT}[1]{\input{#1}\clearpage}
\begin{document}
EOF

for FILE in $FILES; do 
  echo "\INPUT{${FILE%.*}}" >> index.tex
done

echo "\end{document}" >> index.tex

pdflatex index.tex
pdflatex index.tex

rm index.{aux,log,out}
