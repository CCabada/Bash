#! /bin/bash
echo "Bash Assignment"
echo "Enter filename"
#read filename
filename="innocuous.txt"
echo "Enter codebook"
#read codebook
codebook="codebook.txt"
output="out.txt"


while read line;
do
    if [ $((`echo "$line"|awk '{ print $2 }'` %2)) -eq 0 ];
    then echo "$line";
    fi ;
done < "$filename"

#echo Sorts by the second column
#awk {'print $2 %2 '} $filename | sort -n > sorted.txt
#echo Replaces dash with space
cat sorted.txt | sed 's/-/ /g' > sorted_no_dashes.txt
#echo Moves second column to another file
awk {'print $2'} sorted_no_dashes.txt > ascii.txt
