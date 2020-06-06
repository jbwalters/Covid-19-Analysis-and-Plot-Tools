# Covid-19-Analysis-and-Plot-Tools

The purpose of this set of tools is to produce plots of the time series Covid-19 data pulled from the https://github.com/CSSEGISandData/COVID-19 repository. The tools run under Linux.

The following types of plots are produced:
* Total Cumulative Cases
* Total Cumulative Deaths
* 7-Day Average Number of New Cases per Day
* Cases per 100,000
* Deaths per 100,000

Plots are produced for the World, for a user defined set of countries, states and counties.

The following tools are needed for the scripts to function:
* Gnuplot
* Awk
* Sed
* Wget
* Grep
* Csvtool

Installation
1. Create a directory for this toolset.
2. Place all the files into the directory.
3. Change into the directory and run the command ./update_and_plot.sh
The scripts will download the latest data from the JHU/APL Covid-19 repository on Github, extract the data to a subfolder and the process the data.
A number of individual .CSV files will be created that will be used for the plotting routines. The content of the .CSV files is as follows:

The intermediate CSV file data is organized in columns, with the following information:

Column 1: Date
Column 2: Total Cases
Column 3: Total Deaths
Column 4: Total Recovered
Column 5: New Cases
Column 6: New Deaths
Column 7: New Recovered
Column 8: 7 Day Average of New Cases per Day
Column 9: 7 Day Average of New Deaths per Day

The plotting routines are:

plotresults.sh
This plots the total number of cases and deaths.

Plot7DayAvg.sh
Plots the running 7-Day Average of New Cases.

PlotCaseDensity.sh
Plots the number of cases and deaths per 100,000 population.
The population of the specific regions to be plotted are embedded within the plot script.

