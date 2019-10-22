reset
set terminal x11

# set terminal pdf
# set output "real.pdf"

set terminal tikz size 10cm,7cm
set output "real.tex"


set xlabel "$s$"
set ylabel "$\\zeta(s)$"

set zeroaxis
set xrange [-4:4]
# set yrange [-0.01:0.01]
# set yrange [-0.1:0.1]
set yrange [-20:20]
# set logscale y

set xtics -4,2,4
set ytics -20,10,20


# 凡例
# set key at 2.4,13
set key spacing 2
set key samplen 3

set style line 1 lw 2 lc rgb "blue"
set style line 2 lw 2 dt (10,3,3,3) lc rgb "black"
set style line 3 lw 1 dt (5,5) lc rgb "black"


### convert (r,g,b) to #RRGGBB
rgb(r,g,b) = sprintf("#%02x%02x%02x",r%256,g%256,b%256);

set parametric
set trange [-20:20]

plot 'lt1.dat' title '\kaisekisetuzokumae' w l ls 1,\
    'real.dat' title '\kaisekisetuzokugo' w l ls 2,\
    1,t ls 3 notitle


set terminal x11