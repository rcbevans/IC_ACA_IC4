# Gnuplot script
set size 1.0, 0.6
set terminal postscript portrait enhanced mono dashed lw 1 "Helvetica" 14 
set output "./handin/graphs/ruuipc.ps"
set logscale x 2                        # scale axes automatically
unset label                            # remove any previous labels
unset key
set xtic auto                          # set xtics automatically
set ytic auto                          # set ytics automatically
set title "IPC When Executing with Varying RUU Size"
set xlabel "Size of RUU"
set ylabel "IPC When Running Binary"
plot "./results/IPC/ruusize" using 1:3 title 'sim\_IPC' with linespoints