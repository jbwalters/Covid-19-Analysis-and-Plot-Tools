#
#!/bin/bash
#

rm *.csv
rm *.png
rm *.zip

rm -r ./COVID-19-master

wget https://github.com/CSSEGISandData/COVID-19/archive/master.zip

unzip ./master.zip

#	Clear the screen

clear

#
#   Copy the current time series data files to this directory
#

cp ./COVID-19-master/csse_covid_19_data/csse_covid_19_time_series/*.csv ./

# Extract the data header line

grep -i "Province/State" time_series_covid19_confirmed_global.csv > temp1.csv

# Remove data from columns 1, 3 and 4.

awk -f remove_records_1_3_4.awk temp1.csv > temp2.csv

# Remove empty fields

	sed -E ':l;s/,[[:blank:]]*,/,/;tl;s/^[[:blank:]]*,|,[[:blank:]]*$//g' temp2.csv >  dataheader.csv

# Define the list of countries

COUNTRIES=(
	"US"
	"Italy"
	"Germany"
	"Japan"
	"Germany"
	"Russia"
	"Sweden"
	)


for i in "${COUNTRIES[@]}"; do

	# Extract Total Case History to a temporary file

	COUNTRY=$i
	GREPSTRING=$COUNTRY
	SUFFIX="_covid19.csv"
	OUTPUTFILE=$(echo $COUNTRY$SUFFIX | tr -d ' ')

	# Extract the lines with the appropriate COUNTRY

	awk -F, -v string="$GREPSTRING" '$2==string' time_series_covid19_confirmed_global.csv > cases1.csv
	awk -F, -v string="$GREPSTRING" '$2==string' time_series_covid19_deaths_global.csv > deaths1.csv
	awk -F, -v string="$GREPSTRING" '$2==string' time_series_covid19_recovered_global.csv > recovered1.csv


	# Remove field 1, 3 and 4

	awk -f remove_records_1_3_4.awk cases1.csv > cases3.csv
	awk -f remove_records_1_3_4.awk deaths1.csv > deaths3.csv
	awk -f remove_records_1_3_4.awk recovered1.csv > recovered3.csv

	# Place the header in the $OUTPUTFILE

	cat dataheader.csv > countryoutput.csv

	# Remove empty fields from the data files, and append to the $OUTPUTFILE

	sed -E ':l;s/,[[:blank:]]*,/,/;tl;s/^[[:blank:]]*,|,[[:blank:]]*$//g' cases3.csv >>  countryoutput.csv
	sed -E ':l;s/,[[:blank:]]*,/,/;tl;s/^[[:blank:]]*,|,[[:blank:]]*$//g' deaths3.csv >>  countryoutput.csv
	sed -E ':l;s/,[[:blank:]]*,/,/;tl;s/^[[:blank:]]*,|,[[:blank:]]*$//g' recovered3.csv >>  countryoutput.csv

	csvtool transpose countryoutput.csv > temp.csv
	csvtool drop 1  temp.csv> temp2.csv
	awk -f AddColumns56789toCountry.awk temp2.csv > $OUTPUTFILE



done

#	Special cases

#	World
	COUNTRY="World"
	GREPSTRING=$COUNTRY
	SUFFIX="_covid19.csv"
	OUTPUTFILE=$(echo $COUNTRY$SUFFIX | tr -d ' ')

	# Extract the lines with the appropriate COUNTRY

	cp ./time_series_covid19_confirmed_global.csv  ./cases1.csv
	cp ./time_series_covid19_deaths_global.csv  ./deaths1.csv
	cp ./time_series_covid19_recovered_global.csv  ./recovered1.csv

	#
	# special case - process line 258
	#

	# Extract line 258 for individual processing
	awk -F, -v string="Bonaire" '$1 ~string {print $0}'  time_series_covid19_confirmed_global.csv > temp1.csv

	# Blank lines 1-5
	awk 'BEGIN{FS=","; OFS=","}{$1=$2=$3=$4=$5=""}{print $0}' temp1.csv > temp2.csv

	# Remove blank records
	sed -E ':l;s/,[[:blank:]]*,/,/;tl;s/^[[:blank:]]*,|,[[:blank:]]*$//g' temp2.csv >  line258.csv

	# Remove line 258 from the time_series_covid19_confirmed_global.csv
	awk -F, -v string="Bonaire" '$1 !~string{print $0}'  cases1.csv > cases2.csv
	awk -F, -v string="Bonaire" '$1 !~string{print $0}'  deaths1.csv > deaths2.csv
	awk -F, -v string="Bonaire" '$1 !~string{print $0}'  recovered1.csv > recovered2.csv

	# Blank lines 1-4
	awk 'BEGIN{FS=","; OFS=","}{$1=$2=$3=$4=""}{print $0}' cases2.csv > cases3.csv
	awk 'BEGIN{FS=","; OFS=","}{$1=$2=$3=$4=""}{print $0}' deaths2.csv > deaths3.csv
	awk 'BEGIN{FS=","; OFS=","}{$1=$2=$3=$4=""}{print $0}' recovered2.csv > recovered3.csv

	# Combine the intermediate files with line 258
	# Remove field 1, 2, 3 and 4

	awk -f remove_records_1_2_3_4.awk cases3.csv > cases4.csv
	awk -f remove_records_1_2_3_4.awk deaths3.csv > deaths4.csv
	awk -f remove_records_1_2_3_4.awk recovered3.csv > recovered4.csv

	# Remove empty fields from the data files, and append to the $OUTPUTFILE

	sed -E ':l;s/,[[:blank:]]*,/,/;tl;s/^[[:blank:]]*,|,[[:blank:]]*$//g' cases4.csv >  cases5.csv
	sed -E ':l;s/,[[:blank:]]*,/,/;tl;s/^[[:blank:]]*,|,[[:blank:]]*$//g' deaths4.csv >  deaths5.csv
	sed -E ':l;s/,[[:blank:]]*,/,/;tl;s/^[[:blank:]]*,|,[[:blank:]]*$//g' recovered4.csv >  recovered5.csv


	cat line258.csv >> cases5.csv
	cat line258.csv >> deaths5.csv
	cat line258.csv >> recovered5.csv


	# Sum the entries in the vertical columns

	awk -f sumcols_not_1.awk cases5.csv > cases6.csv
	awk -f sumcols_not_1.awk deaths5.csv > deaths6.csv
	awk -f sumcols_not_1.awk recovered5.csv > recovered6.csv


	# Place the header in the $OUTPUTFILE

	awk -f remove_records_1.awk dataheader.csv > temp7.csv
	sed -E ':l;s/,[[:blank:]]*,/,/;tl;s/^[[:blank:]]*,|,[[:blank:]]*$//g' temp7.csv >  countryoutput.csv

	cat cases6.csv >> countryoutput.csv
	cat deaths6.csv >> countryoutput.csv
	cat recovered6.csv >> countryoutput.csv

	csvtool transpose countryoutput.csv >  temp.csv
	awk -f AddColumns56789toCountry.awk temp.csv > $OUTPUTFILE

	# csvtool drop 1  temp.csv> temp2.csv

#	Australia
	COUNTRY="australia"
	GREPSTRING=$COUNTRY
	SUFFIX="_covid19.csv"
	OUTPUTFILE=$(echo $COUNTRY$SUFFIX | tr -d ' ')
	# Extract the lines with the appropriate COUNTRY
	grep -iw "australia" time_series_covid19_confirmed_global.csv > cases1.csv
	grep -iw "australia" time_series_covid19_deaths_global.csv > deaths1.csv
	grep -iw "australia" time_series_covid19_recovered_global.csv > recovered1.csv
	# Remove field 1, 3 and 4
	awk -f remove_records_1_3_4.awk cases1.csv > cases2.csv
	awk -f remove_records_1_3_4.awk deaths1.csv > deaths2.csv
	awk -f remove_records_1_3_4.awk recovered1.csv > recovered2.csv
	# Remove empty fields from the data files, and append to the $OUTPUTFILE
	sed -E ':l;s/,[[:blank:]]*,/,/;tl;s/^[[:blank:]]*,|,[[:blank:]]*$//g' cases2.csv >  cases3.csv
	sed -E ':l;s/,[[:blank:]]*,/,/;tl;s/^[[:blank:]]*,|,[[:blank:]]*$//g' deaths2.csv >  deaths3.csv
	sed -E ':l;s/,[[:blank:]]*,/,/;tl;s/^[[:blank:]]*,|,[[:blank:]]*$//g' recovered2.csv >  recovered3.csv
	# Sum the entries in the vertical columns
	awk -f sumcols_not_1.awk cases3.csv > cases4.csv
	awk -f sumcols_not_1.awk deaths3.csv > deaths4.csv
	awk -f sumcols_not_1.awk recovered3.csv > recovered4.csv


	# Place the header in the $OUTPUTFILE
	cat dataheader.csv > countryoutput.csv
	cat cases4.csv >> countryoutput.csv
	cat deaths4.csv >> countryoutput.csv
	cat recovered4.csv >> countryoutput.csv

	csvtool transpose countryoutput.csv >  temp.csv
	csvtool drop 1  temp.csv> temp2.csv
	awk -f AddColumns56789toCountry.awk temp2.csv > $OUTPUTFILE



 #	United Kingdom
 	COUNTRY="united kingdom"
 	GREPSTRING=$COUNTRY
 	SUFFIX="_covid19.csv"
 	OUTPUTFILE=$(echo $COUNTRY$SUFFIX | tr -d ' ')

 	# Extract the lines with the appropriate COUNTRY

 	grep -iw "united kingdom" time_series_covid19_confirmed_global.csv > cases1.csv
 	grep -iw "united kingdom" time_series_covid19_deaths_global.csv > deaths1.csv
 	grep -iw "united kingdom" time_series_covid19_recovered_global.csv > recovered1.csv

  awk -F, '$1==""' cases1.csv > cases2.csv
  awk -F, '$1==""' deaths1.csv > deaths2.csv
  awk -F, '$1==""' recovered1.csv > recovered2.csv

 	# Remove field 1, 3 and 4

 	awk -f remove_records_1_3_4.awk cases2.csv > cases3.csv
 	awk -f remove_records_1_3_4.awk deaths2.csv > deaths3.csv
 	awk -f remove_records_1_3_4.awk recovered2.csv > recovered3.csv

 	# Remove empty fields from the data files, and append to the $OUTPUTFILE

 	sed -E ':l;s/,[[:blank:]]*,/,/;tl;s/^[[:blank:]]*,|,[[:blank:]]*$//g' cases3.csv >  cases4.csv
 	sed -E ':l;s/,[[:blank:]]*,/,/;tl;s/^[[:blank:]]*,|,[[:blank:]]*$//g' deaths3.csv >  deaths4.csv
 	sed -E ':l;s/,[[:blank:]]*,/,/;tl;s/^[[:blank:]]*,|,[[:blank:]]*$//g' recovered3.csv >  recovered4.csv

 	# Place the header in the $OUTPUTFILE
 	cat dataheader.csv > countryoutput.csv
 	cat cases4.csv >> countryoutput.csv
 	cat deaths4.csv >> countryoutput.csv
 	cat recovered4.csv >> countryoutput.csv

	csvtool transpose countryoutput.csv > temp.csv
	csvtool drop 1  temp.csv> temp2.csv
	awk -f AddColumns56789toCountry.awk temp2.csv > $OUTPUTFILE


 #	France
 	COUNTRY="France"
 	GREPSTRING=$COUNTRY
 	SUFFIX="_covid19.csv"
 	OUTPUTFILE=$(echo $COUNTRY$SUFFIX | tr -d ' ')

 	# Extract the lines with the appropriate COUNTRY

 	grep -iw "France" time_series_covid19_confirmed_global.csv > cases1.csv
 	grep -iw "France" time_series_covid19_deaths_global.csv > deaths1.csv
 	grep -iw "France" time_series_covid19_recovered_global.csv > recovered1.csv

  awk -F, '$1==""' cases1.csv > cases2.csv
  awk -F, '$1==""' deaths1.csv > deaths2.csv
  awk -F, '$1==""' recovered1.csv > recovered2.csv

 	# Remove field 1, 3 and 4

 	awk -f remove_records_1_3_4.awk cases2.csv > cases3.csv
 	awk -f remove_records_1_3_4.awk deaths2.csv > deaths3.csv
 	awk -f remove_records_1_3_4.awk recovered2.csv > recovered3.csv

 	# Remove empty fields from the data files, and append to the $OUTPUTFILE

 	sed -E ':l;s/,[[:blank:]]*,/,/;tl;s/^[[:blank:]]*,|,[[:blank:]]*$//g' cases3.csv >  cases4.csv
 	sed -E ':l;s/,[[:blank:]]*,/,/;tl;s/^[[:blank:]]*,|,[[:blank:]]*$//g' deaths3.csv >  deaths4.csv
 	sed -E ':l;s/,[[:blank:]]*,/,/;tl;s/^[[:blank:]]*,|,[[:blank:]]*$//g' recovered3.csv >  recovered4.csv

 	# Place the header in the $OUTPUTFILE
 	cat dataheader.csv > countryoutput.csv
 	cat cases4.csv >> countryoutput.csv
 	cat deaths4.csv >> countryoutput.csv
 	cat recovered4.csv >> countryoutput.csv

	csvtool transpose countryoutput.csv > temp.csv
	csvtool drop 1  temp.csv> temp2.csv
	awk -f AddColumns56789toCountry.awk temp2.csv > $OUTPUTFILE




 #	Korea

 # Extract Total Case History to a temporary file

 COUNTRY="korea"
 GREPSTRING=$COUNTRY
 SUFFIX="_covid19.csv"
 OUTPUTFILE=$(echo $COUNTRY$SUFFIX | tr -d ' ')

 # Extract the lines with the appropriate COUNTRY

 grep -iw $GREPSTRING time_series_covid19_confirmed_global.csv > cases1.csv
 grep -iw $GREPSTRING time_series_covid19_deaths_global.csv > deaths1.csv
 grep -iw $GREPSTRING time_series_covid19_recovered_global.csv > recovered1.csv

 # Clean it up

	sed 's/\Korea, South\>/Korea/' cases1.csv > cases2.csv
	sed 's/\Korea, South\>/Korea/' deaths1.csv > deaths2.csv
	sed 's/\Korea, South\>/Korea/' recovered1.csv > recovered2.csv

 # only keep the lines where the first field is empty

 awk -F, '$1==""' cases2.csv > cases3.csv
 awk -F, '$1==""' deaths2.csv > deaths3.csv
 awk -F, '$1==""' recovered2.csv > recovered3.csv

 # Remove field 1, 3 and 4

 awk -f remove_records_1_3_4.awk cases3.csv > cases4.csv
 awk -f remove_records_1_3_4.awk deaths3.csv > deaths4.csv
 awk -f remove_records_1_3_4.awk recovered3.csv > recovered4.csv

# Remove extra characters from the beginning

 # Place the header in the $OUTPUTFILE

 awk -f remove_records_1.awk dataheader.csv > temp1.csv
 sed -E ':l;s/,[[:blank:]]*,/,/;tl;s/^[[:blank:]]*,|,[[:blank:]]*$//g' temp1.csv >> countryoutput.csv

 # Remove empty fields from the data files, and append to the $OUTPUTFILE

 sed -E ':l;s/,[[:blank:]]*,/,/;tl;s/^[[:blank:]]*,|,[[:blank:]]*$//g' cases4.csv >> countryoutput.csv
 sed -E ':l;s/,[[:blank:]]*,/,/;tl;s/^[[:blank:]]*,|,[[:blank:]]*$//g' deaths4.csv >>  countryoutput.csv
 sed -E ':l;s/,[[:blank:]]*,/,/;tl;s/^[[:blank:]]*,|,[[:blank:]]*$//g' recovered4.csv >>  countryoutput.csv

	csvtool transpose countryoutput.csv > temp.csv
	csvtool drop 1  temp.csv> temp2.csv
	awk -f AddColumns56789toCountry.awk temp2.csv > $OUTPUTFILE


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
	"Kentucky"
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

	grep -i "UID" time_series_covid19_confirmed_US.csv > temp.csv
	awk -f process_state_header.awk temp.csv > temp2.csv
  sed -E ':l;s/,[[:blank:]]*,/,/;tl;s/^[[:blank:]]*,|,[[:blank:]]*$//g' temp2.csv > stateheader.csv


for i in "${STATES[@]}"; do

	# Extract US Total Case History to a temporary file

	STATE=$i
	GREPSTRING="$STATE"
	SUFFIX="_covid19.csv"
	OUTPUTFILE=$(echo $STATE$SUFFIX | tr -d ' ')

	echo $GREPSTRING >> greps.txt
	echo $OUTPUTFILE >> outputfilelist.txt

	awk -F, -v string="$GREPSTRING" '$7==string' time_series_covid19_confirmed_US.csv > statecases1.csv
	awk -F, -v string="$GREPSTRING" '$7==string' time_series_covid19_deaths_US.csv > statedeaths1.csv

	# Parse the temporary file and place the results in the appropriate country file.
	# This removes data not needed in multiple columns, but retains the state name

	awk -f process_state_cases.awk statecases1.csv > statecases2.csv
	awk -f process_state_deaths.awk statedeaths1.csv > statedeaths2.csv

	# Remove empty fields

  sed -E ':l;s/,[[:blank:]]*,/,/;tl;s/^[[:blank:]]*,|,[[:blank:]]*$//g' statecases2.csv > statecases3.csv
	sed -E ':l;s/,[[:blank:]]*,/,/;tl;s/^[[:blank:]]*,|,[[:blank:]]*$//g' statedeaths2.csv > statedeaths3.csv


	# Add columns

	awk -f sumcols_not_1.awk statecases3.csv > statecases4.csv
	awk -f sumcols_not_1.awk statedeaths3.csv > statedeaths4.csv

	cat stateheader.csv > stateoutput.csv
	cat statecases4.csv >> stateoutput.csv
	cat statedeaths4.csv >> stateoutput.csv

	csvtool transpose stateoutput.csv > temp.csv
	csvtool drop 1  temp.csv> temp2.csv
	awk -f AddColumns456789toState.awk temp2.csv > $OUTPUTFILE


done

#
#		Plotting and Tables Generation
#

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
	"San Bernadino"
	"San Mateo"
	"San Francisco"
	"Sacramento"
)

awk -F, -v string="$GREPSTRING" '$7=="California"' time_series_covid19_confirmed_US.csv > california_cases.csv
awk -F, -v string="$GREPSTRING" '$7=="California"' time_series_covid19_deaths_US.csv > california_deaths.csv

#
#	Remove records  from stateheader.csv
#

awk -f remove_records_1.awk stateheader.csv > temp.csv
sed -E ':l;s/,[[:blank:]]*,/,/;tl;s/^[[:blank:]]*,|,[[:blank:]]*$//g' temp.csv > countyheader.csv


for i in "${COUNTIES[@]}"; do

	# Extract California Total Case History to a temporary file


	COUNTY=$i
	GREPSTRING="$COUNTY"
	SUFFIX="_covid19.csv"

	OUTPUTFILE=$(echo $COUNTY$SUFFIX | tr -d ' ')
	echo $GREPSTRING >> greps.txt
	echo $OUTPUTFILE >> outputfilelist.txt


	awk -F, -v string="$GREPSTRING" '$6==string' california_deaths.csv > county_deaths1.csv
	awk -F, -v string="$GREPSTRING" '$6==string' california_cases.csv > county_cases1.csv



	# Parse the temporary file and place the results in the appropriate country file.
	# This removes data not needed in multiple columns, but retains the state name

	awk -f process_county_cases.awk county_cases1.csv > county_cases2.csv
	awk -f process_county_deaths.awk county_deaths1.csv > county_deaths2.csv



	# Remove empty fields

  sed -E ':l;s/,[[:blank:]]*,/,/;tl;s/^[[:blank:]]*,|,[[:blank:]]*$//g' county_cases2.csv > county_cases3.csv
	sed -E ':l;s/,[[:blank:]]*,/,/;tl;s/^[[:blank:]]*,|,[[:blank:]]*$//g' county_deaths2.csv > county_deaths3.csv



	cat countyheader.csv > county_output.csv
	cat county_cases3.csv >> county_output.csv
	cat county_deaths3.csv >> county_output.csv

	csvtool transpose county_output.csv > temp.csv
	awk -f AddColumns456789toState.awk temp.csv > $OUTPUTFILE


#	csvtool drop 1  temp.csv> temp2.csv

# echo "The last county to be processed is "$OUTPUTFILE




done

#
#		Call the plotting script
#

./plotresults

./Plot7DayAvg

./PlotDensity

exit 0
