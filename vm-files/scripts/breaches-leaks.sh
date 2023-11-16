#!/usr/bin/env bash
opt1="Elasticsearch Tool"
opt2="Search That Hash"
opt3="Name That Hash"
opt4="H8Mail"
leaksmenu=$(zenity  --list  --title "Breaches/Leaks Tool" --radiolist  --column "" --column "" TRUE "$opt1" FALSE "$opt2" FALSE "$opt3" FALSE "$opt4" --height=400 --width=300) 
case $leaksmenu in
$opt1 )
mkdir -p ~/Documents/Elasticsearch/
cd ~/Downloads/Programs/Elasticsearch-Crawler/
ip=$(zenity --entry --title "IP Address" --text "Enter target IP address")
index=$(zenity --entry --title "Index" --text "Enter target index" )
fields=$(zenity --entry --title "Fields" --text "Enter desired data fields (separated by space)")
python3 crawl.py $ip 9200 $index $fields > ~/Documents/Elasticsearch/$ip.txt
open ~/Documents/Elasticsearch/
;;
$opt2 )
hash=$(zenity --entry --title "Hash" --text "Enter Hash")
sth --text $hash
;;
$opt3 )
hash=$(zenity --entry --title "Hash" --text "Enter Hash")
nth --text $hash
;;
$opt4 )
mkdir -p ~/Documents/H8Mail/
email=$(zenity --entry --title "Email Address" --text "Enter target email address")
h8mail -t $email -c ~/Downloads/h8mail_config.ini -o ~/Documents/H8Mail/$email.txt
open ~/Documents/H8Mail/$email.txt
;;
esac
read -rsp $'Press enter to continue...\n'
echo
