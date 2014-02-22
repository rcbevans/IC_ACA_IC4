# Gnuplot script
set size 1.0, 0.6
set terminal postscript portrait enhanced mono dashed lw 1 "Helvetica" 10 
set output "./handin/graphs/energyuse.ps"
set   autoscale                        # scale axes automatically
unset log                              # remove any log-scaling
unset label                            # remove any previous labels
set xtics nomirror rotate by -45 font ",8"
set boxwidth 0.5
set style fill solid
set xtic auto                          # set xtics automatically
set ytic auto                          # set ytics automatically
unset key
set title "Power Consumption of System with Different Settings"
set ylabel "Power Consumption"
plot "./results/energy/graphtestall" using 1:4:xtic(2) with boxes,\
	"./results/energy/graphtestall" using 1:($4+10000000):4 with labels font ",8"