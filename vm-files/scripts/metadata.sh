#!/usr/bin/env bash
opt1="Extract Metadata"
opt2="Clean Metadata"
opt3="Google Document Metadata"
opt4="Launch Sherloq"
opt5="Launch MediaInfo"
exifdata=$(zenity  --list  --title "Metadata Utilities" --radiolist  --column "" --column "" TRUE "$opt1" FALSE "$opt2" FALSE "$opt3" FALSE "$opt4" FALSE "$opt5" --height=400 --width=300)
case $exifdata in
$opt1 )
zenity --info --text "The next window will prompt for a target folder of media" --title "Exiftool"
sleep 1
exiftool_folder=$(zenity --file-selection --directory --title "Exiftool")
exiftool /$exiftool_folder/* -csv > /$exiftool_folder/MetadataReport.csv
open $exiftool_folder
zenity --info --text="Report saved in your Documents folder." --title="Metadata Cleaning"
;;
$opt2 )
zenity --info --text="Select a file to clean" --width=200 --title="Metadata Cleaning"
sleep 1
data_file=$(zenity --file-selection --title "Metadata Cleaning")
mat2 "$data_file"
open $data_file
zenity --info --text "A clean copy has been saved next to the original." --title="Metadata Cleaning"
;;
$opt3 )
url=$(zenity --entry --title "Google Document" --text "Enter target URL")
xeuledoc "$url" > ~/Documents/"GMetadata.txt" | zenity --progress --pulsate --no-cancel --auto-close --title="Google Documents Metadata" --text="Data being saved to ~/Documents/"
open ~/Documents/GMetadata.txt
;;
$opt4 )
cd ~/Downloads/Programs/sherloq/gui/
python3 sherloq.py
;;
$opt5 )
mediainfo-gui
;;
esac
read -rsp $'Press enter to continue...\n'
echo


