reset
# set terminal x11

# set terminal pdf
# set output "real-zeta.pdf"

set terminal tikz size 10cm,7cm
set output "lt1-zeta.tex"

set xlabel "$s$"
set ylabel "$\\zeta(s)$"

set zeroaxis
set xrange [0.9:2.5]
# set yrange [-0.01:0.01]
set yrange [0:14]
# set logscale y


# 凡例
set key at 2.4,13
set key spacing 2

# set style line 1 lw 0.3 lc rgb "black"
# set style line 2 lw 0.5 lc rgb "black"
# set style line 3 lw 0.5 lc rgb "blue"


### convert (r,g,b) to #RRGGBB
rgb(r,g,b) = sprintf("#%02x%02x%02x",r%256,g%256,b%256);

set parametric
set trange [0:15]

plot for [i=2:7] "lt1-zeta.dat" u 1:i title '$N=10^'.(i-1).'$'\
  w l lw 2 lc rgb rgb(280-40*i,280-40*i,280-40*i),\
  1,t dt (3,3) lc "black" notitle



set terminal x11