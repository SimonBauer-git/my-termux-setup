# my-termux-setup
How I setup my android tablet to work as a linux laptop. It can basically anything a laptop can do. limitations: no full usb support and programms need to be compiled for arm 64 (aarch64 to be exact). Performance is dependent on the device. the graphics part depends on the device you use, this is for devices with arm mali gpus (mostly Mediathek socs, and many other arm socs, but NOT Snapdragon ones), for adreno gpus (in Snapdragon socs) you can use a different tutorial for the graphics part, virglrenderer will also work on these but turnip/zink (the other way) is faster, which can be found online. Disclaimer: doing the wrong things in it can and will crash your gpu driver, which will crash android, that can be resolved by a forced reboot of the device. if you brick your device by using this tutorial thats on you.

## Apps you need:
Termux is an application that gives you a linux shell on android, download termux via this link: https://github.com/termux/termux-app/releases
Then you need termux x11, to give you a fast graphical output on the device, this can be found here: https://github.com/termux/termux-x11/releases/tag/nightly
if you want usb support (very rudimentary, not really good) you need termux api: https://f-droid.org/packages/com.termux.api/

## Android 12+ Phantom process killer
you need to disable phantom process killer. This is a service inside android that stops background tasks if too many Background services are running. The limit at which point this kicks in is 32 Background processes, it ususally prevents termux and termux x11 from working correctly. you need to disable it, use phantom process killer disable permanent.bat if you are on windows (needs admin rights) to disable it via ADB. for more info visit https://github.com/agnostic-apollo/Android-Docs/blob/master/en/docs/apps/processes/phantom-cached-and-empty-processes.md#commands-to-disable-phantom-process-killing-and-tldr

## installing the needed tools

first in termux use pkg update. 

use pkg install proot-distro then proot-distro install debian to install proot distro in this case debian. 

then use pkg install x11-repo, then pkg install termux-x11-nightly which installs the necessary tools for termux x11 to work.

install virglrenderer-android for gpu acceleration, without it would work too but even something like vscode will run badly.

log into proot-distro by typing proot-distro login debian

within proot-distro you do an apt update, then apt upgrade if its neccessary then apt install xfce4. you might also need to install libsecret so vscode keeps your login (assuming you want to sync with github/ms account for settings sync). 

the .sh files debian.sh and x11.sh go in the normal non proot-distro (just use wget and paste the url from the "view raw" section of the individual file or create the sh files yourself, they make it easier to launch the stuff as you dont need to be typing all of that crap thats in them Out every time you want to use vscode), xfce.sh goes into the proot distro. make these files executable with chmod +x and then the file name.

use termux-setup-storage aswell in termux as you want to have acess to the normal android file system too. 
this is the basic install of the proot-distro. 

before being able to use it you also need to follow this Tutorial for Sound (or edit x11.sh to not include the start audio Part, it is pretty clear what that one is in the command)
https://docs.andronix.app/troubleshoot/sound
or follow this:
in termux run these commands
pkg install wget && wget https://andronixos.sfo2.cdn.digitaloceanspaces.com/OS-Files/setup-audio.sh && chmod +x
setup-audio.sh && ./setup-audio.sh

## (optional, only if you need vscode)
for the vscode install you want to grab the arm64.deb version from code.visualstudio.com then copy the vscode.desktop command from my github to be able to launch it, as you need to use a different command than normal as we use gpu acelleration and a root account. then use dpkg -i and then the file name to install vscode (terminal needs to be in the folder where vscode is downloaded from, either cd to it or launch terminal from the folder).
## using it after install:
to start open termux then simply type ./x11.sh this brings you into the proot distro. skip any errors that might show with the enter key, you can ignore them.

to start your xfce session in proot distro then type in ./xfce.sh
