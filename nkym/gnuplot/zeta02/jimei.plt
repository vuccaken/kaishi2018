reset
set terminal x11

# set terminal pdf
# set output "jimei.pdf"

set terminal tikz size 10cm,5.5cm
set output "jimei.tex"


set xlabel "$s$"
set ylabel "$\\zeta(s)$"

set zeroaxis
# set xrange [-4:4]
# set yrange [-0.01:0.01]
set yrange [-0.05:0.05]
# set yrange [-0.1:0.1]

# set xtics -4,2,4
# set ytics -20,10,20


# 凡例
set nokey
# set key at 2.4,13
# set key spacing 2
# set key samplen 3

### convert (r,g,b) to #RRGGBB
rgb(r,g,b) = sprintf("#%02x%02x%02x",r%256,g%256,b%256);

set style line 1 lw 2 lc rgb "blue"
set style line 2 lw 1 dt (5,5) lc rgb "black"

set parametric
set trange [-2:2]

plot 'jimei.dat' w l ls 1,\
    for [i=1:4] -i*2,t ls 2


set terminal x11