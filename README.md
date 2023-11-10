# my-termux-setup
How I setup my android tablet to work as a linux laptop. It can basically anything a laptop can do. limitations: no full usb support and programms need to be compiled for arm 64 (aarch64 to be exact). Performance is dependent on the device. the graphics part depends on the device you use, this is for devices with arm mali gpus (mostly Mediathek socs, and many other arm socs, but NOT Snapdragon ones), for adreno gpus (in Snapdragon socs) you need to use a different tutorial for the graphics part, which can be found online

## Apps you need:
Termux is an application that gives you a linux shell on android, download termux via this link: https://github.com/termux/termux-app/releases
Then you need termux x11, to give you a fast graphical output on the device, this can be found here: https://github.com/termux/termux-x11/releases/tag/nightly
if you want usb support (very rudimentary, not really good) you need termux api: https://f-droid.org/packages/com.termux.api/

## Android 12+ Phantom process killer
you need to disable phantom process killer. This is a service inside android that stops background tasks if too many Background services are running. The limit at which point this kicks in is 32 Background processes, it ususally prevents termux and termux x11 from working correctly. you need to disable it, use phantom process killer disable permanent.bat if you are on windows (needs admin rights) to disable it via ADB. for more info visit https://github.com/agnostic-apollo/Android-Docs/blob/master/en/docs/apps/processes/phantom-cached-and-empty-processes.md#commands-to-disable-phantom-process-killing-and-tldr
