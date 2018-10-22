#Add <tr><td> before every line and </td></tr> after every line, and then replace the comma between every column with </td><td>
tail -n+0 $1|sed 's/\,/<\/td><td>/g'|sed 's/^/<tr><td>/g'|sed 's/$/<\/td><\/tr>/g' > table.html
#set the head part of the html file and adjust the width and color
echo "<html><body><table border=1 bgcolor=pink>" > top.html
#set the tail part of the html
echo "</table></body></html>" > bottom.html
#combine three files into one complete html file
cat top.html table.html bottom.html > answerpage.html
rm top.html table.html bottom.html
