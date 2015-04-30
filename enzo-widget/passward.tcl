#!/bin/sh
# the next line restarts using wish \
exec wish "$0" ${1+"$@"}
#
# 10.10.2007 by Kapranov O.J.
#
wm geometry . "540x205+20+250" 
wm overrideredirect . no
wm resizable . 0 0
wm transient . 
wm focusmodel . active

. config -bg "DodgerBlue4" -borderwidth 5 -relief groove -cursor "hand1" \
	-highlightthickness 3 -highlightcolor "DarkSlateGray" \
       	-highlightbackground "DarkSlateGray"

set logo "/home/kapranov/project/project-TclTk/mytcl/enzo/attention.gif"
set img [image create photo blank -file $logo]

label .img -image $img -bg "DodgerBlue4" -width 132 -height 190
pack .img -side left -padx 5 -pady 5

label .warm -fg black -bg yellow -text "АВТОРИЗАЦИЯ ДЛЯ ДОСТУПА К БАЗЕ ДАННЫХ" -width 59 \
	-justify center -font {"utah mt" 11 {bold} }
pack .warm -padx 0 -pady 10

package require Iwidgets 4.0

option add *textBackground seashell
. configure -background "DodgerBlue4"


iwidgets::entryfield .login -labeltext "Login:" -labelpos nw \
    -command { focus [.passwd component entry] }
pack .login -side top -pady 2

iwidgets::entryfield .passwd -labeltext "Password:" -labelpos nw -show "\267" \
    -command { focus [.phone component entry] }
pack .passwd -side top -pady 2

iwidgets::entryfield .phone -labeltext "Phone:" -labelpos nw \
    -command { focus [.login component entry] } \
    -validate {check_phonenum %W "%c"}
pack .phone -side top -pady 2

bind  all <Control-c> {destroy %W}
bell -displayof . -nice
