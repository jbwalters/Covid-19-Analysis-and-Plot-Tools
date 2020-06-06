#!/bin/bash

#
# Script for the plotting of Covid-19
#

#
# Plot World
#



DATESTRING=$(date +%D)

COUNTRIES=(
  "World"
	"US"
	"Italy"
	"France"
	"Germany"
	"Japan"
	"Germany"
  "Sweden"
	)


STATES=(
	"Alabama"
	"Alaska"
	"Arizona"
	"Arkansas"
	"California"
	"Colorado"
	"Connecticut"
	"Delaware"
	"Florida"
	"Georgia"
	"Hawaii"
	"Idaho"
	"Illinois"
	"Indiana"
  "Iowa"
	"Kansas"
	"Louisiana"
	"Maine"
	"Maryland"
	"Massachusetts"
	"Michigan"
	"Minnesota"
	"Mississippi"
	"Missouri"
	"Montana"
	"Nebraska"
	"Nevada"
	"New Hampshire"
	"New Jersey"
	"New Mexico"
	"New York"
	"North Carolina"
	"North Dakota"
	"Ohio"
	"Oklahoma"
	"Oregon"
	"Pennsylvania"
	"Rhode Island"
	"South Carolina"
	"South Dakota"
	"Tennessee"
	"Texas"
	"Utah"
	"Vermont"
	"Virginia"
	"Washington"
	"West Virginia"
	"Wisconsin"
	"Wyoming"
	)

gnuplot  <<- GnuPlotCommands
set term png size 1920, 1024
set output "Country_Cases.png"
set key left top
set term png
set multiplot layout 3,3 title "Total Cases"
set datafile separator ","
set xdata time
set timefmt "%m/%d/%y"
set format x "%m/%d"
set grid
set xrange ["4/1/20":*]
currentplot=1
set arrow 1 from "4/1/20", graph 0.5 to "5/15/20", graph 0.5 heads size screen 0.01,90 ls -1
set label 1 "Some State Lockdowns" at  graph 0.45, 0.45 center
plot "US_covid19.csv" using 1:2 w lines title "US" lw 3
currentplot=2
set arrow 1 from "4/1/20", graph 0.5 to "5/3/20", graph 0.5 heads size screen 0.01,90 ls -1
set label 1 "Lockdown Period" at  graph 0.45, 0.45 center
plot "Italy_covid19.csv" using 1:2 w lines title "Italy" lw 3
currentplot=3
set arrow 1 from "4/1/20", graph 0.5 to "5/11/20", graph 0.5 heads size screen 0.01,90 ls -1
set label 1 "Lockdown Period" at  graph 0.45, 0.45 center
plot "France_covid19.csv" using 1:2 w lines title "France" lw 3
currentplot=4
set arrow 1 from "4/1/20", graph 0.5 to "5/10/20", graph 0.5 heads size screen 0.01,90 ls -1
set label 1 "Lockdown Period" at  graph 0.45, 0.45 center
plot "Germany_covid19.csv" using 1:2 w lines title "Germany" lw 3
currentplot=5
unset arrow 1
set label 1 "No Lockdown" at  graph 0.45, 0.45 center
plot "Japan_covid19.csv" using 1:2 w lines title "Japan" lw 3
currentplot=6
set label 1 "No Lockdown" at  graph 0.45, 0.45 center
plot "korea_covid19.csv" using 1:2 w lines title "Korea" lw 3
currentplot=7
set label 1 "No Lockdown" at  graph 0.45, 0.45 center
plot "Sweden_covid19.csv" using 1:2 w lines title "Sweden" lw 3
currentplot=8
set arrow 1 from "4/1/20", graph 0.5 to "5/15/20", graph 0.5 heads size screen 0.01,90 ls -1
set label 1 "Lockdown Period" at  graph 0.45, 0.45 center
plot "unitedkingdom_covid19.csv" using 1:2 w lines title "UK" lw 3
GnuPlotCommands



gnuplot  <<- GnuPlotCommands
set term png size 1920, 1024
set output "Country_7DayAvg.png"
set key left top
set term png
set multiplot layout 3,3 title "New Case 7 Day Avg"
set datafile separator ","
set xdata time
set timefmt "%m/%d/%y"
set format x "%m/%d"
set grid
set xrange ["4/1/20":*]
currentplot=1
set arrow 1 from "4/1/20", graph 0.5 to "5/15/20", graph 0.5 heads size screen 0.01,90 ls -1
set label 1 "Some State Lockdowns" at  graph 0.45, 0.45 center
plot "US_covid19.csv" using 1:8 w lines title "US" lw 3
currentplot=2
set arrow 1 from "4/1/20", graph 0.5 to "5/3/20", graph 0.5 heads size screen 0.01,90 ls -1
set label 1 "Lockdown Period" at  graph 0.45, 0.45 center
plot "Italy_covid19.csv" using 1:8 w lines title "Italy" lw 3
currentplot=3
set arrow 1 from "4/1/20", graph 0.5 to "5/11/20", graph 0.5 heads size screen 0.01,90 ls -1
set label 1 "Lockdown Period" at  graph 0.45, 0.45 center
plot "France_covid19.csv" using 1:8 w lines title "France" lw 3
currentplot=4
set arrow 1 from "4/1/20", graph 0.5 to "5/10/20", graph 0.5 heads size screen 0.01,90 ls -1
set label 1 "Lockdown Period" at  graph 0.45, 0.45 center
plot "Germany_covid19.csv" using 1:8 w lines title "Germany" lw 3
currentplot=5
unset arrow 1
set label 1 "No Lockdown" at  graph 0.45, 0.45 center
plot "Japan_covid19.csv" using 1:8 w lines title "Japan" lw 3
currentplot=6
set label 1 "No Lockdown" at  graph 0.45, 0.45 center
plot "korea_covid19.csv" using 1:8 w lines title "Korea" lw 3
currentplot=7
set label 1 "No Lockdown" at  graph 0.45, 0.45 center
plot "Sweden_covid19.csv" using 1:8 w lines title "Sweden" lw 3
currentplot=8
set arrow 1 from "4/1/20", graph 0.5 to "5/15/20", graph 0.5 heads size screen 0.01,90 ls -1
set label 1 "Lockdown Period" at  graph 0.45, 0.45 center
plot "unitedkingdom_covid19.csv" using 1:8 w lines title "UK" lw 3
GnuPlotCommands

gnuplot  <<- GnuPlotCommands
set term png size 1920, 1024
set output "State_7DayAvg.png"
set key left top
set term png
set multiplot layout 3,3 title "New Cases-per-Day 7 Day Avg"
set datafile separator ","
set xdata time
set timefmt "%m/%d/%y"
set format x "%m/%d"
set grid
set xrange ["4/1/20":*]
currentplot=1
set arrow 1 from "4/1/20", graph 0.5 to "5/15/20", graph 0.5 heads size screen 0.01,90 ls -1
set label 1 "Lockdown Period" at  graph 0.45, 0.45 center
plot "Arizona_covid19.csv" using 1:8 w lines title "Arizona" lw 3
currentplot=2
set arrow 1 from "4/1/20", graph 0.5 to "5/15/20", graph 0.5 heads size screen 0.01,90 ls -1
plot "California_covid19.csv" using 1:8 w lines title "California" lw 3
currentplot=3
set arrow 1 from "4/1/20", graph 0.5 to "4/27/20", graph 0.5 heads size screen 0.01,90 ls -1
plot "Colorado_covid19.csv" using 1:8 w lines title "Colorado" lw 3
currentplot=4
set arrow 1 from "4/1/20", graph 0.5 to "4/30/20", graph 0.5 heads size screen 0.01,90 ls -1
plot "Florida_covid19.csv" using 1:8 w lines title "Florida" lw 3
currentplot=5
set arrow 1 from "4/1/20", graph 0.5 to "4/30/20", graph 0.5 heads size screen 0.01,90 ls -1
plot "Georgia_covid19.csv" using 1:8 w lines title "Georgia" lw 3
currentplot=6
unset arrow 1
set label 1 "No Lockdown" at  graph 0.45, 0.45 center
plot "SouthDakota_covid19.csv" using 1:8 w lines title "South Dakota" lw 3
currentplot=7
set arrow 1 from "4/1/20", graph 0.5 to "5/7/20", graph 0.5 heads size screen 0.01,90 ls -1
set label 1 "Lockdown Period" at  graph 0.45, 0.45 center
plot "NewYork_covid19.csv" using 1:8 w lines title "New York" lw 3
currentplot=8
set arrow 1 from "4/1/20", graph 0.5 to "4/30/20", graph 0.5 heads size screen 0.01,90 ls -1
plot "Texas_covid19.csv" using 1:8 w lines title "Texas" lw 3

GnuPlotCommands

gnuplot  <<- GnuPlotCommands
set term png size 1920, 1024
set output "County_7DayAvg.png"
set key left top
set term png
set multiplot layout 3,3 title "New Cases-per-Day 7 Day Avg"
set datafile separator ","
set xdata time
set timefmt "%m/%d/%y"
set format x "%m/%d"
set grid
set xrange ["4/1/20":*]
currentplot=1
set arrow 1 from "4/1/20", graph 0.5 to "5/7/20", graph 0.5 heads size screen 0.01,90 ls -1
set label 1 "Lockdown Period" at  graph 0.45, 0.45 center
plot "Fresno_covid19.csv" using 1:8 w lines title "Fresno" lw 3
currentplot=2
set arrow 1 from "4/1/20", graph 0.5 to "5/7/20", graph 0.5 heads size screen 0.01,90 ls -1
set label 1 "Lockdown Period" at  graph 0.45, 0.45 center
plot "Inyo_covid19.csv" using 1:8 w lines title "Inyo" lw 3
currentplot=3
set arrow 1 from "4/1/20", graph 0.5 to "5/7/20", graph 0.5 heads size screen 0.01,90 ls -1
set label 1 "Lockdown Period" at  graph 0.45, 0.45 center
plot "Kern_covid19.csv" using 1:8 w lines title "Kern" lw 3
currentplot=4
set arrow 1 from "4/1/20", graph 0.5 to "5/7/20", graph 0.5 heads size screen 0.01,90 ls -1
set label 1 "Lockdown Period" at  graph 0.45, 0.45 center
plot "LosAngeles_covid19.csv" using 1:8 w lines title "Los Angeles" lw 3
currentplot=5
set arrow 1 from "4/1/20", graph 0.5 to "5/7/20", graph 0.5 heads size screen 0.01,90 ls -1
set label 1 "Lockdown Period" at  graph 0.45, 0.45 center
plot "Sacramento_covid19.csv" using 1:8 w lines title "Sacramento" lw 3
currentplot=6
set arrow 1 from "4/1/20", graph 0.5 to "5/7/20", graph 0.5 heads size screen 0.01,90 ls -1
set label 1 "Lockdown Period" at  graph 0.45, 0.45 center
plot "SanDiego_covid19.csv" using 1:8 w lines title "San Diego" lw 3
currentplot=7
set arrow 1 from "4/1/20", graph 0.5 to "5/7/20", graph 0.5 heads size screen 0.01,90 ls -1
set label 1 "Lockdown Period" at  graph 0.45, 0.45 center
plot "SanFrancisco_covid19.csv" using 1:8 w lines title "San Francisco" lw 3
currentplot=8
set arrow 1 from "4/1/20", graph 0.5 to "5/7/20", graph 0.5 heads size screen 0.01,90 ls -1
set label 1 "Lockdown Period" at  graph 0.45, 0.45 center
plot "Tulare_covid19.csv" using 1:8 w lines title "Tulare" lw 3
currentplot=9
set arrow 1 from "4/1/20", graph 0.5 to "5/7/20", graph 0.5 heads size screen 0.01,90 ls -1
set label 1 "Lockdown Period" at  graph 0.45, 0.45 center
plot "Ventura_covid19.csv" using 1:8 w lines title "Ventura" lw 3
GnuPlotCommands

gnuplot  <<- GnuPlotCommands
set term png size 1920, 1024
set output "County_Comparisons.png"
set key left top
set term png
set multiplot layout 3,3 title "Total Cases"
set datafile separator ","
set xdata time
set timefmt "%m/%d/%y"
set format x "%m/%d"
set grid
set xrange ["4/1/20":*]
currentplot=1
set arrow 1 from "4/1/20", graph 0.5 to "5/7/20", graph 0.5 heads size screen 0.01,90 ls -1
set label 1 "Lockdown Period" at  graph 0.45, 0.45 center
plot "Fresno_covid19.csv" using 1:2 w lines title "Fresno" lw 3
currentplot=2
set arrow 1 from "4/1/20", graph 0.5 to "5/7/20", graph 0.5 heads size screen 0.01,90 ls -1
set label 1 "Lockdown Period" at  graph 0.45, 0.45 center
plot "Inyo_covid19.csv" using 1:2 w lines title "Inyo" lw 3
currentplot=3
set arrow 1 from "4/1/20", graph 0.5 to "5/7/20", graph 0.5 heads size screen 0.01,90 ls -1
set label 1 "Lockdown Period" at  graph 0.45, 0.45 center
plot "Kern_covid19.csv" using 1:2 w lines title "Kern" lw 3
currentplot=4
set arrow 1 from "4/1/20", graph 0.5 to "5/7/20", graph 0.5 heads size screen 0.01,90 ls -1
set label 1 "Lockdown Period" at  graph 0.45, 0.45 center
plot "LosAngeles_covid19.csv" using 1:2 w lines title "Los Angeles" lw 3
currentplot=5
set arrow 1 from "4/1/20", graph 0.5 to "5/7/20", graph 0.5 heads size screen 0.01,90 ls -1
set label 1 "Lockdown Period" at  graph 0.45, 0.45 center
plot "Sacramento_covid19.csv" using 1:2 w lines title "Sacramento" lw 3
currentplot=6
set arrow 1 from "4/1/20", graph 0.5 to "5/7/20", graph 0.5 heads size screen 0.01,90 ls -1
set label 1 "Lockdown Period" at  graph 0.45, 0.45 center
plot "SanDiego_covid19.csv" using 1:2 w lines title "San Diego" lw 3
currentplot=7
set arrow 1 from "4/1/20", graph 0.5 to "5/7/20", graph 0.5 heads size screen 0.01,90 ls -1
set label 1 "Lockdown Period" at  graph 0.45, 0.45 center
plot "SanFrancisco_covid19.csv" using 1:2 w lines title "San Francisco" lw 3
currentplot=8
set arrow 1 from "4/1/20", graph 0.5 to "5/7/20", graph 0.5 heads size screen 0.01,90 ls -1
set label 1 "Lockdown Period" at  graph 0.45, 0.45 center
plot "Tulare_covid19.csv" using 1:2 w lines title "Tulare" lw 3
currentplot=9
set arrow 1 from "4/1/20", graph 0.5 to "5/7/20", graph 0.5 heads size screen 0.01,90 ls -1
set label 1 "Lockdown Period" at  graph 0.45, 0.45 center
plot "Ventura_covid19.csv" using 1:2 w lines title "Ventura" lw 3
GnuPlotCommands

gnuplot  <<- GnuPlotCommands
set term png size 1920, 1024
set output "State_Cases.png"
set key left top
set term png
set multiplot layout 3,3 title "Total Cases"
set datafile separator ","
set xdata time
set timefmt "%m/%d/%y"
set format x "%m/%d"
set grid
set xrange ["4/1/20":*]
currentplot=1
set arrow 1 from "4/1/20", graph 0.5 to "5/15/20", graph 0.5 heads size screen 0.01,90 ls -1
set label 1 "Lockdown Period" at  graph 0.45, 0.45 center
plot "Arizona_covid19.csv" using 1:2 w lines title "Arizona" lw 3
currentplot=2
set arrow 1 from "4/1/20", graph 0.5 to "5/15/20", graph 0.5 heads size screen 0.01,90 ls -1
set label 1 "Lockdown Period" at  graph 0.45, 0.45 center
plot "California_covid19.csv" using 1:2 w lines title "California" lw 3
currentplot=3
set arrow 1 from "4/1/20", graph 0.5 to "4/27/20", graph 0.5 heads size screen 0.01,90 ls -1
set label 1 "Lockdown Period" at  graph 0.45, 0.45 center
plot "Colorado_covid19.csv" using 1:2 w lines title "Colorado" lw 3
currentplot=4
set arrow 1 from "4/1/20", graph 0.5 to "4/30/20", graph 0.5 heads size screen 0.01,90 ls -1
set label 1 "Lockdown Period" at  graph 0.45, 0.45 center
plot "Florida_covid19.csv" using 1:2 w lines title "Florida" lw 3
currentplot=5
set arrow 1 from "4/1/20", graph 0.5 to "4/30/20", graph 0.5 heads size screen 0.01,90 ls -1
set label 1 "Lockdown Period" at  graph 0.45, 0.45 center
plot "Georgia_covid19.csv" using 1:2 w lines title "Georgia" lw 3
currentplot=6
unset arrow 1
set label 1 "No Lockdown" at  graph 0.45, 0.45 center
set label 1 "Lockdown Period" at  graph 0.45, 0.45 center
plot "SouthDakota_covid19.csv" using 1:2 w lines title "South Dakota" lw 3
currentplot=7
set arrow 1 from "4/1/20", graph 0.5 to "5/7/20", graph 0.5 heads size screen 0.01,90 ls -1
set label 1 "Lockdown Period" at  graph 0.45, 0.45 center
plot "NewYork_covid19.csv" using 1:2 w lines title "New York" lw 3
currentplot=8
set arrow 1 from "4/1/20", graph 0.5 to "4/30/20", graph 0.5 heads size screen 0.01,90 ls -1
set label 1 "Lockdown Period" at  graph 0.45, 0.45 center
plot "Texas_covid19.csv" using 1:2 w lines title "Texas" lw 3
GnuPlotCommands
