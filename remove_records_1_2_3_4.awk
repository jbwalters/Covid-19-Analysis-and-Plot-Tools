BEGIN{
FS=",";
OFS=",";
}
{ $1=$2=$3=$4="";{print $0} }
END{}
