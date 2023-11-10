pulseaudio --start && virgl_test_server_android --angle-gl & XDG_RUNTIME_DIR=${TMPDIR} termux-x11 :0 -ac &
./debian.sh
