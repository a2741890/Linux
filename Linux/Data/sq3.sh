#choose three fields and remove the duplicate part then calculate the average box office for each year.
sqlite3 -separator ',' biopics.sqlite 'SELECT year_release,AVG(box_office) FROM (SELECT DISTINCT title,year_release,box_office FROM biopics) GROUP BY year_release' > sqlanswer3.csv
#use a currency output format
echo "Year","Average Gross" > temp3.csv
printf "$%.f\n" $(cut -f 2 -d ',' sqlanswer3.csv) > currency.csv
cut -f 1 -d ',' sqlanswer3.csv > temp2.csv
paste -d, temp2.csv currency.csv  >>temp3.csv
#Change to a html file
./file2html.sh temp3.csv
mv answerpage.html sa3.html
rm sqlanswer3.csv currency.csv temp2.csv temp3.csv
