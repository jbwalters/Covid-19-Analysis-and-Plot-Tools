BEGIN{
FS=",";
OFS=",";
}
{ $1="";{print $0} }
END{}
