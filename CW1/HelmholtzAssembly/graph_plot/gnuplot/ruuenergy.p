# Gnuplot script
set size 1.0, 0.6
set terminal postscript portrait enhanced mono dashed lw 1 "Helvetica" 14 
set output "./handin/graphs/ruuenergy.ps"
set logscale x 2                        # scale axes automatically
unset label                            # remove any previous labels
unset key
set xtic auto                          # set xtics automatically
set ytic auto                          # set ytics automatically
set title "Total Power Consumed with Variance in RUU Size"
set xlabel "Size of RUU"
set ylabel "Total Power Consumed"
plot "./results/energy/ruuenergy" using 1:3 title 'Total Power Consumed per cycle\_cc1' with linespoints