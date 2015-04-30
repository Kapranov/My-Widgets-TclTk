#!/bin/sh
# the next line restarts using wish \
exec wish "$0" ${1+"$@"}

wm geometry . "710x205+305+8" 
wm overrideredirect . no
wm resizable . 0 0
wm transient . 
wm focusmodel . active

. config -bg "DarkSlateGray" -borderwidth 4 -relief groove -cursor "hand1" \
	-highlightthickness 3 -highlightcolor "DarkSlateGray" \
       	-highlightbackground "DarkSlateGray"

set logo "/home/kapranov/project/project-TclTk/mytcl/enzo/attention.gif"
set img [image create photo blank -file $logo]

label .img -image $img -bg DarkSlateGray -width 132 -height 190
pack .img -side left -padx 18 -pady 5 

message .top_line -foreground white -text "ИТО Internet Control Center" \
	    -aspect 4080 -bg DarkSlateGray -padx 15 -pady 2 
pack .top_line -side top

proc launch_1 {} { exec "/home/kapranov/project/project-TclTk/mytcl/enzo/rectorat.tcl" &;}
proc launch_6 {} { exec "/home/kapranov/project/project-TclTk/mytcl/enzo/tco.tcl" &;}
proc launch_11 {} { exec "/home/kapranov/project/project-TclTk/mytcl/enzo/server.tcl" &;}


frame .app_1 
foreach a {"Ректорат"} {
    button .app_1.$a -text $a -font {"utah mt" 12 {bold} } -command launch_1 \
	-width 20 -height 1 -bg "grey" -fg "black" -activebackground "LightCyan4" -relief groove
	pack .app_1.$a -side left
}
foreach b {"ИТО"} {

    button .app_1.$b -text $b -font {"utah mt" 12 {bold} } -command launch_6 \
	-width 20 -height 1 -bg "grey" -fg "black" -activebackground "LightCyan4" -relief groove
	pack .app_1.$b -side left

}

foreach c {"Серверы"} {

    button .app_1.$c -text $c -font {"utah mt" 12 {bold} } -command launch_11 \
	-width 20 -height 1 -bg "grey" -fg "black" -activebackground "LightCyan4" -relief groove
	pack .app_1.$c -side left
}
pack .app_1

proc launch_2 {} { exec "/home/kapranov/project/project-TclTk/mytcl/enzo/administration.tcl" &;}
proc launch_7 {} { exec "/home/kapranov/project/project-TclTk/mytcl/enzo/clas.tcl" &;}
proc launch_12 {} { exec "/home/kapranov/project/project-TclTk/mytcl/enzo/passward.tcl" &;}
frame .app_2
foreach a {"Администрация"} {

    button .app_2.$a -text $a -font {"utah mt" 12 {bold} } -command launch_2 \
	-width 20 -height 1 -bg "grey" -fg "black" -activebackground "LightCyan4" -relief groove
	pack .app_2.$a -side left
}

foreach b {"Интернет классы"} {
 button .app_2.$b -text $b -font {"utah mt" 12 {bold} } -command launch_7 \
	-width 20 -height 1 -bg "grey" -fg "black" -activebackground "LightCyan4" -relief groove
     	pack .app_2.$b -side left
}

foreach c {"Доступ к базе данных"} {
    button .app_2.$c -text $c -font {"utah mt" 12 {bold} } \
	-command launch_12 -width 20 -height 1 -bg "grey" -fg "black" \
	-activebackground "LightCyan4" -relief groove
	pack .app_2.$c -side left
}
pack .app_2

proc launch_3 {} { exec "/home/kapranov/project/project-TclTk/mytcl/enzo/manager.tcl" &;}
proc launch_8 {} { exec "/home/kapranov/project/project-TclTk/mytcl/enzo/campus1.tcl" &;}
#proc launch_11 {} { exec xterm -geometry "107x20+49+235" -e mysql --prompt "\\r:\\m:\\s Введите запрос ☻ " &;}
#proc launch_13 {} { exec xterm -geometry "130x25+49+235" -e vim /home/kapranov/enzo.tcl &;}
proc launch_13 {} { exec "/home/kapranov/project/project-TclTk/mytcl/enzo/dock.tcl" &;}

frame .app_3;
foreach a {"Начальники курсов"} {
    button .app_3.$a -text $a -font {"utah mt" 12 {bold} } -command launch_3 \
	-width 20 -height 1 -bg "grey" -fg "black" -activebackground "LightCyan4" -relief groove
	pack .app_3.$a -side left
}

foreach b {"Общежитие № 1"} {
    button .app_3.$b -text $b -font {"utah mt" 12 {bold} } -command launch_8 \
	-width 20 -height 1 -bg "grey" -fg "black" -activebackground "LightCyan4" -relief groove
	pack .app_3.$b -side left
}

foreach c {"Доступ к службам"} {
 button .app_3.$c -text $c -font {"utah mt" 12 {bold} } -command launch_13 \
	-width 20 -height 1 -bg "grey" -fg "black" -activebackground "LightCyan4" -relief groove
     	pack .app_3.$c -side left
}

pack .app_3

proc launch_4 {} { exec "/home/kapranov/project/project-TclTk/mytcl/enzo/kafedry.tcl" &;}
proc launch_9 {} { exec "/home/kapranov/project/project-TclTk/mytcl/enzo/campus2.tcl" &;}
proc launch_14 {} { exec "xterm -geometry "120x30+25+200" -e axion &;}

frame .app_4;
foreach a {"Кафедры"} {

    button .app_4.$a -text $a -font {"utah mt" 12 {bold} } -command launch_4 \
	-width 20 -height 1 -bg "grey" -fg "black" -activebackground "LightCyan4" -relief groove
	pack .app_4.$a -side left 

}

foreach b {"Общежитие № 2"} {

    button .app_4.$b -text $b -font {"utah mt" 12 {bold} } -command launch_9 \
	-width 20 -height 1 -bg "grey" -fg "black" -activebackground "LightCyan4" -relief groove
	pack .app_4.$b -side left 

}

foreach c {"Доступ к серверу"} {

    button .app_4.$c -text $c -font {"utah mt" 12 {bold} } -command launch_14 \
	-width 20 -height 1 -bg "grey" -fg "black" -activebackground "LightCyan4" -relief groove
	pack .app_4.$c -side left 

}
pack .app_4


proc launch_5 {} { exec "/home/kapranov/project/project-TclTk/mytcl/enzo/library.tcl" &;}
proc launch_10 {} { exec "/home/kapranov/project/project-TclTk/mytcl/enzo/campus3.tcl" &;}
proc launch_15 {} { exec "/home/kapranov/project/project-TclTk/mytcl/enzo/tell.tcl" &;}

frame .app_5;
foreach a {"Библиотека"} {
    button .app_5.$a -text $a -font {"utah mt" 12 {bold} } -command launch_5 \
	-width 20 -height 1 -bg "grey" -fg "black" -activebackground "LightCyan4" -relief groove
	pack .app_5.$a -side left
}


foreach b {"Общежитие № 3"} {
    button .app_5.$b -text $b -font {"utah mt" 12 {bold} } -command launch_10 \
	-width 20 -height 1 -bg "grey" -fg "black" -activebackground "LightCyan4" -relief groove
	pack .app_5.$b -side left
}



foreach c {"Тел справочник"} {
    button .app_5.$c -text $c -font {"utah mt" 12 {bold} } -command launch_15 \
	-width 20 -height 1 -bg "grey" -fg "black" -activebackground "LightCyan4" -relief groove
	pack .app_5.$c -side left
}
pack .app_5

proc every {ms body} {
    eval $body
	after $ms [list every $ms $body]
}

every 1000 {set ::time [clock format [clock seconds] -format %c] } ;
pack [label .clock -textvar time -bg "DarkSlateGray" -fg white -font {"utah mt" 10 {bold} }] \
	 -side right -padx 8

bind  all <Control-c> {destroy %W}
bell -displayof . -nice
