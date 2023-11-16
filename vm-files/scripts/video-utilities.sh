#!/usr/bin/env bash
zenity --info --text="The next window will prompt you for a local media file." --title="Video Utilities" --width=200
ffmpeg_file=$(zenity --file-selection --title "Video Utilities")
timestamp=$(date +%Y-%m-%d:%H:%M)
opt1="Play a video"
opt2="Convert a video to mp4"
opt3="Extract video frames"
opt4="Shorten a video (Low Activity)"
opt5="Shorten a video (High Activity)"
opt6="Extract audio"
opt7="Rotate video"
opt8="Transcribe a file"
opt9="Translate & Transcribe a file"
ffmpeg=$(zenity  --list  --title "Video Utilities" --radiolist  --column "" --column "" TRUE "$opt1" FALSE "$opt2" FALSE "$opt3" FALSE "$opt4" FALSE "$opt5" FALSE "$opt6" FALSE "$opt7" FALSE "$opt8" FALSE "$opt9" --height=420 --width=300)
case $ffmpeg in
$opt1 )
ffplay "$ffmpeg_file"
;;
$opt2 )
mkdir ~/Documents/Videos/
ffmpeg -i "$ffmpeg_file" -vcodec mpeg4 -strict -2 ~/Documents/Videos/$timestamp.mp4
open ~/Documents/Videos/
;;
$opt3 )
mkdir ~/Documents/Videos/
mkdir ~/Documents/Videos/$timestamp-frames
ffmpeg -y -i "$ffmpeg_file" -an -r 10 ~/Documents/Videos/$timestamp-frames/img%03d.bmp
open ~/Documents/Videos/$timestamp-frames/
;;
$opt4 )
mkdir ~/Documents/Videos/
ffmpeg -i "$ffmpeg_file" -strict -2 -vf "select=gt(scene\,0.003),setpts=N/(25*TB)" ~/Documents/Videos/$timestamp-low.mp4
open ~/Documents/Videos/
;;
$opt5 )
mkdir ~/Documents/Videos/
ffmpeg -i "$ffmpeg_file" -strict -2 -vf "select=gt(scene\,0.005),setpts=N/(25*TB)" ~/Documents/Videos/$timestamp-high.mp4
open ~/Documents/Videos/
;;
$opt6 )
mkdir ~/Documents/Videos/
ffmpeg -i "$ffmpeg_file" -vn -ac 2 -ar 44100 -ab 320k -f mp3 ~/Documents/Videos/$timestamp.mp3 | 
open ~/Documents/Videos/
;;
$opt7 )
mkdir ~/Documents/Videos/
ffmpeg -i "$ffmpeg_file" -vf transpose=0 ~/Documents/Videos/$timestamp.mp4
open ~/Documents/Videos/
;;
$opt8 )
mkdir ~/Documents/Videos/
whisper "$ffmpeg_file" --model small -o ~/Documents/Videos
open ~/Documents/Videos/
;;
$opt9 )
mkdir ~/Documents/Videos/
whisper "$ffmpeg_file" --model small --task translate -o ~/Documents/Videos
open ~/Documents/Videos/
;;
esac

read -rsp $'Press enter to continue...\n'
echo