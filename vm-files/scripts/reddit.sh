#!/usr/bin/env bash
opt1="Subreddit Download"
opt2="User Download"
opt3="User Archive"
opt4="Launch Downloader"
redditmenu=$(zenity  --list  --title "Reddit Tool" --radiolist  --column "" --column "" TRUE "$opt1" FALSE "$opt2" FALSE "$opt3" FALSE "$opt4" --height=400 --width=300)
case $redditmenu in
$opt1 )
url=$(zenity --entry --title "Subreddit Download" --text "Enter Subreddit")
python3 -m bdfr download ~/Documents/Reddit/$url/ --subreddit "$url"
open ~/Documents/Reddit/$url
;;
$opt2 )
url=$(zenity --entry --title "User Download" --text "Enter Subreddit")
user=$(zenity --entry --title "User Download" --text "Enter Username")
python3 -m bdfr download ~/Documents/Reddit/$user/ --user $user --subreddit "$url"
open ~/Documents/Reddit/$user
;;
$opt3 )
url=$(zenity --entry --title "User Archive" --text "Enter Reddit Username")
mkdir -p ~/Documents/Reddit/
cd ~/Documents/Reddit/
redditsfinder "$url"
open ~/Documents/Reddit/users/$url
;;
$opt4 )
cd ~/Downloads/Programs/DownloaderForReddit/
python3 main.py
;;
esac


