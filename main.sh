#! /bin/bash
echo "Bash Assignment"
echo "Enter filename"
read filename
#filename="mini-fishlist.txt"
#filename="innocuous.txt"
echo "Enter codebook"
read codebook
#codebook="codebook.txt"
#echo codebook
#codebook="mini-codebook.txt"
#cat $codebook

awk '$1 ~/^[a-zA-Z0-9]{4}$/ {print}' $filename > words.txt
#echo "4 letter fish names"
#cat words.txt
#echo odd 
awk '$2%2!=0 {print $2} ' words.txt > odd.txt
#cat odd.txt

#echo Replaces dash with space
cat odd.txt | sed 's/-/ /g' > no_dashes.txt
#cat no_dashes.txt
 
#echo sorting
sort -n no_dashes.txt > sorted.txt
#cat sorted.txt

#echo Moves second column to another file
awk {'print $2+3'} sorted.txt > ascii1.txt
awk '{printf("%c\n",  $1)}'  ascii1.txt > ascii.txt
#echo ascii
#cat ascii.txt
result=ascii.txt

while read -r asciiline;
do
    while read -r codebookline;
    do
	col1=`echo $codebookline | awk '{print $1}'`
	col2=`echo $codebookline | awk '{print $2}'`
	if [ "${asciiline,,}" = "${col1,,}" ]; then echo "$col2"; fi;
    done < "$codebook"
done < "$result"

