#!/usr/bin/env bash
opt1="Sherlock"
opt2="SocialScan"
opt3="Holehe"
opt4="WhatsMyName"
opt5="Blackbird"
opt6="Maigret"
opt7="Email2Phone"
opt8="GHunt Email"
opt9="GHunt Drive"
opt10="GHunt GAIA"
opt11="GHunt Configuration"
timestamp=$(date +%Y-%m-%d:%H:%M)
usermenu=$(zenity  --list  --title "Username/Email Utilities" --radiolist  --column "" --column "" TRUE "$opt1" FALSE "$opt2"  FALSE "$opt3" FALSE "$opt5" FALSE "$opt6" FALSE "$opt7" FALSE "$opt8" FALSE "$opt9" FALSE "$opt10" FALSE "$opt11" --height=400 --width=300)
case $usermenu in
$opt1 )
handle=$(zenity --entry --title "Sherlock" --text "Enter Username")
cd ~/Downloads/Programs/sherlock/sherlock
echo Working...
python3 sherlock.py $handle > ~/Documents/$handle-$timestamp-Sherlock.txt
open ~/Documents/$handle-$timestamp-Sherlock.txt
;;
$opt2 )
handle=$(zenity --entry --title "SocialScan" --text "Enter Username or Email")
socialscan $handle
;;
$opt3 )
handle=$(zenity --entry --title "Holehe" --text "Enter Email")
holehe $handle
;;
$opt4 )
handle=$(zenity --entry --title "WhatsMyName" --text "Enter Username")
cd ~/Downloads/Programs/WhatsMyName
python3 whats_my_name.py -u $handle > ~/Documents/$handle-$timestamp-WhatsMyName.txt
open ~/Documents/$handle-$timestamp-WhatsMyName.txt
;;
$opt5 )
handle=$(zenity --entry --title "Blackbird" --text "Enter Username")
cd ~/Downloads/Programs/blackbird
python3 blackbird.py -u $handle
firefox ~/Downloads/Programs/blackbird/results/$handle.json
;;
$opt6 )
handle=$(zenity --entry --title "Maigret" --text "Enter Username")
cd ~/Downloads/Programs/Maigret
maigret -a -P -T $handle
open ~/Downloads/Programs/Maigret/reports/
;;
$opt7 )
handle=$(zenity --entry --title "Email2Phone" --text "Enter Email")
cd ~/Downloads/Programs/email2phonenumber
python3 email2phonenumber.py scrape -e $handle
;;
$opt8 )
handle=$(zenity --entry --title "GHunt Email" --text "Enter Gmail Address")
ghunt email $handle > ~/Documents/$handle-$timestamp.txt
open ~/Documents/$handle-$timestamp.txt
;;
$opt9 )
handle=$(zenity --entry --title "GHunt Drive" --text "Enter Google Drive ID")
ghunt drive $handle > ~/Documents/$handle-$timestamp.txt
open ~/Documents/$handle-$timestamp.txt
;;
$opt10 )
handle=$(zenity --entry --title "GHunt GAIA" --text "Enter GAIA")
ghunt gaia $handle > ~/Documents/$handle-$timestamp.txt
open ~/Documents/$handle-$timestamp.txt
;;
$opt11 )
ghunt login
;;
esac
read -rsp $'Press enter to continue...\n'
echo
