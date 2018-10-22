#Download the data from the website
wget https://goo.gl/BhphrS

#Change the name of the data
mv BhphrS biopics.csv

#import the data into SQLite
python3 csv2sqlite.py --table-name biopics --input biopics.csv --output biopics.sqlite

#Clean the data by replacing all the "-" with "0" in order to do the numeric calculation (for SQL). 
sqlite3 -separator ',' biopics.sqlite 'UPDATE biopics SET box_office = 0 WHERE box_office = "-" '

#pick up distinct tilte and count the number of movies(title) according to each director.
sqlite3 -separator ',' biopics.sqlite 'SELECT DISTINCT director,COUNT(title) FROM biopics GROUP BY director' > sa1.txt 
