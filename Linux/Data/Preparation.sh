#In order to make the program go through smoothly, please check to run the command
#on the following that this can ensure everything set before you start to run the question.

#First give all the script accessibility of execuation.
chmod +x bq1.sh bq2.sh bq3.sh sq1.sh sq2.sh sq3.sh cleandata.sh file2html.sh
#install necessary package:sqlite & python3.
sudo apt-get install sqlite3
sudo apt-get install python3
#Get data from the dropbox and then rename it as biopics.csv.
wget https://goo.gl/BhphrS
mv BhphrS biopics.csv
#Clean the data for the purpose of calculation.
./cleandata.sh biopics.csv
#Completed.
echo -e "\e[31mCongratulation!You now have already completed all the neccessary preparation!\e[0m"
