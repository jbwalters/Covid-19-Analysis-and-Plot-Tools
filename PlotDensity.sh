#!/bin/bash




DATESTRING=$(date +%D)


gnuplot  <<- GnuPlotCommands
set term png size 1920, 1024
set output "Country_Cases_Density.png"
set key left top
set term png
set multiplot layout 3,3 title "Total Cases per 100,000"
set datafile separator ","
set xdata time
set timefmt "%m/%d/%y"
set format x "%m/%d"
set grid
set xrange ["4/1/20":*]
currentplot=1
set arrow 1 from "4/1/20", graph 0.5 to "5/15/20", graph 0.5 heads size screen 0.01,90 ls -1
set label 1 "Some State Lockdowns" at  graph 0.45, 0.45 center
plot "US_covid19.csv" using 1:(column(2)*100e3/328.2e6) w lines title "US Cases" lw 3, \
     "US_covid19.csv" using 1:(column(3)*100e3/328.2e6) w lines title "US Deaths" lw 3

currentplot=2
set arrow 1 from "4/1/20", graph 0.5 to "5/3/20", graph 0.5 heads size screen 0.01,90 ls -1
set label 1 "Lockdown Period" at  graph 0.45, 0.45 center
plot "Italy_covid19.csv" using 1:(column(2)*100e3/60.36e6) w lines title "Italy Cases" lw 3, \
     "Italy_covid19.csv" using 1:(column(3)*100e3/60.36e6) w lines title "Italy Deaths" lw 3

currentplot=3
set arrow 1 from "4/1/20", graph 0.5 to "5/11/20", graph 0.5 heads size screen 0.01,90 ls -1
set label 1 "Lockdown Period" at  graph 0.45, 0.45 center
plot "France_covid19.csv" using 1:(column(2)*100e3/66.99e6) w lines title "France Cases" lw 3, \
     "France_covid19.csv" using 1:(column(3)*100e3/66.99e6) w lines title "France Deaths" lw 3

currentplot=4
set arrow 1 from "4/1/20", graph 0.5 to "5/10/20", graph 0.5 heads size screen 0.01,90 ls -1
set label 1 "Lockdown Period" at  graph 0.45, 0.45 center
plot "Germany_covid19.csv" using 1:(column(2)*100e3/83.02e6) w lines title "Germany Cases" lw 3, \
     "Germany_covid19.csv" using 1:(column(3)*100e3/83.02e6) w lines title "Germany Deaths" lw 3

currentplot=5
unset arrow 1
set label 1 "No Lockdown" at  graph 0.45, 0.45 center
plot "Japan_covid19.csv" using 1:(column(2)*100e3/126.5e6) w lines title "Japan Cases" lw 3, \
     "Japan_covid19.csv" using 1:(column(3)*100e3/126.5e6) w lines title "Japan Deaths" lw 3

currentplot=6
set label 1 "No Lockdown" at  graph 0.45, 0.45 center
plot "korea_covid19.csv" using 1:(column(2)*100e3/51.64e6) w lines title "Korea" lw 3, \
     "korea_covid19.csv" using 1:(column(3)*100e3/51.64e6) w lines title "Korea Deaths" lw 3

currentplot=7
set label 1 "No Lockdown" at  graph 0.45, 0.45 center
plot "Sweden_covid19.csv" using 1:(column(2)*100e3/10.23e6) w lines title "Sweden Cases" lw 3, \
     "Sweden_covid19.csv" using 1:(column(3)*100e3/10.23e6) w lines title "Sweden Deaths" lw 3

currentplot=8
set arrow 1 from "4/1/20", graph 0.5 to "5/15/20", graph 0.5 heads size screen 0.01,90 ls -1
set label 1 "Lockdown Period" at  graph 0.45, 0.45 center
plot "unitedkingdom_covid19.csv" using 1:(column(2)*100e3/66.65e6) w lines title "UK Cases" lw 3, \
     "unitedkingdom_covid19.csv" using 1:(column(3)*100e3/66.65e6) w lines title "UK Deaths" lw 3
GnuPlotCommands


gnuplot  <<- GnuPlotCommands
set term png size 1920, 1024
set output "County_Case_Density.png"
set key left top
set term png
set multiplot layout 3,3 title "Cases / 100K"
set datafile separator ","
set xdata time
set timefmt "%m/%d/%y"
set format x "%m/%d"
set grid
set xrange ["4/1/20":*]
currentplot=1
set arrow 1 from "4/1/20", graph 0.5 to "5/15/20", graph 0.5 heads size screen 0.01,90 ls -1
set label 1 "Lockdown Period" at  graph 0.45, 0.45 center
plot "Fresno_covid19.csv" using 1:(column(2)*100e3/999101) w lines title "Fresno County Cases" lw 3, \
     "Fresno_covid19.csv" using 1:(column(3)*100e3/999101) w lines title "Fresno County Deaths" lw 3
currentplot=2
set arrow 1 from "4/1/20", graph 0.5 to "5/15/20", graph 0.5 heads size screen 0.01,90 ls -1
set label 1 "Lockdown Period" at  graph 0.45, 0.45 center
plot "Inyo_covid19.csv" using 1:(column(2)*100e3/18039) w lines title "Inyo County Cases" lw 3, \
     "Inyo_covid19.csv" using 1:(column(3)*100e3/18039) w lines title "Inyo County Deaths" lw 3

currentplot=3
set arrow 1 from "4/1/20", graph 0.5 to "5/15/20", graph 0.5 heads size screen 0.01,90 ls -1
set label 1 "Lockdown Period" at  graph 0.45, 0.45 center

plot "Kern_covid19.csv" using 1:(column(2)*100e3/900202) w lines title "Kern County Cases" lw 3, \
     "Kern_covid19.csv" using 1:(column(3)*100e3/900202) w lines title "Kern County Deaths" lw 3
currentplot=4
set arrow 1 from "4/1/20", graph 0.5 to "5/15/20", graph 0.5 heads size screen 0.01,90 ls -1
set label 1 "Lockdown Period" at  graph 0.45, 0.45 center
plot "LosAngeles_covid19.csv" using 1:(column(2)*100e3/10.039e6) w lines title "Los Angeles County Cases" lw 3, \
     "LosAngeles_covid19.csv" using 1:(column(3)*100e3/10.039e6) w lines title "Los Angeles County Deaths" lw 3

currentplot=5
set arrow 1 from "4/1/20", graph 0.5 to "5/15/20", graph 0.5 heads size screen 0.01,90 ls -1
set label 1 "Lockdown Period" at  graph 0.45, 0.45 center
plot "Sacramento_covid19.csv" using 1:(column(2)*100e3/1.552e6) w lines title "Sacramento County Cases" lw 3, \
     "Sacramento_covid19.csv" using 1:(column(3)*100e3/1.552e6) w lines title "Sacramento County Deaths" lw 3

currentplot=6
set arrow 1 from "4/1/20", graph 0.5 to "5/15/20", graph 0.5 heads size screen 0.01,90 ls -1
set label 1 "Lockdown Period" at  graph 0.45, 0.45 center
plot "SanDiego_covid19.csv" using 1:(column(2)*100e3/3.338e6) w lines title "San Diego County Cases" lw 3, \
    "SanDiego_covid19.csv" using 1:(column(3)*100e3/3.338e6) w lines title "San Diego County Deaths" lw 3

currentplot=7
set arrow 1 from "4/1/20", graph 0.5 to "5/15/20", graph 0.5 heads size screen 0.01,90 ls -1
set label 1 "Lockdown Period" at  graph 0.45, 0.45 center
plot "SanFrancisco_covid19.csv" using 1:(column(2)*100e3/881549) w lines title "San Francisco County Cases" lw 3, \
     "SanFrancisco_covid19.csv" using 1:(column(3)*100e3/881549) w lines title "San Francisco County Deaths" lw 3

currentplot=8
set arrow 1 from "4/1/20", graph 0.5 to "5/15/20", graph 0.5 heads size screen 0.01,90 ls -1
set label 1 "Lockdown Period" at  graph 0.45, 0.45 center
plot "Tulare_covid19.csv" using 1:(column(2)*100e3/446195) w lines title "Tulare County Cases" lw 3, \
     "Tulare_covid19.csv" using 1:(column(3)*100e3/446195) w lines title "Tulare County Deaths" lw 3

currentplot=9
set arrow 1 from "4/1/20", graph 0.5 to "5/15/20", graph 0.5 heads size screen 0.01,90 ls -1
set label 1 "Lockdown Period" at  graph 0.45, 0.45 center
plot "Ventura_covid19.csv" using 1:(column(2)*100e3/846006) w lines title "Ventura County Cases" lw 3, \
     "Ventura_covid19.csv" using 1:(column(3)*100e3/846006) w lines title "Ventura County Deaths" lw 3

GnuPlotCommands

gnuplot  <<- GnuPlotCommands
set term png size 1920, 1024
set output "State_Case_Density.png"
set key left top
set term png
set multiplot layout 3,3 title "Cases / 100K"
set datafile separator ","
set xdata time
set timefmt "%m/%d/%y"
set format x "%m/%d"
set grid
set xrange ["4/1/20":*]

currentplot=1
set arrow 1 from "4/1/20", graph 0.5 to "5/15/20", graph 0.5 heads size screen 0.01,90 ls -1
set label 1 "Lockdown Period" at  graph 0.45, 0.45 center
plot "Arizona_covid19.csv" using 1:(column(2)*100e3/7278717) w lines title "Arizona Cases" lw 3, \
     "Arizona_covid19.csv" using 1:(column(3)*100e3/7278717) w lines title "Arizona Deaths" lw 3

currentplot=2
set arrow 1 from "4/1/20", graph 0.5 to "5/15/20", graph 0.5 heads size screen 0.01,90 ls -1
plot "California_covid19.csv" using 1:(column(2)*100e3/39512223) w lines title "California Cases" lw 3, \
     "California_covid19.csv" using 1:(column(3)*100e3/39512223) w lines title "California Deaths" lw 3

currentplot=3
set arrow 1 from "4/1/20", graph 0.5 to "4/27/20", graph 0.5 heads size screen 0.01,90 ls -1
plot "Colorado_covid19.csv" using 1:(column(2)*100e3/5758736) w lines title "Colorado Cases" lw 3, \
     "Colorado_covid19.csv" using 1:(column(3)*100e3/5758736) w lines title "Colorado Deaths" lw 3

currentplot=4
set arrow 1 from "4/1/20", graph 0.5 to "4/30/20", graph 0.5 heads size screen 0.01,90 ls -1
plot "Florida_covid19.csv" using 1:(column(2)*100e3/21477737) w lines title "Florida Cases" lw 3, \
     "Florida_covid19.csv" using 1:(column(3)*100e3/21477737) w lines title "Florida Deaths" lw 3

currentplot=5
set arrow 1 from "4/1/20", graph 0.5 to "4/30/20", graph 0.5 heads size screen 0.01,90 ls -1
plot "Georgia_covid19.csv" using 1:(column(2)*100e3/10617423) w lines title "Georgia Cases" lw 3, \
     "Georgia_covid19.csv" using 1:(column(3)*100e3/10617423) w lines title "Georgia Deaths" lw 3

currentplot=6
unset arrow 1
set label 1 "No Lockdown" at  graph 0.45, 0.45 center
plot "SouthDakota_covid19.csv" using 1:(column(2)*100e3/884659) w lines title "South Dakota Cases" lw 3, \
     "SouthDakota_covid19.csv" using 1:(column(3)*100e3/884659) w lines title "South Dakota Deaths" lw 3

currentplot=7
set arrow 1 from "4/1/20", graph 0.5 to "5/7/20", graph 0.5 heads size screen 0.01,90 ls -1
set label 1 "Lockdown Period" at  graph 0.45, 0.45 center
plot "NewYork_covid19.csv" using 1:(column(2)*100e3/19504000) w lines title "New York Cases" lw 3, \
     "NewYork_covid19.csv" using 1:(column(3)*100e3/19504000) w lines title "New York Deaths" lw 3

currentplot=8
set arrow 1 from "4/1/20", graph 0.5 to "4/30/20", graph 0.5 heads size screen 0.01,90 ls -1
plot "Texas_covid19.csv" using 1:(column(2)*100e3/28995881) w lines title "Texas Cases" lw 3, \
     "Texas_covid19.csv" using 1:(column(3)*100e3/28995881) w lines title "Texas Deaths" lw 3
GnuPlotCommands

gnuplot  <<- GnuPlotCommands
set term png size 1920, 1024
set output "World_Case_Density.png"
set key left top
set term png
set title "World"
set datafile separator ","
set xdata time
set timefmt "%m/%d/%y"
set format x "%m/%d"
set grid
set xrange ["4/1/20":*]

plot "World_covid19.csv" using 1:(column(2)*100e3/7.8e9) w lines title "Cases / 100K" lw 3, \
     "World_covid19.csv" using 1:(column(3)*100e3/7.8e9) w lines title "Deaths / 100K" lw 3
GnuPlotCommands

gnuplot  <<- GnuPlotCommands
set term png size 1920, 1024
set output "US_Case_Density.png"
set key left top
set term png
set title "US"
set datafile separator ","
set xdata time
set timefmt "%m/%d/%y"
set format x "%m/%d"
set grid
set xrange ["3/1/20":*]

plot "US_covid19.csv" using 1:(column(2)*100e3/328.2e6) w lines title "Cases / 100K" lw 3, \
     "US_covid19.csv" using 1:(column(3)*100e3/328.2e6) w lines title "Deaths / 100K" lw 3
GnuPlotCommands
