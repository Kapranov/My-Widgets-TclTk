#!/bin/sh
# the next line restarts using wish \
exec wish "$0" ${1+"$@"}
package require Iwidgets 4.0

wm geometry . "1010x720+5+30" 
wm overrideredirect . no
wm resizable . 0 0
wm transient . 
wm focusmodel . active
wm title . "База данных: личные дела сотрудников"
. config -bg "gainsboro" -borderwidth 5 -relief groove -cursor "hand1" \
	-highlightthickness 4 -highlightcolor "DarkSlateGray" \
       	-highlightbackground "DarkSlateGray" -bg "alice blue"

set img [image create photo blank -file penguin.gif]

frame .top_01

foreach box_a {box_01} {
    frame .top_01.$box_a -bg "alice blue" -highlightthickness 0 \
       	-height 67 -width 785
pack .top_01.$box_a -side top
}
pack .top_01 -side top 

frame .top_02 -bg "black"
foreach box_b {box_02} {
label .top_02.$box_b -bg "alice blue" -relief groove \
 -borderwidth 3 -image $img \
 -highlightthickness 1 -pady 15 -height 201 -width 150
pack .top_02.$box_b -side top
}

option add *textBackground seashell

.top_02  configure -background "alice blue"

iwidgets::entryfield .top_02.id -labeltext "Налоговый код:" -labelpos nw \
    -command { focus [.top_02.login component entry] } \
    -validate {check_phonenum %W "%c"} -labelfont {"utah mt" 11 {bold} }
pack .top_02.id -padx 2 -pady 5 -fill x

iwidgets::entryfield .top_02.login -labeltext "Фамилия:" -labelpos nw \
    -command { focus [.top_02.passwd component entry] } -labelfont {"utah mt" 11 {bold} }
pack .top_02.login -padx 2 -pady 3 -fill x

iwidgets::entryfield .top_02.passwd -labeltext "Имя:" -labelpos nw -show "\267" \
    -command { focus [.top_02.phone component entry] } -labelfont {"utah mt" 11 {bold} }
pack .top_02.passwd -padx 2 -pady 3 -fill x

iwidgets::entryfield .top_02.phone -labeltext "Отчество:" -labelpos nw \
    -command { focus [.top_02.login component entry] } \
    -validate {check_phonenum %W "%c"} -labelfont {"utah mt" 11 {bold} }
pack .top_02.phone -padx 2 -pady 3 -fill x

iwidgets::entryfield .top_02.ph -labeltext "Отчество:" -labelpos nw \
    -command { focus [.top_02.login component entry] } \
    -validate {check_phonenum %W "%c"} -labelfont {"utah mt" 11 {bold} }
pack .top_02.ph -padx 2 -pady 3 -fill x

iwidgets::entryfield .top_02.hone -labeltext "Отчество:" -labelpos nw \
    -command { focus [.top_02.login component entry] } \
    -validate {check_phonenum %W "%c"} -labelfont {"utah mt" 11 {bold} }
pack .top_02.hone -padx 2 -pady 3 -fill x

iwidgets::entryfield .top_02.one -labeltext "Отчество:" -labelpos nw \
    -command { focus [.top_02.login component entry] } \
    -validate {check_phonenum %W "%c"} -labelfont {"utah mt" 11 {bold} }
pack .top_02.one -padx 2 -pady 3 -fill x

iwidgets::entryfield .top_02.ne -labeltext "Отчество:" -labelpos nw \
    -command { focus [.top_02.login component entry] } \
    -validate {check_phonenum %W "%c"} -labelfont {"utah mt" 11 {bold} }
pack .top_02.ne -padx 2 -pady 3 -fill x

proc check_phonenum {entry char} {
    set current [$entry get]
    set len [string length $current]
    if {$len == 3 || $len == 7} {
        $entry delete 0 end
        $entry insert 0 "$current-"
    }
    if {$len < 12 && [string match {[0-9]} $char]} {
        return 1
    }
    return 0
}

foreach box_clock {box_clock} {
label .top_02.$box_clock -textvar time -bg "alice blue" -fg "darkred" \
-font {"utah mt" 10 {bold} } -width 25 -height 1
pack .top_02.$box_clock -side top -fill x
}
pack .top_02 -side left
###############################################################################
frame .top_03 -background "alice blue"

iwidgets::entryfield .top_03.id -labeltext "Место рождения:" -labelpos nw \
    -command { focus [.top_03.login component entry] } \
    -validate {check_phonenum %W "%c"} -labelfont {"utah mt" 11 {bold} } \
    -background "alice blue" -width 33 -textbackground "white"
pack .top_03.id -side top

iwidgets::entryfield .top_03.login -labeltext "Место прописки:" -labelpos nw \
    -command { focus [.top_03.passwd component entry] } -labelfont {"utah mt" 11 {bold} } \
    -background "alice blue" -width 33 -textbackground "white"
pack .top_03.login -side top

iwidgets::entryfield .top_03.passwd -labeltext "Паспорт №:" -labelpos nw -show "\267" \
    -command { focus [.top_03.phone component entry] } -labelfont {"utah mt" 11 {bold} } \
    -background "alice blue" -width 33 -textbackground "white"
pack .top_03.passwd -side top

iwidgets::entryfield .top_03.phone -labeltext "Кем когда выдан паспорт:" -labelpos nw \
    -command { focus [.top_03.login component entry] } \
    -validate {check_phonenum %W "%c"} -labelfont {"utah mt" 11 {bold} } \
    -background "alice blue" -width 33 -textbackground "white" 
pack .top_03.phone -side top
pack .top_03 -side top 

#frame .top_07 -background "alice blue"
#iwidgets::entryfield .top_03.ph -labeltext "Пол:" -labelpos nw \
#    -command { focus [.top_03.login component entry] } \
#    -validate {check_phonenum %W "%c"} -labelfont {"utah mt" 11 {bold} } \
#    -background "alice blue" -width 33 -textbackground "white" 
#pack .top_03.ph -side left

#iwidgets::entryfield .top_03.ho -labeltext "Семейное положение:" -labelpos nw \
#    -command { focus [.top_03.login component entry] } \
#    -validate {check_phonenum %W "%c"} -labelfont {"utah mt" 11 {bold} } \
#    -background "alice blue" -width 33 -textbackground "white" 
#pack .top_03.ho -side bottom
#
#iwidgets::entryfield .top_03.ne -labeltext "Дети:" -labelpos nw \
#    -command { focus [.top_03.login component entry] } \
#    -validate {check_phonenum %W "%c"} -labelfont {"utah mt" 11 {bold} } \
#    -background "alice blue" -width 33 -textbackground "white" 
#pack .top_03.ne -side right
#
#iwidgets::entryfield .top_03.pone -labeltext "Военный билет №: когда выдан:" -labelpos nw \
#    -command { focus [.top_03.login component entry] } \
#    -validate {check_phonenum %W "%c"} -labelfont {"utah mt" 11 {bold} } \
#    -background "alice blue" -width 33 -textbackground "white" 
#pack .top_03.pone -side right

#iwidgets::entryfield .top_03.hone -labeltext "Телефон домашний мобильный:" -labelpos nw \
#    -command { focus [.top_03.login component entry] } \
#    -validate {check_phonenum %W "%c"} -labelfont {"utah mt" 11 {bold} } \
#    -background "alice blue" -width 33 -textbackground "white"
#pack .top_03.hone -side top -padx 2 -pady 2
#pack .top_07 -side bottom 
###############################################################################
iwidgets::scrolledtext .top_04 -labeltext "Автобиография" \
    -vscrollmode static -hscrollmode dynamic -background "alice blue" \
    -width 5.6i -height 5.5i -labelfont {"utah mt" 11 {bold} }
pack .top_04 -side left 
.top_04 import [file join ${iwidgets::library} demos scrolledtext]

iwidgets::scrolledtext .top_05 -labeltext "Характеристика" \
    -vscrollmode static -hscrollmode dynamic -background "alice blue" \
    -width 5.6i -height 5.5i -labelfont {"utah mt" 11 {bold} }
pack .top_05 -side right 
.top_05 import [file join ${iwidgets::library} demos scrolledtext]

proc every {ms body} {
    eval $body
	after $ms [list every $ms $body]
}

every 1000 {set ::time [clock format [clock seconds] -format %c] }

bind  all <Control-c> {destroy %W}
bell -displayof . -nice
