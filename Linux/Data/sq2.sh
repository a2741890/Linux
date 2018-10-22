#Extract three fields and then remove the duplicate parts, then sum up the box office by subject sex.
sqlite3 -separator ',' biopics.sqlite 'SELECT subject_sex,SUM(box_office) FROM (SELECT DISTINCT title,box_office,subject_sex FROM biopics) GROUP BY subject_sex ORDER BY subject_sex DESC'>sqlanswer2.txt
#use a currency output format
echo "Gender","Amount" > temp3.txt
printf "$%.f\n" $(cut -f 2 -d ',' sqlanswer2.txt) > currency.txt
cut -f 1 -d ',' sqlanswer2.txt > temp2.txt
paste -d, temp2.txt currency.txt  >>temp3.txt
#Output file as a html file
./file2html.sh temp3.txt
mv answerpage.html sa2.html
rm sqlanswer2.txt currency.txt temp2.txt temp3.txt
