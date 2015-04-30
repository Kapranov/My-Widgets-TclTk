#!/bin/sh
# the next line restarts using wish \
exec wish "$0" ${1+"$@"}

source [file join [file dirname [info script]] loadtable.tcl]

wm geometry . "658x290+185+329" 
wm overrideredirect . yes
wm resizable . 0 0
wm transient . 
wm focusmodel . active
wm title . "TCO"

. config -bg "DarkSlateGray" -borderwidth 5 -relief groove -cursor "hand1" \
	-highlightthickness 3 -highlightcolor "DarkSlateGray" \
       	-highlightbackground "DarkSlateGray"

array set table {
    rows	12 
    cols	4   
    table	.table
}

proc colorize num {
    if {$num>0 && $num%2} { return colored }
}

proc fill_headers {w {r 12} {c 4}} {
    for {set i 1} {$i < $r} {incr i} {
	$w set $i,0 "$i"
    }
    for {set j 1} {$j < $c} {incr j} {
	if {$j%3==1} {
	    $w set 0,$j "Фамилия"
	} elseif {$j%2==1} {
	    $w set 0,$j  "hostname"
	} elseif {$j} {
	    $w set 0,$j "IP адрес"
	}
    }
}

label .example -font {"utah mt" 13 {bold} } -text "IP адреса группы Серверы"

set t $table(table)
table $t \
	-rows $table(rows) \
	-cols $table(cols) \
	-cache 1 \
	-titlerows 1 \
	-titlecols 1 \
	-width 2 -height 2 \
	-coltagcommand colorize \
	-flashmode on \
	-flashtime 10 \
	-selectmode browse \
	-colstretch unset \
	-rowstretch unset \
	-validate yes \
	-state normal \
	-wrap yes \
	-rowheight 1 \
	-justify left \
	-roworigin 0 \
	-colorigin 0 \
	-cursor "hand1" \
	-variable tab \
	-vcmd {if {![%W tag includes title %C]} { validate %c %S } }

fill_headers $t
$t tag config colored -bg lightblue -font {"utah mt" 11 {bold} }
$t tag config title -fg black -font {"utah mt" 12 {bold} }
$t tag config active -bg darkred -fg snow -relief solid
$t tag config title -fg white -bg black -font {"utah mt" 12 {bold} }
$t width 0 3
$t height 0 1
$t set  1,2 "195.005.028.090" \
	1,3 "enzo" \
	1,1 "Капранов Олег Георгиевич" \
	2,2 "192.168.010.001" \
	2,3 "enzo" \
	2,1 "Капранов Олег Георгиевич" \
	3,2 "010.002.061.002" \
	3,3 "enzo" \
	3,1 "Капранов Олег Георгиевич" \
	4,2 "010.002.061.003" \
	4,3 "helix" \
	4,1 "Капранов Олег Георгиевич" \
	5,2 "192.168.010.002" \
	5,3 "helix" \
	5,1 "Капранов Олег Георгиевич" \
	6,2 "010.002.061.004" \
	6,3 "gaia" \
	6,1 "Капранов Олег Георгиевич" \
	7,2 "010.002.061.005" \
	7,3 "axion" \
	7,1 "Капранов Олег Георгиевич" \
	8,2 "192.168.000.001" \
	8,3 "axion" \
	8,1 "Капранов Олег Георгиевич" \
	9,2 "010.002.061.006" \
	9,3 "liga" \
	9,1 "Капранов Олег Георгиевич" \
	10,2 "010.002.061.007" \
	10,3 "mira" \
	10,1 "Капранов Олег Георгиевич" \
	11,2 "010.002.061.008" \
	11,3 "eris" \
	11,1 "Капранов Олег Георгиевич" \

button .exit -font {"utah mt" 12 {bold} } -text "Выход" -command {exit}

grid .example -	-sticky ew
grid $t		-sticky news
grid .exit -	-sticky ew
grid columnconfig . 0 -weight 1
grid rowconfig . 1 -weight 1


puts [list Table is $table(table)]
