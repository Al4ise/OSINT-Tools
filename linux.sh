#!/usr/bin/bash
SOURCE="$(dirname "$(realpath "$0")")"

pythonInstall() {
    local name="$1"

    mkdir -p ~/Downloads/Programs/"$name"
    cd ~/Downloads/Programs/"$name"
    python3 -m venv "$name"Environment
    source "$name"Environment/bin/activate
    sudo pip install -U "$name" 2>/dev/null
    deactivate
}

pyGitInstall() {
    local url="$2"
    local name="$(basename "$1" .git)"
    
    cd ~/Downloads/Programs
    git clone "$url"
    cd "$name"
    python3 -m venv "$name"Environment
    source "$name"Environment/bin/activate
    sudo pip install -r requirements.txt 2>/dev/null
    deactivate
}

sudo apt update
sudo apt install curl
sudo apt purge -y apport apport-symptoms popularity-contest ubuntu-report whoopsie
sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list
sudo add-apt-repository -y ppa:mozillateam/ppa
sudo apt update
sudo apt install -y build-essential unrar brave-browser dkms gcc make perl libncurses5-dev gnupg2 tor python3-pip dh-python python3-all python3-stdeb python3-pyqt5 python3-gpg python3-requests python3-socks python3-packaging ffmpeg vlc libffi-dev jq ripgrep bleachbit kazam libcanberra-gtk-module httrack webhttrack subversion mat2 libimage-exiftool-perl mediainfo-gui default-jre git python3-venv

echo '
Package: *
Pin: release o=LP-PPA-mozillateam
Pin-Priority: 1001
' | sudo tee /etc/apt/preferences.d/mozilla-firefox
echo 'Unattended-Upgrade::Allowed-Origins:: "LP-PPA-mozillateam:${distro_codename}";' | sudo tee /etc/apt/apt.conf.d/51unattended-upgrades-firefox

sudo apt install -y firefox --allow-downgrades

sudo apt install -y qemu-guest-agent
sudo systemctl enable qemu-guest-agent
sudo systemctl start qemu-guest-agent

# google earth
wget http://dl.google.com/dl/earth/client/current/google-earth-stable_current_amd64.deb
sudo rm google-earth-stable_current_amd64.deb
sudo apt install -y ./google-earth-stable_current_amd64.deb

sudo apt update --fix-missing
sudo apt -y upgrade
sudo apt --fix-broken install -y

sudo snap remove --purge firefox
sudo snap install chromium
sudo snap install amass

firefox &
sleep 30
pkill -f firefox
curl -O https://inteltechniques.com/data/osintbook10/ff-template.zip

unzip ff-template.zip -d ~/.mozilla/firefox/
cd ~/.mozilla/firefox/ff-template/
cp -R * ~/.mozilla/firefox/*.default-release
rm ff-template.zip

sudo pip install -U youtube-dl
sudo pip install -U yt-dlp

sudo pip install testresources 2>/dev/null
sudo pip install webscreenshot 2>/dev/null
sudo pip install pipx 2>/dev/null
sudo pip install nested-lookup 2>/dev/null

ln -sf $SOURCE/vm-files/scripts ~/Documents/scripts
ln -sf $SOURCE/vm-files/icons ~/Documents/icons
sudo cp $SOURCE/vm-files/shortcuts/* /usr/share/applications/
ln -sf $SOURCE/tools ~/Desktop/Tools

pythonInstall "streamlink"
pythonInstall "instalooter"
pythonInstall "instaloader"
pythonInstall "toutatis"
pythonInstall "gallery-dl"
pythonInstall "social-analyzer"
pythonInstall "holehe"
pythonInstall "socialscan"
pythonInstall "waybackpy"
pythonInstall "changedetection.io"
pythonInstall "xeuledoc"
pythonInstall "bdfr"
pythonInstall "redditsfinder"
pythonInstall "internetarchive"
pythonInstall "name-that-hash"
pythonInstall "maigret"
pythonInstall "search-that-hash"

pyGitInstall "https://github.com/p1ngul1n0/blackbird"
pyGitInstall "https://github.com/martinvigo/email2phonenumber.git"
pyGitInstall "https://github.com/sherlock-project/sherlock.git"
pyGitInstall "https://github.com/aboul3la/Sublist3r.git"
pyGitInstall "https://github.com/s0md3v/Photon.git"
pyGitInstall "https://github.com/laramies/theHarvester.git"
pyGitInstall "https://github.com/Lazza/Carbon14"
pyGitInstall "https://github.com/opsdisk/metagoofil.git"
pyGitInstall "https://github.com/MalloyDelacroix/DownloaderForReddit.git"
pyGitInstall "https://github.com/smicallef/spiderfoot.git"
#pyGitInstall "https://github.com/Datalux/Osintgram.git"

#snoop
mkdir -p ~/Downloads/Programs/snoop
cd ~/Downloads/Programs/snoop
wget https://github.com/snooppr/snoop/releases/latest/download/Snoop.for.GNU_Linux.rar
unrar x Snoop.for.GNU_Linux.rar
chmod +x snoop_cli
rm Snoop.for.GNU_Linux.rar

#h8mail
pythonInstall "h8mail"

cd ~/Downloads
h8mail -g
sed -i 's/\;leak\-lookup\_pub/leak\-lookup\_pub/g' h8mail_config.ini

#archivebox
pythonInstall "archivebox"
mkdir -p ~/Documents/archivebox
cd ~/Documents/archivebox
archivebox init

cd ~/Downloads
wget https://github.com/ripmeapp/ripme/releases/latest/download/ripme.jar
chmod +x ripme.jar

pipx ensurepath
pipx install ghunt
pipx ensurepath

cd ~/Downloads/Programs
git clone https://github.com/FortyNorthSecurity/EyeWitness.git
cd EyeWitness/Python/setup
sudo ./setup.sh
cd ~/Downloads/Programs
wget https://github.com/mozilla/geckodriver/releases/download/v0.32.0/geckodriver-v0.32.0-linux-aarch64.tar.gz
tar -xvzf geckodriver*
chmod +x geckodriver
sudo mv geckodriver /usr/local/bin

cd ~/Downloads/Programs
git clone https://github.com/GuidoBartoli/sherloq.git
cd sherloq/gui
python3 -m venv sherloqEnvironment
source sherloqEnvironment/bin/activate
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

cd ~/Downloads/Programs
git clone https://github.com/AmIJesse/Elasticsearch-Crawler.git

#gsettings set org.gnome.desktop.background picture-uri ''
gsettings set org.gnome.desktop.background primary-color 'rgb(66, 81, 100)'
gsettings set org.gnome.shell favorite-apps []
gsettings set org.gnome.shell.extensions.dash-to-dock dock-position BOTTOM
gsettings set org.gnome.shell favorite-apps "['firefox.desktop', 'chromium_chromium.desktop', 'torbrowser.desktop', 'org.gnome.Nautilus.desktop', 'org.gnome.Terminal.desktop', 'updates.desktop', 'tools.desktop', 'video-download.desktop', 'video-utilities.desktop', 'video-stream.desktop', 'instagram.desktop', 'galleries.desktop', 'users-emails.desktop', 'captures.desktop', 'domains.desktop', 'metadata.desktop', 'archives.desktop', 'documents.desktop', 'breaches-leaks.desktop', 'reddit.desktop', 'spiderfoot.desktop', 'recon-ng.desktop', 'api.desktop', 'google-earth-pro.desktop', 'kazam.desktop', 'gnome-control-center.desktop']"
gsettings set org.gnome.shell.extensions.dash-to-dock dash-max-icon-size 32
echo
read -rsp $'Press enter to continue, reboot, then launch the Updates script.\n'
echo
