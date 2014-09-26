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

def node(expr o, l, ci, cii) =
  begingroup
    picture r;

    r := image(
      fill fullcircle scaled u shifted o withcolor cii;
      draw fullcircle scaled u shifted o withpen pencircle scaled 1.5 withcolor ci;
      label(l, o) withcolor white;
    );

    r
  endgroup
enddef;

def edge(expr o, d, l, c) =
  begingroup
    path p;
    picture r;
    pair a;

    a := (d - o) rotated -90;
    a := point 1 of (((0,0)--a) cutafter fullcircle scaled 0.5u);

    p := ((o--d) cutbefore (fullcircle scaled (u + 1.5) shifted o) cutafter (fullcircle scaled (u + 1.5) shifted d));

    r := image(
      drawarrow p withpen pencircle scaled 1.5 withcolor c;
      label(l, (point 0.5 of p) + a) withcolor c;
    );

    r
  endgroup
enddef;

def nonedge(expr o, d, l, c) =
  begingroup
    path p;
    picture r;
    pair a;

    a := (d - o) rotated -90;
    a := point 1 of (((0,0)--a) cutafter fullcircle scaled 0.5u);

    p := ((o--d) cutbefore (fullcircle scaled (u + 1.5) shifted o) cutafter (fullcircle scaled (u + 1.5) shifted d));

    r := image(
      drawarrow p withpen pencircle scaled 1.5 withcolor c dashed evenly;
      label(l, (point 0.5 of p) + a) withcolor c;
    );

    r
  endgroup
enddef;

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

picture si, sii;

si := image(
    w := 0.65u;
    draw node(( -6w,    0u), btex \Large\sf\bfseries init etex, darkblue, blue);
    draw node(( -2w, -1.5u), btex \LARGE\sf\bfseries $\text{s}_\text{m}$ etex, darkblue, blue);
    draw node(( -6w, -1.5u), btex \LARGE\sf\bfseries $\text{s}$ etex, darkblue, blue);
    draw node((-10w, -1.5u), btex \LARGE\sf\bfseries $\text{s}_\text{0}$ etex, darkblue, blue);
    label(btex \Huge\ldots etex, (-4w, -1.5u)) withpen pencircle scaled 1.5 withcolor darkblue;
    label(btex \Huge\ldots etex, (-8w, -1.5u)) withpen pencircle scaled 1.5 withcolor darkblue;

    draw edge((-6w, 0u), ( -2w, -1.5u), btex etex, darkblue);
    draw edge((-6w, 0u), ( -6w, -1.5u), btex etex, darkblue);
    draw edge((-6w, 0u), (-10w, -1.5u), btex etex, darkblue);

    label.urt(btex \Large\sf\bfseries $\text{n} = \text{\normalsize UINT\_MAX}$ etex, (-4w + 0.25u, -0.75u)) withcolor darkblue;
    label.ulft(btex \Large\sf\bfseries $\text{n} = \text{0}$ etex, (-8w - 0.25u, -0.75u)) withcolor darkblue;

    draw node((-10w,   -3u), btex \LARGE\sf\bfseries $\text{s}_\text{0}'$ etex, darkblue, blue);
    draw node((-10w, -4.5u), btex \LARGE\sf\bfseries $\text{s}_\text{0}''$ etex, darkblue, blue);
    draw node(( -4w,   -6u), btex \LARGE\sf\bfseries $\text{err}$ etex, darkred, red);

    draw    edge((-10w, -1.5u), (-10w,   -3u), btex etex, darkblue);
    draw    edge((-10w,   -3u), (-10w, -4.5u), btex etex, darkblue);
    draw nonedge((-10w, -4.5u), (-10w,   -6u), btex etex, darkblue);
    draw nonedge(( -6w, -1.5u), ( -4w,   -6u), btex etex, darkblue);
    draw nonedge(( -4w,   -3u), ( -4w,   -6u), btex etex, darkblue);
    draw nonedge(( -2w, -1.5u), ( -4w,   -6u), btex etex, darkblue);
);

sii := image(
    w := 0.65u;
    draw node(( -6w,    0u), btex \Large\sf\bfseries init etex, darkblue, blue);
    draw node((-10w, -1.5u), btex \LARGE\sf\bfseries $\text{s}_<$ etex, darkblue, blue);
    draw node(( -2w, -1.5u), btex \LARGE\sf\bfseries $\text{s}_\ge$ etex, darkblue, blue);

    draw edge((-6w, 0u), ( -2w, -1.5u), btex etex, darkblue);
    draw edge((-6w, 0u), (-10w, -1.5u), btex etex, darkblue);

    label.ulft(btex \Large\sf\bfseries $\text{n} < \text{2}^\text{31}$ etex, (-8w - 0.25u, -0.75u)) withcolor darkblue;
    label.urt(btex \Large\sf\bfseries $\text{n} \ge \text{2}^\text{31}$ etex, (-4w + 0.25u, -0.75u)) withcolor darkblue;

    draw node((-10w,   -3u), btex \LARGE\sf\bfseries $\text{s}_\text{0}'$ etex, darkblue, blue);
    draw node((-10w, -4.5u), btex \LARGE\sf\bfseries $\text{s}_\text{0}''$ etex, darkblue, blue);
    draw node(( -2w,   -6u), btex \LARGE\sf\bfseries $\text{err}$ etex, darkred, red);

    draw    edge((-10w, -1.5u), (-10w,   -3u), btex etex, darkblue);
    draw    edge((-10w,   -3u), (-10w, -4.5u), btex etex, darkblue);
    draw nonedge((-10w, -4.5u), (-10w,   -6u), btex etex, darkblue);
    draw nonedge(( -2w, -1.5u), ( -2w,   -6u), btex etex, darkblue);
);

beginfig(3)
    draw si;

    setbounds currentpicture to bbox(image(draw si; draw sii;));
endfig;

beginfig(4)
    draw sii;

    setbounds currentpicture to bbox(image(draw si; draw sii;));
endfig;

beginfig(5)
    label(btex $\forall$ etex scaled 4, (-0.275u,  0.1375u));
    label(btex $\exists$ etex scaled 4, ( 0.275u, -0.1375u));

    draw fullcircle scaled 2u withpen pencircle scaled 5 withcolor darkred;
    draw ((-u, u)--(u, -u) cutbefore (fullcircle scaled 2u) cutafter (reverse fullcircle scaled 2u)) withpen pencircle scaled 3 withcolor darkred;
endfig;

% Interpolated trace
    %s_1 = 0
       %s_1 = 0

    %i_1 = 1
       %2 * i_1 = s_1 + 2

    %i_1 <= n_1
       %2 * i_1  = s_1 + 2
       %2 * n_1 >= s_1 + 2

    %i_1 < 2^31
       %2 * i_1  = s_1 + 2
       %2 * n_1 >= s_1 + 2

    %s_2 = s_1 + 2
       %2 * i_1  = s_2
       %2 * n_1 >= s_2

    %i_2 = i_1 + 1
       %2 * i_2 - 2  = s_2
       %2 * n_1     >= s_2

    %i_2 > n_1
       %2 * n_1 = s_2

    %s_2 != 2 * n_1

w := 2u;
h := 0.75u;
picture ti, tii, tiii, tiv, tv, tvi, tvii, tviii, iti, itii, itiii, itiv, itv, itvi, itvii;

ti := image(
    label(btex {\sf\bfseries $\text{s}_\text{1} = \text{0}$} etex, (0w, 0h)) withcolor darkblue;

    draw (0w, -1h)--(7w, -1h) withpen pencircle scaled 1 withcolor darkblue;

    draw (0w, -1h + 5)--(0w, -1h - 5) withpen pencircle scaled 1 withcolor darkblue;
);

tii := image(
    draw ti;

    label(btex {\sf\bfseries $\text{i}_\text{1} = \text{1}$} etex, (1w, 1h)) withcolor darkblue;

    draw (1w, -1h + 5)--(1w, -1h - 5) withpen pencircle scaled 1 withcolor darkblue;
);

tiii := image(
    draw tii;

    label(btex {\sf\bfseries $\text{i}_\text{1} \le \text{n}_\text{1}$} etex, (2w, 0h)) withcolor darkblue;

    draw (2w, -1h + 5)--(2w, -1h - 5) withpen pencircle scaled 1 withcolor darkblue;
);

tiv := image(
    draw tiii;

    label(btex {\sf\bfseries $\text{i}_\text{1} < \text{2}^\text{31}$} etex, (3w, 1h)) withcolor darkblue;

    draw (3w, -1h + 5)--(3w, -1h - 5) withpen pencircle scaled 1 withcolor darkblue;
);

tv := image(
    draw tiv;

    label(btex {\sf\bfseries $\text{s}_\text{2} = \text{s}_\text{1} + \text{2}$} etex, (4w, 0h)) withcolor darkblue;

    draw (4w, -1h + 5)--(4w, -1h - 5) withpen pencircle scaled 1 withcolor darkblue;
);

tvi := image(
    draw tv;

    label(btex {\sf\bfseries $\text{i}_\text{2} = \text{i}_\text{1} + \text{1}$} etex, (5w, 1h)) withcolor darkblue;

    draw (5w, -1h + 5)--(5w, -1h - 5) withpen pencircle scaled 1 withcolor darkblue;
);

tvii := image(
    draw tvi;

    label(btex {\sf\bfseries $\text{i}_\text{2} > \text{n}_\text{1}$} etex, (6w, 0h)) withcolor darkblue;

    draw (6w, -1h + 5)--(6w, -1h - 5) withpen pencircle scaled 1 withcolor darkblue;
);

tviii := image(
    draw tvii;

    label(btex {\sf\bfseries $\text{s}_\text{2} \neq \text{2} \cdot \text{n}_\text{1}$} etex, (7w, 1h)) withcolor darkblue;

    draw (7w, -1h + 5)--(7w, -1h - 5) withpen pencircle scaled 1 withcolor darkblue;
);

iti := image(
    draw tviii;

    label(btex {\sf\bfseries $\text{s}_\text{1} = \text{0}$} etex, (0.5w, -2h)) withcolor darkred;
);

itii := image(
    draw iti;

    label(btex {\sf\bfseries $\text{2} \cdot \text{i}_\text{1} = \text{s}_\text{1} + \text{2}$} etex, (1.5w, -3.25h)) withcolor darkred;
);

itiii := image(
    draw itii;

    label(btex {\sf\bfseries $\text{2} \cdot \text{i}_\text{1} = \text{s}_\text{1} + \text{2}$} etex, (2.5w, -1.75h)) withcolor darkred;
    label(btex {\sf\bfseries $\text{2} \cdot \text{n}_\text{1} \ge \text{s}_\text{1} + \text{2}$} etex, (2.5w, -2.25h)) withcolor darkred;
);

itiv := image(
    draw itiii;

    label(btex {\sf\bfseries $\text{2} \cdot \text{i}_\text{1} = \text{s}_\text{1} + \text{2}$} etex, (3.5w, -3h)) withcolor darkred;
    label(btex {\sf\bfseries $\text{2} \cdot \text{n}_\text{1} \ge \text{s}_\text{1} + \text{2}$} etex, (3.5w, -3.5h)) withcolor darkred;
);

itv := image(
    draw itiv;

    label(btex {\sf\bfseries $\text{2} \cdot \text{i}_\text{1} = \text{s}_\text{2}$} etex, (4.5w, -1.75h)) withcolor darkred;
    label(btex {\sf\bfseries $\text{2} \cdot \text{n}_\text{1} \ge \text{s}_\text{2}$} etex, (4.5w, -2.25h)) withcolor darkred;
);

itvi := image(
    draw itv;

    label(btex {\sf\bfseries $\text{2} \cdot \text{i}_\text{2} = \text{s}_\text{2} - \text{2}$} etex, (5.5w, -3h)) withcolor darkred;
    label(btex {\sf\bfseries $\text{2} \cdot \text{n}_\text{1} \ge \text{s}_\text{2}$} etex, (5.5w, -3.5h)) withcolor darkred;
);

itvii := image(
    draw itvi;

    label(btex {\sf\bfseries $\text{2} \cdot \text{n}_\text{1} = \text{s}_\text{2}$} etex, (6.5w, -2h)) withcolor darkred;
);

beginfig(6)
    draw ti;

    setbounds currentpicture to bbox itvii;
endfig;

beginfig(7)
    draw tii;

    setbounds currentpicture to bbox itvii;
endfig;

beginfig(8)
    draw tiii;

    setbounds currentpicture to bbox itvii;
endfig;

beginfig(9)
    draw tiv;

    setbounds currentpicture to bbox itvii;
endfig;

beginfig(10)
    draw tv;

    setbounds currentpicture to bbox itvii;
endfig;

beginfig(11)
    draw tvi;

    setbounds currentpicture to bbox itvii;
endfig;

beginfig(12)
    draw tvii;

    setbounds currentpicture to bbox itvii;
endfig;

beginfig(13)
    draw tviii;

    setbounds currentpicture to bbox itvii;
endfig;

beginfig(14)
    draw iti;

    setbounds currentpicture to bbox itvii;
endfig;

beginfig(15)
    draw itii;

    setbounds currentpicture to bbox itvii;
endfig;

beginfig(16)
    draw itiii;

    setbounds currentpicture to bbox itvii;
endfig;

beginfig(17)
    draw itiv;

    setbounds currentpicture to bbox itvii;
endfig;

beginfig(18)
    draw itv;

    setbounds currentpicture to bbox itvii;
endfig;

beginfig(19)
    draw itvi;

    setbounds currentpicture to bbox itvii;
endfig;

beginfig(20)
    draw itvii;

    setbounds currentpicture to bbox itvii;
endfig;

picture lz, li, lii, liii, liv;

lz := image(
  draw edge(( 0u,  0u), (-2u, -1u), btex etex, darkblue);
  draw edge((-2u, -1u), (-3u, -2u), btex etex, darkblue);
  draw edge((-2u, -1u), (-1u, -2u), btex etex, darkblue);

  draw nonedge((-3u, -2u), (-4u, -3u), btex etex, darkblue);
  draw nonedge((-3u, -2u), (-2u, -3u), btex etex, darkblue);

  draw nonedge((-1u, -2u), (-2u, -3u), btex etex, darkblue);
  draw nonedge((-1u, -2u), ( 0u, -3u), btex etex, darkblue);

  draw node(( 0u,  0u), btex etex, darkblue, blue);
  draw node((-2u, -1u), btex etex, darkblue, blue);
  draw node((-3u, -2u), btex etex, darkblue, blue);
  draw node((-1u, -2u), btex etex, darkblue, blue);
);

li := image(
  draw lz;

  draw edge(( 0u,  0u), ( 2u, -1u), btex etex, darkblue);
  draw nonedge(( 1u, -2u), ( 1u, -4u), btex etex, darkblue);
  draw nonedge(( 2u, -1u), ( 3u, -2u), btex etex, darkblue);
  draw edge(( 2u, -1u), ( 1u, -2u), btex etex, darkblue);

  draw node(( 1u, -2u), btex etex, darkblue, blue);
  draw node(( 1u, -4u), btex etex, darkred,  red);
  draw node(( 2u, -1u), btex etex, darkblue, blue);

  draw fullcircle scaled 1.5u shifted (1u, -4u) withpen pencircle scaled 1.5 withcolor darkred dashed dashpattern(off 0.375 on 0.375u off 0.375u);
  draw ((1u, -4u)--(1u + 1.5u, -4u + sind(12.5)/cosd(12.5) * 1.5u) cutbefore (fullcircle scaled 1.5u shifted (1u, -4u))) withpen pencircle scaled 1.5 withcolor darkred;
  label.rt(btex \sf\bfseries Spurious Error etex, (1u + 1.5u, -4u + sind(12.5)/cosd(12.5) * 1.5u)) withcolor darkred;
);

lii := image(
  draw lz;

  draw edge(( 0u,  0u), ( 2u, -1u), btex etex, darkgray);
  draw nonedge(( 1u, -2u), ( 1u, -4u), btex etex, darkgray);
  draw edge(( 2u, -1u), ( 1u, -2u), btex etex, darkgray);
  draw nonedge((4u, -1u), (2.5u, -2.125u), btex etex, darkblue);
  draw nonedge((4u, -1u), (5.5u, -2.125u), btex etex, darkblue);

  drawarrow ((0u, 0u)--(0.5u, -0.25u){dir -30}..(2u, -0.25u)..(4u, -1u) cutbefore (fullcircle scaled (u + 1.5)) cutafter (fullcircle scaled (u + 1.5) shifted (4u, -1u))) withpen pencircle scaled 1.5 withcolor darkblue;

  draw node(( 1u, -2u), btex etex, darkgray, gray);
  draw node(( 2u, -1u), btex etex, darkgray, gray);
  draw node(( 4u, -1u), btex etex, darkblue, blue);
  draw node(( 1u, -4u), btex etex, 0.75darkgray + 0.25darkred,  0.75gray + 0.25red);
);

liii := image(
  draw lii;

  draw fullcircle scaled 1.5u shifted (4u, -1u) withpen pencircle scaled 1.5 withcolor darkgreen dashed dashpattern(off 0.375 on 0.375u off 0.375u);
  draw ((4u, -1u)--(4u + 1.5u, -1u + sind(12.5)/cosd(12.5) * 1.5u) cutbefore (fullcircle scaled 1.5u shifted (4u, -1u))) withpen pencircle scaled 1.5 withcolor darkgreen;
  label.rt(btex \sf\bfseries Continue etex, (4u + 1.5u, -1u + sind(12.5)/cosd(12.5) * 1.5u)) withcolor darkgreen;
);

liv := image(
  draw lii;

  draw (fullcircle scaled 3.5u rotated 15 shifted (-2u, -1.75u)) withpen pencircle scaled 1.5 withcolor darkgreen dashed dashpattern(on 0.375u off 0.375u);
  draw ((-2u, -1.75u)--(-2u - 3u, -1.75u + sind(12.5)/cosd(12.5) * 3u) cutbefore (fullcircle scaled 3.5u shifted (-2u, -1.75u))) withpen pencircle scaled 1.5 withcolor darkgreen;
  label.lft(btex \sf\bfseries Keep etex, (-2u - 3u, -1.75u + sind(12.5)/cosd(12.5) * 3u)) withcolor darkgreen;
);

beginfig(21)
    draw li;

    setbounds currentpicture to bbox(image(draw li; draw lii; draw liii; draw liv;));
endfig;

beginfig(22)
    draw liii;

    setbounds currentpicture to bbox(image(draw li; draw lii; draw liii; draw liv;));
endfig;

beginfig(23)
    draw liv;

    setbounds currentpicture to bbox(image(draw li; draw lii; draw liii; draw liv;));
endfig;

end

verbatimtex
\end{document}
etex

.
