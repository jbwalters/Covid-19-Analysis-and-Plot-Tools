BEGIN {
  FS = ",";
  OFS=",";
	cases=0;
	deaths=0;
  CasesYesterday=0;
  DeathsYesterday=0;
  RecoveredYesterday=0;
  NewCases7=0;
  NewCases6=0;
  NewCases5=0;
  NewCases4=0;
  NewCases3=0;
  NewCases2=0;
  NewCases1=0;
  NewDeaths7=0;
  NewDeaths6=0;
  NewDeaths5=0;
  NewDeaths4=0;
  NewDeaths3=0;
  NewDeaths2=0;
  NewDeaths1=0
}
{
	Date=$1;
	Cases=$2;
	Deaths=$3;
  Recovered=$4;
  NewCases=$2-CasesYesterday;
  NewDeaths=$3-DeathsYesterday;
  NewRecovered=$4-RecoveredYesterday;
  NewCases7=NewCases6;
  NewCases6=NewCases5;
  NewCases5=NewCases4;
  NewCases4=NewCases3;
  NewCases3=NewCases2;
  NewCases2=NewCases1;
  NewCases1=NewCases;
  NewDeaths7=NewDeaths6;
  NewDeaths6=NewDeaths5;
  NewDeaths5=NewDeaths4;
  NewDeaths4=NewDeaths3;
  NewDeaths3=NewDeaths2;
  NewDeaths2=NewDeaths1;
  NewDeaths1=NewDeaths;
  NewCases7dAvg=(NewCases1+NewCases2+NewCases3+NewCases4+NewCases5+NewCases6+NewCases7)/7;
  NewDeaths7dAvg=(NewDeaths1+NewDeaths2+NewDeaths3+NewDeaths4+NewDeaths5+NewDeaths6+NewDeaths7)/7;
  CasesYesterday=$2;
  DeathsYesterday=$3;
  RecoveredYesterday=$4;
	print Date,Cases,Deaths,Recovered,NewCases,NewDeaths,NewRecovered,NewCases7dAvg,NewDeaths7dAvg
}
END{
}
