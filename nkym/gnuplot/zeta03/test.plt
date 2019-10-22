reset
set iso 100,100
set xrange [-6:6]
set yrange [-3:9] # We should have [-3:3], but do not rush!
set zrange [-2:2]
set ticslevel 0
unset key
unset colorbox
set xtics nomirror
set ytics -3,2,3
set ztics -2,2,2
set xtics -6,2,6
set border 1+16

set xlabel 'x-label'
set zlabel 'z-label' offset graph 0.05,0,-0.1
set ylabel 'y-label' offset graph -0.05,-0.25,0
f(x) = (x<3?x:1/0)
set size 1,0.7
# set arrow 1 from -6,-3,-2 to -6,3,-2 nohead
# set arrow 2 from 6,-3,-2 to 6,3,-2 nohead
# set arrow 3 from -6,3,-2 to 6,3,-2 nohead

set palette rgbformulae 33,13,10
splot sin(x)*cos(f(y)) with pm3d