
reset
# set terminal x11

# set terminal pdf
# set output "500pdf.pdf"

set terminal tikz size 9cm,6cm
set output "500tikz.tex"

set xlabel "$x$"
# set ylabel "Im(s)"

# set zeroaxis
# set xrange [-5:5]
set yrange [0:110]

# 凡例
# set key right bottom # 位置
set key at 480, 38
set key spacing 2 # 間隔
set key samplen 6 # 見本の長さ


# ライン設定登録
set style line 1 lw 2 lc rgb "blue"
set style line 2 dt (5,5) lw 2 lc rgb "red"
set style line 3 dt (15,5,5,5) lw 2 lc rgb "#008800"
# set style line 4 pt 6 lw 2 lc rgb "blue"

# P L O T
plot "500.dat" using 1:2 title "$\\pi(x)$" w l ls 1,\
  "500.dat" using 1:3 title "$x/\\log x$" w l ls 2,\
  "500.dat" using 1:4 title "$\\mathrm{li}(x)$" w l ls 3

# plot "500.dat" u 1:2 title "$\\pi(x)$" w l ls 1

# replot

set terminal x11