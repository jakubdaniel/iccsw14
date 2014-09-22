all: slides.pdf 60sec.pdf

slides.pdf: %.pdf: %.latex %.mp beamerthemeD3S.sty
	mpost $*.mp
	pdflatex $*.latex
	pdflatex -jobname slides-comments "\def\withcomments{1} \input{$*.latex}"

60sec.pdf: %.pdf: %.latex beamerthemeD3S.sty
	pdflatex $*.latex

present: all
	dspdfviewer -f slides.pdf

present-comments: all
	dspdfviewer slides-comments.pdf
