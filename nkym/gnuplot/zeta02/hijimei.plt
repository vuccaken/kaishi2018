reset
set terminal x11

# set terminal pdf
# set output "hijimei.pdf"

set terminal tikz size 12cm,6cm
set output "hijimei.tex"


set xlabel "$t$"
set ylabel "$|\\zeta(\\frac12+it)|$"

set zeroaxis
# set xrange [0.9:2.5]
# set yrange [-0.01:0.01]
# set yrange [-10:14]
# set logscale y


# 凡例
set nokey
# set key at 2.4,13
# set key spacing 2

set style line 1 lw 2 lc rgb "blue"
set style line 2 lw 1 dt (5,5) lc rgb "black"


### convert (r,g,b) to #RRGGBB
rgb(r,g,b) = sprintf("#%02x%02x%02x",r%256,g%256,b%256);

# set parametric
# set trange [0:15]

plot 'hijimei.dat' w l ls 1



set terminal x11