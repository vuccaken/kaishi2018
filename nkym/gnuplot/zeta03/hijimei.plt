reset
set terminal x11

# set terminal pdf size 11cm,5cm
# set output "hijimei.pdf"

set terminal tikz size 12cm,6cm
set output "hijimei.tex"

set xlabel "$\\Re(s)$"
set ylabel "$\\Im(s)$"
set zlabel "$|\\zeta(s)|$"
set xlabel offset -1,0,0
set ylabel offset 0,-1,0
set zlabel offset 0,0,0

set xtics nomirror
set xtics -3, 1, 3
set ytics -40, 10, 40
set ztics 0, 0.5, 2

set xtics offset 2.5,-0.2,0
set ytics offset 0,-0.5,0
set ztics offset 1,0,0

set xtics scale 0.3
set ytics scale 1.2

set ticslevel 0
# set logscale z
set zeroaxis
set xrange [-4:4]
set yrange [-40:40]
set zrange [0:1.5]

# set border 4+16
# set arrow 1 from -1,-40,0 to 3,-40,0 nohead


# set view 40, 60, 1, 1
set view 55, 70, 1.1, 1.4

# 隠線処理
# set hidden3d
# set hidden3d back offset 0 trianglepattern 3 undefined 1 altdiagonal bentover

# 凡例
set nokey

set style line 1 lw 0.3 lc rgb "black"
set style line 2 lw 0.3 lc rgb "black"
set style line 3 lw 0.2 lc rgb "blue"

splot "hijimei.dat" w l ls 1

set terminal x11