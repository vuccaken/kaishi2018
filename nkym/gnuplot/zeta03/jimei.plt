reset
set terminal x11

# set terminal pdf size 12cm,8cm
# set output "jimei.pdf"

set terminal tikz size 11cm,7cm
set output "jimei.tex"

set xlabel "$\\Re(s)$"
set ylabel "$\\Im(s)$"
set zlabel "$|\\zeta(s)|$"
set xlabel offset -1,-1,0
set ylabel offset -1,-0.5,0
set zlabel offset -1,0,0

set xtics -8, 2, 2
set ytics -4, 2, 4
# set ztics -8, 2, 2

set xtics offset -0.3,-0.3,0
set ytics offset 0,0,0
set ztics offset 1,0,0

set zeroaxis
set xrange [-8:2]
set yrange [-5:5]
# set zrange [0:0.02]

set format z "$10^{%L}$"
set logscale z 10
set ticslevel 0

# set view 60, 20, 1, 1
set view 70, 20, 1.2, 1.4

# 隠線処理
# set hidden3d
# set hidden3d back offset 0 trianglepattern 3 undefined 1 altdiagonal bentover

# 凡例
set nokey

set style line 1 lw 0.01 lc rgb "black"
set style line 2 lw 0.3 lc rgb "black"
set style line 3 lw 0.2 lc rgb "blue"

splot "jimei.dat" w l ls 1

set terminal x11