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
  "korea"
  "Russia"
  "Sweden"
	)

for i in "${COUNTRIES[@]}"; do

COUNTRY=$i
SUFFIX="_covid19.csv"
INPUTFILE=$(echo $COUNTRY$SUFFIX | tr -d ' ')
MULTI_PLOT_SUFFIX="_Mutiplot.png"
LINEAR_OUTPUT_SUFFIX="_Linear.png"
LOG_OUTPUT_SUFFIX="_Log.png"
NEWCASES_OUTPUT_SUFFIX="_New.png"
LIN_OUT_PLOT=$COUNTRY$LINEAR_OUTPUT_SUFFIX
LOG_OUT_PLOT=$COUNTRY$LOG_OUTPUT_SUFFIX
MULTI_PLOT_OUT=$COUNTRY$MULTI_PLOT_SUFFIX
NEW_PLOT_OUT=$COUNTRY$NEWCASES_OUTPUT_SUFFIX

gnuplot  <<- GnuPlotCommands
set terminal pngcairo size 400,400
set output "${MULTI_PLOT_OUT}"
set key left top
set term png
set multiplot layout 2,1 title "${COUNTRY} ${DATESTRING}"
set datafile separator ","
set xdata time
set timefmt "%m/%d/%y"
set format x "%m/%d"
set xtics format "%b %d"
set xrange ["4/1/20":*]
currentplot = 1
plot "${INPUTFILE}" using 1:2 w lines title "Cases" lw 3, \
"${INPUTFILE}" using 1:3 w lines title "Deaths" lw 3, \
"${INPUTFILE}" using 1:4 w lines title "Recoveries" lw 3
currentplot=2
set logscale y
plot "${INPUTFILE}" using 1:2 w lines title "Cases" lw 3, \
"${INPUTFILE}" using 1:3 w lines title "Deaths" lw 3, \
"${INPUTFILE}" using 1:4 w lines title "Recoveries" lw 3
GnuPlotCommands

gnuplot  <<- GnuPlotCommands
set terminal pngcairo size 400,400
set output "${NEW_PLOT_OUT}"
set key left top
set term png
set multiplot layout 2,1 title "${COUNTRY}  ${DATESTRING}"
set datafile separator ","
set xdata time
set timefmt "%m/%d/%y"
set format x "%m/%d"
set xtics format "%b %d"
set xrange ["4/1/20":*]
currentplot = 1
plot "${INPUTFILE}" using 1:5 w points title "New Cases" lw 3, \
"${INPUTFILE}" using 1:6 w points title "New Deaths" lw 3, \
"${INPUTFILE}" using 1:7 w points title "New Recoveries" lw 3
currentplot=2
set logscale y
plot "${INPUTFILE}" using 1:5 w points title "New Cases" lw 3, \
"${INPUTFILE}" using 1:6 w points title "New Deaths" lw 3, \
"${INPUTFILE}" using 1:7 w points title "New Recoveries" lw 3
GnuPlotCommands


done

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

for i in "${STATES[@]}"; do

STATE=$i
SUFFIX="_covid19.csv"
INPUTFILE=$(echo $STATE$SUFFIX | tr -d ' ')
MULTI_PLOT_SUFFIX="_Mutiplot.png"
LINEAR_OUTPUT_SUFFIX="_Linear.png"
LOG_OUTPUT_SUFFIX="_Log.png"
LIN_OUT_PLOT=$STATE$LINEAR_OUTPUT_SUFFIX
LOG_OUT_PLOT=$STATE$LOG_OUTPUT_SUFFIX
MULTI_PLOT_OUT=$STATE$MULTI_PLOT_SUFFIX
NEW_PLOT_OUT=$STATE$NEWCASES_OUTPUT_SUFFIX


gnuplot  <<- GnuPlotCommands
set terminal pngcairo size 400,400
set output "${MULTI_PLOT_OUT}"
set key left top
set term png
set multiplot layout 2,1 title "${STATE}  ${DATESTRING}"
set datafile separator ","
set xdata time
set timefmt "%m/%d/%y"
set format x "%m/%d"
set xtics format "%b %d"
set xrange ["4/1/20":*]
plot "${INPUTFILE}" using 1:2 w lines title "Cases" lw 3, \
"${INPUTFILE}" using 1:3 w lines title "Deaths" lw 3
currentplot=2
set logscale y
plot "${INPUTFILE}" using 1:2 w lines title "Cases" lw 3, \
"${INPUTFILE}" using 1:3 w lines title "Deaths" lw 3
GnuPlotCommands

gnuplot  <<- GnuPlotCommands
set terminal pngcairo size 400,400
set output "${NEW_PLOT_OUT}"
set key left top
set term png
set multiplot layout 2,1 title "${STATE}  ${DATESTRING}"
set datafile separator ","
set xdata time
set timefmt "%m/%d/%y"
set format x "%m/%d"
set xtics format "%b %d"
set xrange ["4/1/20":*]
currentplot = 1
plot "${INPUTFILE}" using 1:5 w points title "New Cases" lw 3, \
"${INPUTFILE}" using 1:6 w points title "New Deaths" lw 3
currentplot=2
set logscale y
plot "${INPUTFILE}" using 1:5 w points title "New Cases" lw 3, \
"${INPUTFILE}" using 1:6 w points title "New Deaths" lw 3
GnuPlotCommands


done


COUNTIES=(
  "Kern"
  "Inyo"
  "Tulare"
  "Fresno"
  "Los Angeles"
  "Ventura"
  "Santa Barbara"
  "San Luis Obispo"
  "Riverside"
  "Orange"
  "San Diego"
  "Imperial"
  "Kings"
  "Monterey"
  "San Benito"
  "Madera"
  "Merced"
  "Santa Cruz"
  "Santa Clara"
  "San Mateo"
  "San Francisco"
  "Sacramento"
	)


for i in "${COUNTIES[@]}"; do

COUNTY=$i
SUFFIX="_covid19.csv"
INPUTFILE=$(echo $COUNTY$SUFFIX | tr -d ' ')
MULTI_PLOT_SUFFIX="_Mutiplot.png"
LINEAR_OUTPUT_SUFFIX="_Linear.png"
LOG_OUTPUT_SUFFIX="_Log.png"
LIN_OUT_PLOT=$COUNTY$LINEAR_OUTPUT_SUFFIX
LOG_OUT_PLOT=$COUNTY$LOG_OUTPUT_SUFFIX
MULTI_PLOT_OUT=$COUNTY$MULTI_PLOT_SUFFIX
NEW_PLOT_OUT=$COUNTY$NEWCASES_OUTPUT_SUFFIX


gnuplot  <<- GnuPlotCommands
set terminal pngcairo size 400,400
set output "${MULTI_PLOT_OUT}"
set key left top
set term png
set multiplot layout 2,1 title "${COUNTY}  ${DATESTRING}"
set datafile separator ","
set xdata time
set timefmt "%m/%d/%y"
set format x "%m/%d"
set xtics format "%b %d"
set xrange ["4/1/20":*]
plot "${INPUTFILE}" using 1:2 w lines title "Cases" lw 3, \
"${INPUTFILE}" using 1:3 w lines title "Deaths" lw 3
currentplot=2
set logscale y
plot "${INPUTFILE}" using 1:2 w lines title "Cases" lw 3, \
"${INPUTFILE}" using 1:3 w lines title "Deaths" lw 3
GnuPlotCommands

gnuplot  <<- GnuPlotCommands
set terminal pngcairo size 400,400
set output "${NEW_PLOT_OUT}"
set key left top
set term png
set multiplot layout 2,1 title "${COUNTY}  ${DATESTRING}"
set datafile separator ","
set xdata time
set timefmt "%m/%d/%y"
set format x "%m/%d"
set xtics format "%b %d"
set xrange ["4/1/20":*]
currentplot = 1
plot "${INPUTFILE}" using 1:5 w points title "New Cases" lw 3, \
"${INPUTFILE}" using 1:6 w points title "New Deaths" lw 3
currentplot=2
set logscale y
plot "${INPUTFILE}" using 1:5 w points title "New Cases" lw 3, \
"${INPUTFILE}" using 1:6 w points title "New Deaths" lw 3
GnuPlotCommands

done

# World, US, Italy Cases

gnuplot  <<- GnuPlotCommands
set output "Country_Comparison_Linear.png"
set key left top
set term png
set term png
set datafile separator ","
set xdata time
set timefmt "%m/%d/%y"
set format x "%m/%d"
set xtics format "%b %d"
set xrange ["4/1/20":*]
set title "Countries Total Case Comparison ${DATESTRING}"
plot "World_covid19.csv" using 1:2 w lines title "World" lw 3, \
"US_covid19.csv" using 1:2 w lines title "US" lw 3, \
"Italy_covid19.csv" using 1:2 w lines title "Italy" lw 3, \
"Germany_covid19.csv" using 1:2 w lines title "Germany" lw 3, \
"unitedkingdom_covid19.csv" using 1:2 w lines title "UK" lw 3
GnuPlotCommands

gnuplot  <<- GnuPlotCommands
set output "Country_Comparison_Log.png"
set key left top
set term png
set term png
set datafile separator ","
set xdata time
set timefmt "%m/%d/%y"
set format x "%m/%d"
set xtics format "%b %d"
set xrange ["4/1/20":"4/12/20"]
set title "Countries Total Case Comparison ${DATESTRING}"
set logscale y
plot "World_covid19.csv" using 1:2 w lines title "World" lw 3, \
"US_covid19.csv" using 1:2 w lines title "US" lw 3, \
"Italy_covid19.csv" using 1:2 w lines title "Italy" lw 3, \
"Germany_covid19.csv" using 1:2 w lines title "Germany" lw 3, \
"unitedkingdom_covid19.csv" using 1:2 w lines title "UK" lw 3
GnuPlotCommands

gnuplot  <<- GnuPlotCommands
set output "Country_Deaths_Linear.png"
set key left top
set term png
set term png
set datafile separator ","
set xdata time
set timefmt "%m/%d/%y"
set format x "%m/%d"
set xtics format "%b %d"
set xrange ["4/1/20":*]
set title "Countries Total Deaths Comparison ${DATESTRING}"
plot "World_covid19.csv" using 1:3 w lines title "World" lw 3, \
"US_covid19.csv" using 1:3 w lines title "US" lw 3, \
"Italy_covid19.csv" using 1:3 w lines title "Italy" lw 3, \
"Germany_covid19.csv" using 1:3 w lines title "Germany" lw 3, \
"unitedkingdom_covid19.csv" using 1:3 w lines title "UK" lw 3
GnuPlotCommands

gnuplot  <<- GnuPlotCommands
set output "Country_Deaths_Log.png"
set key left top
set term png
set term png
set datafile separator ","
set xdata time
set timefmt "%m/%d/%y"
set format x "%m/%d"
set xtics format "%b %d"
set xrange ["4/1/20":*]
set title "Countries Total Deaths Comparison ${DATESTRING}"
set logscale y
plot "World_covid19.csv" using 1:3 w lines title "World" lw 3, \
"US_covid19.csv" using 1:3 w lines title "US" lw 3, \
"Italy_covid19.csv" using 1:3 w lines title "Italy" lw 3, \
"Germany_covid19.csv" using 1:3 w lines title "Germany" lw 3, \
"unitedkingdom_covid19.csv" using 1:3 w lines title "UK" lw 3
GnuPlotCommands

#
# State Comparisons
#

gnuplot  <<- GnuPlotCommands
set output "States_Comparison_Linear.png"
set key left top
set term png
set term png
set datafile separator ","
set xdata time
set timefmt "%m/%d/%y"
set format x "%m/%d"
set xtics format "%b %d"
set xrange ["4/1/20":*]
set title "States Total Case Comparison ${DATESTRING}"
plot "Arizona_covid19.csv" using 1:2 w lines title "Arizona" lw 3, \
"California_covid19.csv" using 1:2 w lines title "California" lw 3, \
"Colorado_covid19.csv" using 1:2 w lines title "Colorado" lw 3, \
"Florida_covid19.csv" using 1:2 w lines title "Florida" lw 3, \
"NewYork_covid19.csv" using 1:2 w lines title "New York" lw 3, \
"SouthDakota_covid19.csv" using 1:2 w lines title "SouthDakota" lw 3, \
"Texas_covid19.csv" using 1:2 w lines title "Texas" lw 3
GnuPlotCommands

gnuplot  <<- GnuPlotCommands
set output "States_Comparison_Log.png"
set key left top
set term png
set term png
set datafile separator ","
set xdata time
set timefmt "%m/%d/%y"
set format x "%m/%d"
set xtics format "%b %d"
set xrange ["4/1/20":*]
set title "States Total Case Comparison ${DATESTRING}"
set logscale y
plot "Arizona_covid19.csv" using 1:2 w lines title "Arizona" lw 3, \
"California_covid19.csv" using 1:2 w lines title "California" lw 3, \
"Colorado_covid19.csv" using 1:2 w lines title "Colorado" lw 3, \
"Florida_covid19.csv" using 1:2 w lines title "Florida" lw 3, \
"NewYork_covid19.csv" using 1:2 w lines title "New York" lw 3, \
"SouthDakota_covid19.csv" using 1:2 w lines title "SouthDakota" lw 3, \
"Texas_covid19.csv" using 1:2 w lines title "Texas" lw 3
GnuPlotCommands

gnuplot  <<- GnuPlotCommands
set output "States_Deaths_Linear.png"
set key left top
set term png
set term png
set datafile separator ","
set xdata time
set timefmt "%m/%d/%y"
set format x "%m/%d"
set xtics format "%b %d"
set xrange ["4/1/20":*]
set title "States Total Deaths Comparison ${DATESTRING}"
plot "Arizona_covid19.csv" using 1:3 w lines title "Arizona" lw 3, \
"California_covid19.csv" using 1:3 w lines title "California" lw 3, \
"Colorado_covid19.csv" using 1:3 w lines title "Colorado" lw 3, \
"Florida_covid19.csv" using 1:3 w lines title "Florida" lw 3, \
"NewYork_covid19.csv" using 1:3 w lines title "New York" lw 3, \
"SouthDakota_covid19.csv" using 1:3 w lines title "SouthDakota" lw 3, \
"Texas_covid19.csv" using 1:3 w lines title "Texas" lw 3
GnuPlotCommands


gnuplot  <<- GnuPlotCommands
set output "States_Deaths_Log.png"
set key left top
set term png
set term png
set datafile separator ","
set xdata time
set timefmt "%m/%d/%y"
set format x "%m/%d"
set xtics format "%b %d"
set xrange ["4/1/20":*]
set title "States Total Deaths Comparison ${DATESTRING}"
set logscale y
plot "Arizona_covid19.csv" using 1:3 w lines title "Arizona" lw 3, \
"California_covid19.csv" using 1:3 w lines title "California" lw 3, \
"Colorado_covid19.csv" using 1:3 w lines title "Colorado" lw 3, \
"Florida_covid19.csv" using 1:3 w lines title "Florida" lw 3, \
"NewYork_covid19.csv" using 1:3 w lines title "New York" lw 3, \
"SouthDakota_covid19.csv" using 1:3 w lines title "SouthDakota" lw 3, \
"Texas_covid19.csv" using 1:3 w lines title "Texas" lw 3
GnuPlotCommands

gnuplot  <<- GnuPlotCommands
set output "County_Comparison_Log.png"
set key left top
set term png
set term png
set datafile separator ","
set xdata time
set timefmt "%m/%d/%y"
set format x "%m/%d"
set xtics format "%b %d"
set xrange ["4/1/20":*]
set title "County Total Case Comparison ${DATESTRING}"
set logscale y
plot "Kern_covid19.csv" using 1:2 w lines title "Kern" lw 3, \
"SanDiego_covid19.csv" using 1:2 w lines title "San Diego" lw 3, \
"LosAngeles_covid19.csv" using 1:2 w lines title "Los Angeles" lw 3, \
"Fresno_covid19.csv" using 1:2 w lines title "Fresno" lw 3, \
"SanFrancisco_covid19.csv" using 1:2 w lines title "San Francisco" lw 3, \
"Sacramento_covid19.csv" using 1:2 w lines title "Sacramento" lw 3
GnuPlotCommands

exit 0
