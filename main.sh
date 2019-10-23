#! /bin/bash
echo "Bash Assignment"
echo "Enter filename"
#read filename
filename="mini-fishlist.txt"
#filename="innocuous.txt"
echo "Enter codebook"
#read codebook
#codebook="codebook.txt"
codebook="mini-codebook.txt"



echo Sorts by the second column
awk {'print $2 '} $filename | sort -n > sorted.txt
cat sorted.txt

echo Replaces dash with space
cat sorted.txt | sed 's/-/ /g' > sorted_no_dashes.txt
cat sorted_no_dashes.txt

#Error 
echo Moves second column to another file
awk {'print ($2 + 3)'}  sorted_no_dashes.txt > ascii.txt

echo ascii
cat ascii.txt
join  ascii.txt $codebook -a 1
echo res
#cat $result


echo reading file


