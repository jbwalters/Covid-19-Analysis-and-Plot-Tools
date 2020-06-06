BEGIN{
        FS = ",";
        OFS = ","
        STARTCOL=2;
}
{
for(i=STARTCOL; i<=NF; i++)
  sumcol[i]=sumcol[i]+$i
}
END{
for(i=STARTCOL; i<=NF; i++)
  $i=sumcol[i]
	print $0
}
