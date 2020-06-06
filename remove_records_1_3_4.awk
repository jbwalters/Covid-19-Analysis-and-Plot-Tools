BEGIN{ 
FS=",";
OFS=",";
}
{ $1=$3=$4="";{print $0} }
END{} 