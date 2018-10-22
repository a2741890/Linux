#Replace the blank between name with "_" in title to ensure bash treat each one as one name, then cut the director part and sort it and make it uniq and finally assign it into i
for i in $(tail -n+2 newbiopics.csv|cut -f 6 -d ','|awk '{gsub(" ","_")}{print $0}'|sort|uniq)
do
#print out i(i.e. the director), and followed by this, extract whole file ,replacing blank with "_" again for title and group by director -> cut the title part and sort it and make it uniq
#and then use sed to add "1" after every uniq title then add all relevant 1 so that we get the total number of the movies made by each director.
echo $i,$(tail -n+2 newbiopics.csv|awk '{gsub(" ","_")}{print $0}'|grep $i|cut -f 1 -d ','|sort -n |uniq|sed 's/$/&\,1/g'|cut -f 2 -d ','|awk '{total += $0}END{print total}') >> test2.csv
done
#Restore all the title and then output into bs1.txt
tail -n+0 test2.csv|sed 's/\_/ /g' > ba1.txt
rm test2.csv
