reset
# set terminal x11

# set terminal pdf
# set output "zeta01.pdf"

set terminal tikz size 10cm,6cm
set output "real-tikz.tex"

set xlabel "$s$"
set ylabel "$\\Gamma(s)$"

set zeroaxis
# set xrange [-5:5]
set yrange [-10:10]
# set logscale y

# 凡例
set nokey

set style line 1 lw 2 lc rgb "blue"
set style line 2 lw 1 lc rgb "black" dt (5,5)
set style line 3 lw 1 lc rgb "black"

# たて線の設定
set parametric
set trange [-10:10]

plot "real.dat" w l ls 1,\
  for [i=1:8] -i,t ls 2

set terminal x11