#installs the neccessary tools
pkg update
pkg upgrade -y
pkg install x11-repo termux-x11-nightly -y
pkg install virglrenderer android -y
pkg install proot-distro -y
proot-distro install debian
#gets the scripts to launch the proot-distro
wget https://raw.githubusercontent.com/SimonBauer-git/my-termux-setup/main/x11.sh
chmod +x x11.sh
wget https://raw.githubusercontent.com/SimonBauer-git/my-termux-setup/main/debian.sh
chmod +x debian.sh
#make audio work in termux x11
pkg install wget && wget https://andronixos.sfo2.cdn.digitaloceanspaces.com/OS-Files/setup-audio.sh && chmod +x
setup-audio.sh && ./setup-audio.sh
