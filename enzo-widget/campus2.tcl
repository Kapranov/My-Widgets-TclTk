#!/bin/sh
# the next line restarts using wish \
exec wish "$0" ${1+"$@"}

source [file join [file dirname [info script]] loadtable.tcl]

wm geometry . "830x375+120+391" 
wm overrideredirect . yes
wm resizable . 0 0
wm transient . 
wm focusmodel . active

. config -bg "DarkSlateGray" -borderwidth 5 -relief groove -cursor "hand1" \
	-highlightthickness 3 -highlightcolor "DarkSlateGray" \
       	-highlightbackground "DarkSlateGray"

array set table {
    rows	150 
    cols	4   
    table	.table
}

proc colorize num {
    if {$num>0 && $num%2} { return colored }
}

proc fill_headers {w {r 150} {c 4}} {
    for {set i 1} {$i < $r} {incr i} {
	$w set $i,0 "$i"
    }
    for {set j 1} {$j < $c} {incr j} {
	if {$j%3==1} {
	    $w set 0,$j "Mac адрес" 
	} elseif {$j%2==1} {
	    $w set 0,$j  "Фамилия"
	} elseif {$j} {
	    $w set 0,$j "Комната"
	}
    }
}


label .example -font {"utah mt" 13 {bold} } -text "IP адреса группы Общежитие № 2"

set t $table(table)
table $t \
	-rows $table(rows) \
	-cols $table(cols) \
	-cache 1 \
	-titlerows 1 \
	-titlecols 1 \
	-yscrollcommand { .tsy set } \
	-width 2 -height 2 \
	-coltagcommand colorize \
	-flashmode on \
	-flashtime 10 \
	-selectmode extended \
	-colstretch unset \
	-rowstretch unset \
	-validate yes \
	-vcmd {if {![%W tag includes title %C]} { validate %c %S } }

fill_headers $t
$t tag config colored -bg lightblue 
$t tag config title -bg black -fg white -font {"utah mt" 12 {bold} }
$t tag config active -bg darkred -fg snow -relief solid
$t width 0 3

scrollbar .tsy -command [list $t yview]
button .exit -font {"utah mt" 12 {bold} } -text "Выход" -command {exit}

grid .example -     -sticky ew
grid $t       .tsy   -sticky news
grid .exit - -sticky ew
grid columnconfig . 0 -weight 1
grid rowconfig . 1 -weight 1


puts [list Table is $table(table)]
