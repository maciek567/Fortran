unset grid
set terminal pdf
set output "wykres[kind].pdf"
set key box top left
set multi
set logscale x
set logscale y
set key opaque
set key box
set key width 1 height 0.5 font "Arial,14"
set style data lines
set termopt enhanced
set xlabel "N" font "Arial,14"
set ylabel "multiplication time" font "Arial,14"
set xtics font "Arial,14"
set ytics font "Arial,14"
set termoption dashed

plot 'time_measur_naive_[kind]' title 'naive'
replot 'time_measur_better_[kind]' title 'better'
replot 'time_measur_dot_[kind]' title 'dot product'
replot 'time_measur_matmul_[kind]' title 'matmul'

unset multi
