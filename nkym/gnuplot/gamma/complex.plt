reset
# set terminal x11

# set terminal pdf
# set output "complex.pdf"

set terminal tikz size 12cm,8cm
set output "complex-tikz.tex"

set xlabel "$\\Re(s)$"
set ylabel "$\\Im(s)$"
set zlabel "$|\\Gamma(s)|$"
set xlabel offset 0,0.5,0
set ylabel offset 2,0,0
set zlabel offset 0,0,0

set xtics -4, 2, 4
set ytics -4, 2, 4
set ztics 0, 2, 8
set xtics offset 0,0,0
set ytics offset -1.5,0,0

# set zeroaxis
# set xrange [-5:5]
# set yrange [-10:10]
set zrange [0:8]
# set logscale z
set ticslevel 0

set view 45, 330, 1, 1

# 隠線処理
# set hidden3d
set hidden3d back offset 0 trianglepattern 3 undefined 1 altdiagonal bentover

# 凡例
set nokey

set style line 1 lw 0.3 lc rgb "black"
set style line 2 lw 0.5 lc rgb "black"
set style line 3 lw 0.5 lc rgb "blue"

splot "complex.dat" w l ls 1

set terminal x11