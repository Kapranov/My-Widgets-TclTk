#!/usr/bin/wish
# 31.10.2006 Капранов О.Г. (для университета МВД)
# программа для вывода в системе X11
# выводит предупреждение о выключении компьютера
#
wm title . "выключение хоста sedna"
wm geometry . "500x180+380+87"
wm transient . 
wm focusmodel . active
wm attributes . -disabled 0 -toolwindow 0 -topmost 0 
frame .one -width 200 -height 180 -bg black
frame .two -width 300 -height 180 -bg red
# message .msg -text "ВНИМАНИЕ!\n Хост SEDNA будет выключен\n \
#	    через 5 минут"\
#	    -bg red -fg white -width 300 -pady 100 \
#	   -padx 100 -aspect 50
# $t insert insert "Hellow, World\n"
 pack .one -side left 
 pack .two -side right
 bind  all <Control-c> {destroy %W}
# set mybell [exec xset b 100 3000 100]
bell -displayof . -nice
