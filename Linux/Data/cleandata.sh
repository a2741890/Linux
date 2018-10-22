#Replace all the "-" with "0" in order to do the numeric calculation (for bash).
tail -n+0 $1| sed 's/-/0/g' | sed 's/"//g' > newbiopics.csv
