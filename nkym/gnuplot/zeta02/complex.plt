reset
set terminal x11

# set terminal pdf
# set output "hijimei.pdf"

# set terminal tikz size 10cm,7cm
# set output "jimei-zeta.tex"


set xlabel "$t$"
set ylabel "$|\\zeta(\frac12+ti)|$"

set zeroaxis
# set xrange [0.9:2.5]
# set yrange [-0.01:0.01]
# set yrange [-10:14]
# set logscale y


# 凡例
# set key at 2.4,13
# set key spacing 2

# set style line 1 lw 0.3 lc rgb "black"
# set style line 2 lw 0.5 lc rgb "black"
# set style line 3 lw 0.5 lc rgb "blue"


### convert (r,g,b) to #RRGGBB
rgb(r,g,b) = sprintf("#%02x%02x%02x",r%256,g%256,b%256);

# set parametric
# set trange [0:15]

plot 'hijimei.dat' 



set terminal x11