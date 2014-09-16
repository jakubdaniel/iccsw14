verbatimtex
%&latex
\documentclass{article}
\usepackage{amsmath}
\usepackage{amssymb}

\begin{document}
etex

input TEX;

filenametemplate "%j%c.mps";

u := 30;

color blue; blue := (0, 176/255, 240/255);
color darkblue; darkblue := (0, 112/255, 192/255);

color red; red := (240/255, 0, 44/255);
color darkred; darkred := (192/255, 0, 28/255);

color green; green := (44/255, 240/255, 0);
color darkgreen; darkgreen := (28/255, 192/255, 0);

color gray; gray := (192/255, 192/255, 192/255);
color darkgray; darkgray := (86/255, 86/255, 86/255);

beginfig(1)
  fill fullcircle scaled 2u shifted (0u, 0u) withcolor blue;
  draw fullcircle scaled 2u shifted (0u, 0u) withpen pencircle scaled 1.5 withcolor darkblue;
  label(btex \small\sf\bf reachable etex, (0u, 0u)) rotated 45 withcolor white;

  fill (fullcircle scaled 1u shifted (1u, 0u)) withcolor gray;
  draw (fullcircle scaled 1u shifted (1u, 0u)) withpen pencircle scaled 1.5 withcolor darkgray;

  fill (((fullcircle scaled 1u shifted (1u, 0u)) cutbefore (fullcircle scaled 2u shifted (0u, 0u))) cutafter (fullcircle scaled 2u shifted (0u, 0u)))--(((fullcircle rotated 180 scaled 2u shifted (0u, 0u)) cutbefore (fullcircle scaled 1u shifted (1u, 0u))) cutafter (fullcircle scaled 1u shifted (1u, 0u)))--cycle withpen pencircle scaled 1.5 withcolor red;
  draw (((fullcircle scaled 1u shifted (1u, 0u)) cutbefore (fullcircle scaled 2u shifted (0u, 0u))) cutafter (fullcircle scaled 2u shifted (0u, 0u)))--(((fullcircle rotated 180 scaled 2u shifted (0u, 0u)) cutbefore (fullcircle scaled 1u shifted (1u, 0u))) cutafter (fullcircle scaled 1u shifted (1u, 0u)))--cycle withpen pencircle scaled 1.5 withcolor darkred;
  label(btex \small\sf\bf error etex, (1u, 0u)) withcolor white;

  fill fullcircle scaled 0.125u shifted (0u, -0.5u) withcolor white;
  fill fullcircle scaled 0.125u shifted (0.8125u, -0.25u) withcolor white;
  drawarrow (0u, -0.5u)--(0.8125u, -0.25u) cutafter (fullcircle scaled 0.125u shifted (0.8125u, -0.25u)) withpen pencircle withcolor white dashed evenly;
endfig;

beginfig(2)
  drawarrow ((-1.125u,1.125u)--(0u,0u) cutafter (fullcircle scaled (2u + 3) shifted (0u, 0u))) withpen pencircle scaled 1.5 withcolor darkblue;
  drawarrow ((2.5u, 0u)--(3.625u,1.125u) cutbefore (fullcircle scaled 2u shifted (2.5u, 0u))) withpen pencircle scaled 1.5 withcolor darkgreen;
  drawarrow ((2.5u, -2.5u)--(3.625u,-3.625u) cutbefore (fullcircle scaled 2u shifted (2.5u, -2.5u))) withpen pencircle scaled 1.5 withcolor darkred;

  fill fullcircle scaled 2u shifted (0u, 0u) withcolor blue;
  draw fullcircle scaled 2u shifted (0u, 0u) withpen pencircle scaled 1.5 withcolor darkblue;
  label(btex \scriptsize\sf\bf \parbox{1.75cm}{\centering Construct Abstract Program} etex, (0u, 0u)) withcolor white;

  fill fullcircle scaled 2u shifted (2.5u, 0u) withcolor blue;
  draw fullcircle scaled 2u shifted (2.5u, 0u) withpen pencircle scaled 1.5 withcolor darkblue;
  label(btex \scriptsize\sf\bf \parbox{1.75cm}{\centering Model Checking} etex, (2.5u, 0u)) withcolor white;

  fill fullcircle scaled 2u shifted (2.5u, -2.5u) withcolor blue;
  draw fullcircle scaled 2u shifted (2.5u, -2.5u) withpen pencircle scaled 1.5 withcolor darkblue;
  label(btex \scriptsize\sf\bf \parbox{1.75cm}{\centering Counter\-example Analysis} etex, (2.5u, -2.5u)) withcolor white;

  fill fullcircle scaled 2u shifted (0u, -2.5u) withcolor blue;
  draw fullcircle scaled 2u shifted (0u, -2.5u) withpen pencircle scaled 1.5 withcolor darkblue;
  label(btex \scriptsize\sf\bf \parbox{1.75cm}{\centering Abstraction Refinement} etex, (0u, -2.5u)) withcolor white;

  drawarrow ((0u, 0u)..(1.75u,1u)..(2.5u,0u) cutbefore (fullcircle scaled 2u shifted (0u, 0u)) cutafter (fullcircle scaled (2u + 3) shifted (2.5u, 0u))) withpen pencircle scaled 1.5 withcolor darkblue;
  drawarrow ((2.5u, 0u)..(3.5u,-1.75u)..(2.5u,-2.5u) cutbefore (fullcircle scaled 2u shifted (2.5u, 0u)) cutafter (fullcircle scaled (2u + 3) shifted (2.5u, -2.5u))) withpen pencircle scaled 1.5 withcolor darkblue;
  drawarrow ((2.5u, -2.5u)..(1.75u,-3.5u)..(0u,-2.5u) cutbefore (fullcircle scaled 2u shifted (2.5u, -2.5u)) cutafter (fullcircle scaled (2u + 3) shifted (0u, -2.5u))) withpen pencircle scaled 1.5 withcolor darkblue;
  drawarrow ((0u, -2.5u)..(-1u,-1.75u)..(0u,0u) cutbefore (fullcircle scaled 2u shifted (0u, -2.5u)) cutafter (fullcircle scaled (2u + 3) shifted (0u, 0u))) withpen pencircle scaled 1.5 withcolor darkblue;
endfig;

end

verbatimtex
\end{document}
etex

.
