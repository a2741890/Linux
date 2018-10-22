#Extract the whole file and cut the part including title, box_office, and subject_sex
#Replace the "-" with 0 for the calculation purpose(box_office) and then sort these three fields and make them uniq
#Group by Male and Female respectively and cut the box_office part to calculate the total amount earned by each gender
tail -n+0 newbiopics.csv|cut -f 1,5,13 -d ','|sed 's/\-/0/g'|sort|uniq|grep -w 'Male'|cut -f 2 -d ','|awk '{total += $0}END{printf "Male"","total "\n"}' > temp1.txt
tail -n+0 newbiopics.csv|cut -f 1,5,13 -d ','|sed 's/\-/0/g'|sort|uniq|grep -w 'Female'|cut -f 2 -d ','|awk '{total += $0}END{print "Female"","total}' >> temp1.txt
#Use a currency output format
echo "Gender","Amount" > ba2.txt
printf "$%.f\n" $(cut -f 2 -d ',' temp1.txt) > currency.txt
cut -f 1 -d ',' temp1.txt > temp2.txt
paste -d, temp2.txt currency.txt  >> ba2.txt
#Output as a HTML format
./file2html.sh ba2.txt
#Change the name of html file
mv answerpage.html ba2.html
rm temp1.txt temp2.txt currency.txt ba2.txt
