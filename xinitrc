sleep 1
xsetroot -solid black
sleep 1

xterm +sb -n big -geometry 96x64+0+0 -fg white &
xterm +sb -n bigr -geometry 96x64+40+24 -fg white &
xterm -sl 1024 -n ops -geometry 84x32-192-60 -fg yellow &

oclock -geom 200x200-0-32 -fg yellow -bg red &
xclock -digital -fn '-*-lucidabright-*-r-*--34-*' \
	-geom 478x52-64-8 -fg white -bg red -update 37 &

twm
