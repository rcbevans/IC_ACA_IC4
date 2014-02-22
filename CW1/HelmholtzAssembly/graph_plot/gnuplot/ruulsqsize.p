# Gnuplot script
set terminal png nocrop enhanced font arial 14 size 840,640 
set output './handin/graphs/ruulsqipc.png'
unset key
set view map
set style data linespoints
set logscale x 2
set logscale y 2
set xtics border in scale 0,0 mirror norotate  offset character 0, 0, 0
set ytics border in scale 0,0 mirror norotate  offset character 0, 0, 0
set ztics border in scale 0,0 nomirror norotate  offset character 0, 0, 0
set cbtics 
set title "IPC Performance of System With Variance in RUU and LSQ Size" 
set rrange [ * : * ] noreverse nowriteback
set trange [ * : * ] noreverse nowriteback
set urange [ * : * ] noreverse nowriteback
set vrange [ * : * ] noreverse nowriteback
set xrange [ 2.00000 : 256.00000 ] noreverse nowriteback
set x2range [ * : * ] noreverse nowriteback
set yrange [ 2.00000 : 256.00000 ] noreverse nowriteback
set y2range [ * : * ] noreverse nowriteback
set zrange [ * : * ] noreverse nowriteback
set xlabel "RUU Size"
set ylabel "LSQ Size"
set cblabel "IPC" 
set cbrange [ 0.00000 : 3.0000 ] noreverse nowriteback
set palette rgbformulae 7,5,15
plot './results/IPC/ruulsqsize' using 2:1:4 with image