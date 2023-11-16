#!/usr/bin/env bash
sudo apt update
sudo apt -y upgrade
sudo snap refresh
sudo apt update --fix-missing
sudo apt --fix-broken install
sudo pip install -U youtube-dl 2>/dev/null
sudo pip install -U yt-dlp 2>/dev/null
cd ~/Downloads/Programs/Streamlink
source streamlinkEnvironment/bin/activate
sudo pip install -U streamlink 2>/dev/null
deactivate
cd ~/Downloads/Programs/Instalooter
source instalooterEnvironment/bin/activate
sudo pip install -U instalooter 2>/dev/null
deactivate
cd ~/Downloads/Programs/Instaloader
source instaloaderEnvironment/bin/activate
sudo pip install -U instaloader 2>/dev/null
deactivate
cd ~/Downloads/Programs/Toutatis
source toutatisEnvironment/bin/activate
sudo pip install -U toutatis 2>/dev/null
deactivate
cd ~/Downloads/Programs/Osintgram
git pull https://github.com/Datalux/Osintgram.git
source OsintgramEnvironment/bin/activate
sudo pip install -r requirements.txt 2>/dev/null
deactivate
cd ~/Downloads/Programs/Gallery-DL
source gallerydlEnvironment/bin/activate
sudo pip install -U gallery-dl 2>/dev/null
deactivate
cd ~/Downloads
wget -N https://github.com/ripmeapp/ripme/releases/latest/download/ripme.jar
chmod +x ripme.jar
cd ~/Downloads/Programs/sherlock
git pull https://github.com/sherlock-project/sherlock.git
source SherlockEnvironment/bin/activate
sudo pip install -r requirements.txt 2>/dev/null
deactivate
cd ~/Downloads/Programs/socialscan
source socialscanEnvironment/bin/activate
sudo pip install -U socialscan 2>/dev/null
deactivate
cd ~/Downloads/Programs/holehe
source holeheEnvironment/bin/activate
sudo pip install -U holehe 2>/dev/null
deactivate
cd ~/Downloads/Programs/blackbird
git pull https://github.com/p1ngul1n0/blackbird
source blackbirdEnvironment/bin/activate
sudo pip install -r requirements.txt 2>/dev/null
deactivate
cd ~/Downloads/Programs/email2phonenumber
git pull https://github.com/martinvigo/email2phonenumber.git
source email2phonenumberEnvironment/bin/activate
sudo pip install -r requirements.txt 2>/dev/null
deactivate
sudo pip install -U pipx
pipx upgrade ghunt
cd ~/Downloads/Programs/EyeWitness
git pull https://github.com/FortyNorthSecurity/EyeWitness.git
cd Python/setup
sudo ./setup.sh
cd ~/Downloads/Programs/Sublist3r
git pull https://github.com/aboul3la/Sublist3r.git
source Sublist3rEnvironment/bin/activate
sudo pip install -r requirements.txt 2>/dev/null
deactivate
cd ~/Downloads/Programs/Photon
git pull https://github.com/s0md3v/Photon.git
source PhotonEnvironment/bin/activate
sudo pip install -r requirements.txt 2>/dev/null
deactivate
cd ~/Downloads/Programs/theHarvester
git pull https://github.com/laramies/theHarvester.git
source theHarvesterEnvironment/bin/activate
sudo pip install -r requirements.txt 2>/dev/null
deactivate
sudo pip install -U testresources 2>/dev/null
sudo pip install -U webscreenshot 2>/dev/null
cd ~/Downloads/Programs/Carbon14
git pull https://github.com/Lazza/Carbon14
source Carbon14Environment/bin/activate
sudo pip install -r requirements.txt 2>/dev/null
deactivate
cd ~/Downloads/Programs/xeuledoc
source xeuledocEnvironment/bin/activate
sudo pip install -U xeuledoc 2>/dev/null
deactivate
cd ~/Downloads/Programs/sherloq
git pull https://github.com/GuidoBartoli/sherloq.git
cd gui
source sherloqEnvironment/bin/activate
sudo pip install -r requirements.txt 2>/dev/null
deactivate
cd ~/Downloads/Programs/metagoofil
git pull https://github.com/opsdisk/metagoofil.git
source metagoofilEnvironment/bin/activate
sudo pip install -r requirements.txt 2>/dev/null
deactivate
cd ~/Downloads/Programs/bdfr
source bdfrEnvironment/bin/activate
sudo pip install -U bdfr 2>/dev/null
deactivate
cd ~/Downloads/Programs/redditsfinder
source redditsfinderEnvironment/bin/activate
sudo pip install -U redditsfinder 2>/dev/null
deactivate
cd ~/Downloads/Programs/DownloaderForReddit
git pull https://github.com/MalloyDelacroix/DownloaderForReddit.git
source DownloaderForRedditEnvironment/bin/activate
sudo pip install -r requirements.txt 2>/dev/null
deactivate
wget http://dl.google.com/dl/earth/client/current/google-earth-stable_current_amd64.deb
sudo apt install -y ./google-earth-stable_current_amd64.deb
sudo rm google-earth-stable_current_amd64.deb
cd ~/Downloads/Programs/waybackpy
source waybackpyEnvironment/bin/activate
sudo pip install -U waybackpy 2>/dev/null
deactivate
cd ~/Downloads/Programs/changedetection
source changedetectionEnvironment/bin/activate
sudo pip install -U changedetection.io 2>/dev/null
deactivate
cd ~/Downloads/Programs/spiderfoot
git pull https://github.com/smicallef/spiderfoot.git
source spiderfootEnvironment/bin/activate
sudo pip install -r requirements.txt 2>/dev/null
deactivate
cd ~/Downloads/Programs/recon-ng
git pull https://github.com/lanmaster53/recon-ng.git
source recon-ngEnvironment/bin/activate
sudo pip install -r REQUIREMENTS 2>/dev/null
deactivate
sudo pip install -U openai-whisper
cd ~/Downloads/Programs/internetarchive
source internetarchiveEnvironment/bin/activate
sudo pip install -U internetarchive 2>/dev/null
deactivate
cd ~/Downloads/Programs/Elasticsearch-Crawler
git pull https://github.com/AmIJesse/Elasticsearch-Crawler.git
sudo pip install -U nested-lookup 2>/dev/null
cd ~/Downloads/Programs/search-that-hash
source search-that-hashEnvironment/bin/activate
sudo pip install -U search-that-hash 2>/dev/null
deactivate
cd ~/Downloads/Programs/name-that-hash
source name-that-hashEnvironment/bin/activate
sudo pip install -U name-that-hash
deactivate
cd ~/Downloads/Programs/h8mail
source h8mailEnvironment/bin/activate
sudo pip install -U h8mail 2>/dev/null
deactivate
sudo apt autoremove -y
echo
read -rsp $'Press enter to continue. \n'
echo


