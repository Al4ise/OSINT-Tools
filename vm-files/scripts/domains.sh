#!/usr/bin/env bash
opt1="Amass"
opt2="Sublist3r"
opt3="Photon"
opt4="TheHarvester"
opt5="Carbon14"
timestamp=$(date +%Y-%m-%d:%H:%M)
domainmenu=$(zenity  --list  --title "Domain Tool" --radiolist  --column "" --column "" TRUE "$opt1" FALSE "$opt2" FALSE "$opt3" FALSE "$opt4" FALSE "$opt5" --height=400 --width=300)
case $domainmenu in
$opt1 )
domain=$(zenity --entry --title "Amass" --text "Enter target domain name")
mkdir -p ~/Documents/Amass/
amass intel -whois -ip -src -active -d $domain  -o ~/Documents/Amass/$timestamp-$domain.1.txt
amass enum -src -passive -d $domain -o ~/Documents/Amass/$timestamp-$domain.2.txt -d $domain
open ~/Documents/Amass/
;;
$opt2 )
domain=$(zenity --entry --title "Sublist3r" --text "Enter target domain name")
mkdir -p ~/Documents/Sublist3r/
cd ~/Downloads/Programs/Sublist3r
python3 sublist3r.py -d $domain -o ~/Documents/Sublist3r/sublist3r_$domain.txt
open ~/Documents/Sublist3r/
;;
$opt3 ) 
domain=$(zenity --entry --title "Photon" --text "Enter target domain name")
mkdir -p ~/Documents/Photon/
cd ~/Downloads/Programs/Photon/
python3 photon.py -u $domain -l 3 -t 100 -o ~/Documents/Photon/$timestamp-$domain
open ~/Documents/Photon/$timestamp-$domain
;;
$opt4 )
domain=$(zenity --entry --title "TheHarvester" --text "Enter target domain name")
mkdir -p ~/Documents/theHarvester/
cd ~/Downloads/Programs/theHarvester/
python3 theHarvester.py -d $domain -b bing,duckduckgo,yahoo,qwant -f ~/Documents/theHarvester/$timestamp-$domain
open ~/Documents/theHarvester/
;;
$opt5 )
domain=$(zenity --entry --title "Carbon14" --text "Domain name (WITHOUT 'HTTPS://')")
mkdir -p ~/Documents/Carbon14/
cd ~/Downloads/Programs/Carbon14/
python3 carbon14.py https://$domain > ~/Documents/Carbon14/$domain.txt
open ~/Documents/Carbon14/
;;
esac


