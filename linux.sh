#!/usr/bin/env bash
## Updated: October 10, 2023
## For use ONLY with Ubuntu 22.04
## These will assist with the creation of your custom machine and will be updated as things change
## Full usage details are available in the book: https://inteltechniques.com/book1.html
## Slight variations may be present for Windows/Mac users (such as 'Next' vs. 'Continue')
## Please report any issues to errors@inteltechniques.com
## Copyright 2023 Michael Bazzell
## These instructions are provided 'as is' without warranty of any kind
## In no event shall the copyright holder be liable for any claim, damages or other liability
## Full license information and restrictions at https://inteltechniques.com/osintbook10/license.txt
SOURCE="$(basename ${BASH_SOURCE[0]})"

sudo adduser osint vboxsf
sudo add-apt-repository -y ppa:mozillateam/ppa
echo '
Package: *
Pin: release o=LP-PPA-mozillateam
Pin-Priority: 1001
' | sudo tee /etc/apt/preferences.d/mozilla-firefox
echo 'Unattended-Upgrade::Allowed-Origins:: "LP-PPA-mozillateam:${distro_codename}";' | sudo tee /etc/apt/apt.conf.d/51unattended-upgrades-firefox

sudo apt purge -y apport apport-symptoms popularity-contest ubuntu-report whoopsie

sudo apt update
sudo apt install -y build-essential dkms gcc make perl libncurses5-dev curl gnupg2 tor python3-pip dh-python python3-all python3-stdeb python3-pyqt5 python3-gpg python3-requests python3-socks python3-packaging ffmpeg vlc libffi-dev jq ripgrep bleachbit kazam libcanberra-gtk-module httrack webhttrack subversion mat2 libimage-exiftool-perl mediainfo-gui default-jre git python3-venv
sudo apt install -y firefox --allow-downgrades

# edits
sudo apt install -y qemu-guest-agent
systemctl enable qemu-guest-agent
systemctl start qemu-guest-agent


wget http://dl.google.com/dl/earth/client/current/google-earth-stable_current_amd64.deb
sudo rm google-earth-stable_current_amd64.deb
sudo apt install -y ./google-earth-stable_current_amd64.deb

sudo apt update --fix-missing
sudo apt -y upgrade
sudo apt --fix-broken install -y

sudo rcvboxadd setup
sudo snap remove --purge firefox

cd ~/Desktop
firefox &
sleep 30
pkill -f firefox
curl -O https://inteltechniques.com/data/osintbook10/ff-template.zip

unzip ff-template.zip -d ~/.mozilla/firefox/
cd ~/.mozilla/firefox/ff-template/
cp -R * ~/.mozilla/firefox/*.default-release
cd ~/Desktop
rm ff-template.zip
sudo snap install chromium
git clone https://github.com/micahflee/torbrowser-launcher.git
cd torbrowser-launcher
./build_deb.sh
sudo dpkg -i deb_dist/torbrowser-launcher_*.deb
./torbrowser-launcher 
cd ..
rm -rf torbrowser-launcher/

sudo pip install -U youtube-dl
sudo pip install -U yt-dlp

mkdir -p ~/Documents/scripts
mkdir -p ~/Documents/icons
cp -r $SOURCE/vm-files/scripts ~/Documents/scripts
cp -r $SOURCE/vm-files/icons ~/Documents/icons
sudo cp -r $SOURCE/vm-files/shortcuts /usr/share/applications/
cd ~/Desktop
rm vm-files.zip
rm -rf vm-files

mkdir -p ~/Downloads/Programs
mkdir -p ~/Downloads/Programs/Streamlink
cd ~/Downloads/Programs/Streamlink
python3 -m venv streamlinkEnvironment
source streamlinkEnvironment/bin/activate
sudo pip install streamlink 2>/dev/null
deactivate
mkdir -p ~/Downloads/Programs/Instalooter
cd ~/Downloads/Programs/Instalooter
python3 -m venv instalooterEnvironment
source instalooterEnvironment/bin/activate
sudo pip install instalooter 2>/dev/null
deactivate
mkdir -p ~/Downloads/Programs/Instaloader
cd ~/Downloads/Programs/Instaloader
python3 -m venv instaloaderEnvironment
source instaloaderEnvironment/bin/activate
sudo pip install instaloader 2>/dev/null
deactivate
mkdir -p ~/Downloads/Programs/Toutatis
cd ~/Downloads/Programs/Toutatis
python3 -m venv toutatisEnvironment
source toutatisEnvironment/bin/activate
sudo pip install toutatis 2>/dev/null
deactivate
cd ~/Downloads/Programs
git clone https://github.com/Datalux/Osintgram.git
cd Osintgram
python3 -m venv OsintgramEnvironment
source OsintgramEnvironment/bin/activate
sudo pip install -r requirements.txt 2>/dev/null
deactivate
sed -i 's/followinfnumbers/followingnumbers/g' ~/Documents/scripts/instagram.sh
mkdir -p ~/Downloads/Programs/Gallery-DL
cd ~/Downloads/Programs/Gallery-DL
python3 -m venv gallerydlEnvironment
source gallerydlEnvironment/bin/activate
sudo pip install -U gallery-dl 2>/dev/null
deactivate
cd ~/Downloads
wget https://github.com/ripmeapp/ripme/releases/latest/download/ripme.jar
chmod +x ripme.jar
cd ~/Downloads/Programs
git clone https://github.com/sherlock-project/sherlock.git
cd sherlock
python3 -m venv SherlockEnvironment
source SherlockEnvironment/bin/activate
sudo pip install -r requirements.txt 2>/dev/null
deactivate
mkdir -p ~/Downloads/Programs/socialscan
cd ~/Downloads/Programs/socialscan
python3 -m venv socialscanEnvironment
source socialscanEnvironment/bin/activate
sudo pip install -U socialscan 2>/dev/null
deactivate
mkdir -p ~/Downloads/Programs/holehe
cd ~/Downloads/Programs/holehe
python3 -m venv holeheEnvironment
source holeheEnvironment/bin/activate
sudo pip install -U holehe 2>/dev/null
deactivate
cd ~/Documents/scripts/
sed -i 's/FALSE \"\$opt4\" //g' users-emails.sh
sed -i '50,55d' updates.sh
cd ~/Downloads/Programs
git clone https://github.com/p1ngul1n0/blackbird
cd blackbird
python3 -m venv blackbirdEnvironment
source blackbirdEnvironment/bin/activate
sudo pip install -r requirements.txt 2>/dev/null
deactivate
mkdir -p ~/Downloads/Programs/Maigret
cd ~/Downloads/Programs/Maigret
python3 -m venv maigretEnvironment
source maigretEnvironment/bin/activate
sudo pip install maigret
deactivate
cd ~/Downloads/Programs
git clone https://github.com/martinvigo/email2phonenumber.git
cd email2phonenumber
python3 -m venv email2phonenumberEnvironment
source email2phonenumberEnvironment/bin/activate
sudo pip install -r requirements.txt 2>/dev/null
deactivate
sudo pip install pipx
pipx ensurepath
pipx install ghunt
pipx ensurepath
cd ~/Downloads/Programs
git clone https://github.com/FortyNorthSecurity/EyeWitness.git
cd EyeWitness/Python/setup
sudo ./setup.sh
cd ~/Documents/scripts
sed -i 's/ChrisTruncer/FortyNorthSecurity/g' updates.sh
cd ~/Downloads/Programs
wget https://github.com/mozilla/geckodriver/releases/download/v0.32.0/geckodriver-v0.32.0-linux-aarch64.tar.gz
tar -xvzf geckodriver*
chmod +x geckodriver
sudo mv geckodriver /usr/local/bin
sudo snap install amass
cd ~/Downloads/Programs
git clone https://github.com/aboul3la/Sublist3r.git
cd Sublist3r
python3 -m venv Sublist3rEnvironment
source Sublist3rEnvironment/bin/activate
sudo pip install -r requirements.txt 2>/dev/null
deactivate
cd ~/Downloads/Programs
git clone https://github.com/s0md3v/Photon.git
cd Photon
python3 -m venv PhotonEnvironment
source PhotonEnvironment/bin/activate
sudo pip install -r requirements.txt 2>/dev/null
deactivate
cd ~/Downloads/Programs
git clone https://github.com/laramies/theHarvester.git
cd theHarvester
python3 -m venv theHarvesterEnvironment
source theHarvesterEnvironment/bin/activate
sudo pip install -r requirements.txt 2>/dev/null
deactivate
sudo pip install testresources 2>/dev/null
sudo pip install webscreenshot 2>/dev/null
cd ~/Downloads/Programs
git clone https://github.com/Lazza/Carbon14
cd Carbon14
python3 -m venv Carbon14Environment
source Carbon14Environment/bin/activate
sudo pip install -r requirements.txt 2>/dev/null
deactivate

mkdir -p ~/Downloads/Programs/xeuledoc
cd ~/Downloads/Programs/xeuledoc
python3 -m venv xeuledocEnvironment
source xeuledocEnvironment/bin/activate
sudo pip install -U xeuledoc 2>/dev/null
deactivate
cd ~/Downloads/Programs

git clone https://github.com/GuidoBartoli/sherloq.git
cd sherloq/gui
python3 -m venv sherloqEnvironment
source sherloqEnvironment/bin/activate
sudo pip install -r requirements.txt 2>/dev/null
deactivate

cd ~/Downloads/Programs
git clone https://github.com/opsdisk/metagoofil.git
cd metagoofil
python3 -m venv metagoofilEnvironment
source metagoofilEnvironment/bin/activate
sudo pip install -r requirements.txt 2>/dev/null
deactivate
mkdir -p ~/Downloads/Programs/bdfr
cd ~/Downloads/Programs/bdfr
python3 -m venv bdfrEnvironment
source bdfrEnvironment/bin/activate
sudo pip install -U bdfr 2>/dev/null
deactivate
mkdir -p ~/Downloads/Programs/redditsfinder
cd ~/Downloads/Programs/redditsfinder
python3 -m venv redditsfinderEnvironment
source redditsfinderEnvironment/bin/activate
sudo pip install -U redditsfinder 2>/dev/null
deactivate
cd ~/Downloads/Programs
git clone https://github.com/MalloyDelacroix/DownloaderForReddit.git
cd DownloaderForReddit
python3 -m venv DownloaderForRedditEnvironment
source DownloaderForRedditEnvironment/bin/activate
sudo pip install -r requirements.txt 2>/dev/null
deactivate

mkdir -p ~/Downloads/Programs/waybackpy
cd ~/Downloads/Programs/waybackpy
python3 -m venv waybackpyEnvironment
source waybackpyEnvironment/bin/activate
sudo pip install -U waybackpy 2>/dev/null
deactivate
mkdir -p ~/Downloads/Programs/changedetection
cd ~/Downloads/Programs/changedetection
python3 -m venv changedetectionEnvironment
source changedetectionEnvironment/bin/activate
sudo pip install changedetection.io 2>/dev/null
deactivate
mkdir -p ~/Downloads/Programs/archivebox
cd ~/Downloads/Programs/archivebox
python3 -m venv archiveboxEnvironment
source archiveboxEnvironment/bin/activate
sudo pip install archivebox
deactivate
mkdir -p ~/Documents/archivebox
cd ~/Documents/archivebox
archivebox init
cd ~/Downloads/Programs
git clone https://github.com/smicallef/spiderfoot.git
cd spiderfoot
python3 -m venv spiderfootEnvironment
source spiderfootEnvironment/bin/activate
sudo pip install -r requirements.txt 2>/dev/null
deactivate
cd ~/Downloads/Programs
git clone https://github.com/lanmaster53/recon-ng.git
cd recon-ng
python3 -m venv recon-ngEnvironment
source recon-ngEnvironment/bin/activate
sudo pip install -r REQUIREMENTS 2>/dev/null
deactivate
sudo pip install -U openai-whisper
mkdir -p ~/.cache/whisper
cd ~/.cache/whisper
wget https://openaipublic.azureedge.net/main/whisper/models/9ecf779972d90ba49c06d968637d720dd632c55bbf19d441fb42bf17a411e794/small.pt
cd ~/Documents/scripts
mkdir -p ~/Downloads/Programs/internetarchive
cd ~/Downloads/Programs/internetarchive
python3 -m venv internetarchiveEnvironment
source internetarchiveEnvironment/bin/activate
sudo pip install -U internetarchive 2>/dev/null
deactivate
cd ~/Downloads/Programs
git clone https://github.com/AmIJesse/Elasticsearch-Crawler.git
sudo pip install nested-lookup 2>/dev/null
mkdir -p ~/Downloads/Programs/search-that-hash
cd ~/Downloads/Programs/search-that-hash
python3 -m venv search-that-hashEnvironment
source search-that-hashEnvironment/bin/activate
sudo pip install -U search-that-hash 2>/dev/null
deactivate
mkdir -p ~/Downloads/Programs/name-that-hash
cd ~/Downloads/Programs/name-that-hash
python3 -m venv name-that-hashEnvironment
source name-that-hashEnvironment/bin/activate
sudo pip install -U name-that-hash 2>/dev/null
deactivate
mkdir -p ~/Downloads/Programs/h8mail
cd ~/Downloads/Programs/h8mail
python3 -m venv h8mailEnvironment
source h8mailEnvironment/bin/activate
sudo pip install -U h8mail 2>/dev/null
deactivate
cd ~/Downloads
h8mail -g
sed -i 's/\;leak\-lookup\_pub/leak\-lookup\_pub/g' h8mail_config.ini
gsettings set org.gnome.desktop.background picture-uri ''
gsettings set org.gnome.desktop.background primary-color 'rgb(66, 81, 100)'
gsettings set org.gnome.shell favorite-apps []
gsettings set org.gnome.shell.extensions.dash-to-dock dock-position BOTTOM
gsettings set org.gnome.shell favorite-apps "['firefox.desktop', 'chromium_chromium.desktop', 'torbrowser.desktop', 'org.gnome.Nautilus.desktop', 'org.gnome.Terminal.desktop', 'updates.desktop', 'tools.desktop', 'video-download.desktop', 'video-utilities.desktop', 'video-stream.desktop', 'instagram.desktop', 'galleries.desktop', 'users-emails.desktop', 'captures.desktop', 'domains.desktop', 'metadata.desktop', 'archives.desktop', 'documents.desktop', 'breaches-leaks.desktop', 'reddit.desktop', 'spiderfoot.desktop', 'recon-ng.desktop', 'api.desktop', 'google-earth-pro.desktop', 'kazam.desktop', 'gnome-control-center.desktop']"
gsettings set org.gnome.shell.extensions.dash-to-dock dash-max-icon-size 32

#edits
gsettings set org.gnome.desktop.interface scaling-factor 2
gsettings set org.gnome.desktop.peripherals.touchpad natural-scroll true
echo
read -rsp $'Press enter to continue, reboot, then launch the Updates script.\n'
echo
