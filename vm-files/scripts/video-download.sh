#!/usr/bin/env bash
mkdir -p ~/Documents/Videos/ 
mkdir -p ~/Documents/Videos/Youtube-DL/

opt1="YTDL-Best Quality"
opt2="YTDL-Maximum 720p"
opt3="YTDLP-Best Quality"
opt4="YTDLP-Maximum 720p"
opt5="Export YT Comments"
opt6="Export YT Subtitles"
opt7="Export YT Info"
timestamp=$(date +%Y-%m-%d_%H_%M)
videodownloadmenu=$(zenity  --list  --title "Video Downloader" --radiolist  --column "" --column "" TRUE "$opt1" FALSE "$opt2" FALSE "$opt3" FALSE "$opt4" FALSE "$opt5" FALSE "$opt6" FALSE "$opt7" --height=400 --width=300)
case $videodownloadmenu in
$opt1 )

url=$(zenity --entry --title "Best Quality" --text "Enter Target URL")
youtube-dl "$url" -o ~/Documents/Videos/Youtube-DL/"$timestamp-%(title)s.%(ext)s" -i --all-subs
open ~/Documents/Videos/Youtube-DL/
;;
$opt2 )
url=$(zenity --entry --title "Maximum 720p" --text "Enter Target URL")
youtube-dl "$url" -o ~/Documents/Videos/Youtube-DL/"$timestamp-%(title)s.%(ext)s" -i -f 'bestvideo[height<=720]+bestaudio' --all-subs
open ~/Documents/Videos/Youtube-DL/
;;
$opt3 )
url=$(zenity --entry --title "Best Quality" --text "Enter Target URL")
yt-dlp $url -o ~/Documents/Videos/Youtube-DL/"$timestamp-%(title)s.%(ext)s" -i --all-subs
open ~/Documents/Videos/Youtube-DL/
;;
$opt4 )
url=$(zenity --entry --title "Maximum 720p" --text "Enter Target URL")
yt-dlp "$url" -o ~/Documents/Videos/Youtube-DL/"$timestamp-%(title)s.%(ext)s" -i -f 'bestvideo[height<=720]+bestaudio' --all-subs
open ~/Documents/Videos/Youtube-DL/
;;
$opt5 )
url=$(zenity --entry --title "Export YT Comments" --text "Enter Target URL")
cd ~/Documents/Videos/Youtube-DL/
yt-dlp "$url" -o ~/Documents/Videos/Youtube-DL/$timestamp-comments --write-comments --skip-download 
open ~/Documents/Videos/Youtube-DL/
;;
$opt6 )
cd ~/Documents/Videos/Youtube-DL/
url=$(zenity --entry --title "Export YT Subtitles" --text "Enter Target URL")
youtube-dl --all-subs --skip-download --write-auto-sub "$url"
open ~/Documents/Videos/Youtube-DL/
;;
$opt7 )
url=$(zenity --entry --title "Export YT Info" --text "Enter Target URL")
cd ~/Documents/Videos/Youtube-DL/
yt-dlp "$url" -o ~/Documents/Videos/Youtube-DL/$timestamp-info --write-info-json --skip-download
open ~/Documents/Videos/Youtube-DL/
;;
esac

read -rsp $'Press enter to continue...\n'
echo
