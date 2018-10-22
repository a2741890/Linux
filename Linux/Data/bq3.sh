#Cut three fields including title, year_release, box_office
tail -n+2 newbiopics.csv|cut -f 1,4,5 -d ',' > newlist2.csv
#Cut the column year_release and assign it to i
for i in $(cut -f 2 -d ',' newlist2.csv|sort|uniq)
do
#Calculate the average box office for each year(with distinct titles)
echo $i,$(cut -f 1,2,3 -d ',' newlist2.csv|sort|uniq|grep -w $i|cut -f 3 -d ','|awk '{total += $0}END{print total/NR}') >> answer3.csv
done
#Use a currency output format
echo "Year","Average Gross" > temp3.csv
printf "$%.f\n" $(cut -f 2 -d ',' answer3.csv) > currency.csv
cut -f 1 -d ',' answer3.csv > temp2.csv
paste -d, temp2.csv currency.csv  >>temp3.csv

./file2html.sh temp3.csv
mv answerpage.html ba3.html
rm newlist2.csv answer3.csv currency.csv temp2.csv temp3.csv
