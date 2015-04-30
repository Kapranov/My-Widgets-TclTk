#!/usr/bin/wish
# frame .w -width 600 -height 300
wm geometry . "680x200+180+180" 
wm overrideredirect . no
wm resizable . 0 0
wm transient . 
wm focusmodel . active
# wm iconify .
# wm attributes . -topmost yes 
# wm attributes . -alpha 0.99 
#
# set img [image create photo -width 130 -height 175 -file attention.gif]
# set t [text .line ]
##########################################################
. config -bg yellow -borderwidth 3 
#frame .open -borderwidth 20 -bg black -width 50 -height 50 
##########################################################
#frame .one -bg DarkSlateGray -width 695  -height 194
#pack .one ;
set img [image create photo blank -file attention.gif]
label .img -image $img -bg DarkSlateGray -width 132 -height 190;
pack .img -side left;
message .line -foreground white -text "ИТО Internet Control Center" \
	    -aspect 4080 -bg DarkSlateGray -padx 180 -pady 3 -relief ridge 

pack .line -side top ;

frame .app -width 538  -height 170 ;
.app configure -background green ;
#.one.app configure -background DarkSlateGray;

proc launch_01 {} { exec &;}
#proc launch_02 {} { exec &;}
#proc launch_03 {} { exec &;}
#proc launch_04 {} { exec &;}
#proc launch_05 {} { exec &;}

button .app.01  -font {"utah mt" 13 {bold} } -text "Администрация" -command launch_01 \
	   -width 18 -height 1 ;
#button .app.02  -font {"utah mt" 13 {bold} } -text "Библиотека" -command launch_01 \
	   -width 20  -height 1 ;
#button .app.03  -font {"utah mt" 14 {bold} } -text "Кафедры" -command launch_01 \
	   -width 20 -height 1 ;
#button .app.04  -font {"utah mt" 14 {bold} } -text "Учебные классы" -command launch_01 \
	   -width 20 -height 1 ;
#button .app.05  -font {"utah mt" 14 {bold} } -text "Учебный корпус № 1" -command launch_01 \
	   -width 20 -height 1 ;

pack .app -side right;
#pack .app.01 -side left;
#.app.02 .app.03 -side left;
#pack .app.04 -side right;
#pack .app.05 -side top; 
##########################################################
#set img [image create photo blank -file attention.gif]
#label .img -image $img -bg DarkSlateGray
#pack .img -side left
#message .line  -foreground white -text "Информационно технический отдел" -aspect 1080 -bg DarkSlateGray 
#pack .line -side top
##########################################################
# frame .txt -width 370 -height 175 -bg red 
# pack .txt -side right
#
bind  all <Control-c> {destroy %W}
bell -displayof . -nice
