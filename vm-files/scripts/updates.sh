#!/usr/bin/bash
SOURCE="$(dirname "$(realpath "$0")")"

pythonInstall() {
    local name="$1"

    mkdir -p ~/Downloads/Programs/"$name"
    cd ~/Downloads/Programs/"$name" || exit
    python3 -m venv "$name"Environment
    source "$name"Environment/bin/activate
    sudo pip install -U "$name" 2>/dev/null
    deactivate
}

pyGitInstall() {
    local url="$1"
    local name="$(basename "$1" .git)"
    local req_path="$2"
    if [ -z "$req_path" ]; then
        req_path="$name/requirements.txt"
    else
        req_path="$name/$req_path"
    fi

    cd ~/Downloads/Programs || exit
    if [ -d "$name" ]; then
        cd "$name" || exit
        git pull
    else
        git clone --recursive "$url"
        cd "$(dirname "$req_path")" || exit
        python3 -m venv "$name"Environment
    fi
    source "$name"Environment/bin/activate
    sudo pip install -r "$(basename "$req_path")" 2>/dev/null
    deactivate
}

# keyrings/repos
wget -q -N -O /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
if ! grep -q "brave-browser-apt-release" /etc/apt/sources.list /etc/apt/sources.list.d/*; then
    echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg] https://brave-browser-apt-release.s3.brave.com/ stable main" | sudo tee /etc/apt/sources.list.d/brave-browser-release.list
fi

if ! apt-key list | grep -q "Google Inc"; then
    wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
fi

if ! grep -q "mozillateam/ppa" /etc/apt/sources.list /etc/apt/sources.list.d/*; then
    sudo add-apt-repository -y ppa:mozillateam/ppa
fi

echo '
Package: *
Pin: release o=LP-PPA-mozillateam
Pin-Priority: 1001
' | sudo tee /etc/apt/preferences.d/mozilla-firefox > /dev/null
echo 'Unattended-Upgrade::Allowed-Origins:: "LP-PPA-mozillateam:${distro_codename}";' | sudo tee /etc/apt/apt.conf.d/51unattended-upgrades-firefox > /dev/null

sudo apt update

# menu
if ! [[ "$(dpkg -l qemu-guest-agent)" || "$(dpkg -l virtualbox-guest-utils)" ]]; then
    echo "What Virtualization Software are you on?:"
    echo "[1] Virtualbox"
    echo "[2] UTM/QEMU"
    echo "[3] None/Other"
    read -rp "Choose an option: " option

    # Check if qemu-guest-agent is installed
    case $option in
        1) echo "Installing Virtualbox-specific software..."
            sudo adduser osint vboxsf
            sudo rcvboxadd setup
            sudo apt install -y virtualbox-guest-utils
            ;;
        2) echo "Installing UTM/QEMU-specific software..."
            sudo apt install -y qemu-guest-agent
            sudo systemctl enable qemu-guest-agent
            sudo systemctl start qemu-guest-agent
            ;;
        3) echo "No virtualization-specific software will be installed."
            ;;
        *) echo "Invalid option. Try another one." && exit
            ;;
    esac

    # purges
    sudo apt purge -y apport apport-symptoms popularity-contest ubuntu-report whoopsie
    sudo snap remove --purge firefox
fi

sudo apt install -y curl build-essential unrar brave-browser dkms gcc make perl libncurses5-dev gnupg2 tor python3-pip dh-python python3-all python3-stdeb python3-pyqt5 python3-gpg python3-requests python3-socks python3-packaging ffmpeg vlc libffi-dev jq ripgrep bleachbit kazam libcanberra-gtk-module httrack webhttrack subversion mat2 libimage-exiftool-perl mediainfo-gui default-jre git python3-venv

sudo apt update --fix-missing
sudo apt -y upgrade
sudo apt --fix-broken install -y

#firefox
sudo apt install -y firefox --allow-downgrades
firefox &
sleep 30
pkill -f firefox

# firefox profile
wget https://inteltechniques.com/data/osintbook10/ff-template.zip
unzip ff-template.zip -d ~/.mozilla/firefox/
mv ~/.mozilla/firefox/ff-template/* ~/.mozilla/firefox/*.default-release/
rm -f ff-template.zip
rm -rf ~/.mozilla/firefox/ff-template

# snap
sudo snap install chromium
sudo snap install amass

# google earth
cd ~/Desktop || exit
wget http://dl.google.com/dl/earth/client/current/google-earth-stable_current_amd64.deb
rm google-earth-stable_current_amd64.deb
sudo apt install -y ./google-earth-stable_current_amd64.deb

# pip installs
sudo pip install -U youtube-dl
sudo pip install -U yt-dlp
sudo pip install -U testresources
sudo pip install -U webscreenshot
sudo pip install -U pipx
sudo pip install -U nested-lookup

# pipx s
pipx ensurepath
pipx install ghunt

# whisper
sudo pip install -U openai-whisper
if [ ! -d ~/.cache/whisper ]; then
    mkdir -p ~/.cache/whisper
    cd ~/.cache/whisper || exit
    wget https://openaipublic.azureedge.net/main/whisper/models/9ecf779972d90ba49c06d968637d720dd632c55bbf19d441fb42bf17a411e794/small.pt
fi

# links
ln -sf "$SOURCE"/vm-files/scripts ~/Documents/scripts
ln -sf "$SOURCE"/vm-files/icons ~/Documents/icons
ln -sf "$SOURCE"/tools ~/Desktop/Tools

for i in "$SOURCE"/vm-files/shortcuts/*; do
    sudo ln -sf "$SOURCE"/vm-files/shortcuts/"$i" /usr/share/applications/"$i"
done

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
pyGitInstall "https://github.com/GuidoBartoli/sherloq.git" "gui/requirements.txt"
pyGitInstall "https://github.com/lanmaster53/recon-ng.git" "REQUIREMENTS"

#snoop
rm -rf ~/Downloads/Programs/snoop
mkdir -p ~/Downloads/Programs/snoop
cd ~/Downloads/Programs/snoop || exit
wget https://github.com/snooppr/snoop/releases/latest/download/Snoop.for.GNU_Linux.rar
unrar x Snoop.for.GNU_Linux.rar
chmod +x snoop_cli
rm Snoop.for.GNU_Linux.rar
ln -sf ~/Downloads/Programs/snoop/snoop_cli /usr/local/bin/snoop

#h8mail
if [ -d ~/Downloads/Programs/h8mail ]; then
    pythonInstall "h8mail"
else
    pythonInstall "h8mail"
    cd ~/Downloads || exit
    h8mail -g
    sed -i 's/\;leak\-lookup\_pub/leak\-lookup\_pub/g' h8mail_config.ini
fi

#archivebox
if [ -d ~/Downloads/Programs/archivebox ]; then
    pythonInstall "archivebox"
else
    pythonInstall "archivebox"
    mkdir -p ~/Documents/archivebox
    cd ~/Documents/archivebox || exit
    archivebox init
fi

# ripme.jar
cd ~/Downloads || exit
wget -N https://github.com/ripmeapp/ripme/releases/latest/download/ripme.jar
chmod +x ripme.jar

# eyewitness
cd ~/Downloads/Programs || exit
if [ -d "EyeWitness" ]; then
    cd EyeWitness || exit
    git pull
else
    git clone --recursive https://github.com/FortyNorthSecurity/EyeWitness.git
fi
cd EyeWitness/Python/setup || exit
sudo ./setup.sh

# Elasticsearch-Crawler
cd ~/Downloads/Programs || exit
if [ -d "Elasticsearch-Crawler" ]; then
    cd Elasticsearch-Crawler || exit
    git pull
else
    git clone --recursive https://github.com/AmIJesse/Elasticsearch-Crawler.git
fi

#gsettings set org.gnome.desktop.background picture-uri ''
gsettings set org.gnome.desktop.background primary-color 'rgb(66, 81, 100)'
gsettings set org.gnome.shell favorite-apps []
gsettings set org.gnome.shell.extensions.dash-to-dock dock-position BOTTOM
gsettings set org.gnome.shell favorite-apps "['firefox.desktop', 'brave-browser.desktop', 'chromium_chromium.desktop', 'torbrowser.desktop', 'org.gnome.Nautilus.desktop', 'org.gnome.Terminal.desktop', 'updates.desktop', 'tools.desktop', 'video-download.desktop', 'video-utilities.desktop', 'video-stream.desktop', 'instagram.desktop', 'galleries.desktop', 'users-emails.desktop', 'captures.desktop', 'domains.desktop', 'metadata.desktop', 'archives.desktop', 'documents.desktop', 'breaches-leaks.desktop', 'reddit.desktop', 'spiderfoot.desktop', 'recon-ng.desktop', 'api.desktop', 'google-earth-pro.desktop', 'kazam.desktop', 'gnome-control-center.desktop']"
gsettings set org.gnome.shell.extensions.dash-to-dock dash-max-icon-size 32
echo
read -rsp $'Press enter to continue, reboot, then launch the Updates script.\n'
echo
