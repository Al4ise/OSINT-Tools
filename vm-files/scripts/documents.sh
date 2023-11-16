#!/usr/bin/env bash
opt1="Metagoofil-Only"
opt2="Metagoofil+Exiftool"
domainmenu=$(zenity  --list  --title "Choose Tool" --radiolist  --column "" --column "" TRUE "$opt1" FALSE "$opt2" --height=400 --width=300) 
case $domainmenu in
$opt1 ) 
domain=$(zenity --entry --title "Metagoofil-Only" --text "Enter target domain name")
mkdir -p ~/Documents/Metagoofil
mkdir -p ~/Documents/Metagoofil/"$domain"_docs
python3 ~/Downloads/Programs/metagoofil/metagoofil.py -d $domain -w -t pdf,doc,xls,ppt,docx,xlsx,pptx -o ~/Documents/Metagoofil/"$domain"_docs
open ~/Documents/Metagoofil/
;;
$opt2 ) 
domain=$(zenity --entry --title "Metagoofil+Exiftool" --text "Enter target domain name")
mkdir -p ~/Documents/Metagoofil
mkdir -p ~/Documents/Metagoofil/"$domain"_docs
mkdir -p ~/Documents/Metagoofil/"$domain"_results
python3 ~/Downloads/Programs/metagoofil/metagoofil.py -d $domain -w -t pdf,doc,xls,ppt,docx,xlsx,pptx -o ~/Documents/Metagoofil/"$domain"_docs
cd ~/Documents/Metagoofil/"$domain"_docs
exiftool * -csv > ~/Documents/Metagoofil/"$domain"_results/Report.csv
open ~/Documents/Metagoofil
;;

esac

