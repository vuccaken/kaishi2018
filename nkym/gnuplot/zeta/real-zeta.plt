reset
set terminal x11

# set terminal pdf
# set output "real-zeta.pdf"

set terminal tikz size 10cm,7cm
set output "real-zeta.tex"

set xlabel "$s$"
set ylabel "$\\zeta(s)$"

set zeroaxis
# set xrange [-5:5]
# set yrange [-0.01:0.01]
set yrange [-40:20]
# set logscale y


# 凡例
set nokey

set style line 1 lw 2 lc rgb "black"
set style line 2 lw 0.5 lc rgb "black"
set style line 3 lw 0.5 lc rgb "blue"


set parametric
set trange [-100:20]

plot "real-zeta.dat" w l ls 1,\
  1,t dt (10,10) lc "black" notitle

set terminal x11